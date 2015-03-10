/*
	Author: Karel Moricky

	Description:
	Return addon from CghPatches to which a given object belongs to
	
	Parameter(s):
		0: OBJECT
	
	Returns:
	STRING - addon class
*/

private ["_unit","_addon","_units"];

_unit = [_this,0,objnull,[objnull,""]] call bis_fnc_param;
_addon = "";

if (typename _unit == typename objnull) then {_unit = typeof _unit;};

{
	_units = getarray (_x >> "units");
	if ({_unit == _x} count _units > 0) exitwith {_addon = configname _x;};
} foreach ([configfile >> "cfgpatches"] call bis_fnc_subClasses);

_addon

/*
private ["_unit"];

_unit = [_this,0,objnull,[objnull,""]] call bis_fnc_param;
unitaddons typeof _unit
*/