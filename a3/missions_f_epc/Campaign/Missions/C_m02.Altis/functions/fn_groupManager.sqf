//Parameters
private ["_action", "_parameters"];
_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

//Sub-functions
switch (toLower _action) do {
	case (toLower "hide") : {
		//Parameters
		private ["_group", "_hide"];
		_group 	= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_hide	= [_parameters, 1, true, [true]] call BIS_fnc_param;
		
		//Make sure group is not null, if so, exit with a error
		if (isNull _group) exitWith {
			"Group cannot be null" call BIS_fnc_error;
		};
		
		//The group vehicles
		private "_vehicles";
		_vehicles = [_group, true] call BIS_fnc_groupVehicles;

		//Disable and hide
		{
			_x enableSimulation !_hide;
			_x hideObject _hide;
		} forEach _vehicles + units _group;

		//Set variable to group
		if (_hide) then {
			_group setVariable ["BIS_groupManager_isHidden", true];
		} else {
			_group setVariable ["BIS_groupManager_isHidden", nil];
		};

		//AI
		["aiDisable", [_group, _hide]] call BIS_fnc_C_m02_groupManager;

		//Log
		["Group (%1) hidden status changed (Hidden: %2)", _group, _hide] call BIS_fnc_logFormat;

		//Return
		_hide;
	};

	case (toLower "isHidden") : {
		//Parameters
		private ["_group"];
		_group 	= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;

		//Return
		!isNil { _group getVariable "BIS_groupManager_isHidden" };
	};

	case (toLower "aiDisable") : {
		//Parameters
		private ["_group", "_disable"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_disable	= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Go through all units in the group
		{
			if (_disable) then {
				_x disableAi "FSM";
				_x disableAi "ANIM";
				_x disableAi "MOVE";
				_x disableAi "TARGET";
				_x disableAi "AUTOTARGET";
			} else {
				_x enableAi "FSM";
				_x enableAi "ANIM";
				_x enableAi "MOVE";
				_x enableAi "TARGET";
				_x enableAi "AUTOTARGET";
			};
		} forEach units _group;

		//Store
		if (_disable) then {
			_group setVariable ["BIS_groupManager_isAiDisabled", _disable];
		} else {
			_group setVariable ["BIS_groupManager_isAiDisabled", nil];
		};

		//Log
		["Group (%1) AI status changed, Disabled: (%2)", _group, _disable] call BIS_fnc_logFormat;

		//Return
		_disable;
	};

	case (toLower "isAiDisabled") : {
		//Parameters
		private ["_group"];
		_group = [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;

		//Return
		_group getVariable ["BIS_groupManager_isAiDisabled", false];
	};

	case (toLower "addWaypoint") : {
		//Parameters
		private ["_group", "_position", "_type", "_behaviour", "_combatMode", "_speed", "_formation", "_radius", "_statements"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_position	= [_parameters, 1, [], [[]]] call BIS_fnc_param;
		_type		= [_parameters, 2, "MOVE", [""]] call BIS_fnc_param;
		_behaviour	= [_parameters, 3, behaviour leader _group, [""]] call BIS_fnc_param;
		_combatMode	= [_parameters, 4, combatMode _group, [""]] call BIS_fnc_param;
		_speed		= [_parameters, 5, speedMode _group, [""]] call BIS_fnc_param;
		_formation	= [_parameters, 6, formation _group, [""]] call BIS_fnc_param;
		_radius		= [_parameters, 7, 0, [0]] call BIS_fnc_param;
		_statements	= [_parameters, 8, ["true", ""], [[]]] call BIS_fnc_param;

		//The waypoint
		private "_waypoint";
		_waypoint = _group addWaypoint [_position, _radius];

		//The waypoint properties
		_waypoint setWaypointType _type;
		_waypoint setWaypointBehaviour _behaviour;
		_waypoint setWaypointCombatMode _combatMode;
		_waypoint setWaypointSpeed _speed;
		_waypoint setWaypointFormation _formation;
		_waypoint setWaypointCompletionRadius _radius;
		_waypoint setWaypointStatements _statements;

		//Hide
		_waypoint setWaypointVisible false;
		_waypoint showWaypoint "NEVER";

		//Log
		["Group (%1) has new waypoint (%2) of type (%3)", _group, _position, _type] call BIS_fnc_logFormat;

		//Return
		_waypoint;
	};

	case (toLower "removeWaypoint") : {
		//Parameters
		private ["_group", "_waypoint"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_waypoint	= [_parameters, 1, [], [[]]] call BIS_fnc_param;

		//Delete the waypoint
		deleteWaypoint _waypoint;

		//Log
		["Group (%1) waypoint (%2) deleted", _group, _waypoint] call BIS_fnc_logFormat;

		//Return
		true;
	};

	case (toLower "setStance") : {
		//Parameters
		private ["_group", "_stance"];
		_group 	= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_stance	= [_parameters, 1, "AUTO", [""]] call BIS_fnc_param;

		//Set stance for all units
		{
			_x setUnitPos _stance;
		} forEach units _group;

		//Store
		_group setVariable ["BIS_groupManager_stance", _stance];

		//Return
		_stance;
	};

	case (toLower "getStance") : {
		//Parameters
		private ["_group"];
		_group = [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;

		//Return
		_group getVariable ["BIS_groupManager_stance", "AUTO"];
	};

	case (toLower "setCaptive") : {
		//Parameters
		private ["_group", "_captive"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_captive	= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Set captive
		{
			_x setCaptive _captive;
		} forEach units _group + ([_group, true] call BIS_fnc_groupVehicles);
		
		//Store
		_group setVariable ["BIS_groupManager_isCaptive", _captive];

		//Return
		_captive;
	};

	case (toLower "getCaptive") : {
		//Parameters
		private ["_group"];
		_group = [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;

		//Return
		_group getVariable ["BIS_groupManager_isCaptive", false];
	};

	case (toLower "followLeader") : {
		//Parameters
		private ["_group", "_command"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_command	= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Go through all units
		{
			if (_x != leader _group) then {
				_x doFollow leader _group;
			};
		} forEach units _group;
	};

	case (toLower "stop") : {
		//Parameters
		private ["_group", "_command"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_command	= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Go through all units
		{
			if (_command) then {
				doStop _x;
			} else {
				commandStop _x;
			};
		} forEach units _group;
	};

	case (toLower "reveal") : {
		//Parameters
		private ["_group", "_units", "_knowsAbout"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_units		= [_parameters, 1, objNull, [objNull, grpNull, []]] call BIS_fnc_param;
		_knowsAbout	= [_parameters, 2, 2, [0]] call BIS_fnc_param;

		//Validate units
		switch (typeName _units) do {
			case (typeName objNull) : { _units = [_units]; };
			case (typeName grpNull) : { _units = units _units; };
		};

		//Go through all units to reveal
		{
			_group reveal [_x, _knowsAbout];
		} forEach _units;
	};

	case (toLower "attack") : {
		//Parameters
		private ["_group", "_target", "_knowsAbout"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_target		= [_parameters, 1, objNull, [objNull]] call BIS_fnc_param;
		_knowsAbout	= [_parameters, 2, 2, [0]] call BIS_fnc_param;

		//Reveal target to group
		["reveal", [_group, _target, _knowsAbout]] call BIS_fnc_C_m02_groupManager;

		//Go through all units in group
		{
			_x doWatch _target;
			_x doTarget _target;
			_x doFire _target;
		} forEach units _group;
	};

	case (toLower "unitCount") : {
		//Parameters
		private ["_group", "_real"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_real		= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Return
		if (_real) then {
			{ alive _x } count units _group;
		} else {
			count units _group;
		};
	};

	case (toLower "allowDamage") : {
		//Parameters
		private ["_group", "_allow"];
		_group 		= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_allow		= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Go through all units in the group
		{
			_x allowDamage _allow;
		} forEach units _group;

		//Store
		_group setVariable ["BIS_groupManager_isDamageAllowed", _allow];
	};

	case (toLower "isDamageAllowed") : {
		//Parameters
		private ["_group"];
		_group = [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;

		//Return
		_group getVariable ["BIS_groupManager_isDamageAllowed", true];
	};

	case (toLower "orderGetIn") : {
		//Parameters
		private ["_group", "_getIn"];
		_group 	= [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		_getIn	= [_parameters, 1, true, [true]] call BIS_fnc_param;

		//Get in or not
		units _group orderGetIn _getIn;
		units _group allowGetIn _getIn;

		//Store
		_group setVariable ["BIS_groupManager_isOrderGetIn", _getIn];
	};

	case (toLower "isOrderGetIn") : {
		//Parameters
		private ["_group"];
		_group = [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;

		//Return
		_group getVariable ["BIS_groupManager_isOrderGetIn", true];
	};
	
	case (toLower "delete") : {
		//Parameters
		private ["_group"];
		_group = [_parameters, 0, grpNull, [grpNull]] call BIS_fnc_param;
		
		//Go through vehicles
		{
			deleteVehicle _x;
		} forEach ([_group, true] call BIS_fnc_groupVehicles);
		
		//Go through units
		{
			deleteVehicle _x;
		} forEach units _group;
		
		//Delete group
		deleteGroup _group;
	};

	case DEFAULT {
		//Error
		["Unknown action: %1", _action] call BIS_fnc_error;
	};
};
