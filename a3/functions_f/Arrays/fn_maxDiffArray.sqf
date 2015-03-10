
/*
	File: maxDifArray.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function to return the maximum difference between all values in an array.

	Parameter(s):
	_this select 0: Array of Numbers
	
	Returns:
	Biggest difference - Number
*/

private ["_array", "_maxDiff"];
_array = _this select 0;
_maxDiff = 0;

for "_i" from 0 to ((count _array) - 1) do
{
	for "_k" from 0 to ((count _array) - 1) do
	{
		_maxDiff = _maxDiff max (abs ((_array select _i) - (_array select _k)));
	};
};

_maxDiff