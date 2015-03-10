/*
	Author: Karel Moricky

	Description:
	Check if speaker is locked for different conversation

	Parameter(s):
	_this: OBJECT

	Returns:
	BOOL - true if locked
*/

_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
!isnil {_unit getvariable "bis_fnc_kbTell"}