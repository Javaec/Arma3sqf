private ["_var", "_mode"];
_var = [_this, 0, "", [""]] call BIS_fnc_param;
_mode = [_this, 1, false, [false]] call BIS_fnc_param;	// true for delayed deleting

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
	
	private ["_vehicles", "_wps", "_groups"];
	_vehicles = missionNamespace getVariable _vehVar;
	_wps = missionNamespace getVariable _WPVar;
	_groups = missionNamespace getVariable _grpVar;
	
	// Delete everything
	if (!(isNil "BIS_fnc_ambientAnim__terminate")) then {{[_x] call BIS_fnc_ambientAnim__terminate; if (_mode) then {sleep _delay}}} forEach _vehicles;
	{deleteVehicle _x; if (_mode) then {sleep _delay}} forEach _vehicles;
	{deleteWaypoint _x; if (_mode) then {sleep _delay}} forEach _wps;
	{deleteGroup _x; if (_mode) then {sleep _delay}} forEach _groups;
	
	// Reset variables
	{missionNamespace setVariable [_x, []]} forEach [_vehVar, _WPVar, _grpVar];
};

if (!(_mode)) then {
	// Instant deleting
	[_var, _mode] call _function;
} else {
	// Delayed deleting
	[_var, _mode] spawn _function;
};

true