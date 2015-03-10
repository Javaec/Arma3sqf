/*
	Author: Karel Moricky

	Description:
	Resize control according to it's text

	Parameter(s):
	_this select 0: CONTROL

	Returns:
	BOOL - true
*/

disableserialization;
private ["_control","_ctrlPos"];

_control = [_this,0,controlnull,[controlnull]] call bis_fnc_param;

_ctrlPos = ctrlposition _control;
_ctrlPos set [3,ctrlTextHeight _control];
_control ctrlsetposition _ctrlPos;
//_control ctrlsetbackgroundcolor [1,0,1,1];
_control ctrlcommit 0;

true