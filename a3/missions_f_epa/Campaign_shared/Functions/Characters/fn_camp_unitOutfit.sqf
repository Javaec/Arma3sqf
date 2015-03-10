/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all unit's outfit pieces = uniform(s), vest(s), backpack, helmet(s), goggles(s).

	Example:
	[[_item1class:string,_item1count:number],...] = [player] call BIS_fnc_camp_unitItems;
*/

private["_unit","_filter","_output","_items"];

_unit 	= [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_filter	= [_this, 1, ["backpack","uniform","vest","headgear","goggles"], ["",[]]] call bis_fnc_param;
_output	= [];

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};
if (isNull _unit) exitWith
{
	["[x] Unit is null!"] call BIS_fnc_logFormat;
};
if (typeName _filter == typeName "") then
{
	_filter = [_filter];
};

_items = (items _unit) + [uniform _unit] + [vest _unit] + [backpack _unit] + [headgear _unit] + [goggles _unit] - [""];

{
	_type = _x call BIS_fnc_camp_getEquipType;

	if (_type in _filter) then
	{
		_output set [count _output, toLower _x];
	};
}
forEach _items;

//consolidate array
_output = _output call BIS_fnc_consolidateArray;

_output