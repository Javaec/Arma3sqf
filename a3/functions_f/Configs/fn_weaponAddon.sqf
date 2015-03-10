/*
	Author: Karel Moricky

	Description:
	Return addon from CghPatches to which a given weapon class belongs to
	
	Parameter(s):
		0: OBJECT
	
	Returns:
	STRING - addon class
*/

private ["_weapon","_addon","_weapons"];

_weapon = [_this,0,"",[""]] call bis_fnc_param;
_addon = "";

{
	_weapons = getarray (_x >> "weapons");
	if ({_weapon == _x} count _weapons > 0) exitwith {_addon = configname _x;};
} foreach ([configfile >> "cfgpatches"] call bis_fnc_subClasses);

_addon