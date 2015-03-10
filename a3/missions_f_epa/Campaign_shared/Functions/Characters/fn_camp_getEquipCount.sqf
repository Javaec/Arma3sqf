/*--------------------------------------------------------------------------------------------------

	Author: Jiøí Wainar

	_possessedCount = [player,["attachment","optic_mrco"]] call BIS_fnc_camp_getEquipCount;

--------------------------------------------------------------------------------------------------*/
private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = false;

private["_unit","_data","_type","_class","_count","_i","_array"];

_unit  	 = [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_data 	 = [_this, 1, "", ["",[]]] call bis_fnc_param;

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

//re-type string definition to array
if (typeName _data == typeName "") then
{
	_type   = _data call BIS_fnc_camp_getEquipType;
	_class  = _data call BIS_fnc_camp_getEquipClass;
}
else
{
	_type   = _data call BIS_fnc_camp_getEquipType;
	_class  = _data call BIS_fnc_camp_getEquipClass;

	//make classname shortcut to work in array defintions as well
	_class  = _class call BIS_fnc_camp_getEquipClass;
};

switch (_type) do
{
	case "item":
	{
		_array = [_unit] call BIS_fnc_camp_unitItems;
	};
	case "backpack";
	case "uniform";
	case "vest";
	case "headgear";
	case "goggles":
	{
		_array = [_unit] call BIS_fnc_camp_unitOutfit;
	};
	case "weapon":
	{
		_class 	= (_class call BIS_fnc_weaponComponents) select 0;
		_array = [_unit] call BIS_fnc_camp_unitWeapons;
	};
	case "magazine":
	{
		_array = [_unit] call BIS_fnc_camp_unitMagazines;
	};
	case "attachment":
	{
		_array = [_unit] call BIS_fnc_camp_unitAttachments;
	};
	default
	{
		_array = [];
	};
};

_count = [_array,_class,0] call BIS_fnc_getFromPairs;

_count
