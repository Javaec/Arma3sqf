/*
	Training: Boarding as driver
*/

// Defines
#define STAGE_ID		"motorized"
#define TASK_ID	 		"BIS_motorized_challenge_7"
#define KIND_OF_VEHICLE		"LandVehicle"

//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		// Information from challenge, to fill task texts
		private ["_taskTitle", "_taskDescription", "_taskWaypoint", "_taskDestination"];
		_taskTitle 		= ["getTitle", _parameters] call BIS_fnc_challenge;
		_taskDescription 	= ["getDescription", _parameters] call BIS_fnc_challenge;
		_taskWaypoint 		= _taskTitle;
		_taskDestination	= nil;
		
		// Add task
		[WEST, [TASK_ID, STAGE_ID], [_taskDescription, _taskTitle, _taskWaypoint], nil, true] call BIS_fnc_taskCreate;
	};

	case (toLower "terminate") : {
		// Reset recruits status variable
		BIS_instructorRecruitStatus = [];
		publicVariable "BIS_instructorRecruitStatus";
	};

	case (toLower "terminateAndClear") : {
		[TASK_ID] call BIS_fnc_deleteTask;
	};
	
	case (toLower "update") : {
		// The delay between each variable replication
		private "_publicDelay";
		_publicDelay = 10;
		
		// We want to replicate variable if:
		// * Not yet replicated
		// * Delay between replications is fulfilled
		if (isNil { BIS_instructorRecruitStatus } || { count BIS_instructorRecruitStatus < 1 } || { time >= (BIS_instructorRecruitStatus select 3) + _publicDelay }) then {
			BIS_instructorRecruitStatus = [
				["getTitle", _parameters] call BIS_fnc_challenge,
				["getDescription", _parameters] call BIS_fnc_challenge,
				{ vehicle _this == _this || { driver vehicle _this != _this } || { !(vehicle _this isKindOf KIND_OF_VEHICLE) } },
				time
			];
			publicVariable "BIS_instructorRecruitStatus";
		};
	};
	
	case (toLower "conditionSucceed") : {
		{ vehicle _x != _x && { _x == driver vehicle _x } && { vehicle _x isKindOf KIND_OF_VEHICLE } } count (["allRecruits"] call BIS_fnc_flow) == count (["allRecruits"] call BIS_fnc_flow);
	};

	case (toLower "conditionFail") : {
		false;
	};

	case (toLower "conditionCancel") : {
		false;
	};
	
	case (toLower "conditionSkip") : {
		{ vehicle _x != _x && { _x == driver vehicle _x } && { vehicle _x isKindOf KIND_OF_VEHICLE } } count (["allRecruits"] call BIS_fnc_flow) == count (["allRecruits"] call BIS_fnc_flow);
	};
	
	case (toLower "onSucceed") : {
		[TASK_ID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};

	case (toLower "onFail") : {
		
	};

	case (toLower "onCancel") : {
		
	};
};
