/************************************************************
	Random Select
	Author: Andrew Barron, rewritten by Warka, optimized by Karel Moricky

Parameters: array

This returns a randomly selected element from the passed array.

Example: [1,2,3] call BIS_fnc_selectRandom
Returns: 1, 2, or 3
************************************************************/

if (count _this > 0) then {
	_this select (floor random (count _this));
} else {
	["Array has no elements."] call bis_fnc_error;
	nil
};
