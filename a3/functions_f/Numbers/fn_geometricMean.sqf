
/************************************************************
	Geometric Mean
	Author: Andrew Barron

Returns the geometric mean (weighted average) of an array of numbers
************************************************************/

private ["_ret","_i"];

_ret = _this select 0;

//multiply up all numbers
for "_i" from 1 to ((count _this)-1) do
{
	_ret = _ret * (_this select _i);
};

//find the root
_ret = abs _ret;
_ret = _ret^(1/count _this);
_ret
