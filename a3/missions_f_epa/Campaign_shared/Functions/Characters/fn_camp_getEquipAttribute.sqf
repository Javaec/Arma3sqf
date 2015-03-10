/*
	Author: Jiøí Wainar

	Description:
	Read appropriate config for given piece of equipment and return attribute value.

	Example:
	_value:any = [_class:string,_attribute:string/array] call BIS_fnc_camp_getEquipAttribute;

	_value = ["compass","picture"] call BIS_fnc_camp_getEquipAttribute;
*/

private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = false;

private["_type","_class","_cfg","_value","_attribute","_params"];

_class 	   = [_this, 0, "", [""]] call bis_fnc_param;
_attribute = [_this, 1, "", ["",[]]] call bis_fnc_param;

_class 	   = _class call BIS_fnc_camp_getEquipClass;
_type 	   = _class call BIS_fnc_camp_getEquipType;

if (typeName _attribute == typeName "") then
{
	_attribute = [_attribute];
};

_cfg = switch (_type) do
{
	case "magazine":
	{
		configfile >> "cfgMagazines"
	};
	case "backpack":
	{
		configfile >> "cfgVehicles"
	};
	case "goggles":
	{
		configfile >> "cfgGlasses"
	};
	default
	{
		configfile >> "cfgWeapons"
	};
};

_params = [_cfg,_class] + _attribute;
_value  = _params call BIS_fnc_getCfgData;

if (isNil "_value") then
{
	["[x] Cannot read config @ %1",_params] call BIS_fnc_logFormat;

	_value = "";
};

_value