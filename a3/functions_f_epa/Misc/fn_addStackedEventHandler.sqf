/*
	Author: Nelson Duarte
	
	Description:
	This function adds a new item that will be stacked and called upon event handler selected has been executed
	
	Parameter(s):
	_this select 0:	STRING		- The unique ID of the item inside the stack
	_this select 1:	STRING		- The onXxx event handler to monitor and execute code upon
	_this select 2:	STRING or CODE	- The function name or code to execute upon the event triggering
	_this select 3:	ANY		- Arguments passed to function/code
	
	Returns:
	STRING - The stacked item ID
*/
//Parameters
private ["_id", "_event", "_code", "_arguments"];
_id		= [_this, 0, "", [""]] call BIS_fnc_param;
_event		= [_this, 1, "", [""]] call BIS_fnc_param;
_code		= [_this, 2, {}, [{}, ""]] call BIS_fnc_param;
_arguments	= [_this, 3, []] call BIS_fnc_param;

//Supported event handlers
private "_supportedEvents";
_supportedEvents = ["oneachframe", "onpreloadstarted", "onpreloadfinished", "onmapsingleclick", "onplayerconnected", "onplayerdisconnected"];

//Validate event
if !(toLower _event in _supportedEvents) exitWith {
	//Error
	["Stack with ID (%1) could not be added because the Event (%2) is not supported or does not exist. Supported Events (%3)", _id, _event, _supportedEvents] call BIS_fnc_error;
};

//Mission namespace id
private "_namespaceId";
_namespaceId = "BIS_stackedEventHandlers_";

//Mission namespace event
private "_namespaceEvent";
_namespaceEvent = _namespaceId + _event;

//The data
private "_data";
_data = missionNameSpace getVariable [_namespaceEvent, []];

//The index
private "_index";
_index = -1;

//Go through all event handler data and find if id is already defined, if so, we override it
{
	//Item id
	private "_itemId";
	_itemId	= [_x, 0, "", [""]] call BIS_fnc_param;
	
	//Is this the correct one?
	if (_id == _itemId) exitWith {
		_index = _forEachIndex;
	};
} forEach _data;

//Is data related to event empty
//If so, we need to initialize it
switch (toLower _event) do {
	case "oneachframe" : { onEachFrame { ["oneachframe"] call BIS_fnc_executeStackedEventHandler; }; };
	case "onpreloadstarted" : { onPreloadStarted { ["onpreloadstarted"] call BIS_fnc_executeStackedEventHandler; }; };
	case "onpreloadfinished" : { onPreloadFinished { ["onpreloadfinished"] call BIS_fnc_executeStackedEventHandler; }; };
	case "onmapsingleclick" : { onMapSingleClick { ["onmapsingleclick"] call BIS_fnc_executeStackedEventHandler; }; };
	case "onplayerconnected" : { onPlayerConnected { ["onplayerconnected"] call BIS_fnc_executeStackedEventHandler; }; };
	case "onplayerdisconnected" : { onPlayerDisconnected { ["onplayerdisconnected"] call BIS_fnc_executeStackedEventHandler; }; };
};

//Add new item, or override old one with same id
if (_index == -1) then {
	//Add
	_data set [count _data, _this];
} else {
	//Override
	_data set [_index, _this];
};

//Store in namespace
missionNameSpace setVariable [_namespaceEvent, _data];

//Log
["Stack as been updated with ID (%1) for Event (%2) executing Function (%3), Replaced: (%4)", _id, _event, _code, _index != -1] call BIS_fnc_logFormat;

//Return
_id;
