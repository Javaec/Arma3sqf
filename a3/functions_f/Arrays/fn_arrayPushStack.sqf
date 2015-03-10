
/************************************************************
	Array Push Stack
	Author: Andrew Barron

This function is similar to the array push function; however,
it pushes the contents of an array onto the stack array.

Example:

Example:
array = [1,2,3]
[array, [4,5,6]] call BIS_fnc_arrayPush

array2 = [[5,6,7], [8,[9],10]] call BIS_fnc_arrayPush

array is now [1,2,3,4,5,6]
array2 is now [5,6,7,8,[9],10]
************************************************************/

{
	(_this select 0) set [count (_this select 0), _x];
} foreach (_this select 1);
(_this select 0)
