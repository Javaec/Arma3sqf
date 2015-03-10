/*
	File: fn_findExtreme.sqf
	Author: Joris-Jan van 't Land

	Description:
	Returns the minimum or maximum value in an Array.

	Parameter(s):
	_this select 0: Array (array)
	_this select 1: Scalar (mode)
		0: minimum
		1: maximum
	
	Returns:
	Scalar (extreme)
*/

private ["_array", "_mode", "_extreme"];
_array = _this select 0;
_mode = _this select 1;

_extreme = _array select 0;

switch (_mode) do 
{
	//Minimum
	case 0: 
	{			
		{
			_extreme = _extreme min _x;
		} 
		forEach _array;
	};
	
	//Maximum
	case 1: 
	{
		{
			_extreme = _extreme max _x;
		} 
		forEach _array;
	};
};

_extreme