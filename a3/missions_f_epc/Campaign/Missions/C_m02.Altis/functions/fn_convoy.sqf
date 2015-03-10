/*
	Convoy Controller
*/

//Defines
#define SPEED_DEFAULT 			10
#define CANMOVE_DEFAULT 		true
#define ALLOWCREWINIMMOBILE 		true
#define ALLOWDAMAGE	 		true
#define ALLOWIMPORTANTCREWDAMAGE	false

//Action
private "_action";
_action = [_this, 0, "", [""]] call BIS_fnc_param;

//Sub-functions
switch (toLower _action) do {
	//Initialize convoy
	case (tolower "initialize") : {
		//Parameters
		private ["_vehicles"];
		_vehicles = [_this, 1, [], [[]]] call BIS_fnc_param;

		//Enough vehicles?
		if (count _vehicles < 2) exitWith {
			//Error
			["Not enough vehicles (%1)", _vehicles] call BIS_fnc_error;
		};

		//First and last vehicles in the convoy
		private ["_first", "_last"];
		_first 	= [_vehicles, 0, objNull, [objNull]] call BIS_fnc_param;
		_last	= [_vehicles, (count _vehicles) - 1, objNull, [objNull]] call BIS_fnc_param;

		//Flows container
		private "_handlers";
		_handlers = [];

		// Convoy flow
		private "_convoyFlow";
		_convoyFlow = [_first, _last, cheatsEnabled] execFSM "fsms\convoyFlow.fsm";

		//Store convoy flow
		_handlers set [count _handlers, _convoyFlow];

		//All vehicles but the first in the convoy needs vehicleFlow
		for "_i" from 1 to ((count _vehicles) - 1) do {
			private "_vehicleFlow";
			_vehicleFlow = [_vehicles select _i, _vehicles select (_i - 1), _first, cheatsEnabled] execFSM "fsms\vehicleFlow.fsm";

			//Store handler
			_handlers set [count _handlers, _vehicleFlow];
		};

		//Initialize all vehicles
		{
			["initializeVehicle", _x] call BIS_fnc_C_m02_convoy;
		} forEach _vehicles;

		//Store vehicles
		missionNameSpace setVariable ["BIS_convoyInitialized", true];
		missionNameSpace setVariable ["BIS_convoyVehicles", _vehicles];
		missionNameSpace setVariable ["BIS_convoyHandlers", _handlers];

		//Log
		"Initialization complete" call BIS_fnc_log;
	};

	//Initialize vehicle
	case (tolower "initializeVehicle") : {
		//Parameters
		private ["_vehicle"];
		_vehicle = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

		//Units should not leave vehicle when it is destroyed
		_vehicle allowCrewInImmobile ALLOWCREWINIMMOBILE;

		//Vehicle should not receive damage
		_vehicle allowDamage ALLOWDAMAGE;

		//Event handlers
		_vehicle setVariable ["BIS_convoyHandleDamage", _vehicle addEventHandler ["HandleDamage", { ["handleDamage", _this] call BIS_fnc_C_m02_convoy; }]];
		_vehicle setVariable ["BIS_convoyKilled", _vehicle addEventHandler ["Killed", { ["Killed", _this] call BIS_fnc_C_m02_convoy; }]];
		
		//In case driver is null, we issue a error warning
		if (isNull driver _vehicle) exitWith {
			//Error
			["Vehicle (%1) does not have driver", _vehicle] call BIS_fnc_error;
		};
		
		//The group
		private "_group";
		_group = group driver _vehicle;
		
		//Group properties
		_group allowFleeing 0;
		_group enableAttack false;
		
		//The driver and gunner
		private ["_commander", "_driver", "_gunner"];
		_commander 	= commander _vehicle;
		_driver 	= driver _vehicle;
		_gunner 	= gunner _vehicle;

		{
			if (!isNull _x) then {
				//Allow damage
				_x allowDamage ALLOWIMPORTANTCREWDAMAGE;
				
				//Disable FSM
				_x disableAi "FSM";
			};
		} forEach [_commander, _gunner, _driver];
		
		//Driver has special properties
		_driver disableAi "TARGET";
		_driver disableAi "AUTOTARGET";
		_driver removeWeapon "NVGoggles";
		
		//Log
		["Vehicle initialized (%1), Valid driver (%2)", _vehicle, !isNull _driver] call BIS_fnc_logFormat;
	};
	
	//Terminate convoy
	case (tolower "terminate") : {
		{ ["terminateVehicle", _x] call BIS_fnc_C_m02_convoy; } forEach (missionNameSpace getVariable ["BIS_convoyVehicles", []]);
		missionNameSpace setVariable ["BIS_convoyHandlers", nil];
		missionNameSpace setVariable ["BIS_convoyVehicles", nil];
		missionNamespace setVariable ["BIS_convoyCanMove", nil];
		missionNamespace setVariable ["BIS_convoySpeed", nil];

		//Log
		"Terminated" call BIS_fnc_log;
	};

	//Terminate vehicle
	case (tolower "terminateVehicle") : {
		//Parameters
		private ["_vehicle"];
		_vehicle = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

		//Remove from convoy vehicle list
		missionNameSpace setVariable ["BIS_convoyVehicles", (missionNameSpace getVariable ["BIS_convoyVehicles", []]) - [_vehicle]];

		//Remove event handlers
		{
			if (!isNil { _vehicle getVariable ("BIS_convoy" + _x) }) then {
				_vehicle removeEventHandler [_x, _vehicle getVariable ("BIS_convoy" + _x)];
			};
		} forEach ["HandleDamage", "Killed"];

		//Enable driver ability to move
		driver _vehicle enableAi "MOVE";
		driver _vehicle forceSpeed -1;
	};

	//Enable convoy ability to move
	case (tolower "moveEnable") : {
		missionNamespace setVariable ["BIS_convoyCanMove", true];
		{ driver _x enableAi "MOVE"; } forEach (missionNameSpace getVariable ["BIS_convoyVehicles", []]);
	};

	//Disable convoy ability to move
	case (tolower "moveDisable") : {
		missionNamespace setVariable ["BIS_convoyCanMove", false];
		{ driver _x disableAi "MOVE"; } forEach (missionNameSpace getVariable ["BIS_convoyVehicles", []]);
	};

	//Check whether convoy moving abilities are enabled
	case (tolower "moveEnabled") : {
		missionNamespace getVariable ["BIS_convoyCanMove", CANMOVE_DEFAULT];
	};

	//Set the convoy speed
	case (tolower "setSpeed") : {
		//Parameters
		private ["_speed"];
		_speed = [_this, 1, SPEED_DEFAULT, [0]] call BIS_fnc_param;

		missionNamespace setVariable ["BIS_convoySpeed", _speed];
	};

	//Get the speed of the convoy
	case (tolower "getSpeed") : {
		missionNamespace getVariable ["BIS_convoySpeed", SPEED_DEFAULT];
	};

	//Set vehicles in convoy as captive
	case (tolower "setCaptive") : {
		//Parameters
		private "_captive";
		_captive = [_this, 1, false, [true]] call BIS_fnc_param;

		{
			_x setCaptive _captive;
		} forEach (missionNameSpace getVariable ["BIS_convoyVehicles", []]);
	};

	//Vehicle handle damage
	case (tolower "handleDamage") : {
		private ["_damage", "_source"];
		_damage = [_this select 1, 2, 0, [0]] call BIS_fnc_param;
		_source = [_this select 1, 3, objNull, [objNull]] call BIS_fnc_param;

		//If player caused the damage let it through
		if (_source == player) then {
			_damage;
		} else {
			0;
		};
	};

	//Vehicle handle damage
	case (tolower "inCombat") : {
		private "_inCombat";
		_inCombat = false;

		//Go through all vehicles
		{
			if (behaviour driver _x == "combat") exitWith {
				_inCombat = true;
			};
		} forEach (missionNameSpace getVariable ["BIS_convoyVehicles", []]);

		//Return
		_inCombat;
	};

	//Add a waypoint to the convoy
	case (tolower "addWaypoint") : {
		private ["_positions", "_statement"];
		_positions 	= [_this select 1, 0, [], [[]]] call BIS_fnc_param;
		_statement	= [_this select 1, 1, "", [""]] call BIS_fnc_param;
		
		//The convoy vehicles
		private "_vehicles";
		_vehicles = missionNameSpace getVariable ["BIS_convoyVehicles", []];
		
		//Go through all vehicles and add waypoint
		for "_i" from 0 to ((count _vehicles) - 1) do {
			private "_vehicle";
			_vehicle = _vehicles select _i;
			
			private "_position";
			_position = if (_i <= (count _positions) - 1) then { _positions select _i; } else { _positions select ((count _positions) - 1); };
			
			private "_waypoint";
			_waypoint = group driver _vehicle addWaypoint [_position, 0];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointSpeed "FULL";
			_waypoint setWaypointVisible false;
			_waypoint showWaypoint "NEVER";

			//Statements are only added to first group
			if (_i < 1) then {
				_waypoint setWaypointStatements ["true", _statement];
			};
		};
	};

	//Get all groups in the convoy
	case (tolower "getGroups") : {
		private "_groups";
		_groups = [];

		//Go through each vehicle
		{
			_groups set [count _groups, group driver _x];
		} forEach (missionNameSpace getVariable ["BIS_convoyVehicles", []]);

		//Return
		_groups;
	};

	//Reset convoy position
	case (tolower "resetPosition") : {
		private ["_positions", "_removeWaypoints"];
		_positions 		= [_this select 1, 0, [], [[]]] call BIS_fnc_param;
		_removeWaypoints	= [_this select 1, 1, false, [true]] call BIS_fnc_param;

		//The vehicles
		private "_vehicles";
		_vehicles = missionNameSpace getVariable "BIS_convoyVehicles";

		//Validate
		if (count _positions < count _vehicles) exitWith {
			["Not enough positions (%1) for vehicles (%2)"] call BIS_fnc_error;
		};

		//The direction
		private "_direction";
		_direction = [_positions select ((count _positions) - 1), _positions select 0] call BIS_fnc_dirTo;

		//Loop positions
		{
			//The position
			private "_position";
			_position = _x;

			//The vehicle
			private "_vehicle";
			_vehicle = _vehicles select _forEachIndex;

			//Set vehicle position
			_vehicle setDir _direction;
			_vehicle setPos _position;
		} forEach _positions;

		//Remove waypoints if required
		if (_removeWaypoints) then {
			["removeWaypoints"] call BIS_fnc_C_m02_convoy;
		};
	};

	//Remove waypoints
	case (tolower "removeWaypoints") : {
		{
			private "_group";
			_group = _x;

			{
				deleteWaypoint _x;
			} forEach waypoints _x;
		} forEach (["getGroups"] call BIS_fnc_C_m02_convoy);
	};
	
	//Set behaviour
	case (tolower "setBehaviour") : {
		private ["_behaviour"];
		_behaviour = [_this select 1, 0, "CARELESS", [""]] call BIS_fnc_param;
		
		{
			//Set behaviour
			{ _x setBehaviour _behaviour; } forEach units _x;
			_x setBehaviour _behaviour;
			
			//Set combat mode accordantly
			switch (toLower _behaviour) do {
				case "careless" : { _x setCombatMode "BLUE"; };
				case "safe" : { _x setCombatMode "GREEN"; };
				case "aware" : { _x setCombatMode "YELLOW"; };
				case "combat" : { _x setCombatMode "RED"; };
			};
		} forEach (["getGroups"] call BIS_fnc_C_m02_convoy);
		
		//Store
		missionNamespace setVariable ["BIS_convoyBehaviour", _behaviour];
	};
	
	//Get behaviour
	case (tolower "getBehaviour") : {
		//Return
		missionNamespace getVariable ["BIS_convoyBehaviour", "CARELESS"];
	};

	//Invalid action
	case DEFAULT {
		//Error
		["Invalid action (%1)", _action] call BIS_fnc_error;
	};
};
