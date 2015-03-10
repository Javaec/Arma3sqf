/*
	Author: Karel Moricky

	Description:
	Get unit inisgnia (e.g., should insignia on soldiers)

	Parameter(s):
		0: OBJECT

	Returns:
	STRING - insignia texture
*/

private ["_unit"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_unit getvariable ["bis_fnc_setUnitInsignia_class",""];