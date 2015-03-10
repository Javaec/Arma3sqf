/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Return a unit's current task.
	
	Parameters:
		0: OBJECT - Unit to check
	
	Returns:
	STRING - current task ID
*/
private ["_unit","_taskReal","_taskID"];

_unit = [_this,0,objnull,[objnull]] call BIS_fnc_param;
_taskReal = currenttask _unit;
_taskID = "";
{
	if (([_x,_unit] call bis_fnc_taskReal) == _taskReal) exitwith {_taskID = _x;};
} foreach (_unit getvariable ["BIS_fnc_setTaskLocal_tasks",[]]);
_taskID