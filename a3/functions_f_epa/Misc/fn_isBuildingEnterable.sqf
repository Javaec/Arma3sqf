/*
	Author: Nelson Duarte
	
	Description:
	This function returns whether a building is has model defined positions inside of it or not
	
	Parameter(s):
	_this select 0:	OBJECT	- The building object to check
	_this select 1:	NUMBER	- The minimum number of available positions a building needs to have in order to this function return true
	
	Returns:
	BOOLEAN - Whether this building has available positions defined in model
*/

//Parameters
private ["_building", "_min"];
_building 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_min		= [_this, 1, 1, [0]] call BIS_fnc_param;

//Get available positions of the building
private "_availablePositions";
_availablePositions = [_building, _min] call BIS_fnc_buildingPositions;

//Does this building have at least one position defined?
private "_isEnterable";
_isEnterable = count _availablePositions >= _min;

//Return
_isEnterable;
