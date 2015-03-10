/*
	Author: Karel Moricky

	Description:
	Check if person is not locked by some conversation

	Parameter(s):
	_this: OBJECT - checked person

	Returns:
	BOOL - true if he can speak
*/

private ["_actor"];
_actor = [_this,0,objnull,[objnull]] call bis_fnc_param;
isnil {_actor getvariable "bis_fnc_kbTell"}