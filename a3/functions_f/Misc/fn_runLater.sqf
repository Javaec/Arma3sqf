/*
	Author: Nelson Duarte
	
	Description:
	Run some code later
	Delay can be in seconds, frames and/or custom condition
	Code and conditions are executed in non-schedule environment
	
	Parameters:
	_this select 0: Unique id
	_this select 1: Code/function that is executed later
	_this select 2: The timer value (can be in seconds or frames)
	_this select 3: The timer type, can be "seconds" or "frames"
	_this select 4: The custom condition, code is only executed if timer is validated and condition is met
	
	Returns:
	NOTHING
	
	Examples:
	["uniqueId", { hint str time; }, 5] call BIS_fnc_runLater; 						//Hints current game time in the next frame after 5 seconds have passed
	["uniqueId", { hint str time; }, 120, "frames"] call BIS_fnc_runLater; 					//Hints current game time in the next frame after 120 frames have passed
	["uniqueId", { hint str time; }, nil, nil, { !isNil { BIS_variable } }] call BIS_fnc_runLater; 		//Hints current game time in the next frame after BIS_variable is assigned
	["uniqueId", { hint str time; }, 5, "seconds", { !isNil { BIS_variable } }] call BIS_fnc_runLater; 	//Hints current game time in the next frame after 5 seconds have passed and BIS_variable is assigned
	["uniqueId", { hint str time; }] call BIS_fnc_runLater; 						//Hints current game time in the next frame
*/

//Parameters
private ["_id", "_code"];
_id 		= [_this, 0, "", [""]] call BIS_fnc_param;
_code 		= [_this, 1, {}, [{}, ""]] call BIS_fnc_param;
_timer 		= [_this, 2, 0, [0]] call BIS_fnc_param;
_timerType	= [_this, 3, "seconds", [""]] call BIS_fnc_param;
_condition	= [_this, 4, { true }, [{}]] call BIS_fnc_param;

["itemAdd", [_id, _code, _timer, _timerType, _condition, nil, true]] call BIS_fnc_loop;
