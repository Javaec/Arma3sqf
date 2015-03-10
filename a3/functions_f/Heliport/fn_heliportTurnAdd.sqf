//
/*
	Author: Karel Moricky

	Description:
	Increase the heliport turn by given number.

	Parameter(s):
	_this select 0: NUMBER - Added amount

	Returns:
	NUMBER - Current turn after calculation.
*/

private ["_add","_turn"];

_add = if (count _this > 0) then {_this select 0} else {1};
_turn = [hsim_heliportDB,["turn"]] call BIS_fnc_dbValueReturn;
if (isnil "_turn") then {_turn = 0;};
_turn = _turn + _add;
[hsim_heliportDB,["turn"],_turn] call BIS_fnc_dbValueSet;
_turn