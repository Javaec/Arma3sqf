/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all container's magazines. Magazines loaded in weapons are included.

	Example:
	[[_magazine1class:string,magazine1count:number],...] = [_container:object,_weaponFilter:string] call BIS_fnc_camp_containerMagazines;
*/

private["_container","_weapon","_output","_ammo","_magSize","_magClass","_magAmmo"];

_container = [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_weapon    = [_this, 1, "", [""]] call bis_fnc_param;
_output    = [];

if (typeName _container == typeName "") then
{
	_container = missionNamespace getVariable [_container, objNull];
};

_ammo = [_container,_weapon] call BIS_fnc_camp_containerAmmo;

{
	_magClass = _x select 0;
	_magAmmo  = _x select 1;
	_magSize  = getNumber(configfile >> "CfgMagazines" >> _magClass >> "count");

	if (_magSize <= 0) then
	{
		_magSize = 1;
	};

	_output set [count _output, [_magClass,round(_magAmmo/_magSize)]];
}
forEach _ammo;

_output