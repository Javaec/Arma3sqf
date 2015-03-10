
/*******************************************************************************
 *
 *	version: 		1.0
 *	name:			Task handler
 *	description:	automatically sets tasks as current 	
 *	author:			Chose
 *	paramaters:		_this select 0: a unit whose tasks will be handled (Array)
 					_this select 1: links to tasks created via MP Framwork with
 									priorities (loewr number means higher
 									priority)
 *	return value:	none 	
 * 	example:	 	[
 						BIS_cooper,
						[
							["objShaftoe",   		1],
							["objGorka",			3],
							["objNikolayev",		5],
							["objLagushina",   		5],
							["objSmugglers",   		5],
							["objFindBase",    		4],
							["objSentries",   		3],
							["objLeader",			3],
							["objDestroyBase",		3],
							["objEscortLagushina",	1],
							["objRescueCrew",   	2],
							["objSafehouse",    	3],
							["objMaksim",    		6],
							["objEvidence",    		7]
						]
					] call BIS_fnc_taskHandler

 *	TODO:			* generalize so it can be used in WF
 					* add support for standard tasks
 					* randomize the selection of tasks with the same priority
 ******************************************************************************/     

//validity checks
if (typeName (_this select 0) != "OBJECT") exitWith {textLogFormat ["Error: taskHandler.sqf :: 1st parsed variable is %1 must be OBJECT!!!", typeName (_this select 0)]};
if (typeName (_this select 1) != "ARRAY") exitWith {textLogFormat ["Error: taskHandler.sqf :: 2nd parsed variable is %1 must be ARRAY!!!", typeName (_this select 1)]};
if ({typeName (_x select 0) != "STRING"} count (_this select 1) > 0) exitWith {debugLog "Error: taskHandler.sqf :: All of the task links must be STRING!!!"};
if ({typeName (_x select 1) != "SCALAR"} count (_this select 1) > 0) exitWith {debugLog "Error: taskHandler.sqf :: All of the task priorities must be SCALAR!!!"};

BIS_checkAITasks = {
	_ret = FALSE;
	if (isNil {BIS_missionScope getVariable "BIS_useAITasks"}) exitWith {FALSE};
	if (typeName (BIS_missionScope getVariable "BIS_useAITasks") == typeName TRUE) then {
		if (BIS_missionScope getVariable "BIS_useAITasks") then {_ret = TRUE} else {_ret = FALSE}
	};
	if (typeName (BIS_missionScope getVariable "BIS_useAITasks") == typeName []) then {
		if (_this in (BIS_missionScope getVariable "BIS_useAITasks")) then {_ret = TRUE} else {_ret = FALSE}
	};
	_ret
};

//AI tasks system execution (after a player disconnects, if wanted)
if (isServer && !(local (_this select 0))) then {
	[(_this select 0), (_this select 1)] spawn {
		waitUntil {local (_this select 0) && alive (_this select 0)};
		if ((_this select 0) call BIS_checkAITasks) then {(_this select 0) setVariable ["BIS_tasksPriorityLadder", (_this select 1), TRUE]; BIS_AITasks = (_this select 0) execFSM "A3\functions_f\misc\fn_AITasks.fsm"}
	}
};

if (isNil {BIS_missionScope getVariable "BIS_tasksGroupList"}) then {BIS_missionScope setVariable ["BIS_tasksGroupList", [], TRUE]};
if ((group (_this select 0)) in (BIS_missionScope getVariable "BIS_tasksGroupList")) exitWith {};

if (!(local (_this select 0))) exitWith {};

//AI tasks system execution (direct, if wanted)
if ((_this select 0) call BIS_checkAITasks) then {
	(_this select 0) setVariable ["BIS_tasksPriorityLadder", (_this select 1), TRUE]; BIS_AITasks = (_this select 0) execFSM "A3\functions_f\misc\fn_AITasks.fsm"
} else {
	_this spawn {
		waitUntil {!(isNil {BIS_missionScope getVariable "BIS_useAITasks"})};
		if ((_this select 0) call BIS_checkAITasks) then {(_this select 0) setVariable ["BIS_tasksPriorityLadder", (_this select 1), TRUE]; BIS_AITasks = (_this select 0) execFSM "A3\functions_f\misc\fn_AITasks.fsm"}
	}
};	

//execute the FSM
if (isPlayer (_this select 0) || {isPlayer _x} count units (_this select 0) > 0) then {
	BIS_taskHandler = _this execFSM "A3\functions_f\misc\fn_taskHandler.fsm";
	BIS_missionScope setVariable ["BIS_tasksGroupList", (BIS_missionScope getVariable "BIS_tasksGroupList") + [group (_this select 0)], TRUE]
};