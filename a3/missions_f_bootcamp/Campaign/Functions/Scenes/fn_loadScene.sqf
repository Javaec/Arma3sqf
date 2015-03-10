private ["_var", "_mode"];
_var = [_this, 0, "", [""]] call BIS_fnc_param;
_mode = [_this, 1, false, [false]] call BIS_fnc_param;	// true for delayed loading

if (_var == "") exitWith {"No scene variable defined" call BIS_fnc_error; false};

// Ensure the scene already exists
private ["_scenes"];
_scenes = missionNamespace getVariable ["BIS_fnc_saveScene_scenes", []];
if (!(_var in _scenes)) exitWith {(format ["No scene exists for the variable '%1'", _var]) call BIS_fnc_error; false};

private ["_function"];
_function = {
	private ["_var", "_mode"];
	_var = _this select 0;
	_mode = _this select 1;
	
	private ["_delay"];
	_delay = 0.05;
	
	// Establish variables
	private ["_vehVar", "_WPVar", "_grpVar"];
	_vehVar = format ["BIS_scenes_%1_vehicles", _var];
	_WPVar = format ["BIS_scenes_%1_WPs", _var];
	_grpVar = format ["BIS_scenes_%1_groups", _var];
	
	{missionNamespace setVariable [_x, []]} forEach [_vehVar, _WPVar, _grpVar];
	
	private ["_vehVarSaved", "_grpVarSaved"];
	_vehVarSaved = format ["BIS_scenes_%1_savedVehicles", _var];
	_grpVarSaved = format ["BIS_scenes_%1_savedGroups", _var];
	
	private ["_vehSaved", "_grpSaved"];
	_vehSaved = missionNamespace getVariable _vehVarSaved;
	_grpSaved = missionNamespace getVariable _grpVarSaved;
	
	private ["_vehicles", "_waypoints", "_groups"];
	_vehicles = [];
	_waypoints = [];
	_groups = [];
	
	// Process vehicles
	{
		private ["_name", "_class", "_pos", "_dir", "_pitchBank", "_damage", "_fuel", "_init"];
		_name = _x select 0;
		_class = _x select 1;
		_pos = _x select 2;
		_dir = _x select 3;
		_pitchBank = _x select 4;
		_damage = _x select 5;
		_fuel = _x select 6;
		_init = _x select 7;
		_vel = _x select 8;
		_locked = _x select 9;
		_engineOn = _x select 10;
		
		// Determine whether to spawn as flying or not
		private ["_special"];
		_special = "NONE";
		if ((_pos select 2) > 1 && _engineOn) then {_special = "FLY"};
		
		// Create vehicle
		private ["_vehicle"];
		_vehicle = createVehicle [_class, [10,10,10], [], 0, _special];
		_vehicle setPosATL _pos;
		_vehicle setDir _dir;
		([_vehicle] + _pitchBank) call BIS_fnc_setPitchBank;
		_vehicle setDamage _damage;
		_vehicle setFuel _fuel;
		_vehicle lock _locked;
		_vehicle setVelocity _vel;
		if (_engineOn) then {_vehicle engineOn true};
		
		// Execute init
		switch (typeName _init) do {
			case (typeName ""): {
				// String code
				_vehicle call compile (("this = _this;" + _init));
			};
			
			case (typeName {}): {
				// Normal code
				[_vehicle, _init] call {
					this = _this select 0;
					call (_this select 1);
				};
			};
			
			case (typeName []): {
				// Multiple inits
				{
					if (typeName _x == typeName "") then {
						// String code
						_vehicle call compile (("this = _this;" + _x));
					} else {
						// Normal code
						[_vehicle, _x] call {
							this = _this select 0;
							call (_this select 1);
						};
					};
				} forEach _init;
			};
		};
		
		// Set as the correct variable
		missionNamespace setVariable [_name, _vehicle];
		
		// Add to array
		_vehicles set [count _vehicles, _vehicle];
		
		if (_mode) then {sleep _delay};
	} forEach _vehSaved;
	
	// Process groups
	{
		private ["_groupName", "_groupID", "_side", "_combatMode", "_formation", "_speedMode", "_unitInfo", "_wpInfo"];
		_groupName = _x select 0;
		_groupID = _x select 1;
		_side = _x select 2;
		_combatMode = _x select 3;
		_formation = _x select 4;
		_speedMode = _x select 5;
		_unitInfo = _x select 6;
		_wpInfo = _x select 7;
		
		// Create group
		private ["_group"];
		_group = createGroup _side;
		
		{
			private ["_name", "_class", "_pos", "_dir", "_pitchBank", "_damage", "_fuel", "_init", "_rank", "_captive", "_behaviour"];
			_name = _x select 0;
			_class = _x select 1;
			_pos = _x select 2;
			_dir = _x select 3;
			_pitchBank = _x select 4;
			_damage = _x select 5;
			_fuel = _x select 6;
			_init = _x select 7;
			_rank = _x select 8;
			_captive = _x select 9;
			_behaviour = _x select 10;
			
			// Create unit
			private ["_unit"];
			_unit = _group createUnit [_class, [10,10,10], [], 0, "NONE"];
			_unit setPosATL _pos;
			_unit setDir _dir;
			([_unit] + _pitchBank) call BIS_fnc_setPitchBank;
			_unit setDamage _damage;
			_unit setFuel _fuel;
			_unit setRank _rank;
			if (_captive) then {_unit setCaptive true};
			_unit setBehaviour _behaviour;
			
			// Execute inits
			switch (typeName _init) do {
				case (typeName ""): {
					// String code
					_unit call compile (("this = _this;" + _init));
				};
				
				case (typeName {}): {
					// Normal code
					[_unit, _init] call {
						this = _this select 0;
						call (_this select 1);
					};
				};
				
				case (typeName []): {
					// Multiple inits
					{
						if (typeName _x == typeName "") then {
							// String code
							_unit call compile (("this = _this;" + _x));
						} else {
							// Normal code
							[_unit, _x] call {
								this = _this select 0;
								call (_this select 1);
							};
						};
					} forEach _init;
				};
			};
			
			// Set as the correct variable
			missionNamespace setVariable [_name, _unit];
			
			// Add to array
			_vehicles set [count _vehicles, _unit];
			
			if (_mode) then {sleep _delay};
		} forEach _unitInfo;
		
		// Set up group
		_group setGroupID [_groupID];
		_group setCombatMode _combatMode;
		_group setFormation _formation;
		_group setSpeedMode _speedMode;
		
		// Set as the correct variable
		missionNamespace setVariable [_groupName, _group];
		
		// Add to array
		_groups set [count _groups, _group];
		
		{
			private ["_pos", "_type", "_radius", "_combatMode", "_formation", "_speed", "_behaviour", "_statements", "_visible", "_show"];
			_pos = _x select 0;
			_type = _x select 1;
			_radius = _x select 2;
			_combatMode = _x select 3;
			_formation = _x select 4;
			_speed = _x select 5;
			_behaviour = _x select 6;
			_statements = _x select 7;
			_visible = _x select 8;
			_show = _x select 9;
			
			// Create waypoint
			private ["_wp"];
			_wp = _group addWaypoint [_pos, 0];
			_wp setWaypointPosition [_pos, 0];
			_wp setWaypointType _type;
			_wp setWaypointCompletionRadius _radius;
			_wp setWaypointFormation _formation;
			_wp setWaypointSpeed _speed;
			_wp setWaypointBehaviour _behaviour;
			_wp setWaypointStatements _statements;
			_wp setWaypointVisible _visible;
			_wp showWaypoint _show;
			
			// Set the appropriate current waypoint
			if (_forEachIndex == 0) then {_group setCurrentWaypoint _wp};
			
			// Add to array
			_waypoints set [count _waypoints, _wp];
			
			if (_mode) then {sleep _delay};
		} forEach _wpInfo;
		
		if (_mode) then {sleep _delay};
	} forEach _grpSaved;
	
	// Process occupied vehicles
	{
		private ["_name", "_vehicle", "_crew"];
		_name = _x select 0;
		_vehicle = missionNamespace getVariable _name;
		_crew = _x select 11;
		
		// Proceed only if it has crew members
		if (count _crew > 0) then {
			{
				private ["_name", "_unit", "_role"];
				_name = _x select 0;
				_unit = missionNamespace getVariable _name;
				_role = _x select 1;
				
				switch (toUpper (_role select 0)) do {
					case "DRIVER": {
						// Driver
						_unit assignAsDriver _vehicle;
						_unit moveInDriver _vehicle;
					};
					
					case "CARGO": {
						// Cargo
						_unit assignAsCargo _vehicle;
						_unit moveInCargo _vehicle;
					};
					
					case "TURRET": {
						// Turret
						private ["_path"];
						_path = _role select 1;
						
						_unit assignAsTurret [_vehicle, _path];
						_unit moveInTurret [_vehicle, _path];
					};
				};
				
				if (_mode) then {sleep _delay};
			} forEach _crew;
			
			if (_mode) then {sleep _delay};
		};
	} forEach _vehSaved;
	
	// Store information
	{
		private ["_var", "_data"];
		_var = _x select 0;
		_data = _x select 1;
		missionNamespace setVariable [_var, _data];
	} forEach [
		[_vehVar, _vehicles],
		[_WPVar, _waypoints],
		[_grpVar, _groups]
	];
};

if (!(_mode)) then {
	// Instant loading
	[_var, _mode] call _function;
} else {
	// Delayed loading
	[_var, _mode] spawn _function;
};

true