
/************************************************************
	Unit Vector
	Author: Andrew Barron

Returns the unit vector for the passed vector (vector pointing
in the same direction, but with magnitude == 1)
This does not modify the original array.
The array can have any number of elements (2, 3, etc).
************************************************************/
private ["_mag","_ret"];

_ret = [];
_mag = _this call BIS_fnc_magnitude;

//loop thru passed array, create return array
{
	_ret = _ret + [_x / _mag]; //divide each element by magnitude of the array
} foreach _this;

_ret
