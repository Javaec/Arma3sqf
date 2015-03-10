/*
	Author: Karel Moricky

	Description:
	Set unit inisgnia (e.g., should insignia on soldiers)

	Parameter(s):
		0: OBJECT
		2: STRING - CfgUnitInsignia class. Use an empty string to remove current insignia.

	Returns:
	BOOL - true if insignia was set
*/

private ["_unit","_class","_cfgTexture","_texture"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_class = [_this,1,"",[""]] call bis_fnc_param;

//--- Load texture from config.cpp or description.ext
_cfgTexture = [["CfgUnitInsignia",_class],configfile] call bis_fnc_loadclass;
if (_cfgTexture == configfile && _class != "") exitwith {["'%1' not found in CfgUnitInsignia",_class] call bis_fnc_error; false};
_texture = gettext (_cfgTexture >> "texture");
if (_texture == "") then {_texture = "#(argb,8,8,3)color(0,0,0,0)";};

private ["_index"];
_index = -1;
{
	if (_x == "insignia") exitwith {_index = _foreachindex;};
} foreach getarray (configfile >> "CfgVehicles" >> gettext (configfile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

if (_index < 0) then {
	//["'insignia' hidden selection not found on object of type '%1'",typeof _unit] call bis_fnc_error;
	false
} else {
	_unit setvariable ["bis_fnc_setUnitInsignia_class",_class,true];
	_unit setobjecttextureglobal [_index,_texture];
	true
};