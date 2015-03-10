/*
	Author: Jiri Wainar

	Description:
	Deletes specific crew member directly from the vehicle.

	Parameter(s):
		0: OBJECT - vehicle
		1: OBJECT - crew member

	Returns:
	NOTHING
*/

private ["_vehicle","_unit"];

_vehicle = [_this,0,objNull,[objNull]] call bis_fnc_param;
_unit 	 = [_this,1,objNull,[objNull]] call bis_fnc_param;

if (isNull _vehicle || {isNull _unit} || {_vehicle == _unit}) exitWith {};

if (local _vehicle) then
{
	_vehicle deleteVehicleCrew _unit;
}
else
{
	[[_vehicle,_unit],_fnc_scriptname,false] call bis_fnc_mp;
};