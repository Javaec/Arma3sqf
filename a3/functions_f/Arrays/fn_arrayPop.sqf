
/************************************************************
	Array Pop
	Author: KTottE & Andrew Barron

This function removes the last (rightmost) element of an array and returns it.
The array is passed by reference so changes inside the function will be reflected
outside of it.

Example:
array = [1,2,3,4]
element = array call BIS_fnc_arrayPop

array is now [1,2,3]
element is now 4
************************************************************/

private["_element", "_size", "_array"];

_array = _this;
_size = count _array;
_element = _array select (_size - 1);
_array resize (_size - 1);

_element
