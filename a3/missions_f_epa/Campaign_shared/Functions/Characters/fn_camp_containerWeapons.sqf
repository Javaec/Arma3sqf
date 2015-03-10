/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all container's plain weapons (without attachments).

	Example:
	[[_weapon1class:string,weapon1count:number],...] = [_container:object] call BIS_fnc_camp_containerWeapons;
*/

private["_container"];

_container = [_this, 0, objNull, ["",objNull]] call bis_fnc_param;

if (typeName _container == typeName "") then
{
	_container = missionNamespace getVariable [_container, objNull];
};
if (isNull _container) exitWith
{
	["[x] Container is null!"] call BIS_fnc_logFormat;
};

//reformat cargo content to pair array
private["_content","_pairs","_classes","_counts"];

_content = getWeaponCargo _container;
_pairs   = [];
_classes = _content select 0;
_counts  = _content select 1;

{
	_pairs set [count _pairs,[toLower _x,_counts select _forEachIndex]];
}
forEach _classes;

//x-change the xtended classes for the plain classes
private["_class","_count","_specs","_output"];

_output	= [];

{
	_class = _x select 0;
	_count = _x select 1;

	_specs = _class call BIS_fnc_weaponComponents;

	if (count _specs > 0) then
	{
		_class = _specs select 0;
	};

	_output = [_output,toLower _class,_count] call BIS_fnc_addToPairs;
}
forEach _pairs;

_output