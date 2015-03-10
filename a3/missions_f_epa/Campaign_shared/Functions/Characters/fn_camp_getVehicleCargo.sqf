/*
	Author: Jiøí Wainar

	Description:
	Returns vehicle cargo.

	Example:
	_cargo = [vehicle player] call BIS_fnc_camp_getVehicleCargo;
*/

private["_fnc_log_disable"]; _fnc_log_disable = false;

private["_vehicle","_containers","_cargo","_output","_container","_containerClass","_containerType"];

_vehicle 	= [_this, 0, vehicle player, [objNull]] call bis_fnc_param; if (isNull _vehicle) exitWith {[]}; if (_vehicle isKindOf "Man") exitWith {[]};
_output		= [];
_containers 	= [[typeOf _vehicle,_vehicle]] + (everyContainer _vehicle);

{
	_containerClass = _x select 0;
	_container      = _x select 1;

	if (_forEachIndex > 0) then
	{
		_containerType = _containerClass call BIS_fnc_camp_getEquipType;
	}
	else
	{
		_containerType = "vehicle";
	};

	if (_containerType == "backpack") then
	{
		_containerClass = _containerClass call BIS_fnc_basicBackpack;
	};

	_containerClass	= toLower _containerClass;

	_cargo = [];
	_cargo = _cargo + ([_container] call BIS_fnc_camp_containerWeapons);				//add weapons
	_cargo = _cargo + ([_container] call BIS_fnc_camp_containerAttachments);			//add attachments
	_cargo = _cargo + ([_container] call BIS_fnc_camp_containerMagazines);				//add attachments
	_cargo = _cargo + ([_container] call BIS_fnc_camp_containerItems);				//add items
	_cargo = _cargo + ([_container,["headgear","goggles"]] call BIS_fnc_camp_containerOutfit);	//add headgear & goggles

	_output set [count _output, [_containerClass,_cargo]];
}
forEach _containers;

_output