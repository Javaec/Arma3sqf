/*
	Author: Karel Moricky

	Description:
	Show ORBAT viewer.

	Parameter(s):
		0: CONFIG - path to displayed structure, e.g. configfile >> >> CfgORBAT >> 7thInfantry >> 1stBCT
		1 (Optional): DISPLAY - parent display of the viewer
		2 (Optional): ARRAY - list of tags. Searching will stop on groups which doesn't contain at least one of the tags (default: no tags)
		3 (Optional): NUMBER - number of tier displayed (default: unlimited)
		4 (Optional): ARRAY - array of arrays in format [group class (CONFIG),action performed upon clicking on group icon (CODE)]

	Returns:
	DISPLAY
*/
#define GROUPPARAMS_COUNT	12

startloadingscreen ["","RscDisplayLoadingBlack"];
private ["_parentDisplayDefault","_class","_parentDisplay","_tags","_deepnessLimit","_parentClass","_onClick","_mapSize","_scale","_display","_fnc_validClass","_fnc_countSubClasses","_deepnessMax","_n","_structure","_map","_parentParams","_subClassesCount","_info","_footer","_fade","_selected"];

disableserialization;
_parentDisplayDefault = switch false do {
	case isnull (finddisplay 37): {finddisplay 37}; //--- GetReady
	case isnull (finddisplay 52): {finddisplay 52}; //--- ServerGetReady
	case isnull (finddisplay 53): {finddisplay 53}; //--- ClientGetReady
	default {[] call bis_fnc_displayMission}; //--- Mission
};
_class = [_this,0,configfile >> "CfgORBATDefault",[configfile]] call (uinamespace getvariable "bis_fnc_param");
_parentDisplay = [_this,1,_parentDisplayDefault,[displaynull]] call (uinamespace getvariable "bis_fnc_param");
_tags = [_this,2,[],[[]]] call bis_fnc_param;
_deepnessLimit = [_this,3,-1,[0]] call bis_fnc_param;
_onClick = [_this,4,[],[[]]] call bis_fnc_param;
if (_deepnessLimit < 0) then {_deepnessLimit = 999;};

_classArray = [_class] call bis_fnc_configpath;
_classArray resize (count _classArray - 1);
_parentClass = [_classArray] call bis_fnc_configpath;

//--- Calculate terrain size
_mapSize = [] call bis_fnc_mapSize;
if (_mapSize < 0) then {_mapSize = 4000;};
_scale = 64 / _mapSize;
with uinamespace do {
	RscDisplayORBAT_scaleMin = _scale * 0.5;
	RscDisplayORBAT_scaleMax = _scale * 4.0;
	RscDisplayORBAT_scaleDefault = _scale;
};

//--- Create the viewer
_parentDisplay createdisplay "RscDisplayORBAT";
_display = finddisplay 505;
if (isnull _display) exitwith {"Unable to create 'RscDisplayORBAT' display." call (uinamespace getvariable "bis_fnc_error"); displaynull};

//--- Store global variables
BIS_fnc_ORBAT_step = 10;

//--- Function to check if class meets criteria
_fnc_validClass = {
	private ["_class","_classTags"];
	_class = _this;
	_classTags = getarray (_class >> "tags");
	{_x in _classTags} count _tags > 0 || count _tags == 0;
};

//--- Function to count last tier classes
_fnc_countSubclasses = {
	private ["_class","_classDeepness","_parents","_subclass","_count","_subordinates"];
	_class = _this select 0;
	_classDeepness = _this select 1;
	_parents = _this select 2;
	if !(_class in _parents) then {
		if (_class call _fnc_validClass && (_classDeepness < _deepnessLimit)) then {
			_parents set [count _parents,_class];
			_count = 0;
			_subordinates = getarray (_class >> "subordinates");
			if (count _subordinates > 0) then {
				{
					_count = _count + ([_parentClass >> _x,_classDeepness + 1,+_parents] call _fnc_countSubclasses);
				} foreach _subordinates;
			} else {
				{
					_count = _count + ([_x,_classDeepness + 1,+_parents] call _fnc_countSubclasses);
				} foreach (_class call bis_fnc_returnchildren);
			};
			if (_count == 0) then {_count = 1};
			_count
		} else {
			1
		};
	} else {
		//["Recursion warning - %1 is already listed.",_class] call bis_fnc_errorMsg;
		1
	};
};

//--- Load the chain of command structure from config to array
_localOverlay = [];
BIS_fnc_ORBAT_loadConfig = {
	private ["_class","_classParams","_deepness","_parents","_onClickID","_subclass","_result","_text","_texture","_textureMarker","_textureName","_size","_color","_textureSize","_classParams","_countChild"];
	_class = _this select 0;
	_classParams = _class call BIS_fnc_ORBATGetGroupParams;
	_result = [];

	_deepness = _this select 1;
	_deepnessMax = _deepness max _deepnessMax;

	_parents = _this select 2;
	if (_class in _parents) exitwith {["Recursion warning - %1 is already listed.",_class] call bis_fnc_error; [_class,_classParams,_result]};
	
	//--- Detect custom code
	_onClickID = _onClick find _class;
	if (_onClickID >= 0) then {
		_onClickCode = _onClick select (_onClickID + 1);
		_onClickCode = [_onCLickCode,0,{},[{}]] call bis_fnc_paramIn;
		_classParams set [count _classParams,_onClickCode];

		_localOverlay set [count _localOverlay,_class];
		_localOverlay set [count _localOverlay,[["\A3\Ui_f\data\GUI\Rsc\RscDisplayORBAT\shortcut_ca.paa",[0,0,0,1],1,1,0,"",false]]];
	};

	if (_class call _fnc_validClass && _deepness < _deepnessLimit) then {
		_parents set [count _parents,_class];
		_classParams set [1,[_class,_deepness,[]] call _fnc_countSubclasses];

		_n = _n + 1;
		_countChild = 0;
		_subordinates = getarray (_class >> "subordinates");
		if (count _subordinates > 0) then {
			{
				_result = _result + [[_parentClass >> _x,_deepness + 1,+_parents] call BIS_fnc_ORBAT_loadConfig];
				_countChild = _countChild + 1;
			} foreach _subordinates;
		} else {
			{
				_result = _result + [[_x,_deepness + 1,+_parents] call BIS_fnc_ORBAT_loadConfig];
				_countChild = _countChild + 1;
			} foreach (_class call bis_fnc_returnchildren);
		};
	};

	//--- Do not show assets when unit is not last in its tier to prevent duplicate assets
	if (count _result > 0) then {
		_classParams set ["assetsText" call bis_fnc_ORBATGetGroupParams,""];
	};

	[_class,_classParams,_result]
};
_deepnessMax = 0;
_n = 0;
_structure = [_class,0,[]] call BIS_fnc_ORBAT_loadConfig;
BIS_fnc_ORBAT_structure = _structure;
BIS_fnc_ORBAT_localOverlay = _localOverlay;

//--- Load background picture
//BIS_fnc_ORBAT_insignia = gettext (_class >> "insignia");
BIS_fnc_ORBAT_insignia = (BIS_fnc_ORBAT_structure select 1) select ("insignia" call bis_fnc_ORBATGetGroupParams);

//--- Background texture color
_colorBackground = [_class,"colorInsignia"] call bis_fnc_returnconfigentry;
if (isnil "_colorBackground") then {_colorBackground = 0;};
_colorBackground = switch (true) do {
	case (typename _colorBackground == typename ""): {
		_colorBackgroundMarker = configfile >> "CfgMarkerColors" >> _colorBackground;
		if (isclass _colorBackgroundMarker) then {getarray (_colorBackgroundMarker >> "color")} else {[0,0,0,1]};
	};
	case (typename _colorBackground == typename []): {
		if (count _colorBackground != 4) then {[1,1,1,0.085]} else {_colorBackground};
	};
	default {[1,1,1,0.085]};
};
_colorBackground call bis_fnc_colorConfigToRGBA;
_colorBackground set [3,0.085];
BIS_fnc_ORBAT_colorBackground = _colorBackground;

BIS_fnc_ORBAT_indexSubclassesCount =	("subClasses" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexTexture =		("texture" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexSize =		("size" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexColor =		("color" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexTextureSize =	("textureSize" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexInfoText =		("infoText" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexSizeTexture =	("sizeTexture" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_indexTextShort =		("textShort" call bis_fnc_ORBATGetGroupParams);
BIS_fnc_ORBAT_countIndex =		("count" call bis_fnc_ORBATGetGroupParams);


//--- Load the structure from array and draw it
BIS_fnc_ORBAT_loadArray = {
	private ["_structure","_index","_offsetX","_offsetY","_posParent","_colorAlpha","_colorAlphaParent","_class","_params","_subclasses","_posX","_posY","_fadeArray","_fadeID","_lineBorder","_iconSizeLocal"];

	_structure = _this select 0;
	_offsetX = _this select 1;
	_offsetY = _this select 2;
	_posParent = _this select 3;
	_colorAlpha = _this select 4;
	_colorAlphaParent = _colorAlpha;

	_class = _structure select 0;
	_params = _structure select 1;
	_subclasses = _structure select 2;

	_subclassesCount =	_params select BIS_fnc_ORBAT_indexSubclassesCount;
	_texture =		_params select BIS_fnc_ORBAT_indexTexture;
	_size =			_params select BIS_fnc_ORBAT_indexSize;
	_color =		_params select BIS_fnc_ORBAT_indexColor;
	_textureSize =		_params select BIS_fnc_ORBAT_indexTextureSize;
	_infoText =		_params select BIS_fnc_ORBAT_indexInfoText;
	_sizeTexture =		_params select BIS_fnc_ORBAT_indexSizeTexture;
	_textShort =		_params select BIS_fnc_ORBAT_indexTextShort;

	_posX = (_posStart select 0) + _offsetX + (_stepX * _subclassesCount * 0.5);
	_posY = (_posStart select 1) + _offsetY;

	//--- Check if visibility is altered by BIS_fnc_ORBATSetGroupFade
	_fadeArray = missionnamespace getvariable ["BIS_fnc_ORBATSetGroupFade_groups",[]];
	_fadeID = _fadeArray find _class;
	if (_fadeID >= 0) then {_colorAlpha = _fadeArray select (_fadeID + 1);};
	_color set [3,(_color select 3) * _colorAlpha];

	//--- During first run store icon positions to array
	if (BIS_fnc_ORBAT_posArrayInit) then {
		BIS_fnc_ORBAT_posArray set [count BIS_fnc_ORBAT_posArray,_class];
		BIS_fnc_ORBAT_posArray set [count BIS_fnc_ORBAT_posArray,[_posX,_posY]];
	};

	//--- Mouse over (only when onClick code is defined for the group)
	_lineBorder = 5;
	_iconSizeLocal = _iconSize;
	_textOffsetYLocal = _textOffsetY;
	if (
		([_posX,_posY] distance (_map ctrlmapscreentoworld BIS_fnc_ORBAT_mousePos)) < (BIS_fnc_ORBAT_step / 5) * _textureSize
		&&
		_colorAlpha > 0
	) then {
		_tooltipParams = _params;
		if (count _params > BIS_fnc_ORBAT_countIndex) then {
			_selected = [_class,_params];
			_lineBorder = 4;
			_iconSizeLocal = _iconSize * 1.2;
			_textOffsetYLocal = _textOffsetY * 1.2;
		};
	};

	if (_textShort == "") then {
		if (count _posParent > 0) then {
			//--- Draw vertical line
			_map drawline [
				[
					_posX,
					_posY + _stepYhalf
				],
				[
					_posX,
					_posY - _stepYhalf
				],
				[0,0,0,_colorAlphaParent]
			];

			//--- Draw horizontal line
			_map drawline [
				[
					_posParent select 0,
					_posY - _stepYhalf
				],
				[
					_posX,
					_posY - _stepYhalf
				],
				[0,0,0,_colorAlphaParent]
			];
		};
	} else {
		//--- Draw line down (to subordinate units)
		if (count _subclasses > 0) then {
			_map drawline [
				[
					_posX,
					_posY + _stepY / _lineBorder - _textOffsetY / 2
				],
				[
					_posX,
					_posY + _stepYhalf
				],
				[0,0,0,_colorAlpha]
			];
		};

		if (count _posParent > 0) then {

			//--- Draw line up (to parent unit)
			_map drawline [
				[
					_posX,
					_posY - _stepY / _lineBorder
				],
				[
					_posX,
					_posY - _stepYhalf
				],
				[0,0,0,_colorAlphaParent]
			];

			//--- Draw horizontal line
			_map drawline [
				[
					_posParent select 0,
					_posY - _stepYhalf
				],
				[
					_posX,
					_posY - _stepYhalf
				],
				[0,0,0,_colorAlphaParent]
			];
		};
	};

	//--- Draw size texture
	if (_size >= 0) then {
		_map drawicon [
			_sizeTexture,
			_color,
			[_posX,_posY],
			_iconSizeLocal,
			_iconSizeLocal,
			0,
			"",
			0
		];
	};

	//--- Draw unit texture
	_map drawicon [
		_texture,
		_color,
		[_posX,_posY],
		_iconSizeLocal * _textureSize,
		_iconSizeLocal * _textureSize,
		0,
		"",
		0
	];

	//--- Draw text
	_map drawicon [
		"#(argb,8,8,3)color(0,0,0,0)",
		[0,0,0,1],
		[_posX,_posY - _textOffsetYLocal],	//[_posX - _textOffsetX,_posY - _textOffsetYLocal],
		//[_posX,_posY],
		_iconSize * 1.1,
		0,
		0,
		_textShort,
		0,
		0.0006 * _iconSize,
		"PuristaLight",
		"center"
	];

	//--- Draw custom textures
	_overlay = missionnamespace getvariable ["BIS_fnc_ORBATAddGroupOverlay_groups",[]];
	_localOverlay = missionnamespace getvariable ["BIS_fnc_ORBAT_localOverlay",[]];
	if (round ctrlfade (_display displayctrl 2) == 1) then {_localOverlay = [];}; //--- Do not show custom overlay when interface is hidden
	{
		_classID = _x find _class;
		if (_classID >= 0) then {
			_classOverlay = _x select (_classID + 1);
			{
				if (typename _x == typename []) then {
					_xTexture = _x select 0;
					_xColor = +(_x select 1);
					_xWidth = _x select 2;
					_xHeight = _x select 3;
					_xAngle = _x select 4;
					_xText = _x select 5;
					_xShadow = _x select 6;

					//--- Read dynamic params passed as code
					if (typename _xColor == typename {}) then {
						_xColor = call _xColor;
						_xColor = [_xColor,0,[1,1,1,1],[[]]] call bis_fnc_paramIn;
					};
					if (typename _xWidth == typename {}) then {
						_xWidth = call _xWidth;
						_xWidth = [_xWidth,0,1,[1]] call bis_fnc_paramIn;
					};
					if (typename _xHeight == typename {}) then {
						_xHeight = call _xHeight;
						_xHeight = [_xHeight,0,1,[1]] call bis_fnc_paramIn;
					};
					if (typename _xAngle == typename {}) then {
						_xAngle = call _xAngle;
						_xAngle = [_xAngle,0,0,[0]] call bis_fnc_paramIn;
					};

					_xColor set [3,(_xColor select 3) * _colorAlpha];

					//--- Convert size to coeficients of original icon size
					_xWidth = _xWidth * (_iconSizeLocal * _textureSize);
					_xHeight = _xHeight * (_iconSizeLocal * _textureSize);

					//--- Draw
					_map drawicon [_xTexture,_xColor,[_posX,_posY],_xWidth,_xHeight,_xAngle,_xText,_xShadow];
				};
			} foreach _classOverlay;
		};
	} foreach [_overlay,_localOverlay];

	//--- Deeper
	private ["_n"];
	_n = 0;
	{
		private ["_params","_subclassesCount"];
		_params = _x select 1;
		_subclassesCount = _params select 1;
		[
			_x,
			_offsetX + (_stepX * _n),
			_offsetY + _stepY,
			[_posX,_posY],
			_colorAlpha
		] call BIS_fnc_ORBAT_loadArray;
		_n = _n + _subclassesCount;
	} foreach _subclasses;
};


//--- Draw the structure on map
BIS_fnc_ORBAT_draw = {
	_map = _this select 0;
	_display = ctrlparent _map;
	_mapScale = (1 / (ctrlmapscale _map max 0.0001)) / BIS_fnc_ORBAT_sizeCoef;
	_initPosArray = false;

	//_tooltip = _display displayctrl 2350;
	//_tooltip ctrlsetfade 1;

	_iconSize = (BIS_fnc_ORBAT_step / 32) * _mapScale * safezoneH;
	_posStart = [1000,1000];
	_offsetX = 0;
	_offsetY = 0;
	_selected = [];
	_tooltipParams = [];

	_stepX = (BIS_fnc_ORBAT_step / 1.3) * safezoneH;
	_stepY = -BIS_fnc_ORBAT_step * safezoneH;
	_stepYhalf = _stepY / 2;

//	_textOffsetX = 4.2 * safezoneH;		- text offset removed, no need for this anymore?
	_textOffsetY = 2.4 * safezoneH;

	//--- Background (black on start to avoid white flashing)
	_colorBackground = if (BIS_fnc_ORBAT_posArrayInit) then {"#(argb,8,8,3)color(0,0,0,1)"} else {"#(argb,8,8,3)color(1,1,1,1)"};
	_map drawRectangle [_posStart,99999,99999,0,[1,1,1,1],_colorBackground];

	//--- Background picture
	if !(BIS_fnc_ORBAT_posArrayInit) then {
	_map drawicon [
		BIS_fnc_ORBAT_insignia,
		BIS_fnc_ORBAT_colorBackground,
		//BIS_fnc_ORBAT_posStart,
		(_map ctrlmapscreentoworld [0.5,0.5]),
		//1 * _mapScale * safezoneH,
		//1 * _mapScale * safezoneH,
		384 * safezoneH,
		384 * safezoneH,
		0,
		"",
		0
	];
	};

	//--- Structure
	[
		BIS_fnc_ORBAT_structure,
		_offsetX,
		_offsetY,
		[],
		1
	] call BIS_fnc_ORBAT_loadArray;

	[_tooltipParams,_display,BIS_fnc_ORBAT_mousePos] call bis_fnc_ORBATTooltip;

	//_tooltip ctrlcommit 0;
	BIS_fnc_ORBAT_posArrayInit = false;
	BIS_fnc_ORBAT_selected = _selected;
};

BIS_fnc_ORBATOpen_keyDown = {
	_display = _this select 0;
	_key = _this select 1;

	//--- H
	switch _key do {
		case 35: {
			_fade = ceil ctrlfade (_display displayctrl 2);
			_fade = (_fade + 1) % 2;
			{
				(_display displayctrl _x) ctrlsetfade _fade;
				(_display displayctrl _x) ctrlcommit 0.3;
			} foreach [2,1000,2350];
		};
	};
	false
};

BIS_fnc_ORBAT_selected = [];
BIS_fnc_ORBAT_mousePos = [0,0];
BIS_fnc_ORBAT_mouse = {
	BIS_fnc_ORBAT_mousePos = [_this select 1,_this select 2];
};
BIS_fnc_ORBAT_mouseClickDisable = false;
BIS_fnc_ORBAT_mouseClick = {
	if !(BIS_fnc_ORBAT_mouseClickDisable) then {
		disableserialization;
		_selected = BIS_fnc_ORBAT_selected;
		if (count _selected > 0) then {
			_params = _selected select 1;
			if (count _params > BIS_fnc_ORBAT_countIndex) then {
				_display = ctrlparent (_this select 0);
				_onClickCode = _params select BIS_fnc_ORBAT_countIndex;

				_close = _selected call _onClickCode;
				_close = [_close,0,false,[false]] call bis_fnc_paramIn;

				if (_close) then {
					BIS_fnc_ORBAT_mouseClickDisable = true;
					_fade = _display displayctrl 1099;
					_fade ctrlsetfade 0;
					_fade ctrlcommit 0.3;
					uisleep 0.3;
					_display closedisplay 2;
				};
			};
		};
	};
};

BIS_fnc_ORBAT_posArray = [];
BIS_fnc_ORBAT_posArrayInit = true;


//--- Map init
_map = _display displayctrl 51;

BIS_fnc_ORBAT_sizeCoef = ((_map ctrlmapscreentoworld [0,0] select 1) - (_map ctrlmapscreentoworld [0,1] select 1)) * (_mapSize / 1000 / 384);
BIS_fnc_ORBAT_sizeCoef = BIS_fnc_ORBAT_sizeCoef max 0.01;

[_map] call BIS_fnc_ORBAT_draw;
_map ctrladdeventhandler ["draw","_this call BIS_fnc_ORBAT_draw;"];
_map ctrladdeventhandler ["mousemoving","_this call BIS_fnc_ORBAT_mouse;"];
_map ctrladdeventhandler ["mouseholding","_this call BIS_fnc_ORBAT_mouse;"];
_map ctrladdeventhandler ["mousebuttonclick","_this spawn BIS_fnc_ORBAT_mouseClick;"];
_display displayaddeventhandler ["keydown","_this call BIS_fnc_ORBATOpen_keyDown"];

//--- Move to upmost tier icon
_parentParams = BIS_fnc_ORBAT_structure select 1;
_subclassesCount = _parentParams select 1;

BIS_fnc_ORBAT_posStart = [	
	//1000 + ((BIS_fnc_ORBAT_step / 2) * safezoneH) * _subclassesCount * 0.5,
	(BIS_fnc_ORBAT_posArray select 1) select 0,
	1000 - (_deepnessMax * BIS_fnc_ORBAT_step) * 0.6,
	0
];
_map ctrlmapanimadd [0,((0.001 * _subclassesCount) * (safezoneH / safezoneW)) / BIS_fnc_ORBAT_sizeCoef,BIS_fnc_ORBAT_posStart];
ctrlmapanimcommit _map;

//--- Info init
_info = _display displayctrl 1200;
_info ctrlenable false;

//--- Footer  init
_footer = _display displayctrl 1000;
_footer ctrlsettext (_parentParams select ("text" call bis_fnc_ORBATGetGroupParams));

//--- Fade in
_fade = _display displayctrl 1099;
_fade ctrlsetfade 1;
_fade ctrlcommit 0.5;

//--- Create upward looking camera (increases FPS, as no scene is drawn)
BIS_fnc_ORBAT_camera = if (count allmissionobjects "Camera" == 0 && !visiblemap) then {
	_camera = "camera" camcreate position player;
	_camera cameraeffect ["internal","back"];
	_camera campreparepos [position player select 0,position player select 1,(position player select 2) + 10];
	_camera campreparetarget [position player select 0,(position player select 1) + 1,(position player select 2) + 1000];
	_camera campreparefov 0.1;
	_camera camcommitprepared 0;
	_camera
} else {
	objnull
};


//--- Garbage collector
_display displayaddeventhandler [
	"unload",
	"
		BIS_fnc_ORBAT_camera cameraeffect ['terminate','back'];
		camdestroy BIS_fnc_ORBAT_camera;

		BIS_fnc_ORBAT_camera = nil;
		BIS_fnc_ORBAT_step = nil;
		BIS_fnc_ORBAT_loadConfig = nil;
		BIS_fnc_ORBAT_structure = nil;
		BIS_fnc_ORBAT_insignia = nil;
		BIS_fnc_ORBAT_colorBackground = nil;
		BIS_fnc_ORBAT_loadArray = nil;
		BIS_fnc_ORBAT_mousePos = nil;
		BIS_fnc_ORBAT_mouse = nil;
		BIS_fnc_ORBAT_draw = nil;
		BIS_fnc_ORBAT_sizeCoef = nil;
		BIS_fnc_ORBAT_posStart = nil;
		BIS_fnc_ORBAT_posArray = nil;
		BIS_fnc_ORBAT_posArrayInit = nil;
		BIS_fnc_ORBAT_localOverlay = nil;
		BIS_fnc_ORBAT_selected = nil;
		BIS_fnc_ORBAT_indexSubclassesCount = nil;
		BIS_fnc_ORBAT_indexTexture = nil;
		BIS_fnc_ORBAT_indexSize = nil;
		BIS_fnc_ORBAT_indexColor = nil;
		BIS_fnc_ORBAT_indexTextureSize = nil;
		BIS_fnc_ORBAT_indexInfoText = nil;
		BIS_fnc_ORBAT_indexSizeTexture = nil;
		BIS_fnc_ORBAT_indexTextShort = nil;
		BIS_fnc_ORBAT_countIndex = nil;
		
		0 fadeMusic 0;
		3 fadeMusic 0.5;
	"
];

endloadingscreen;
_display;