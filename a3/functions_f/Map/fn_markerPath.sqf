/*
	Author: Karel Moricky

	Description:
	Creater marker(s) between two points

	Parameter(s):
	_this select 0: start (value type see _this select 1)
	_this select 1: end
		ARRAY - position [x,y] or [x,y,z] or waypoint position [GROUP,NUMBER]
		OBJECT - object's position
		LOCATION - location's position
		STRING - marker's position
	_this select 2 (Optional): NUMBER - distance between markers.
		When value is negative, line marker is used instead with thickness of this value
	_this select 3 (Optional): ARRAY - marker params (see BIS_fnc_markerCreate for details)

	Returns:
	ARRAY - list of created markers
*/

//--- Marker settings
_markerCounterVar = _fnc_scriptName + "_counter";
_markerCounter = if (isnil _markerCounterVar) then {0} else {missionnamespace getvariable _markerCounterVar};
missionnamespace setvariable [_markerCounterVar,_markerCounter + 1];
_markerCounterLocal = 0;
_markerParamsDefault = [
	[_fnc_scriptName + "_marker_%1",_markerCounter],
	"mil_triangle",
	"colorgreen"
];

//--- Init params
_paramStart =	[_this,0,[0,0,0],[[],objnull,"",locationnull]] call bis_fnc_param;
_paramEnd =	[_this,1,[0,0,0],[[],objnull,"",locationnull]] call bis_fnc_param;
_markerDis =	[_this,2,1000,[0]] call bis_fnc_param;
_markerParams =	[_this,3,_markerParamsDefault,[[]]] call bis_fnc_param;

//--- Convert position
_fnc_returnPos = {
	switch (typename _this) do {
		case (typename []): {
			_px = [_this,0,0,[0,grpnull]] call bis_fnc_param;
			_py = [_this,1,0,[0]] call bis_fnc_param;
			_pz = [_this,2,0,[0]] call bis_fnc_param;
			if (typename _px == typename grpnull) then {

				//--- Waypoint
				waypointposition [_px,_py]
			} else {

				//--- Position
				[_px,_py,_pz]
			};
		};

		//-- Object
		case (typename objnull): {
			position _this
		};

		//--- Location
		case (typename locationnull): {
			locationposition _this
		};

		//--- Marker
		case (typename ""): {
			markerpos _this
		};
	};
};

_posStart = _paramStart call _fnc_returnPos;
_posEnd = _paramEnd call _fnc_returnPos;

_dir = [_posStart,_posEnd] call bis_fnc_dirto;
_dis = [_posStart,_posEnd] call bis_fnc_distance2D;

//--- Line marker
if (_markerDis <= 0) then {
	_markerParams = [[abs _markerDis,_dis/2]] + _markerParams;
	_markerDis = _dis/2;
};

_listMarkers = [];
for "_m" from _markerDis to _dis step _markerDis do {
	if (round _m >= round _dis) exitwith {};
	private ["_marker","_markerPos"];
	_markerPos = [
		(_posStart select 0) + (sin _dir * _m),
		(_posStart select 1) + (cos _dir * _m),
		0
	];

	if (_m == _markerDis) then {
		_marker = _markerParams call bis_fnc_markerCreate;
		_marker setmarkerpos _markerPos;
		_marker setmarkerdir _dir;
		_markerParams = _marker call bis_fnc_markerParams;
		_markerParams set [0,((_markerParams select 0) select 0) + "_%1"];
	} else {
		_marker = createmarker [format [(_markerParams select 0),_markerCounterLocal],_markerPos];
		_marker setmarkerdir _dir;
		_marker setmarkersize (_markerParams select 2);
		_marker setmarkercolor (_markerParams select 3);
		_marker setmarkertype (_markerParams select 4);
		_marker setmarkerbrush (_markerParams select 5);
		_marker setmarkershape (_markerParams select 6);
		_marker setmarkeralpha (_markerParams select 7);
		_marker setmarkertext (_markerParams select 8);
	};
	_listMarkers set [count _listMarkers,_marker];
	_markerCounterLocal = _markerCounterLocal + 1;
};

_listMarkers