/*
	Author: Nelson Duarte
	
	Description:
	This function removes an item that is stacked in some event
	
	Parameter(s):
	_this select 0:	STRING	- The unique ID of the item inside the stack
	_this select 1:	STRING	- The onXxx event handler
	
	Returns:
	BOOLEAN - TRUE if successfully removed, FALSE if not
*/
//Parameters
private ["_id", "_event"];
_id		= [_this, 0, "", [""]] call BIS_fnc_param;
_event		= [_this, 1, "", [""]] call BIS_fnc_param;

//Mission namespace id
private "_namespaceId";
_namespaceId = "BIS_stackedEventHandlers_";

//Mission namespace event
private "_namespaceEvent";
_namespaceEvent = _namespaceId + _event;

//Data
private "_data";
_data = missionNameSpace getVariable [_namespaceEvent, []];

//Data item index
private "_index";
_index = -1;

//Go through all event handler data and find the correct index
{
	//Item id
	private "_itemId";
	_itemId	= [_x, 0, "", [""]] call BIS_fnc_param;
	
	//Is this the correct one?
	if (_id == _itemId) exitWith {
		_index = _forEachIndex;
	};
} forEach _data;

//Make sure data item was found
if (_index != -1) then {
	//Item found, change data type of element to STRING so we can remove it
	_data set [_index, "REMOVE_PLEASE"];
	
	//Remove item
	_data = _data - ["REMOVE_PLEASE"];
	
	//Update global container
	missionNameSpace setVariable [_namespaceEvent, _data];
	
	//Log
	["ID (%1) was successful removed from event (%2) stack", _id, _event] call BIS_fnc_logFormat;
	
	//Return
	true;
} else {
	//Error
	["ID (%1) not found in event (%2) stack, unable to remove", _id, _event] call BIS_fnc_error;
	
	//Return
	false;
};
