
/************************************************************
	Arithmetic Mean
	Author: Andrew Barron

Returns the arithmetic mean (average) of an array of numbers
************************************************************/

private ["_ret"];

_ret = 0;

//sum up all numbers
{_ret = _ret + _x} foreach _this;

//divide by the count of numbers
_ret = _ret / (count _this);
_ret;