/*
	Author: Josef Zemanek

	Description:
	Grab all tasks currently created for a given unit

	Parameters:
		0: OBJECT - Tasks owner

	Returns:
	ARRAY
*/

private ["_target"];

_target = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_target getvariable ["BIS_fnc_setTaskLocal_tasks",[]];