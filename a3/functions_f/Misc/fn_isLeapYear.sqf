/*
	Author: Jiri Wainar

	Description:
	Returns true if given year is a leap year, otherwise false.

	Parameter(s):
	_this: SCALAR - year; a non-decimal number

	Example:
	_isLeapYear = 2035 call BIS_fnc_isLeapYear;

	Returns:
	BOOL - is given year a leap year or not?
*/

if (typeName _this != typeName 123) exitWith
{
	["Year must be a number!"] call BIS_fnc_error;
};

if (_this % 1 != 0) exitWith
{
	["Year must be a non-decimal number!"] call BIS_fnc_error;
};

if (_this/400 % 1 == 0) exitWith
{
	true
};

if (_this/100 % 1 == 0) exitWith
{
	false
};

if (_this/4 % 1 == 0) exitWith
{
	true
};

false