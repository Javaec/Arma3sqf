scriptName "Showcase_Night\scripts\radioOff.sqf";

//Params
private ["_radio", "_player", "_action"];
_radio 	= _this select 0;
_player = _this select 1;
_action = _this select 2;

//Remove action from radio
_radio removeAction _action;

//Kill radio
_radio setDamage 1;

//Log
"Showcase_Night\scripts\radioOff.sqf" call BIS_fnc_log;
