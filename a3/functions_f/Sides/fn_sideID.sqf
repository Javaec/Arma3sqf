/*
	Author: Karel Moricky

	Description:
	Returns side ID (as used in config).

	Parameter(s):
	0: SIDE

	Returns:
	NUMBER
*/

private ["_side"];
_side = [_this,0,sideLogic,[sideLogic]] call bis_fnc_param;
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
] find _side