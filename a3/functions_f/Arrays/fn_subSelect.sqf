
/************************************************************
	Subarray Select
	Author: Andrew Barron

Returns a sub-selection of the passed array. There are various
methods the sub-array can be determined.

Parameters: [array, beg, <end>]
Returns: subarray

array - Array to select sub array from.
beg - Index of array to begin sub-array. If negative, index is
	counted from the end of array.
end - Optional. Index of array to end the sub-array. If ommitted,
	remainder of the array will be selected. If negative, it
	specifies the length of the sub-array (in absolute form).

Examples:

	_array = ["a","b",true,3,8];
	[_array, 2] call BIS_fnc_subSelect; //returns [true,3,8]
	[_array, -2] call BIS_fnc_subSelect; //returns [3,8]
	[_array, 1, 3] call BIS_fnc_subSelect; //returns ["b",true,3]
	[_array, 1, -2] call BIS_fnc_subSelect; //returns ["b",true]

************************************************************/

private ["_ary","_beg","_len","_end","_ret","_i"];

_ret = [];

//inputs
_ary = _this select 0;
_len = (count _ary)-1;

//beginning point of subarray
_beg = _this select 1;

//if negative, index is counted from end of array
if(_beg < 0) then {_beg = _len+_beg+1};

//end point of subarray, optional
if(count _this > 2) then {_end = _this select 2} else {_end = _len};

//if end is negative, it means a fixed length array is returned
if(_end < 0) then {_end = _beg-_end-1};

//ensure we don't get errors from going past the end of the array
if(_end > _len) then {_end = _len};

//simply loop thru the passed array, copying elements over to the return array
for "_i" from _beg to _end do
{
	[_ret, _ary select _i] call BIS_fnc_arrayPush;
};

_ret;