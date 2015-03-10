/*
	Training: Engagement
*/

// Defines
#define STAGE_ID			"infantry"
#define TASK_ID				"BIS_infantry_challenge_10"
#define WAYPOINT_POSITION 		"BIS_engagment"
#define WAYPOINT_RADIUS			150
#define TASK_MARKER_IMAGE		"a3\Ui_f\data\Map\MapControl\taskIcon_ca.paa"
#define ENEMY_POSITION			"BIS_engagment"
#define ENEMY_RADIUS			100
#define ENEMY_GROUP_PATROL		"OIA_InfSentry"
#define ENEMY_GROUP_GUARDS		"OIA_InfSentry"
#define CHALLENGE_TIMEOUT		1200
#define CHALLENGE_TIMEOUT_ID		"BIS_challenge_timeout_id"

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
		
		// Add the curator icon
		BIS_curatorIcon = [BIS_curator, [TASK_MARKER_IMAGE, [1,1,1,0.5], _taskDestination, 1, 1, 0, _taskTitle, 1, 0.035, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
		
		// Store the challenge maximum time
		missionNamespace setVariable [CHALLENGE_TIMEOUT_ID, time + CHALLENGE_TIMEOUT];
		
		// The group that patrols the area
		private "_patrolGroup";
		_patrolGroup = [getMarkerPos ENEMY_POSITION, EAST, configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> ENEMY_GROUP_PATROL] call BIS_fnc_spawnGroup;
		
		// Patrol the area
		for "_i" from 0 to 2 do {
			private "_waypoint";
			_waypoint = _patrolGroup addWaypoint [[getMarkerPos ENEMY_POSITION, random ENEMY_RADIUS, random 360] call BIS_fnc_relPos, 0];
			_waypoint setWaypointBehaviour "AWARE";
			_waypoint setWaypointCombatMode "RED";
			_waypoint setWaypointSpeed "LIMITED";
			
			if (_i < 2) then {
				_waypoint setWaypointType "MOVE";
			} else {
				_waypoint setWaypointType "CYCLE";
			};
		};
		
		// The group that stays inside buildings and guards the area
		private "_guardsGroup";
		_guardsGroup = [getMarkerPos ENEMY_POSITION, EAST, configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> ENEMY_GROUP_GUARDS] call BIS_fnc_spawnGroup;
		
		// The near buildings
		private "_buildings";
		_buildings = getMarkerPos ENEMY_POSITION nearObjects ["House", ENEMY_RADIUS];
		
		// The enter-able buildings
		private "_enterableBuildings";
		_enterableBuildings = [];
		
		// Filter buildings by validating only those that are enter-able
		{
			if ([_x, count units _guardsGroup] call BIS_fnc_isBuildingEnterable) then {
				_enterableBuildings set [count _enterableBuildings, _x];
			};
		} forEach _buildings;
		
		// All position from all enter-able buildings we have so far
		private "_totalPositions";
		_totalPositions = [];
		
		// get the buildings positions
		{
			_totalPositions = _totalPositions + ([_x] call BIS_fnc_buildingPositions);
		} forEach _enterableBuildings;
		
		// Flush the list of positions
		private "_positions";
		_positions = _totalPositions call BIS_fnc_arrayShuffle;
		
		// Resize to match the number of units in the group
		_positions resize count units _guardsGroup;
		
		// Set each unit of the group to a selected position in a selected building
		for "_i" from 0 to ((count units _guardsGroup) - 1) do {
			private ["_unit", "_position", "_direction"];
			_unit 		= units _guardsGroup select _i;
			_position 	= _positions select _i;
			_direction	= random 360;
			
			_unit setDir _direction;
			_unit setFormDir _direction;
			_unit setPos _position;
			_unit setUnitPos "UP";
			doStop _unit;
		};
		
		// The enemy groups
		BIS_infantry_enemyGroups = [_patrolGroup, _guardsGroup];
		
		// Some basic properties
		{
			_x allowFleeing 0;
			_x enableAttack false;
			
			// Skill
			{ _x setSkill 0.25; } forEach units _x;
			
			// We need to make these units editable by the Instructor
			BIS_curator addCuratorEditableObjects [units _x, true];
		} forEach BIS_infantry_enemyGroups;
		
		// Recruits achievement
		{
			// Present in combat flag
			_x setVariable ["BIS_presentInCombatChallenge", true, true];
			
			// Hit event
			_x setVariable ["BIS_infantry_mphit", _x addMpEventHandler ["MPHit", {
				private ["_injured", "_shooter"];
				_injured = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
				_shooter = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
				
				if (isServer) then {
					// Add injured to blacklist
					if (isNil { _injured getVariable "BIS_starRecruitFailure" }) then {
						_injured setVariable ["BIS_starRecruitFailure", true, true];
					};
					
					// Add shooter to blacklist
					if (_shooter in (["allRecruits"] call BIS_fnc_flow)) then {
						if (isNil { _shooter getVariable "BIS_starRecruitFailure" }) then {
							_shooter setVariable ["BIS_starRecruitFailure", true, true];
						};
					};
				};
			}]];
		} forEach (["allRecruits"] call BIS_fnc_flow);
	};

	case (toLower "terminate") : {
		// Remove the curator icon
		if (!isNil { BIS_curatorIcon }) then {
			[BIS_curator, BIS_curatorIcon] call BIS_fnc_removeCuratorIcon;
		};
		
		// Reset timeout variable
		missionNamespace setVariable [CHALLENGE_TIMEOUT_ID, nil];
		
		// Reset recruits status variable
		BIS_instructorRecruitStatus = [];
		publicVariable "BIS_instructorRecruitStatus";
		
		// Recruits hit event handler
		{
			if (!isNil { _x getVariable "BIS_infantry_mphit" }) then {
				_x removeMpEventHandler ["MPHit", _x getVariable "BIS_infantry_mphit"];
			};
		} forEach (["allRecruits"] call BIS_fnc_flow);
	};

	case (toLower "terminateAndClear") : {
		// Remove task
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
		{ _x distance getMarkerPos WAYPOINT_POSITION > WAYPOINT_RADIUS } count (["allRecruits"] call BIS_fnc_flow) < 1 && { { { alive _x } count units _x > 0 } count BIS_infantry_enemyGroups < 1 };
	};

	case (toLower "conditionFail") : {
		time >= missionNamespace getVariable CHALLENGE_TIMEOUT_ID;// || { { alive _x } count (["allRecruits"] call BIS_fnc_flow) < 1 };
	};
	
	case (toLower "conditionCancel") : {
		false;
	};
	
	case (toLower "conditionSkip") : {
		false;
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
