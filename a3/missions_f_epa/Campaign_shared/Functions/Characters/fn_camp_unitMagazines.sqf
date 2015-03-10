/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all unit's magazines. Magazines loaded in weapons are included.

	Example:
	[[_magazine1class:string,magazine1count:number],...] = [player] call BIS_fnc_camp_unitMagazines;
*/

private["_unit","_output","_ammo","_magSize","_magClass","_magAmmo"];

_unit 	= [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_output = [];

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

_ammo = [_unit] call BIS_fnc_camp_unitAmmo;

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