/*
	Board Vehicle
*/

// Defines
#define STAGE_ID		"infantry"
#define TASK_ID			"BIS_infantry_challenge_11"
#define TRANSPORT_START		"BIS_infantry_transportStart"
#define TRANSPORT_PICKUP	"BIS_infantry_transportPickup"
#define TRANSPORT_END		"BIS_infantry_transportEnd"
#define TRANSPORT_TYPE		"B_Truck_01_transport_F"
#define TASK_MARKER_IMAGE	"a3\Ui_f\data\Map\MapControl\taskIcon_ca.paa"
#define REQUIRED_POSITION 	"BIS_engagment"
#define REQUIRED_RADIUS 	150

//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		// The transport vehicle
		private "_transport";
		_transport = [getMarkerPos TRANSPORT_START, [getMarkerPos TRANSPORT_START, getMarkerPos TRANSPORT_PICKUP] call BIS_fnc_dirTo, TRANSPORT_TYPE, WEST] call BIS_fnc_spawnVehicle;
		
		// The vehicle stuff
		private ["_vehicle", "_crew", "_group"];
		_vehicle 	= [_transport, 0, objNull, [objNull]] call BIS_fnc_param;
		_crew 		= [_transport, 1, [], [[]]] call BIS_fnc_param;
		_group 		= [_transport, 2, grpNull, [grpNull]] call BIS_fnc_param;
		
		// Make vehicle indestructible
		_vehicle allowDamage false;
		
		// Information from challenge, to fill task texts
		private ["_taskTitle", "_taskDescription", "_taskWaypoint", "_taskDestination"];
		_taskTitle 		= ["getTitle", _parameters] call BIS_fnc_challenge;
		_taskDescription 	= ["getDescription", _parameters] call BIS_fnc_challenge;
		_taskWaypoint 		= _taskTitle;
		_taskDestination	= _vehicle;
		
		// Add task
		[WEST, [TASK_ID, STAGE_ID], [_taskDescription, _taskTitle, _taskWaypoint], _vehicle, true] call BIS_fnc_taskCreate;
		
		// Add the move to pick up position
		private "_waypointPickup";
		_waypointPickup = _group addWaypoint [getMarkerPos TRANSPORT_PICKUP, 0];
		_waypointPickup setWaypointType "MOVE";
		_waypointPickup setWaypointBehaviour "SAFE";
		_waypointPickup setWaypointCombatMode "BLUE";
		_waypointPickup setWaypointStatements ["count (['allRecruits'] call BIS_fnc_flow) > 0 && { { vehicle _x != vehicle this } count (['allRecruits'] call BIS_fnc_flow) < 1 }", ""];
		
		// The end waypoint
		private "_waypointEnd";
		_waypointEnd = _group addWaypoint [getMarkerPos TRANSPORT_END, 5];
		_waypointEnd setWaypointType "MOVE";
		_waypointEnd setWaypointStatements ["true", "{ [[[_x], { (_this select 0) action ['Eject', vehicle (_this select 0)]; }], 'BIS_fnc_spawn', _x, false] call BIS_fnc_mp; } forEach (['allRecruits'] call BIS_fnc_flow);"];
		
		// The get out waypoint
		private "_waypointgetOut";
		_waypointgetOut = _group addWaypoint [getMarkerPos TRANSPORT_END, 5];
		_waypointgetOut setWaypointType "GETOUT";
		
		// Store the transport
		BIS_infantry_transport = _transport;
		
		// Some basic properties
		_group allowFleeing 0;
		_group enableAttack false;
			
		// We need to make these units editable by the Instructor
		BIS_curator addCuratorEditableObjects [units _group + [_vehicle], false];
	};

	case (toLower "terminate") : {
		// Reset recruits status variable
		BIS_instructorRecruitStatus = [];
		publicVariable "BIS_instructorRecruitStatus";
	};

	case (toLower "terminateAndClear") : {
		// Remove task
		[TASK_ID] call BIS_fnc_deleteTask;
		
		// Delete units
		{ deleteVehicle _x } forEach (BIS_infantry_transport select 1);
		deleteVehicle (BIS_infantry_transport select 0);
		deleteGroup (BIS_infantry_transport select 2);
		
		// Reset variables
		BIS_infantry_transport = nil;
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
				{ isNil { BIS_infantry_transport } || { vehicle _this != BIS_infantry_transport select 0 }},
				time
			];
			publicVariable "BIS_instructorRecruitStatus";
		};
	};
	
	case (toLower "conditionSucceed") : {
		{ vehicle _x != (BIS_infantry_transport select 0) } count (["allRecruits"] call BIS_fnc_flow) < 1;
	};

	case (toLower "conditionFail") : {
		false;
	};
	
	case (toLower "conditionCancel") : {
		false;
	};
	
	case (toLower "conditionSkip") : {
		{ _x distance getMarkerPos REQUIRED_POSITION <= REQUIRED_RADIUS } count (["allRecruits"] call BIS_fnc_flow) < 0;
	};
	
	case (toLower "onSucceed") : {
		[TASK_ID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};

	case (toLower "onFail") : {
		
	};

	case (toLower "onCancel") : {
		
	};
};
