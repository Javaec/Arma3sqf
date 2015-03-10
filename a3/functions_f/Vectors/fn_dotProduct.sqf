
/************************************************************
	Dot Product
	Author: Andrew Barron
	
Returns the dot product of two vectors.
The vectors can have any number of elements (2, 3, etc), but
they must have the same number.
************************************************************/

private ["_v1","_v2","_ret","_i"];

_v1 = _this select 0;
_v2 = _this select 1;
_ret = 0;

//loop thru arrays in order, multiply each pair of elements, add them to the total
for "_i" from 0 to ((count _v1)-1) do
{
	_ret = _ret + (_v1 select _i)*(_v2 select _i);
};

_ret
