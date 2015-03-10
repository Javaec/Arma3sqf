/*
	Author: Karel Moricky

	Description:
	Header function of local mission tasks.
	Automatically declares following variables:
		_taskID: STRING
		_taskState: STRING
		_taskExists: BOOL

	Parameter(s):
		0: STRING - unique mode
		1 (Optional): ANY - additional params
		2 (Optional): CODE - specific task function (default: "BIS_fnc_missionTasksLocal")

	Returns:
	BOOL
*/

private ["_taskID","_taskState","_taskFunction"];
_taskID = [_this,0,"",[""]] call bis_fnc_param;
_taskFunction = [_this,2,BIS_fnc_missionTasksLocal,[{},""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

//--- Extract the function when only variable was passed in
if (typename _taskFunction == typename "") then {_taskFunction = missionnamespace getvariable [_taskFunction,BIS_fnc_missionTasksLocal];};
_taskFunction = [_taskFunction,0,BIS_fnc_missionTasksLocal,[{}]] call bis_fnc_paramin;

_taskExists = _taskID call bis_fnc_taskExists;
_taskState = if (_taskExists) then {toUpper (_taskID call bis_fnc_taskstate)} else {""};
_taskCompleted = if (_taskExists) then {_taskID call BIS_fnc_taskCompleted} else {false};

switch _taskID do {
	_this call _taskFunction;
	default {
		["Task ID '%1' not defined in %2",_taskID,_taskFunction] call bis_fnc_error;
	};
};
true