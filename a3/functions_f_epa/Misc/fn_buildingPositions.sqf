/*
	Author: Nelson Duarte
	
	Description:
	This function return all available positions of a building defined in model, if any
	
	Parameter(s):
	_this select 0:	OBJECT	- The building object
	_this select 1:	NUMBER	- The maximum number of positions to return
	
	Returns:
	ARRAY - List of all available positions within building
*/

//Parameters
private ["_building", "_max"];
_building 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_max		= [_this, 1, 99, [0]] call BIS_fnc_param;

//The number of available positions
private "_availablePositions";
_availablePositions = [];

//The index
private "_index";
_index = 0;

//Loop limit and find available positions
while { (_building buildingPos _index) distance [0,0,0] > 0 && _index < _max } do {
	//Add position to the pool
	_availablePositions set [count _availablePositions, _building buildingPos _index];
	
	//Increment index
	_index = _index + 1;
};

//Return
_availablePositions;
