/*
	Author: Jiri Wainar

	Description:
	Returns a consolidated array with all unit's plain weapons (without attachments).

	Example:
	[[_weapon1class:string,weapon1count:number],...] = [player] call BIS_fnc_camp_unitWeapons;
*/

private["_unit","_output","_parts"];

_unit 	= [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_output	= [];

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

{
	_parts 	= _x call BIS_fnc_weaponComponents;

	if (count _parts > 0) then
	{
		_output set [count _output, _parts select 0];
	};
}
forEach (weapons _unit);

//consolidate array
_output = _output call BIS_fnc_consolidateArray;

_output