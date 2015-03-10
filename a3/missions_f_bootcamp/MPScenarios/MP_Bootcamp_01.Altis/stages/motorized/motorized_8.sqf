/*
	Training: Convoy Movement
*/

// Defines
#define STAGE_ID			"motorized"
#define TASK_ID	 			"BIS_motorized_challenge_8"
#define TIME_MAX			500
#define TIME_MIN_IN_CONVOY		120
#define POSITION_BASE			"BIS_bootcampCenter"
#define CONVOY_MAX_RADIUS		50
#define CONVOY_MAX_ANGLE_OFFSET		100
#define CONVOY_MIN_SPEED		5
#define TIME_START			"BIS_convoy_timeStart"
#define TIME_IN_CONVOY_START		"BIS_convoy_timeInConvoyStart"
#define IN_CONVOY			"BIS_convoy_inConvoy"

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
		
		// Stuff
		missionNamespace setVariable [IN_CONVOY, false];
		missionNamespace setVariable [TIME_START, time];
		BIS_curator setVariable [TIME_IN_CONVOY_START, -1, true];
	};

	case (toLower "terminate") : {
		// Reset variables
		missionNamespace setVariable [IN_CONVOY, nil];
		missionNamespace setVariable [TIME_START, nil];
		BIS_curator setVariable [TIME_IN_CONVOY_START, nil, true];
		
		// Reset recruits status variable
		BIS_instructorRecruitStatus = [];
		publicVariable "BIS_instructorRecruitStatus";
	};

	case (toLower "terminateAndClear") : {
		[TASK_ID] call BIS_fnc_deleteTask;
	};
	
	case (toLower "update") : {
		//*******************************
		// Important data
		//*******************************
		private ["_inConvoy", "_timeLeft", "_timeInConvoy"];
		_inConvoy		= missionNamespace getVariable IN_CONVOY;
		_timeLeft 		= abs((missionNamespace getVariable TIME_START) - time);
		_timeInConvoy 		= if (_inConvoy) then { abs((BIS_curator getVariable TIME_IN_CONVOY_START) - time) } else { 0 };
		
		//*******************************
		// Bad recruits
		//*******************************
		private "_badRecruits";
		_badRecruits = [];
		
		// Check whether inside vehicle
		{
			if (vehicle _x == _x || { _x != driver vehicle _x }) then {
				if !(_x in _badRecruits) then { _badRecruits set [count _badRecruits, _x]; };
			};
		} forEach (["allRecruits"] call BIS_fnc_flow);
		
		// Check distance between each recruit, all recruits must be within radius in relation to all other recruits
		{
			private "_recruit";
			_recruit = _x;
			
			{
				if (_recruit distance _x > CONVOY_MAX_RADIUS) then {
					if !(_recruit in _badRecruits) then { _badRecruits set [count _badRecruits, _recruit]; };
				};
			} forEach (["allRecruits"] call BIS_fnc_flow) - [_recruit];
		} forEach (["allRecruits"] call BIS_fnc_flow);
		
		// Check speed
		{
			if (speed vehicle _x < CONVOY_MIN_SPEED) then {
				if !(_x in _badRecruits) then { _badRecruits set [count _badRecruits, _x]; };
			};
		} forEach (["allRecruits"] call BIS_fnc_flow);
		
		// Check angle
		{
			private ["_recruit", "_vehicle"];
			_recruit = _x;
			_vehicle = vehicle _x;
			
			{
				if (abs (getDir _vehicle % 360 - getDir vehicle _x % 360) > CONVOY_MAX_ANGLE_OFFSET) then {
					if !(_x in _badRecruits) then { _badRecruits set [count _badRecruits, _x]; };
				};
			} forEach (["allRecruits"] call BIS_fnc_flow) - [_recruit];
		} forEach (["allRecruits"] call BIS_fnc_flow);
		
		// In road
		{
			if (!isOnRoad vehicle _x) then {
				if !(_x in _badRecruits) then { _badRecruits set [count _badRecruits, _x]; };
			};
		} forEach (["allRecruits"] call BIS_fnc_flow);
		
		//*******************************
		// Whether recruits are in convoy
		//*******************************
		_inConvoy = count _badRecruits < 1;
		
		// In convoy changed status?
		if (_inConvoy && !(missionNamespace getVariable IN_CONVOY)) then {
			missionNamespace setVariable [IN_CONVOY, _inConvoy];
			BIS_curator setVariable [TIME_IN_CONVOY_START, time, true];
		};
		
		// Reset in convoy start time if needed
		if (!_inConvoy) then {
			missionNamespace setVariable [IN_CONVOY, false];
			BIS_curator setVariable [TIME_IN_CONVOY_START, 0, true];
		};
		
		//*******************************
		// Task related
		//*******************************
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
				{ vehicle _this == _this || { _this != driver vehicle _this } || { !isOnRoad position vehicle _this } || { speed _this < CONVOY_MIN_SPEED } },
				time
			];
			publicVariable "BIS_instructorRecruitStatus";
		};
	};
	
	case (toLower "conditionSucceed") : {
		// Check whether this challenge is done
		!isNil { BIS_curator getVariable TIME_IN_CONVOY_START } && { BIS_curator getVariable TIME_IN_CONVOY_START != 0 } && { abs((BIS_curator getVariable TIME_IN_CONVOY_START) - time) >= TIME_MIN_IN_CONVOY };
	};

	case (toLower "conditionFail") : {
		false;
	};

	case (toLower "conditionCancel") : {
		count (["allRecruits"] call BIS_fnc_flow) < 2;
	};
	
	case (toLower "conditionSkip") : {
		count (["allRecruits"] call BIS_fnc_flow) < 2;
	};
	
	case (toLower "onSucceed") : {
		// Succeed task
		[TASK_ID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};

	case (toLower "onFail") : {
		
	};

	case (toLower "onCancel") : {
		// Cancel task
		[TASK_ID, "CANCELED"] call BIS_fnc_taskSetState;
	};
};
