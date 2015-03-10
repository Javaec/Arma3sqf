/*--------------------------------------------------------------------------------------------------

	Author: Jiøí Wainar

	Example:
	[_unit,[_type,_class,_count]] call BIS_fnc_camp_removeEquipment;

--------------------------------------------------------------------------------------------------*/
private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = true;

private["_unit","_data","_type","_class","_count","_i"];

_unit  = [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_data = [_this, 1, "", ["",[]]] call bis_fnc_param;

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

//re-type string definition to array
if (typeName _data == typeName "") then
{
	_type   	= _data call BIS_fnc_camp_getEquipType;
	_class  	= _data call BIS_fnc_camp_getEquipClass;
	_count  	= 1;
}
else
{
	_type   	= _data call BIS_fnc_camp_getEquipType;
	_class  	= _data call BIS_fnc_camp_getEquipClass;
	_count  	= [_data, 2, 1, [123]] call bis_fnc_param;
};

["[i][%1] Removing [type:%2,class:%3,count:%4] ...",_unit,_type,_class,_count] call BIS_fnc_logFormat;

//do the removal
switch (_type) do
{
	case "weapons":
	{
		private["_items"];

		_items = items _unit;

		removeAllWeapons _unit;

		{
			_unit addItem _x;
		}
		forEach _items;

	};
	case "items":
	{
		removeAllItems _unit;
	};

	case "magazine":
	{
		for "_i" from 1 to _count do
		{
			_unit removeMagazine _class;
		};
	};

	case "backpack":
	{
		removeBackpack _unit;
	};
	case "vest":
	{
		removeVest _unit;
	};
	case "uniform":
	{
		removeUniform _unit;
	};

	case "item":
	{
		_unit unassignItem _class;
		_unit removeItem _class;
	};
	case "weapon":
	{
		_unit removeWeapon _class;

		private["_magTypes"];

		_magTypes = getArray(configfile >> "CfgWeapons" >> _class >> "magazines");

		{
			_unit removeMagazines _x;
		}
		forEach _magTypes;
	};

	case "goggles":
	{
		removeGoggles _unit;
	};
	case "headgear":
	{
		removeHeadgear _unit;
	};

	default
	{
		["[x][Removing failed] unit: %1 | type: %2 | class: %3",_unit,_type,_class] call BIS_fnc_logFormat;

		_count = 0;
	};
};