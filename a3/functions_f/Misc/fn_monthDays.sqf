/*
	Author: Jiri Wainar

	Description:
	Returns number of days in given month. Takes in account for leap year.

	Parameter(s):
	_this select 0: SCALAR - year; a non-decimal number
	_this select 1: SCALAR - month; a non-decimal number between 1-12

	Example:
	_days = [2035,7] call BIS_fnc_monthDays;

	Returns:
	SCALAR - number of days in given month
*/

private ["_year","_month","_days","_isLeapYear"];

_year 	= [_this, 0, 2035, [123]] call BIS_fnc_param;
_month 	= [_this, 1, 1, [123]] call BIS_fnc_param;

if (_month % 1 != 0) exitWith
{
	["Month must be a non-decimal number!"] call BIS_fnc_error;
};

if (_month < 1 || _month > 12) exitWith
{
	["Month must be a number in interval [1,12]!"] call BIS_fnc_error;
};

//get days
_days =	switch (_month) do
{
	case  1;
	case  3;
	case  5;
	case  7;
	case  8;
	case 10;
	case 12: {	31	};

	case  2: {	28	};

	default	 {	30	};
};

//check for leap year
_isLeapYear = _year call BIS_fnc_isLeapYear;

if (_isLeapYear && _month == 2) then
{
	_days = _days + 1;
};

_days