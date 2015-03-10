/*
	Author: Joris-Jan van 't Land, optimized by Karel Moricky

	Description:
	Function to select a random item from an array, taking into account item weights.
	The weights should be Numbers between 0 and 1, with a maximum precision of hundreds.
	
	Parameter(s):
	_this select 0: source Array (Array of Any Value)
	_this select 1: weights (Array of Number)
	
	Returns:
	Any Value selected item
	
	TODO:
	[*] Algorithm is inefficient?
*/

private ["_array", "_weights","_weightsTotal"];
_array = [_this,0,[],[[]]] call bis_fnc_param;
_weights = +([_this,1,[],[[]]] call bis_fnc_param);

//Parameter validation.
if ((count _array) > (count _weights)) exitWith {"There must be at least as many elements in Weights (1) as there are in Array (0)!" call bis_fnc_error; nil};

_weightsTotal = 0;
{
	_x = [_x,0,0,[0]] call bis_fnc_paramIn;
	_weightsTotal = _weightsTotal + _x;
} foreach _weights;

if (_weightsTotal > 0) then {

	//Created weighted array of indices.
	private ["_weighted"];
	_weighted = [];
	{
		private ["_weight"];
		_weight = _x / _weightsTotal;

		//Normalize the weight for a precision of hundreds.
		_weight = round(_weight * 100);
	
		for "_k" from 0 to (_weight - 1) do 
		{
			_weighted = _weighted + [_foreachindex];
		};
	} foreach _weights;

	//Randomly select an index from the weighted array and therefore an element.
	private ["_index"];
	_index = _weighted call BIS_fnc_selectRandom;

	_array select _index
} else {
	["The sum of weights must be larger than 0"] call bis_fnc_error;
	nil
};