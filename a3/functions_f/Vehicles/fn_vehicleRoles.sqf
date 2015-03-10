/*
	Author: Karel Moricky

	Description:
	Returns vehicle roles

	Parameter(s):
		0: OBJECT or STRING

	Returns:
	ARRAY of ARRAYS in format [role,index],e.g. [["Driver",[]],["Turret",[0,1]],["Cargo",[0]]]
*/

private ["_vehicle","_roles","_cfgVehicle"];

_vehicle = [_this,0,objnull,[objnull,""]] call bis_fnc_param;
_roles = [];

if (typename _vehicle == typename objnull) then {_vehicle = typeof _vehicle;};

_cfgVehicle = configfile >> "cfgvehicles" >> _vehicle;

//--- Driver
if (getnumber (_cfgVehicle >> "hasdriver") > 0) then {
	_roles set [count _roles,["Driver",[]]];
};

//--- Turrets
{
	_roles set [count _roles,["Turret",_x]];
} foreach ([_vehicle,[]] call bis_fnc_getturrets);

//--- Cargo
for "_t" from 0 to (getnumber (_cfgVehicle >> "transportsoldier") - 1) do {
	_roles set [count _roles,["Cargo",[_t]]];
};

_roles