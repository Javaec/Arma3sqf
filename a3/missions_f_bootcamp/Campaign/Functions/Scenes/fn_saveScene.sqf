private ["_trigger", "_var", "_delete"];
_trigger = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_var = [_this, 1, "", [""]] call BIS_fnc_param;
_delete = [_this, 2, true, [true]] call BIS_fnc_param;

if (isNull _trigger) exitWith {(format ["The trigger '%1' does not exist", _trigger]) call BIS_fnc_error; false};
if (_var == "") exitWith {"No scene variable defined" call BIS_fnc_error; false};

// Ensure the variable isn't already in use
private ["_scenes"];
_scenes = missionNamespace getVariable ["BIS_fnc_saveScene_scenes", []];
if (_var in _scenes) exitWith {(format ["A scene is already defined for the variable '%1'", _var]) call BIS_fnc_error; false};

// Add scene
_scenes set [count _scenes, _var];
missionNamespace setVariable ["BIS_fnc_saveScene_scenes", _scenes];

// Establish variables
private ["_vehVar", "_WPVar", "_grpVar"];
_vehVar = format ["BIS_scenes_%1_vehicles", _var];
_WPVar = format ["BIS_scenes_%1_WPs", _var];
_grpVar = format ["BIS_scenes_%1_groups", _var];

private ["_vehVarSaved", "_grpVarSaved"];
_vehVarSaved = format ["BIS_scenes_%1_savedVehicles", _var];
_grpVarSaved = format ["BIS_scenes_%1_savedGroups", _var];

{missionNamespace setVariable [_x, []]} forEach [_vehVar, _WPVar, _grpVar, _vehVarSaved, _grpVarSaved];

private ["_vehicles", "_waypoints", "_groups", "_vehSaved", "_grpSaved"];
_vehicles = [];
_waypoints = [];
_groups = [];
_vehSaved = [];
_grpSaved = [];

// Filter objects down to just those in the trigger
private ["_all"];
_all = entities "All";
{if (!(_x in _all)) then {_all = _all + [_x]}} forEach allUnits;

private ["_allVehicles"];
_allVehicles = vehicles;

{if (!([_trigger, _x] call BIS_fnc_inTrigger)) then {_all set [_forEachIndex, -1]}} forEach _all;
_all = _all - [-1];
deleteVehicle _trigger;

{
	if (!(isPlayer _x)) then {
		private ["_group", "_name", "_init"];
		_group = group _x;
		_name = vehicleVarName _x;
		if (_name == "") then {_name = str _x};
		_init = _x getVariable ["BIS_fnc_saveScene_init", ""];
		
		private ["_groupName"];
		_groupName = str _group;
		
		// Ensure the init code is valid
		if (!(typeName _init in [typeName "", typeName {}, typeName []])) then {
			(format ["The init code defined for '%1' must be either a string, code, or an array", _x]) call BIS_fnc_error;
			_init = "";
		};
		
		if (isNull _group) then {
			if (!(_x getVariable ["BIS_fnc_saveScene_exclude", false])) then {
				// Empty vehicle
				_vehSaved set [
					count _vehSaved,
					[
						_name,
						typeOf _x,
						getPosATL _x,
						direction _x,
						_x call BIS_fnc_getPitchBank,
						damage _x,
						fuel _x,
						_init,
						velocity _x,
						locked _x,
						isEngineOn _x,
						[]	// No crew
					]
				];
				
				_vehicles set [count _vehicles, _x];
			};
		} else {
			if (_x in _allVehicles) then {
				private ["_vehicle", "_vehName"];
				_vehicle = vehicle _x;
				_vehName = vehicleVarName _vehicle;
				if (_vehName == "") then {_vehName = (str _vehicle + "_vehicle")};
				
				if (!(_vehicle getVariable ["BIS_fnc_saveScene_exclude", false])) then {
					// Ensure it's not already in the list
					if ({_x select 0 == _vehName} count _vehSaved == 0) then {
						// Store crew and roles
						private ["_crew"];
						_crew = [];
						{_crew set [count _crew, [str _x, assignedVehicleRole _x]]} forEach crew _vehicle;
						
						// Add vehicle
						_vehSaved set [
							count _vehSaved,
							[
								_vehName,
								typeOf _vehicle,
								getPosATL _vehicle,
								direction _vehicle,
								_vehicle call BIS_fnc_getPitchBank,
								damage _vehicle,
								fuel _vehicle,
								_init,
								velocity _vehicle,
								locked _vehicle,
								isEngineOn _vehicle,
								_crew	// Assigned crew
							]
						];
						
						_vehicles set [count _vehicles, _vehicle];
					};
				};
			};
			
			// Don't add the same group twice
			if ({_x select 0 == _groupName} count _grpSaved == 0) then {
				// Add actual group
				_groups set [count _groups, _group];
				
				// Determine the surviving group members
				private ["_units"];
				_units = units _group;
				{if (!(alive _x)) then {_units set [_forEachIndex, -1]}} forEach _units;
				_units = _units - [-1];
				
				// Store an array of info on the units in the group
				private ["_unitInfo"];
				_unitInfo = [];
				
				{
					if (!(_x getVariable ["BIS_fnc_saveScene_exclude", false])) then {
						// Ensure the init code is valid
						private ["_init"];
						_init = _x getVariable ["BIS_fnc_saveScene_init", ""];
						
						if (!(typeName _init in [typeName "", typeName {}, typeName []])) then {
							(format ["The init code defined for '%1' must be either a string, code, or an array", _x]) call BIS_fnc_error;
							_init = "";
						};
						
						// Add the unit
						_unitInfo set [
							_forEachIndex,
							[
								str _x,
								typeOf _x,
								getPosATL _x,
								direction _x,
								_x call BIS_fnc_getPitchBank,
								damage _x,
								fuel _x,
								_x getVariable ["BIS_fnc_saveScene_init", ""],
								rank _x,
								captive _x,
								behaviour _x
							]
						];
						
						// Add to array of vehicles
						_vehicles set [count _vehicles, _x];
					};
				} forEach _units;
				
				// Proceed only if any of the group was stored
				if (count _unitInfo > 0) then {
					// Store an array of info on the waypoints belonging to the group
					private ["_wps"];
					_wps = waypoints _group;
					_wps set [0, -1];
					_wps = _wps - [-1];
					
					private ["_wpInfo"];
					_wpInfo = [];
					
					if (count _wps > 0) then {
						{
							_wpInfo set [
								_forEachIndex,
								[
									waypointPosition _x,
									waypointType _x,
									waypointCompletionRadius _x,
									waypointCombatMode _x,
									waypointFormation _x,
									waypointSpeed _x,
									waypointBehaviour _x,
									waypointStatements _x,
									waypointVisible _x,
									waypointShow _x
								]
							];
							
							// Add to array of waypoints
							_waypoints set [count _waypoints, _x];
						} forEach _wps;
					};
					
					// Add the group to the array
					_grpSaved set [
						count _grpSaved,
						[
							_groupName,
							groupID _group,
							side _group,
							combatMode _group,
							formation _group,
							speedMode _group,
							_unitInfo,
							_wpInfo
						]
					];
					
					_groups set [count _groups, _group];
				};
			};
		};
	};
} forEach _all;

// Store information
{
	private ["_var", "_data"];
	_var = _x select 0;
	_data = _x select 1;
	missionNamespace setVariable [_var, _data];
} forEach [
	[_vehVar, _vehicles],
	[_WPVar, _waypoints],
	[_grpVar, _groups],
	[_vehVarSaved, _vehSaved],
	[_grpVarSaved, _grpSaved]
];

// Delete scene if necessary
if (_delete) then {_var call BIS_fnc_deleteScene};

true