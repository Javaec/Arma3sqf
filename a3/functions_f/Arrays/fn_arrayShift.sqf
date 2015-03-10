
/************************************************************
	Array Shift
	Author: KTottE

This function removes the first (leftmost) element of an array and returns it.
The array is passed by reference so changes inside the function will be reflected
outside of it.

Example:
array = [1,2,3,4]
element = [array] call BIS_fnc_arrayShift

array is now [2,3,4]
element is now 1
************************************************************/

private["_element", "_size", "_i"];

_element = (_this select 0) select 0;
_size = (count (_this select 0))-1;

//Set each position in the array to the value of the position to the
//right of it, thus shifting all the values to the left.
for "_i" from 0 to _size do
{
    (_this select 0) set [_i, (_this select 0) select (_i + 1)];
};

(_this select 0) resize _size;

_element
