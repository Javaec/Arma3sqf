/*
	Author: Thomas Ryan
	
	Description:
	Controls the fatigue of the defined units.
	
	Parameters:
		_this select 0:
			OBJECT - affected unit
			ARRAY - affected units
			GROUP - affected group
		_this select 1:
			NUMBER - fatigue level
			BOOL - false to disable fatigue (default: true)
	
	Returns:
	True if successful, false if not.
*/

private ["_units", "_fatigue"];
_units = [_this, 0, objNull, [objNull, [], grpNull]] call BIS_fnc_param;
_fatigue = [_this, 1, true, [0, true]] call BIS_fnc_param;

private ["_typeUnits"];
_typeUnits = typeName _units;

if (_typeUnits != typeName []) then {
	_units = switch (_typeUnits) do {
		case (typeName objNull): {[_units]};
		case (typeName grpNull): {units _units};
	};
};

// Remove invalid units
{if (isNull _x) then {_units deleteAt _forEachIndex}} forEach _units;
if (count _units == 0) exitWith {"Invalid unit(s) defined!" call BIS_fnc_error; false};

switch (typeName _fatigue) do {
	// Apply fatigue level
	case (typeName 0): {
		{_x setFatigue _fatigue} forEach _units;
		["Fatigue set to %1 | Affected units: %2 | Mission time: %3", _fatigue, _units, time] call BIS_fnc_logFormat;
	};
	
	// Enable or disable fatigue
	case (typeName true): {
		{_x enableFatigue _fatigue} forEach _units;
		["Fatigue %1 | Affected units: %2 | Mission time: %3", if (_fatigue) then {"enabled"} else {"disabled"}, _units, time] call BIS_fnc_logFormat;
	};
};

true