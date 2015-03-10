/*
	Author: Karel Moricky

	Description:
	Returns sides allied to the given side / object

	Parameter(s):
	0: SIDE or OBJECT

	Returns:
	ARRAY of SIDEs
*/

private ["_side","_enemy"];
_side = [_this,0,objnull,[objnull,sideUnknown]] call bis_fnc_param;
if (typename _side == typename objnull) then {_side = side _side;};

_enemy = [];
{
	if (_side getfriend _x >= 0.6) then {_enemy set [count _enemy,_x];};
} foreach [
	east,
	west,
	resistance,
	civilian
];
_enemy