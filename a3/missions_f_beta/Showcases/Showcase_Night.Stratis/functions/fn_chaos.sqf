/*
	Update chaos value
	
	Chaos: Increment value
		- (Number)
*/

//Params
private "_chaos";
_chaos	= [_this, 0, 0, [0]] call BIS_fnc_param;

//Increment Chaos value
private "_chaosTotal";
_chaosTotal = BIS_chaos + _chaos;

//Update gobal container
BIS_chaos = _chaosTotal;

//Log
format ["%1 chaos, %2 increment", _chaosTotal, _chaos] call BIS_fnc_log;

//Return value
_chaosTotal;
