/*
	Author: Karel Moricky

	Description:
	Displays message window

	Parameter(s):
		0: STRING or STRUCTURED TEXT - message body
		1: STRING - message header
		2:
			BOOL - enable/disable "OK" button
			TEXT - set "OK" button's text (enabling it automatically)
		3:
			BOOL - enable/disable "Cancel" button
			TEXT - set "Cancel" button's text (enabling it automatically)
		4: DISPLAY - parent display
		5: BOOL - when true, function will try to use control inherited from 'RscMessageBox' in display instead of creating a new one
		6: BOOL - true to pause the game, false to let it running

	Returns:
		BOOL - true if "OK" button was activated, false if "Cancel" was activated or user pressed "Escape" key.
*/
private ["_textMessage","_textHeader","_textOK","_textCancel","_parent","_useParentBox","_isPause","_display","_ctrlRscMessageBox","_ctrlBcgCommonTop",
"_ctrlBcgCommon","_ctrlText","_ctrlBackgroundButtonOK","_ctrlBackgroundButtonMiddle","_ctrlBackgroundButtonCancel","_ctrlButtonOK","_ctrlButtonCancel",
"_allControls","_positions","_ctrlButtonOKPos","_ctrlBcgCommonPos","_bottomSpaceY","_marginX","_marginY","_ctrlTextPosH","_bottomPosY",
"_ctrlRscMessageBoxPos","_ctrlRscMessageBoxPosH","_focus","_ehKeyDown","_status"];

#define DISPLAY_DEFAULT	(uinamespace getvariable "RscDisplayCommonMessage_display")

disableserialization;
_textMessage =	[_this,0,"",["",parsetext "",[]]] call bis_fnc_param;
_textHeader =	[_this,1,"",[""]] call bis_fnc_param;
_textOK =	[_this,2,true,["",false]] call bis_fnc_param;
_textCancel =	[_this,3,false,["",false]] call bis_fnc_param;
_parent =	[_this,4,[] call bis_fnc_displayMission,[displaynull]] call bis_fnc_param;
_useParentBox = [_this,5,false,[false]] call bis_fnc_param;
_isPause = 	[_this,6,true,[false]] call bis_fnc_param;

//--- Show message box and terminate if it failed
if !(_useParentBox) then {
	_displayClass = if (_isPause) then {"RscDisplayCommonMessagePause"} else {"RscDisplayCommonMessage"};
	_parent createdisplay _displayClass;
};
if (!_useParentBox && isnil {DISPLAY_DEFAULT}) exitwith {["Unable to create message box"] call bis_fnc_error; false};
if (!_useParentBox && isnull (DISPLAY_DEFAULT)) exitwith {["Unable to create message box."] call bis_fnc_error; false};
if (_useParentBox && isnull (_parent)) exitwith {["Parent display does not exist."] call bis_fnc_error; false};
if (_useParentBox && isnull (_parent displayctrl 2351)) exitwith {["Control inheriting from 'RscMessageBox' not found in display %1.",_parent] call bis_fnc_error; false};

if (typename _textMessage == typename "") then {_textMessage = parsetext _textMessage;};

//--- Declare UI controls
_display = if (_useParentBox) then {_parent} else {DISPLAY_DEFAULT;};
_ctrlRscMessageBox =		_display displayctrl 2351;
_ctrlBcgCommonTop =		_display displayctrl 235100;
_ctrlBcgCommon =		_display displayctrl 235101;
_ctrlText =			_display displayctrl 235102;
_ctrlBackgroundButtonOK =	_display displayctrl 235103;
_ctrlBackgroundButtonMiddle =	_display displayctrl 235104;
_ctrlBackgroundButtonCancel =	_display displayctrl 235105;
_ctrlButtonOK =			_display displayctrl 235106;
_ctrlButtonCancel =		_display displayctrl 235107;
_allControls = [_ctrlBcgCommonTop,_ctrlBcgCommon,_ctrlText,_ctrlBackgroundButtonOK,_ctrlBackgroundButtonMiddle,_ctrlBackgroundButtonCancel,_ctrlButtonOK,_ctrlButtonCancel];

//--- Default control positions
if (_useParentBox) then {
	_positions = uinamespace getvariable "BIS_fnc_guiMessage_defaultPositions";
	if (isnil "_positions") then {
		_positions = [];
		{
			_xPos = ctrlposition _x;
			_positions set [count _positions,_xPos];
		} foreach _allControls;
		uinamespace setvariable ["BIS_fnc_guiMessage_defaultPositions",_positions];
		_display displayaddeventhandler ["unload","uinamespace setvariable ['BIS_fnc_guiMessage_defaultPositions',nil];"];
	} else {
		{
			_x ctrlsetposition (_positions select _foreachindex);
			_x ctrlcommit 0;
		} foreach _allControls;
	};
};

//--- Apply header text
_ctrlBcgCommonTop ctrlsettext _textHeader;

//--- Calculate spacing
_ctrlButtonOKPos = ctrlposition _ctrlButtonOK;
_ctrlBcgCommonPos = ctrlposition _ctrlBcgCommon;
_bottomSpaceY = (_ctrlButtonOKPos select 1) - ((_ctrlBcgCommonPos select 1) + (_ctrlBcgCommonPos select 3));

//--- Calculate text padding
_ctrlTextPos = ctrlposition _ctrlText;
_marginX = (_ctrlTextPos select 0) - (_ctrlBcgCommonPos select 0);
_marginY = (_ctrlTextPos select 1) - (_ctrlBcgCommonPos select 1);

//--- Apply text and get its height
_ctrlText ctrlsetstructuredtext _textMessage;
_ctrlTextPosH = ctrltextheight _ctrlText;

//--- Move text area
_ctrlBcgCommon ctrlsetposition [
	(_ctrlBcgCommonPos select 0),
	(_ctrlBcgCommonPos select 1),
	(_ctrlBcgCommonPos select 2),
	_ctrlTextPosH + (_marginY * 2)
];
_ctrlBcgCommon ctrlcommit 0;

_ctrlText ctrlsetposition [
	(_ctrlBcgCommonPos select 0) + _marginX,
	(_ctrlBcgCommonPos select 1) + _marginY,
	(_ctrlBcgCommonPos select 2) - _marginX * 2,
	_ctrlTextPosH
];
_ctrlText ctrlcommit 0;

//--- Move bottom bar
_bottomPosY = (_ctrlBcgCommonPos select 1) + _ctrlTextPosH + (_marginY * 2) + _bottomSpaceY;
{
	_xPos = ctrlposition _x;
	_xPos set [1,_bottomPosY];
	_x ctrlsetposition _xPos;
	_x ctrlcommit 0;
} foreach [
	_ctrlBackgroundButtonOK,
	_ctrlBackgroundButtonMiddle,
	_ctrlBackgroundButtonCancel,
	_ctrlButtonOK,
	_ctrlButtonCancel
];

//--- Move the whole group
_ctrlRscMessageBoxPos = ctrlposition _ctrlRscMessageBox;
_ctrlRscMessageBoxPosH = _bottomPosY + (_ctrlButtonOKPos select 3);
_ctrlRscMessageBox ctrlsetposition [
	0.5 - (_ctrlBcgCommonPos select 2) / 2,
	0.5 - _ctrlRscMessageBoxPosH / 2,
	(_ctrlBcgCommonPos select 2) + 0.5,
	_ctrlRscMessageBoxPosH
];
_ctrlRscMessageBox ctrlenable true;
_ctrlRscMessageBox ctrlcommit 0;


//--- Increase the size of controls group to cover (and disable) everything below
if (_useParentBox) then {
	_ctrlRscMessageBoxPos = ctrlPosition _ctrlRscMessageBox;
	_ctrlRscMessageBoxPos = [
		(_ctrlRscMessageBoxPos select 0) - 2,
		(_ctrlRscMessageBoxPos select 1) - 2,
		(_ctrlRscMessageBoxPos select 2) + 4,
		(_ctrlRscMessageBoxPos select 3) + 4
	];
	_ctrlRscMessageBox ctrlsetposition _ctrlRscMessageBoxPos;
	_ctrlRscMessageBox ctrlcommit 0;
	{
		_xPos = ctrlposition _x;
		_xPos set [0,(_xPos select 0) + 2];
		_xPos set [1,(_xPos select 1) + 2];
		_x ctrlsetposition _xPos;
		_x ctrlcommit 0;
	} foreach _allCOntrols;
};

//--- Set buttons visibility and text
_focus = _ctrlButtonOK;
_ctrlButtonOK ctrlenable true;
_ctrlButtonOK ctrlsetfade 0;
_ctrlButtonOK ctrlsettext localize "STR_DISP_OK";
if (typename _textOK == typename false) then {
	if !(_textOK) then {
		_ctrlButtonOK ctrlenable false;
		_ctrlButtonOK ctrlsetfade 1;
		_focus = _ctrlButtonCancel;
	};
} else {
	_ctrlButtonOK ctrlsettext _textOK;
};
_ctrlButtonOK ctrlcommit 0;

_ctrlButtonCancel ctrlenable true;
_ctrlButtonCancel ctrlsetfade 0;
_ctrlButtonCancel ctrlsettext localize "STR_DISP_CANCEL";
if (typename _textCancel == typename false) then {
	if !(_textCancel) then {
		_ctrlButtonCancel ctrlenable false;
		_ctrlButtonCancel ctrlsetfade 1;
	};
} else {
	_ctrlButtonCancel ctrlsettext _textCancel;
};
_ctrlButtonCancel ctrlcommit 0;
ctrlsetfocus _focus;


//--- Assign button actions
uinamespace setvariable ["BIS_fnc_guiMessage_status",nil];
_ctrlButtonOK ctrlseteventhandler ["buttonclick","uinamespace setvariable ['BIS_fnc_guiMessage_status',true]; true"];
_ctrlButtonCancel ctrlseteventhandler ["buttonclick","uinamespace setvariable ['BIS_fnc_guiMessage_status',false]; true"];
_display displayaddeventhandler ["unload","uinamespace setvariable ['BIS_fnc_guiMessage_status',false];"];
_ehKeyDown = _display displayaddeventhandler ["keydown","if ((_this select 1) == 1) then {uinamespace setvariable ['BIS_fnc_guiMessage_status',false]; true} else {false}"];


//--- Clicked
waituntil {!isnil {uinamespace getvariable "BIS_fnc_guiMessage_status"}};

_display displayremoveeventhandler ["keydown",_ehKeyDown];

if (_useParentBox) then {
	_ctrlRscMessageBox ctrlenable false;
	_ctrlRscMessageBox ctrlsetposition [0,0,0,0];
	_ctrlRscMessageBox ctrlcommit 0;
} else {
	_display closedisplay 2;
};


_status = uinamespace getvariable "BIS_fnc_guiMessage_status";
uinamespace setvariable ["BIS_fnc_guiMessage_status",nil];
_status