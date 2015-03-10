/*
	Training: Firing a Rifle
*/

// Defines
#define STAGE_ID		"infantry"
#define TASK_ID	 		"BIS_infantry_challenge_7"
#define RANGE_MARKER		"BIS_firingRange_weapon"
#define RANGE_RADIUS		50
#define SHOTS_MIN_COUNT		10
#define REQUIRED_WEAPON		"arifle_MX_F"
#define CHALLENGE_TIMEOUT	900
#define CHALLENGE_TIMEOUT_ID	"BIS_challenge_timeout_id"

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
		
		// Store the challenge maximum time
		missionNamespace setVariable [CHALLENGE_TIMEOUT_ID, time + CHALLENGE_TIMEOUT];
	};

	case (toLower "terminate") : {
		// Reset timeout variable
		missionNamespace setVariable [CHALLENGE_TIMEOUT_ID, nil];
		
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
				{ count (["getRecruitBestCourse", [BIS_weaponsFiringRange_board, getPlayerUid _this, SHOTS_MIN_COUNT, REQUIRED_WEAPON]] call BIS_fnc_firingRange) <= 0 },
				time
			];
			publicVariable "BIS_instructorRecruitStatus";
		};
	};
	
	case (toLower "conditionSucceed") : {
		{ count (["getRecruitBestCourse", [BIS_weaponsFiringRange_board, getPlayerUid _x, SHOTS_MIN_COUNT, REQUIRED_WEAPON]] call BIS_fnc_firingRange) > 0 } count (["allRecruits"] call BIS_fnc_flow) == count (["allRecruits"] call BIS_fnc_flow);
	};

	case (toLower "conditionFail") : {
		time >= missionNamespace getVariable CHALLENGE_TIMEOUT_ID;
	};

	case (toLower "conditionCancel") : {
		false;
	};
	
	case (toLower "conditionSkip") : {
		{ count (["getRecruitBestCourse", [BIS_weaponsFiringRange_board, getPlayerUid _x, SHOTS_MIN_COUNT, REQUIRED_WEAPON]] call BIS_fnc_firingRange) > 0 } count (["allRecruits"] call BIS_fnc_flow) == count (["allRecruits"] call BIS_fnc_flow);
	};
	
	case (toLower "onSucceed") : {
		[TASK_ID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};

	case (toLower "onFail") : {
		[TASK_ID, "FAILED"] call BIS_fnc_taskSetState;
	};

	case (toLower "onCancel") : {
		
	};
};
