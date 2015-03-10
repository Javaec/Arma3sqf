/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all unit's magazine ammo. Ammunition in loaded magazines is included.

	Example:
	[[_magazine1class:string,ammo:number],...] = [player, primaryWeapon player] call BIS_fnc_camp_unitAmmo;
*/

private["_unit","_weapon","_ammoAll","_magazines","_type"];

_unit 	= [_this, 0, player, ["",objNull]] call bis_fnc_param;
_weapon = [_this, 1, "", [""]] call bis_fnc_param;

_ammoAll = [];

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

_magazines = magazinesAmmo _unit;

//add magazines in weapons
{
	if (count _x > 4) then
	{
		_magazines set [count _magazines, _x select 4];
	};
	if (count _x > 5) then
	{
		_magazines set [count _magazines, _x select 5];
	};
}
forEach (weaponsItems _unit);

//process magazines & ammo
{
	_ammoAll = [_ammoAll,toLower(_x select 0),_x select 1] call BIS_fnc_addToPairs;
}
forEach _magazines;

//if weapon filter is not defined, return all ammo
if (_weapon == "") exitWith {_ammoAll};

private["_fittingMagazines","_defaultMagazine","_ammoFiltered"];

_fittingMagazines = (configfile >> "CfgWeapons" >> _weapon >> "magazines") call BIS_fnc_getCfgDataArray;

{
	_fittingMagazines set [_forEachIndex, toLower _x];
}
forEach _fittingMagazines;

if (count _fittingMagazines == 0) exitWith {[]};

_ammoFiltered = [];

private["_class","_count"];

{
	_class = _x select 0;
	_count = _x select 1;

	if (true) then
	{
		if !(_class in _fittingMagazines) exitWith {};

		_ammoFiltered set [count _ammoFiltered,_x];
	};
}
forEach _ammoAll;

_ammoFiltered