
/************************************************************
	Array UnShift
	Author: KTottE, optimized by Andrew Barron

This function adds an element to the beginning of an array and returns the array.
The array is passed by reference so changes inside the function will be reflected
outside of it.

Example:
array = [2,3,4]
[array, 1] call BIS_fnc_ArrayUnshift
array2 = [[6,7,8], 5] call BIS_fnc_ArrayUnshift

array is now [1,2,3,4]
array2 is now [5,6,7,8]
************************************************************/

private["_array", "_size", "_i"];

_array = _this select 0;
_size = count (_this select 0)-1;
_array resize (_size + 1);

// Loop through the array, from right to left, and move everything one step to the right
for "_i" from _size-1 to 1 step -1 do
{
    _array set[_i + 1, _array select (_i-1)];
};

//set first element
(_this select 0) set[0, _this select 1];
(_this select 0)
