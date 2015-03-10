
/************************************************************
	Random Index
	Author: Andrew Barron

Parameters: array

This returns a random integer representing an index in the passed array.

Example: [1,2,3] call BIS_fnc_selectRandom
Returns: 0, 1, or 2
************************************************************/

private "_ret";

_ret = floor random (count _this);           //random index
_ret