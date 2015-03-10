/*
	Author: Nelson Duarte
	
	Description:
	This returns a new array with randomized order of elements from input array
	
	Parameters:
	_this: ARRAY
	
	Returns:
	ARRAY
	
	Example:
	[1, 2, 3] call BIS_fnc_arrayShuffle
	Returns: [2, 3, 1] (For example)
*/

#define REPLACE_WITH "DELETE_ME_PLEASE"

//The container
private "_array";
_array = [[_this], 0, [], [[]]] call BIS_fnc_param;

//We create a copy of the container
//This will allow us to keep the old array reference instead of making it unusable for user
private "_copy";
_copy = [];

//The resulting container
private "_result";
_result = [];

// Iterator index
private "_index";
_index = -1;

//Fill the copied container with the elements
{
	_copy pushBack _x;
} forEach _array;

//Cut & Paste
for "_i" from 0 to (count _copy - 1) do {
	//The random index
	_index = floor random count _copy;
	
	//Pick a random element
	_result pushBack (_copy select _index);
	
	//Override the selected element with string data type, for the sake of removing it later
	_copy set [_index, REPLACE_WITH];
	
	//Delete element
	_copy = _copy - [REPLACE_WITH];
};

//Return new array with randomized elements
_result;
