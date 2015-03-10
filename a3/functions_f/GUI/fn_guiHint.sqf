/*
	Author: Karel Moricky

	Description:
	Creates advanced hintC dialog

	Parameter(s):
	_this select 0: ARRAY in format
		[text,picture]
			* text: STRING - hint text
			* picture: STRING - picture
		[item1,item2...] - Listbox item ARRAYs in format
			[itemText,itemDescription,picture,icon]
				* itemText: STRING - Text displayed in listbox
				* itemDescription (Optional): STRING - text displayed after clicking on item
				* picture (Optional): STRING - picture displayed after clicking on item
				* icon (Optional): STRING - icon displayed in listbox left from text
	_this select 1 (Optional): STRING - hint header
	_this select 2 (Optional): ARRAY - [STRING,CODE,NUMBER] - text on left button (when "", button is hidden), code executed upon clicking and fade out delay. If only text is present, button is disabled.
	_this select 3 (Optional): ARRAY - [STRING,CODE,NUMBER] - STRING - text on right button and code executed upon clicking
	_this select 4 (Optional): ARRAY - [STRING,CODE,NUMBER] - STRING - text on middle button and code executed upon clicking
	_this select 5 (Optional): NUMBER or ARRAY - width or [width,height] of picture (in grid coordinates). Width > 17 means only picture is used.

	Returns:
	ARRAY - [endState(,lbId)]
		* endState: NUMBER - 1 when clicked on right button, -1 when clicked on left button, 0 when escaped
		* lbId: NUMBER - selected listbox item (when listbox was used)
*/

#define DISPLAY_CLASS	'Hsim_RscDisplayCommonHint_guiHint'
#define DISPLAY_CONFIG	(configfile >> "RscDisplayCommonHint")
#define DISPLAY		(uinamespace getvariable DISPLAY_CLASS)
#define CONTROL		(DISPLAY displayctrl _idc)

#define CONTROL_FADEINTIME	0.3
#define CONTROL_FADEIN \
	CONTROL ctrlsetfade 1; \
	CONTROL ctrlcommit 0; \
	CONTROL ctrlsetfade 0; \
	CONTROL ctrlcommit CONTROL_FADEINTIME;


disableserialization;
private ["_posX","_posY","_posW","_posH","_textHeader","_textMessage","_pos","_buttonW","_buttonH","_posText","_idc","_result"];

private [
	"_textMessage",
	"_textHeader",
	"_buttonTextRight",
	"_buttonTextLeft",
	"_buttonTextMiddle",
	"_picturePos",
	"_exitDelay",
	"_GUI_GRID",
	"_GUI_GRID_X",
	"_GUI_GRID_Y",
	"_GUI_GRID_w",
	"_GUI_GRID_H",
	"_pictureW",
	"_pictureH",
	"_textPicture",
	"_textMessageCount",
	"_paddingW",
	"_paddingWpicture",
	"_paddingH",
	"_marginBcgW",
	"_marginBcgH",
	"_posW",
	"_posH",
	"_posX",
	"_posY",
	"_buttonW",
	"_buttonH",
	"_pos",
	"_posPicture",
	"_posText",
	"_posListbox",
	"_posSubText",
	"_fnc_bcg",
	"_buttonTextRightDisable",
	"_buttonCodeRight",
	"_buttonTextLeftDisable",
	"_buttonCodeLeft",
	"_buttonTextMiddleDisable",
	"_buttonCodeMiddle",
	"_idc",
	"_display",
	"_result"
];

BIS_fnc_guiHint_status = 0;
_textMessage =		[_this,0,[],[[]]] call bis_fnc_param;
_textHeader =		[_this,1,"",["",parsetext ""]] call bis_fnc_param;
_buttonTextRight =	[_this,2,localize "STR_DISP_OK",["",[]]] call bis_fnc_param;
_buttonTextLeft =	[_this,3,"",["",[]]] call bis_fnc_param;
_buttonTextMiddle =	[_this,4,"",["",[]]] call bis_fnc_param;
_picturePos =		[_this,5,[],[0,[]]] call bis_fnc_param;

//--- Load config grid
_GUI_GRID = ["GUI","GRID_OLD_CENTER"] call bis_fnc_guiGrid;
_GUI_GRID_X = ((_GUI_GRID select 0) select 0);
_GUI_GRID_Y = ((_GUI_GRID select 0) select 1);
_GUI_GRID_W = (_GUI_GRID select 1);
_GUI_GRID_H = (_GUI_GRID select 2);

//--- Calculate positions
if (typename _picturePos == typename 0) then {_picturePos = [_picturePos];};
_pictureW = [_picturePos,0,6,[0]] call bis_fnc_param;
_pictureH = [_picturePos,1,12,[0]] call bis_fnc_param;
_pictureW = _pictureW * _GUI_GRID_W;
_pictureH = _pictureH * _GUI_GRID_H;
_textPicture = "";
_textMessageCount = 0;

//--- Coeficients
_paddingW = 0.5 * _GUI_GRID_W;
_paddingWpicture = if (_pictureW <= 0) then {0} else {_paddingW};
_paddingH = 0.5 * _GUI_GRID_H;
_marginBcgW = 0.2 * _GUI_GRID_W * 0;
_marginBcgH = 0.2 * _GUI_GRID_W * 0;

//--- Dialog size
_posW = 18 * _GUI_GRID_W;
_posH = _pictureH + _GUI_GRID_H * 2 + _paddingH * 2;
_posX = safezoneX + (safezoneW - _posW) / 2;
_posY = safezoneY + (safezoneH - _posH) / 2;

//--- Picture wider than dialog - leave picture only
_pictureOnly = if (_pictureW >= (_posW - _paddingW * 2)) then {
	_pictureW = _posW - _paddingW * 2;
	true
} else {
	false
};

//---- Button size
_buttonW = _posW / 3;
_buttonH = _GUI_GRID_H;
_pos = [
	_posX,
	_posY,
	_posW,
	_posH
];
_posPicture = [
	_posX + _paddingWpicture,
	_posY + _paddingH + _GUI_GRID_H,
	_pictureW,
	_pictureH
];
_posText = [
	(_posPicture select 0) + _pictureW + _paddingW,
	(_posPicture select 1),
	_posW - _pictureW - _paddingW * 2 - _paddingWpicture,
	_pictureH
];
_posListbox = [
	_posX + _paddingW,
	(_posPicture select 1),
	_posW - _pictureW - _paddingW * 2 - _paddingWpicture,
	_pictureH / 2
];
_posSubText = [
	0,
	0,
	(_posText select 2) - _paddingW,
	0
];
_fnc_bcg = {
	[
		(_this select 0) - _marginBcgW,
		(_this select 1) - _marginBcgH,
		(_this select 2) + _marginBcgW * 2,
		(_this select 3) + _marginBcgH * 2
	]
};

//--- Disabled buttons
_buttonTextRightDisable = false;
_buttonDelayRight = [_buttonTextRight,2,1,[1]] call bis_fnc_param;
_buttonCodeRight = [_buttonTextRight,1,{},[{}]] call bis_fnc_param;
if (typename _buttonTextRight == typename []) then {
	_buttonTextRightDisable = count _buttonTextRight <= 1;
};
_buttonTextRight = [_buttonTextRight,0,"",[""]] call bis_fnc_param;
uinamespace setvariable [_fnc_scriptname + "_codeRight",_buttonCodeRight];

_buttonTextLeftDisable = false;
_buttonDelayLeft = [_buttonTextLeft,2,1,[1]] call bis_fnc_param;
_buttonCodeLeft = [_buttonTextLeft,1,{},[{}]] call bis_fnc_param;
if (typename _buttonTextLeft == typename []) then {
	_buttonTextLeftDisable = count _buttonTextLeft <= 1;
};
_buttonTextLeft = [_buttonTextLeft,0,"",[""]] call bis_fnc_param;
uinamespace setvariable [_fnc_scriptname + "_codeLeft",_buttonCodeLeft];

_buttonTextMiddleDisable = false;
_buttonDelayMiddle = [_buttonTextMiddle,2,1,[1]] call bis_fnc_param;
_buttonCodeMiddle = [_buttonTextMiddle,1,{},[{}]] call bis_fnc_param;
if (typename _buttonTextMiddle == typename []) then {
	_buttonTextMiddleDisable = count _buttonTextMiddle <= 1;
};
_buttonTextMiddle = [_buttonTextMiddle,0,"",[""]] call bis_fnc_param;
uinamespace setvariable [_fnc_scriptname + "_codeMiddle",_buttonCodeMiddle];

if (isnil {DISPLAY}) then {uinamespace setvariable [DISPLAY_CLASS,displaynull]};
//waituntil {isnull DISPLAY};

//--- Create background
[nil,4000] call BIS_fnc_guiBackground;
[_pos] call BIS_fnc_guiBackground;

//--- Create dialog
createdialog "RscDisplayCommonHint";
uinamespace setvariable [DISPLAY_CLASS,uinamespace getvariable "HSim_RscDisplayCommonHint"];

////////////////////////////////////////////////////////////////////////////////////////
//--- Header
_idc = 1101;//[DISPLAY_CONFIG,"StructuredText_0"] call BIS_fnc_getIDC;
CONTROL ctrlsetposition [
	_posX + _GUI_GRID_W * 0.1,
	_posY + _GUI_GRID_H * 0.07,
	_posW,
	_GUI_GRID_H
];
if (typename _textHeader == typename "") then {
	_textHeader = parsetext format ["<t align='left' size='1.3'>%1</t>",_textHeader];
};
CONTROL ctrlsetstructuredtext _textHeader;
CONTROL ctrlcommit 0;
CONTROL_FADEIN

////////////////////////////////////////////////////////////////////////////////////////
//--- Listbox
if (count _textMessage > 0) then{
	if (typename (_textMessage select 0) == typename []) then {
		_textMessageCount = count _textMessage + 1;

		//--- Add item
		_idc = 1500;//[DISPLAY_CONFIG,"Listbox_1"] call BIS_fnc_getIDC;
		CONTROL ctrlsetposition [
			_posText select 0,
			_posText select 1,
			_posText select 2,
			0.04 * _textMessageCount
		];
		{
			private ["_lbText","_lbPicture"];
			_lbText =	[_x,0,"",["",[]]] call bis_fnc_param;
			_lbIcon =	[_x,3,"",[""]] call bis_fnc_param;
			_lbAdd = CONTROL lbadd _lbText;

			//--- Add icon
			if (_lbIcon != "") then {
				_lbPicture = [_x,1,"",[""]] call bis_fnc_param;
				CONTROL lbsetpicture [_lbAdd,_lbIcon];
			};
		} foreach _textMessage;
		CONTROL ctrladdeventhandler ["LBDblClick","BIS_fnc_guiHint_status = +1; ((ctrlParent (_this select 0)) closeDisplay 3000);"];

		//--- On LB selection changed event handler
		uinamespace setvariable [_fnc_scriptname + "_textMessage",_textMessage];
		uinamespace setvariable [_fnc_scriptname + "_lbselchanged",{
			disableserialization;
			_params = _this select 0;
			_fnc_scriptName = _this select 1;

			_control = _params select 0;
			_lbId = _params select 1;
			if (_lbId >= 0) then {
				uinamespace setvariable [_fnc_scriptname + "_cursel",_lbId];

				_textMessage = uinamespace getvariable (_fnc_scriptname + "_textMessage");
				_lbArray = _textMessage select _lbId;
				if (typename _lbArray == typename []) then {
					_lbMessage = [_lbArray,1,"",[""]] call bis_fnc_param;
					_lbPicture = [_lbArray,2,"#(argb,8,8,3)color(1,0,1,1)",[""]] call bis_fnc_param;

					_idc = 1100;//[DISPLAY_CONFIG >> "controls" >> "GroupText","StructuredText_0"] call BIS_fnc_getIDC;
					CONTROL ctrlsetstructuredtext parsetext _lbMessage;
					_ctrlPos = ctrlposition CONTROL;
					_ctrlPos set [3,ctrltextheight CONTROL];
					CONTROL ctrlsetposition _ctrlPos;
					CONTROL ctrlcommit 0;

					_idc = 1200;//[DISPLAY_CONFIG,"Picture_0"] call BIS_fnc_getIDC;
					CONTROL ctrlsettext _lbPicture;
				} else {
					_idc = 1100;//[DISPLAY_CONFIG >> "controls" >> "GroupText","StructuredText_0"] call BIS_fnc_getIDC;
					CONTROL ctrlsetstructuredtext parsetext "";
					_idc = 1200;//[DISPLAY_CONFIG,"Picture_0"] call BIS_fnc_getIDC;
					CONTROL ctrlsettext "#(argb,8,8,3)color(1,0,1,1)";
				};
			};
		}];

		//--- Selected item
		uinamespace setvariable [_fnc_scriptname + "_cursel",if !(isnil "BIS_fnc_guiHint_curselCustom") then {BIS_fnc_guiHint_curselCustom} else {0}];
		CONTROL ctrladdeventhandler [
			"lbselchanged",
			format ["[_this,'%1'] call (uinamespace getvariable '%1_lbselchanged');",_fnc_scriptName]
		];
		CONTROL ctrlcommit 0;
		CONTROL lbsetcursel (uinamespace getvariable (_fnc_scriptname + "_cursel"));
		CONTROL_FADEIN

		//--- Move on the bottom
		//_posText set [1,(_posPicture select 1) + (_pictureH / 2) + _paddingH];
		///_posText set [1,(_posPicture select 1) + (_pictureH / 5) + _paddingH];
	} else {
		_textPicture = [_textMessage,1,"#(argb,8,8,3)color(1,0,1,1)",[""]] call bis_fnc_param;
		_textMessage = [_textMessage,0,"",[""]] call bis_fnc_paramIn;
	};

	//--- Text
	_idc = 2300;//[DISPLAY_CONFIG,"GroupText"] call BIS_fnc_getIDC;
	_sizeEx = getnumber (DISPLAY_CONFIG >> "controls" >> "HintListbox" >> "sizeex");
	CONTROL ctrlsetposition [
		(_posText select 0),
		(_posText select 1) + _sizeEx * _textMessageCount,
		(_posText select 2),
		(_posText select 3) - _sizeEx * _textMessageCount
	];
	if (typename _textMessage == typename "") then {
		_textMessage = parsetext format ["<t align='left'>%1</t>",_textMessage];
	};
	CONTROL ctrlsetbackgroundcolor [1,0,1,1];
	CONTROL ctrlcommit 0;
	CONTROL_FADEIN

	_idc = 1100;//[DISPLAY_CONFIG >> "controls" >> "GroupText","StructuredText_0"] call BIS_fnc_getIDC;
	if (typename _textMessage != typename []) then {
		CONTROL ctrlsetstructuredtext _textMessage;
	};
	_posSubText set [3,ctrltextheight CONTROL];
	CONTROL ctrlsetposition _posSubText;
	CONTROL ctrlcommit 0;
	CONTROL_FADEIN
};

////////////////////////////////////////////////////////////////////////////////////////
//--- Picture background
/* I'm disabled
_posBcg = _posPicture call _fnc_bcg;
_idc = [DISPLAY_CONFIG,"IGUIBack_2"] call BIS_fnc_getIDC;
CONTROL ctrlsetposition _posBcg;
CONTROL ctrlcommit 0;
*/
_posPicture = _posPicture call _fnc_bcg;

//--- Picture
_idc = 1200;//[DISPLAY_CONFIG,"Picture_0"] call BIS_fnc_getIDC;
CONTROL ctrlsetposition _posPicture;
//CONTROL ctrlsettext _textPicture;
if (_pictureW < _GUI_GRID_W / 2) then {CONTROL ctrlshow false} else {CONTROL ctrlshow true};
CONTROL ctrlcommit 0;
CONTROL_FADEIN

////////////////////////////////////////////////////////////////////////////////////////
//--- Button Right
if (_buttonTextRight!= "") then {
	//_idc = [DISPLAY_CONFIG,"ButtonMenu_0"] call BIS_fnc_getIDC;
	_idc = 1701;
	CONTROL ctrlsetposition [
		_posX + _posW - _buttonW * 1,
		_posY + _posH - _buttonH,
		_buttonW,
		_buttonH
	];
	CONTROL ctrlsettext _buttonTextRight;

	CONTROL ctrladdeventhandler ["buttonclick",format ["with uinamespace do {[1,_this,%1] spawn bis_fnc_guiHint_buttonclick;};",_buttonDelayRight]];
	CONTROL ctrlcommit 0;
	ctrlsetfocus CONTROL;
	if (_buttonTextRightDisable) then {CONTROL ctrlenable false;};
	CONTROL_FADEIN
};

////////////////////////////////////////////////////////////////////////////////////////
if (_buttonTextLeft != "") then {
	//--- Button Left
	//_idc = [DISPLAY_CONFIG,"ButtonMenu_1"] call BIS_fnc_getIDC;
	_idc = 1700;
	CONTROL ctrlsetposition [
		//_posX + _posW - _buttonW * 2,
		_posX,
		_posY + _posH - _buttonH,
		_buttonW,
		_buttonH
	];
	CONTROL ctrlsettext _buttonTextLeft;
	CONTROL ctrladdeventhandler ["buttonclick",format ["with uinamespace do {[-1,_this,%1] spawn bis_fnc_guiHint_buttonclick;};",_buttonDelayLeft]];
	CONTROL ctrlcommit 0;
	if (_buttonTextLeftDisable) then {CONTROL ctrlenable false;};
	CONTROL_FADEIN
};

////////////////////////////////////////////////////////////////////////////////////////
if (_buttonTextMiddle != "") then {
	//--- Button Middle
	_idc = 1702;
	CONTROL ctrlsetposition [
		_posX + _posW - _buttonW * 2,
		_posY + _posH - _buttonH,
		_buttonW,
		_buttonH
	];
	CONTROL ctrlsettext _buttonTextMiddle;
	CONTROL ctrladdeventhandler ["buttonclick",format ["with uinamespace do {[0,_this,%1] spawn bis_fnc_guiHint_buttonclick;};",_buttonDelayMiddle]];
	CONTROL ctrlcommit 0;
	if (_buttonTextMiddleDisable) then {CONTROL ctrlenable false;};
	CONTROL_FADEIN
};

////////////////////////////////////////////////////////////////////////////////////////

uinamespace setvariable [
	_fnc_scriptname + "_buttonClick",
	{
		_status = _this select 0;
		_delay = _this select 2;
		_this = _this select 1;
		missionnamespace setvariable ["BIS_fnc_guiHint_status",_status];

		disableserialization;
		_button = _this select 0;
		_display = ctrlParent _button;

		//--- Remove current action
		_button ctrlremovealleventhandlers "buttonclick";

		//--- Fade out
		_controls = [DISPLAY_CONFIG,0,false] call bis_fnc_displaycontrols;
		{
			if (_x < 10000) then {
				_idc = _x;
				CONTROL ctrlsetfade 1;
				CONTROL ctrlcommit CONTROL_FADEINTIME;
			};
		} foreach _controls;
		uisleep CONTROL_FADEINTIME;

		//--- Execute button code
		_codeName = switch _status do {
			case -1: {"BIS_fnc_guiHint_codeLeft"};
			case 0: {"BIS_fnc_guiHint_codeMiddle"};
			case +1: {"BIS_fnc_guiHint_codeRight"};
			default {""}
		};
		_code = uinamespace getvariable [_codeName,{}];
		with missionnamespace do {[] spawn _code;};

		//--- Close display
		_time = diag_ticktime + _delay;
		waituntil {DISPLAY != _display || diag_ticktime > _time};
		_display closeDisplay 3000;
	}
];
uinamespace setvariable [
	_fnc_scriptname + "_unLoad",
	{
		if (isnull DISPLAY) then {
			uinamespace setvariable ["BIS_fnc_guiHint_buttonclick",nil];
			uinamespace setvariable ["BIS_fnc_guiHint_unload",nil];
		};
		_exitCode = uinamespace getvariable ["BIS_fnc_guiHint_codeMiddle",{}];
		call _exitCode;
		true
	}
];
DISPLAY displayaddeventhandler ["unload","with uinamespace do {_this spawn bis_fnc_guiHint_unload;};"];

//--- Assign button actions
/*
uisleep CONTROL_FADEINTIME;
_idc = 1701;
CONTROL ctrladdeventhandler ["buttonclick","with uinamespace do {[1,_this] spawn bis_fnc_guiHint_buttonclick;};"];
_idc = 1700;
CONTROL ctrladdeventhandler ["buttonclick","with uinamespace do {[-1,_this] spawn bis_fnc_guiHint_buttonclick;};"];
_idc = 1702;
CONTROL ctrladdeventhandler ["buttonclick","with uinamespace do {[0,_this] spawn bis_fnc_guiHint_buttonclick;};"];
*/

//--- Done
_display = DISPLAY;
waituntil {_display != DISPLAY};

_result = [BIS_fnc_guiHint_status];
if (!isnil {uinamespace getvariable (_fnc_scriptname + "_cursel")}) then {_result = _result + [uinamespace getvariable (_fnc_scriptname + "_cursel")]};

_result