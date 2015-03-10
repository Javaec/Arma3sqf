/*
	Author: Karel Moricky

	Description:
	Returns side type based on side ID

	Parameter(s):
	0: NUMBER

	Returns:
	SIDE
*/

private ["_sideID"];
_sideID = [_this,0,4,[0]] call bis_fnc_param;
_sideID = _sideID max 0 min 8;
[
	east,
	west,
	resistance,
	civilian,
	sideUnknown,
	sideEnemy,
	sideFriendly,
	sideLogic,
	civilian	//--- Ambient life in editor
] select _sideID