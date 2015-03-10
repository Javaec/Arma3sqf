/*
	Author: Thomas Ryan
	
	Description:
	Controls the disabling of saving, stacking each request to prevent saving being enabled too early.
	
	Parameters:
		_this: STRING - Unique string ID
	
	Returns:
	True if successful, false if not.
*/

private ["_saveID"];
_saveID = [_this, 0, "", [""]] call BIS_fnc_param;
if (_saveID == "") exitWith {"No unique string ID defined" call BIS_fnc_error; false};

// Get stacked disabled saves
private ["_variable", "_disabledSaves"];
_variable = "BIS_fnc_disableSaving_disabledSaves";
_disabledSaves = missionNamespace getVariable [_variable, []];
if (_saveID in _disabledSaves) exitWith {format ["Disabled save state already assigned to ID '%1'", _saveID] call BIS_fnc_error; false};

// Disable saving if appropriate
if (count _disabledSaves == 0) then {enableSaving [false, false]};

// Add to stacked disabled saves
_disabledSaves = _disabledSaves + [_saveID];
missionNamespace setVariable [_variable, _disabledSaves];

true