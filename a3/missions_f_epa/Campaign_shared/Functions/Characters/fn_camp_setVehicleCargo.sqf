/*
	Author: Jiøí Wainar

	Description:
	Set vehicle cargo according to the saved data.

	Example:
	[vehicle player] call BIS_fnc_camp_setVehicleCargo;
*/

private["_fnc_log_disable"]; _fnc_log_disable = false;

private["_vehicle","_cargo","_containers","_containerClass","_containerType"];

_vehicle = [_this, 0, vehicle player, [objNull]] call bis_fnc_param; if (_vehicle isKindOf "Man") exitWith {[]};
_cargo   = [_this, 1, BIS_PER_SKIRMISH_vehicle select 2, [[]]] call bis_fnc_param;

//clear vehicle cargo
clearWeaponCargo _vehicle; clearMagazineCargo _vehicle; clearItemCargo _vehicle;

//create containers
{
	if (_forEachIndex > 0) then
	{
		_containerClass = _x select 0;
		_containerType  = _containerClass call BIS_fnc_camp_getEquipType;

		if (_containerType == "backpack") then
		{
			_vehicle addBackpackCargo [_containerClass call BIS_fnc_basicBackpack, 1];
		}
		else
		{
			_vehicle addItemCargo [_containerClass, 1];
		};
	};
}
forEach _cargo;

//get all containers for items spawning
_containers = [[typeOf _vehicle,_vehicle]] + (everyContainer _vehicle);

//fill containers with the stuff
private["_container","_containerClass","_content","_class","_count","_type"];

{
	_container 	= _x select 1;
	_containerClass = _x select 0;
	_content   	= (_cargo select _forEachIndex) select 1;

	["[i] _container = %1",typeOf _container] call BIS_fnc_logFormat;
	["[i] _content = %1",_content] call BIS_fnc_logFormat;

	//process content
	{
		//["[i] _x = %1",_x] call BIS_fnc_logFormat;

		_class = _x select 0;
		_count = _x select 1;
		_type  = _class call BIS_fnc_camp_getEquipType;

		switch (_type) do
		{
			case "weapon":
			{
				_container addWeaponCargo [_class,_count];
			};
			case "magazine":
			{
				_container addMagazineCargo [_class,_count];
			};
			default
			{
				_container addItemCargo [_class,_count];
			};
		};

		["[i] Added %3x[%2] to [%1] cargo!",_containerClass,_class,_count] call BIS_fnc_logFormat;
	}
	forEach _content;
}
forEach _containers;