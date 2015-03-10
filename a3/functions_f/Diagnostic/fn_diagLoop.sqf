/*
	Author: Karel Moricky

	Description:
	Runs scripted loop. Repeated call terminates previous loops.

	Parameter(s):
		0: CODE - code to be executed
		1: NUMBER - delay between calls (default: 0.1)

	Returns:
	SCRIPT - spawn handle
*/

if !(isnil "BIS_fnc_diagLoop_spawn") then {terminate BIS_fnc_diagLoop_spawn;};
BIS_fnc_diagLoop_spawn = _this spawn {
	scriptname "BIS_fnc_diagLoop";
	_code = [_this,0,{hint str time},[{}]] call bis_fnc_param;
	_delay = [_this,1,0.1,[0]] call bis_fnc_param;
	
	while {true} do {
		[] call _code;
		uisleep _delay;
	};
};
BIS_fnc_diagLoop_spawn