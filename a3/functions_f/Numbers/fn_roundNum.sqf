
/*
	File: fn_roundNum.sqf
	Author: Joris-Jan van 't Land

	Description:
	Round a number to the provided factor.

	Parameter(s):
	_this select 0: number (Scalar)
	_this select 1: factor (Scalar)
	_this select 2: (optional) secondary factor, used when number / primary factor is smaller than 10 (Scalar)
	
	Returns:
	Scalar - rounded number
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [roundNum] Function requires at least 2 parameters!"; -1};

private ["_num", "_fac", "_secFac", "_return"];
_num = _this select 0;
_fac = _this select 1;

_secFac = -1;
if ((count _this) > 2) then {_secFac = _this select 2};

_return = _num;

//Validate parameters
if ((typeName _num) != (typeName 0)) exitWith {debugLog "Log: [roundNum] Number (0) must be a Scalar!"; -1};
if ((typeName _fac) != (typeName 0)) exitWith {debugLog "Log: [roundNum] Factor (1) must be a Scalar!"; -1};
if ((typeName _secFac) != (typeName 0)) exitWith {debugLog "Log: [roundNum] Secondary factor (2) must be a Scalar!"; -1};

//Use the secondary factor when the primary factor would round to roughly.
private ["_useFac"];
_useFac = _fac;
if (_secFac != -1) then 
{
	if ((_num / _fac) < 10) then 
	{
		_useFac = _secFac;
	};
};

//Make sure the return value is not 0.
if (_num >= _useFac) then 
{
	_return = _num - (_num % _useFac);
};

_return