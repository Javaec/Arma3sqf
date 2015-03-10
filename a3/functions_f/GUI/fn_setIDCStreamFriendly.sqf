/*
	Author: Muf, optimized by Karel Moricky

	Description:
	Shows or hides UI control according to state of the Stream Friendly UI switch in Game Options.

	Parameter(s):
		0: DISPLAY or CONTROL
		1: NUMBER - control IDC when the first parameter is a display

	Returns:
	BOOL - true when the control is visible, false when it's not
*/

private ["_display","_idc","_control"];
_display = [_this,0,displaynull,[displaynull,controlnull]] call bis_fnc_param;
_idc = [_this,1,-1,[0]] call bis_fnc_param;

_control = if (typename _display == typename displaynull) then {_display displayctrl _idc} else {_display};
_control ctrlshow !isStreamFriendlyUIEnabled;
ctrlshown _control