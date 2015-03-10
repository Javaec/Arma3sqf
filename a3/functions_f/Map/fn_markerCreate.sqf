/*
	Author: Karel Moricky

	Description:
	Creates marker with given params.
	Reads config to recognize settings - use for quick debugging only.

	Parameter(s):
	_this: ARRAY of values:
		STRING - one of type, color, brush or shape. If no corresponding class is found, value is used as marker text
		ARRAY
			[STRING(,ANY,ANY,...)] - marker name with optional arguments
			[NUMBER] - marker size [a,a]
			[NUMBER,NUMBER] - marker size [x,y]
			[NUMBER,NUMBER,NUMBER] - marker position [x,y,z]
		OBJECT - object's position
		NUMBER - marker dir
		BOOL - marker locality (true if global)

	Returns:
	STRING - created marker
*/

private [
	"_markerName",
	"_markerPos",
	"_markerSize",
	"_markerColor",
	"_markerType",
	"_markerBrush",
	"_markerShape",
	"_markerDir",
	"_markerText",
	"_markerGlobal",
	"_markerCounterVar",
	"_markerCounter",
	"_fnc_getClasses",
	"_fnc_getParam",
	"_listTypes",
	"_listColors",
	"_listBrushes",
	"_listShapes"
];

if (typename _this != typename []) then {_this = [_this]};

_markerName = "";
_markerPos = [0,0,0];
_markerSize = [0,0];
_markerColor = "";
_markerType = "";
_markerBrush = "";
_markerShape = "";
_markerDir = 1;
_markerText = "";
_markerGlobal = false;
_markerCounterVar = _fnc_scriptName + "_counter";
_markerCounter = if (isnil _markerCounterVar) then {-1} else {missionnamespace getvariable _markerCounterVar};

_fnc_getClasses = {
	private ["_cfg","_list"];
	_cfg = configfile >> _this;
	_list = [];
	for "_i" from 0 to (count _cfg - 1) do {
		_current = _cfg select _i;
		if (isclass _current) then {_list = _list + [configname _current]};
	};
	_list
};
_fnc_getParam = {
	{_param == _x} count _this > 0
};

_listTypes = "cfgMarkers" call _fnc_getClasses;
_listColors = "cfgMarkerColors" call _fnc_getClasses;
_listBrushes = "cfgMarkerBrushes" call _fnc_getClasses;
_listShapes = ["ellipse","rectangle"];

{
	_param = _x;
	switch (typename _param) do {
		//--- Brush, Shape, Color, Type
		case (typename ""): {

			//--- Type
			if (_listTypes call _fnc_getParam) then {
				_markerType = _param;
			} else {

				//--- Color
				if (_listColors call _fnc_getParam) then {
					_markerColor = _param;
				} else {

					//--- Shape
					if (_listShapes call _fnc_getParam) then {
						_markerShape = _param;
					} else {

						//--- Brush
						if (_listBrushes call _fnc_getParam) then {
							_markerBrush = _param;
						} else {

							//--- Text
							if (_markerText == "") then {_markerText = _param};
						};
					};
				};
			};
		};

		//--- Object position
		case (typename objnull): {
			_markerPos = if (_markerPos distance [0,0,0] == 0) then {position _param};
		};

		//--- Position, Size
		case (typename []): {
			if (count _param > 0) then {
				if (typename (_param select 0) == typename "") then {

					//--- Name
					if (_markerName == "") then {
						if (count _param == 1) then {

							//--- Increase the counter
							_markerCounter = _markerCounter + 1;
							_param set [1,_markerCounter];
							missionnamespace setvariable [_markerCounterVar,_markerCounter];
							
						};
						_markerName = format _param;
					};
				} else {
					switch (count _param) do {

						//--- Size
						case 1: {
							if (_markerSize distance [0,0] == 0) then {
								private ["_markerSizeXY"];
								_markerSizeXY = [_param,0,1,[0]] call bis_fnc_param;
								_markerSize = [_markerSizeXY,_markerSizeXY];
							};
						};

						case 2: {
							if (_markerSize distance [0,0] == 0) then {
								private ["_markerSizeX","_markerSizeY"];
								_markerSizeX = [_param,0,1,[0]] call bis_fnc_param;
								_markerSizeY = [_param,1,1,[0]] call bis_fnc_param;
								_markerSize = [_markerSizeX,_markerSizeY];
							};
						};

						//--- Position
						case 3: {
							if (_markerPos distance [0,0,0] == 0) then {
								private ["_markerPosX","_markerPosY"];
								_markerPosX = [_param,0,1,[0]] call bis_fnc_param;
								_markerPosY = [_param,1,1,[0]] call bis_fnc_param;
								_markerPos = [_markerPosX,_markerPosY,0];
							};
						};
					};
				};
			};
		};

		//--- Dir
		case (typename 0): {
			_markerDir = _param;
		};

		//--- Locality
		case (typename true): {
			_markerGlobal = _param;
		};
	};
} foreach _this;

//--- Default name
if (_markerName == "") then {
	_markerCounter = _markerCounter + 1;
	_markerName = format ["USER_MARKER_%1",_markerCounter];
	missionnamespace setvariable [_markerCounterVar,_markerCounter];
};
if (_markerSize distance [0,0] == 0) then {_markerSize = [1,1]};

//--- Create marker
if (_markerGlobal) then {
	_marker = createmarker [_markerName,_markerPos];
	_marker setmarkersize  _markerSize;
	_marker setmarkertext _markerText;
	_marker setmarkerdir _markerDir;
	if (_markerColor != "") then {_marker setmarkercolor _markerColor};
	if (_markerType != "") then {_marker setmarkertype _markerType};
	if (_markerShape != "") then {_marker setmarkershape _markerShape};
	if (_markerBrush != "") then {_marker setmarkerbrush _markerBrush};
	_marker
} else {
	_marker = createmarkerlocal [_markerName,_markerPos];
	_marker setmarkersizelocal  _markerSize;
	_marker setmarkertextlocal _markerText;
	_marker setmarkerdirLocal _markerDir;
	if (_markerColor != "") then {_marker setmarkercolorlocal _markerColor};
	if (_markerType != "") then {_marker setmarkertypelocal _markerType};
	if (_markerShape != "") then {_marker setmarkershapelocal _markerShape};
	if (_markerBrush != "") then {_marker setmarkerbrushlocal _markerBrush};
	_marker
};