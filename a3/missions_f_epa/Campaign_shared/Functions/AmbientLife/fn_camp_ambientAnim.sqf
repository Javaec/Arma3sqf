/*
	Author: Jiri Wainar

	Description:
	Controls if ambient anims should be played or not.

	Returns:
	-

	Example:
	[this,"SIT_HIGH2"] call BIS_fnc_camp_ambientAnim;
*/



_this spawn
{
	private["_unit"];

	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	waitUntil{time > 0};

	if (isNil "_unit") exitWith {};
	if (isNull _unit) exitWith {};
	if !(alive _unit && canMove _unit) exitWith {};

	_unit enableSimulation false;

	waitUntil{BIS_PER_phase >= 0};

	sleep 1;

	_unit enableSimulation true;

	_this call BIS_fnc_ambientAnim;
};