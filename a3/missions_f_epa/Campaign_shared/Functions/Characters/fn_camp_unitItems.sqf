/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all unit's items (attachments excluded).

	Example:
	[[_item1class:string,_item1count:number],...] = [player] call BIS_fnc_camp_unitItems;
*/

private["_unit","_output","_items"];

_unit 	= [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_output	= [];

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

if (isNull _unit) exitWith
{
	["[x] Unit is null!"] call BIS_fnc_logFormat;
};

_items = (items _unit) + (assigneditems _unit);

{
	_type = _x call BIS_fnc_camp_getEquipType;

	if (_type == "item") then
	{
		_output set [count _output, toLower _x];
	};
}
forEach _items;

//consolidate array
_output = _output call BIS_fnc_consolidateArray;

_output