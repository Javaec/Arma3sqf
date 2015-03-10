/*
	Author: Josef Zemanek and Karel Moricky

	Description:
	Evaluates the current battlefield situation and saves the game when appropriate

	Parameter(s):
		_this: units to check (ARRAY)

	Returns:
	BOOL - true when saved
*/
private ["_units","_condition"];

_units = [[_this],0,[],[[],objnull,grpnull]] call bis_fnc_param;
if (typename _units == typename objnull) then {_units = [_units]};
if (typename _units == typename grpnull) then {_units = units _units};
if (count _units == 0) then {_units = [player]};

//--- None of following acts must be happening
_condition = {
	{
		//--- Incapacitated
		lifeState _x == "UNCONSCIOUS"
		||
		//--- Dead
		!(alive _x)
		||
		//--- Speaking
		_x call bis_fnc_kbIsSpeaking
		||
		//--- Disabled
		!(vehicle _x getvariable ["BIS_helicopterCanFly",true])
	} count _units == 0
};

//--- Save when clear
[_units,_condition] spawn {
	_units = _this select 0;
	_condition = _this select 1;
	_delay = if (call _condition) then {0.1} else {3};
	sleep _delay; //--- Delay because conversations are spawned, not called
	waitUntil {call _condition};
	saveGame
};