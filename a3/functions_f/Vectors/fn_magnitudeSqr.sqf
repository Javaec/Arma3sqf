
/************************************************************
	Magnitude
	Author: Andrew Barron

Returns the magnitude of an array of numbers (a vector).
The vector can have any number of elements (2, 3, etc).
************************************************************/

private "_ret";

_ret = 0;
{_ret = _ret + _x^2} foreach _this; //add in squares of all components
_ret                                //return squared magnitude
