/*
	Author: Jiri Wainar

	Description:
	Hide object if the campaign phase is not between the listed.

	Returns:
	-

	Example:
	[this,1,4,5] call BIS_fnc_camp_phase;
*/

private["_object", "_phases"];

_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if (isNil "_object") exitWith {};
if (isNull _object) exitWith {};

_this set [0,999];
_phases = _this - [999];

waitUntil{BIS_PER_phase >= 0};

if (BIS_PER_phase in _phases) exitWith
{
};

//move away and delete the object
_object setPos [30,30,0]; deleteVehicle _object;

if !(BIS_is3dEditor) then
{
	waitUntil{isNull _object};
};