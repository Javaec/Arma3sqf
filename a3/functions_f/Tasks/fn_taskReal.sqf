/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Find the actual task associated with a task name assigned to a unit.
	
	Parameters:
		0: STRING - Task name
		1: OBJECT - Task owner
	
	Returns:
	The actual task.
*/

private ["_taskID","_unit","_taskVar"];

_taskID = [_this,0,"",[""]] call BIS_fnc_param;
_unit = [_this,1,objnull,[objnull]] call BIS_fnc_param;
_taskVar = _taskID call bis_fnc_taskVar;

_unit getvariable [_taskVar,tasknull];