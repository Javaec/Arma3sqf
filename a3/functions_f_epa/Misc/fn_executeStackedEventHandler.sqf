/*
	Author: Nelson Duarte
	
	Description:
	This function executes the stacked items, should not be called independently
	
	Parameter(s):
	_this select 0:	STRING	- The onXxx event handler
	
	Returns:
	BOOLEAN - FALSE
*/
//Parameters
private ["_event"];
_event = [_this, 0, "", [""]] call BIS_fnc_param;

//Mission namespace id
private "_namespaceId";
_namespaceId = "BIS_stackedEventHandlers_";

//Mission namespace event
private "_namespaceEvent";
_namespaceEvent = _namespaceId + _event;

//The data
private "_data";
_data = missionNameSpace getVariable [_namespaceEvent, []];

//Process data
{
	//Data item parameters
	private ["_code", "_arguments"];
	_code		= [_x, 2, "", [{}, ""]] call BIS_fnc_param;
	_arguments	= [_x, 3, []] call BIS_fnc_param;
	
	if (typeName _code != typeName "") then {
		//Execute code
		_arguments call _code;
	} else {
		//Execute function
		_arguments call (call compile _code);
	};
} forEach _data;

//Return
false;
