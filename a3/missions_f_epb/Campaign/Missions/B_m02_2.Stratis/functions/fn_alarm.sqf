//Params
private ["_logic", "_alarm", "_sound", "_lifespan", "_delay"];
_logic 		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_alarm		= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_sound		= [_this, 2, "Alarm", [""]] call BIS_fnc_param;
_lifespan 	= [_this, 3, 120, [0]] call BIS_fnc_param;
_delay		= [_this, 4, 3, [0]] call BIS_fnc_param;

//Validate Logic object
if (isNull _logic) exitWith {
	"Logic object must NOT be null" call BIS_fnc_error;
};

//Validate Alarm object
if (isNull _logic) exitWith {
	"Alarm object must NOT be null" call BIS_fnc_error;
};

//Timestamp
private "_timestamp";
_timestamp = time + _lifespan;

//The loop
while { time < _timestamp && isNil { _logic getVariable "BIS_powerCut" } } do {
	_alarm say3D _sound;
	sleep _delay;
};

//Log
["Alarm went off: Alarm (%1), Logic (%2)", _alarm, _logic] call BIS_fnc_logFormat;
