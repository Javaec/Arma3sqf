
/************************************************************
	Find Nearest Number
	Author: Andrew Barron

Parameters: [[number set], target number]
Returns: number

Returns the number out of the set which is closest to the target number

Example: [[1,5,10], 4] call BIS_fnc_nearestNum
	returns 5
************************************************************/

private ["_numSet","_target","_bestD","_closest","_diff"];

_numSet = _this select 0;
_target = _this select 1;

_bestD = 1e9;
{
	_diff = abs (_target-_x);
	if(_diff < _bestD) then
	{
		_closest = _x;
		_bestD = _diff;
	};
} foreach _numSet;

_closest