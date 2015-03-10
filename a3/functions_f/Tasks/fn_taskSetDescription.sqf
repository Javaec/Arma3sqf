/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Set a task's description.
	
	Parameters:
		0: STRING - Task name
		1: ARRAY - Task description in the format ["description", "title", "marker"]
	
	Returns:
	BOOL
*/

private ["_taskName","_info"];

_taskName = [_this,0, "",[""]] call BIS_fnc_param;
_info = [_this,1,["","",""],[[]], 3] call BIS_fnc_param;

[_taskName,nil,_info] call bis_fnc_setTask;