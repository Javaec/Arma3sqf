//Parameters
private ["_device", "_loudspeakers", "_sound", "_delay"];
_device 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_loudspeakers	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_sound		= [_this, 2, "Alarm", [""]] call BIS_fnc_param;
_delay		= [_this, 4, 3, [0]] call BIS_fnc_param;

//Validate Logic object
if (isNull _device) exitWith {
	"Device object must NOT be null" call BIS_fnc_error;
};

//Validate Alarm object
if (isNull _device) exitWith {
	"Loudspeakers object must NOT be null" call BIS_fnc_error;
};

//Add action
_device addAction [localize "STR_A3_Campaign_B_m01_Alarm_Action", {
	private ["_device", "_action"];
	_device	= _this select 0;
	_action	= _this select 2;
	
	//Remove action
	_device removeAction _action;
	
	//Flag device as off
	_device setVariable ["BIS_alarmOff", true];
}, [], 1, false, true, "", "isNil { _target getVariable 'BIS_alarmOff' }"];

//The loop
while { isNil { _device getVariable "BIS_alarmOff" } } do {
	_loudspeakers say3D _sound;
	sleep _delay;
};

//Log
["Device (%1), Loudspeakers (%2), Sound: %3, Delay: %4", _device, _loudspeakers, _sound, _delay] call BIS_fnc_logFormat;
