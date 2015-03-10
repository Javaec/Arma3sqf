/*
	Author: Nelson Duarte
	
	Description:
	Loop stacked code/function with timing and conditional control
	Code and conditions are executed in non-scheduled environment
	
	Parameters:
	_this select 0: Action
	_this select 1: Parameters
	
	Returns:
	NOTHING
	
	Examples:
	["initialize"] call BIS_fnc_loop; 										//Initializes game loop (not required if AUTO_INITIALIZE is set to true)
	["terminate"] call BIS_fnc_loop; 										//Terminates game loop
	["itemAdd", ["uniqueId", { hint str time; }, 5]] call BIS_fnc_loop; 						//Hints time every five seconds
	["itemAdd", ["uniqueId", { hint str time; }, 120, "frames"]] call BIS_fnc_loop; 				//Hints time every 120 frames
	["itemAdd", ["uniqueId", { hint str time; }, nil, nil, { !isNil { BIS_variable } }]] call BIS_fnc_loop; 	//Hints time every frame after BIS_variable is assigned
	["itemAdd", ["uniqueId", { hint str time; }, 5, "seconds", { !isNil { BIS_variable } }]] call BIS_fnc_loop; 	//Hints time every five seconds after BIS_variable is assigned
	["itemAdd", ["uniqueId", { hint str time; }]] call BIS_fnc_loop; 						//Hints time every frame
	["itemRemove", ["uniqueId"]] call BIS_fnc_loop; 								//Remove item from loop with id "uniqueId"
*/

//Defines
#define AUTO_INITIALIZE true
//#define AUTO_TERMINATE true

//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		//Do not allow multiple executions
		if (!isNil { missionNameSpace getVariable "BIS_fnc_loop_initialized" }) exitWith {
			"BIS_fnc_loop already initialized" call BIS_fnc_error;
		};
		
		//Flag
		missionNameSpace setVariable ["BIS_fnc_loop_initialized", true];
		
		//Queue
		missionNameSpace setVariable ["BIS_fnc_loop_queue", []];
		
		//The current amount of elapsed frames
		missionNameSpace setVariable ["BIS_fnc_loop_frames", 0];
		
		//The current time
		missionNameSpace setVariable ["BIS_fnc_loop_time", time];
		
		//On each frame event handler
		missionNameSpace setVariable ["BIS_fnc_loop_onEachFrame", ["BIS_fnc_loop", "oneachframe", {
			//Function is called every frame
			["oneachframe"] call BIS_fnc_loop;
		}] call BIS_fnc_addStackedEventHandler];
		
		//Log
		"Initialized" call BIS_fnc_log;
	};
	
	case (toLower "terminate") : {
		//Terminate on each frame loop
		[missionNameSpace getVariable ["BIS_fnc_loop_onEachFrame", ""], "oneachframe"] call BIS_fnc_removeStackedEventHandler;
		
		//Clear variables
		missionNameSpace setVariable ["BIS_fnc_loop_initialized", nil];
		missionNameSpace setVariable ["BIS_fnc_loop_queue", nil];
		missionNameSpace setVariable ["BIS_fnc_loop_frames", nil];
		missionNameSpace setVariable ["BIS_fnc_loop_time", nil];
		missionNameSpace setVariable ["BIS_fnc_loop_onEachFrame", nil];
		
		//Log
		"Terminated" call BIS_fnc_log;
	};
	
	case (toLower "onEachFrame") : {
		//Initialized?
		if (isNil { missionNameSpace getVariable "BIS_fnc_loop_initialized" }) exitWith {
			//Error
			["Action (%1) requires initialization", _action] call BIS_fnc_error;
		};
		
		//Update frames and time
		missionNameSpace setVariable ["BIS_fnc_loop_frames", (missionNameSpace getVariable ["BIS_fnc_loop_frames", 0]) + 1];
		missionNameSpace setVariable ["BIS_fnc_loop_time", time];
		
		//Go through all items in queue
		{
			private "_parameters";
			_parameters = _x;
			_parameters set [8, _forEachIndex];
			
			//Execute item
			["itemExecute", _parameters] call BIS_fnc_loop;
		} forEach (missionNameSpace getVariable ["BIS_fnc_loop_queue", []]);
	};
	
	case (toLower "itemExecute") : {
		//Initialized?
		if (isNil { missionNameSpace getVariable "BIS_fnc_loop_initialized" }) exitWith {
			//Error
			["Action (%1) requires initialization", _action] call BIS_fnc_error;
		};
		
		//Parameters
		private ["_id", "_code", "_timer", "_timerType", "_conditionStart", "_conditionEnd", "_executeOnce", "_lastExecutionTime", "_index"];
		_id 			= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_code 			= [_parameters, 1, {}, [{}, ""]] call BIS_fnc_param;
		_timer			= [_parameters, 2, 0, [0], 2] call BIS_fnc_param;
		_timerType 		= [_parameters, 3, "seconds", [""]] call BIS_fnc_param;
		_conditionStart		= [_parameters, 4, { true }, [{}]] call BIS_fnc_param;
		_conditionEnd		= [_parameters, 5, { false }, [{}]] call BIS_fnc_param;
		_executeOnce 		= [_parameters, 6, false, [false]] call BIS_fnc_param;
		_lastExecutionTime 	= [_parameters, 7, time, [0]] call BIS_fnc_param;
		_index			= [_parameters, 8, 0, [0]] call BIS_fnc_param;
		
		//The condition, depends on timerType
		private "_conditionTimer";
		_conditionTimer = if (_timerType == "frames") then {
			missionNameSpace getVariable ["BIS_fnc_loop_frames", 0] >= _lastExecutionTime + _timer;
		} else {
			time >= _lastExecutionTime + _timer;
		};
		
		//Should we execute the item?
		if (_conditionTimer && _conditionStart) then {
			//Process item
			if (typeName _code != typeName "") then {
				[] call _code;
			} else {
				[] call (call compile _code);
			};
			
			//Should only execute once or end condition met?
			if (_executeOnce || _conditionEnd) then {
				//Remove item
				["itemRemove", _id] call BIS_fnc_loop;
			} else {
				//Queue
				private "_queue";
				_queue = missionNameSpace getVariable ["BIS_fnc_loop_queue", []];
				
				//Item
				private "_item";
				_item = _queue select _index;
				
				//Update timer/frames
				if (_timerType == "frames") then {
					_item set [7, missionNameSpace getVariable ["BIS_fnc_loop_frames", 0]];
				} else {
					_item set [7, time];
				};
				
				//Modify item in queue
				_queue set [_index, _item];
				
				//Store
				missionNameSpace setVariable ["BIS_fnc_loop_queue", _queue];
			};
		};
	};
	
	case (toLower "itemAdd") : {
		//Public
		private ["_id", "_code", "_timer", "_timerType", "_conditionStart", "_conditionEnd", "_executeOnce"];
		_id 			= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_code 			= [_parameters, 1, {}, [{}, ""]] call BIS_fnc_param;
		_timer			= [_parameters, 2, 0, [0]] call BIS_fnc_param;
		_timerType 		= [_parameters, 3, "seconds", [""]] call BIS_fnc_param;
		_conditionStart		= [_parameters, 4, { true }, [{}]] call BIS_fnc_param;
		_conditionEnd		= [_parameters, 5, { false }, [{}]] call BIS_fnc_param;
		_executeOnce 		= [_parameters, 6, false, [false]] call BIS_fnc_param;
		
		//Initialize loop if not initialized already
		if (isNil { missionNameSpace getVariable "BIS_fnc_loop_initialized" }) then {
			//Error
			if (!AUTO_INITIALIZE) exitWith {
				["Action (%1) requires initialization", _action] call BIS_fnc_error;
			};
			
			//Auto initialize
			["initialize"] call BIS_fnc_loop;
		};
		
		//Queue
		private "_queue";
		_queue = missionNameSpace getVariable ["BIS_fnc_loop_queue", []];
		
		//Add item to queue
		_queue pushBack [_id, _code, _timer, _timerType, _conditionStart, _conditionEnd, _executeOnce, time, 0];
		
		//Store queue
		missionNameSpace setVariable ["BIS_fnc_loop_queue", _queue];
		
		//Log
		["Item added: Id (%1), Code (%2), Timer (%3), Timer Type (%4), Condition Start (%5), Condition End (%6), Execute Once (%7)", _id, _code, _timer, _timerType, _conditionStart, _conditionEnd, _executeOnce] call BIS_fnc_logFormat;
	};
	
	case (toLower "itemRemove") : {
		//Initialized?
		if (isNil { missionNameSpace getVariable "BIS_fnc_loop_initialized" }) exitWith {
			//Error
			["Action (%1) requires initialization", _action] call BIS_fnc_error;
		};
		
		//Parameters
		private ["_id"];
		_id = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		//Queue
		private "_queue";
		_queue = missionNameSpace getVariable ["BIS_fnc_loop_queue", []];
		
		//Go through queue and find matching id
		{
			//The current item id
			private "_itemId";
			_itemId = [_x, 0, "", [""]] call BIS_fnc_param;
			
			//Match found?
			if (_id == _itemId) then {
				_queue set [_forEachIndex, "delete"];
			};
		} forEach _queue;
		
		//Now we remove all dirty items from the queue
		_queue = _queue - ["delete"];
		
		//Store queue
		missionNameSpace setVariable ["BIS_fnc_loop_queue", _queue];
		
		//Log
		["Item removed: Id (%1)", _id] call BIS_fnc_logFormat;
	};
	
	case DEFAULT {
		//Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
