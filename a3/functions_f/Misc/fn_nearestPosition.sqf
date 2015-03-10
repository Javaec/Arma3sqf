
/*
	File: nearestPosition.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function to find the nearest Object or position from a list, 
	when compared to a given Object or position.

	Parameter(s):
	_this select 0: Array of Objects, Locations, Groups, markers (String) and / or positions (Array)
	_this select 1: Comparator Object, Location, Group, marker (String) or position (Array)
	
	Notes:
	[*] For type Group the position of its leader is used.
	
	Returns:
	Object / Location / Group / marker (String) or position (Array) which is nearest to the comparator
*/

//Valid parameter count
if (isNil "_this") exitWith {debugLog "Log: [nearestPosition] There should be 2 mandatory parameters!"; nil};
if ((count _this) < 2) exitWith {debugLog "Log: [nearestPosition] There should be 2 mandatory parameters!"; nil};

private ["_list", "_position"];
_list = _this select 0;
_position = _this select 1;

//Validate parameters
if ((typeName _list) != (typeName [])) exitWith {debugLog "Log: [nearestPosition] List (0) should be an Array!"; nil};
if (!((typeName _position) in [(typeName objNull), (typeName locationNull), (typeName grpNull), (typeName ""), (typeName [])])) exitWith {debugLog "Log: [nearestPosition] Comparator (1) should be an Object, Location, Group, String or Array!"; nil};

//Internal function to convert various types to a position
private ["_getPosition"];
_getPosition = 
{
	private ["_position"];
	switch (typeName _this) do 
	{
		case (typeName locationNull): {_position = locationPosition _this};
		case (typeName grpNull): {_position = position (leader _this)};
		case (typeName ""): {_position = markerPos _this};
		default {_position = _this};	
	};
	
	_position
};

//Convert the comparator
_position = _position call _getPosition;

private ["_closest", "_closestDist"];
_closestDist = -1;
_closest = [0, 0, 0];

{
	if ((typeName _x) in [(typeName objNull), (typeName locationNull), (typeName grpNull), (typeName ""), (typeName [])]) then 
	{
		//Determine the distance to the comparator, save when it's the new closest
		private ["_dist"];
		_dist = (_x call _getPosition) distance _position;
		if ((_closestDist == -1) || (_dist < _closestDist)) then 
		{
			_closestDist = _dist;
			_closest = _x;
		};
	} 
	else 
	{
		debugLog "Log: [nearestPosition] A to-be-compared value should be an Object, Location, Group, String or Array!";
	};
} forEach _list;

_closest