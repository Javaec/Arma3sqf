private ["_mode","_modeText"];
_mode = [_this,0,0,[0]] call (uinamespace getvariable "bis_fnc_param");
_mode = _mode max 0 min 2;
_modeText = [
	"No Debug",
	"Save script map",
	"Save and log script map"
] select _mode;

[" Functions debug set to: %1",_modeText] call (uinamespace getvariable "bis_fnc_logFormat");

uinamespace setvariable ["bis_fnc_initFunctions_debugMode",_mode];
[1] call (uinamespace getvariable "bis_fnc_recompile");