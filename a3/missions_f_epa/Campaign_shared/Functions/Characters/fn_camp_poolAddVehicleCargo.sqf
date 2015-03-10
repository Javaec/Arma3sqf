/*
	Author: Jiøí Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Persistant equipment front-end "load" function.

	Function:
	--------------------------------------------------------------------------------------------
	1. gathers info about mission characters
	2. checks their equipment against equipment pool content
	3. loads the equipment and adjusts it

	Example:
	--------------------------------------------------------------------------------------------
	[vehicle player] call BIS_fnc_camp_poolAddVehicleCargo;
	[ [["b_g_offroad_01_f",[["smokeshell",1]]],["b_assaultpack_kerry",[["toolkit",1]]]], true] call BIS_fnc_camp_poolAddVehicleCargo;
*/

//control debug log spam
private["_fnc_log_disable"];_fnc_log_disable = false;

private["_vehicle","_cargo","_add"];

_cargo = [_this, 0, vehicle player, [objNull,[]]] call bis_fnc_param;
_add   = [_this, 1, true, [true]] call bis_fnc_param;

if (typeName _cargo == typeName objNull) then
{
	_cargo  = [_cargo] call BIS_fnc_camp_getVehicleCargo;
};

if (count _cargo == 0) exitWith {[]};

private["_containerClass","_containerType","_content","_class","_count","_type"];

{
	_containerClass = _x select 0;

	if (_forEachIndex > 0) then
	{
		_containerType  = _containerClass call BIS_fnc_camp_getEquipType;

		if (_containerType == "backpack") then
		{
			_containerClass = _containerClass call BIS_fnc_basicBackpack;
		};
	}
	else
	{
		_containerType = "vehicle";
	};

	_containerClass = toLower _containerClass;

	_content = _x select 1;

	//add container (backpack, vest or uniform) to the processed content
	if (_forEachIndex > 0) then
	{
		_content = [[_containerClass,1]] + _content;
	};

	//["[i] _containerClass = %1",_containerClass] call BIS_fnc_logFormat;
	//["[i] _content = %1",_content] call BIS_fnc_logFormat;

	//process content (it's container inclueded)
	{
		//["[i] _x = %1",_x] call BIS_fnc_logFormat;

		_class = _x select 0;
		_count = _x select 1;
		_type  = _class call BIS_fnc_camp_getEquipType;

		if !(_add) then {_count = -_count};

		//["[i] _type = %1 | _class = %2 | _count = %3",_type,_class,_count] call BIS_fnc_logFormat;

		[_type,_class,_count] call BIS_fnc_camp_poolAdd;
	}
	forEach _content;
}
forEach _cargo;