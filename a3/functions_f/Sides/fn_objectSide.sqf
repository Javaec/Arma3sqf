/*
	Author: Karel Moricky

	Description:
	Returns object side as defined in config (i.e., not affected by dynamic changing)

	Parameter(s):
	0: OBJECT
	1: BOOL - false (default) to return actual object side, true to return the default one (set in config)

	Returns:
	SIDE
*/

private ["_object","_static"];
_object = [_this,0,objnull,[objnull]] call bis_fnc_param;
_static = [_this,1,false,[false]] call bis_fnc_param;

if (_static) then {
	(getnumber (configfile >> "cfgvehicles" >> typeof _object >> "side")) call bis_fnc_sideType
} else {
	if (_object call bis_fnc_isUnitVirtual) then {
		_object getvariable ["bis_fnc_objectside_side",side _object]
	} else {
		if (isnull group _object) then {side _object} else {side group _object}
	};
};