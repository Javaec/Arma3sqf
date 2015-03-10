
/************************************************************
	Find Lowest Number
	Author: Andrew Barron

Parameters: [number set]
Returns: number

Returns the lowest number out of the passed set.

Example: [1,5,10] call BIS_fnc_lowestNum
	returns 1
************************************************************/

private "_lowest";

_lowest = 1e9;
{
	if(_x < _lowest) then
	{
		_lowest = _x;
	};
} foreach _this;

_lowest