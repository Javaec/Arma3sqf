/*
	Grenades Firing Range
*/

// Defines
#define STAGE_ID		"infantry"
#define TASK_ID 		"BIS_infantry_challenge_3"
#define WAYPOINT_POSITION	"BIS_firingRange_grenade"
#define WAYPOINT_RADIUS		25
#define TASK_MARKER_IMAGE	"a3\Ui_f\data\Map\MapControl\taskIcon_ca.paa"

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
		_taskDestination	= getMarkerPos WAYPOINT_POSITION;
		
		// Add task
		[WEST, [TASK_ID, STAGE_ID], [_taskDescription, _taskTitle, _taskWaypoint], _taskDestination, true] call BIS_fnc_taskCreate;
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
				{ _this distance getMarkerPos WAYPOINT_POSITION > WAYPOINT_RADIUS },
				time
			];
			publicVariable "BIS_instructorRecruitStatus";
		};
	};
	
	case (toLower "conditionSucceed") : {
		{ _x distance getMarkerPos WAYPOINT_POSITION > WAYPOINT_RADIUS } count (["allRecruits"] call BIS_fnc_flow) < 1;
	};

	case (toLower "conditionFail") : {
		false;
	};

	case (toLower "conditionCancel") : {
		false;
	};
	
	case (toLower "conditionSkip") : {
		{ _x distance getMarkerPos WAYPOINT_POSITION > WAYPOINT_RADIUS } count (["allRecruits"] call BIS_fnc_flow) < 1;
	};
	
	case (toLower "onSucceed") : {
		[TASK_ID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};

	case (toLower "onFail") : {
		
	};

	case (toLower "onCancel") : {
		
	};
};
