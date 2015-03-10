scriptName "initScTriggers.sqf";

/*--------------------------------------------------------------------------------------------------

	LOOP FOR SCRIPTED TRIGGERS (with interface)

	Global variables:
	-----------------
	* BIS_ScTriggers_addArray
	* BIS_ScTriggers_removeArray

	Functions:
	----------
	* BIS_ScTriggers_add
	* BIS_ScTriggers_remove
	* BIS_ScTriggers_getKey

--------------------------------------------------------------------------------------------------*/

#define CHECK_FREQUENCY		0.05

if (isNil "BIS_DebugMode") then
{
	BIS_DebugMode = false;
};

BIS_ScTriggers_addArray = [];
BIS_ScTriggers_removeArray = [];

//functions ----------------------------------------------------------------------------------------
BIS_ScTriggers_add =
{
	BIS_ScTriggers_addArray set [count BIS_ScTriggers_addArray,_this];
};

BIS_ScTriggers_remove =
{
	BIS_ScTriggers_removeArray set [count BIS_ScTriggers_removeArray,_this];
};

BIS_ScTriggers_getKey =
{
	(format["%1_%2",toLower((_this select 0) call BIS_fnc_objectVar),toLower(_this select 1)])
};

//main trigger loop --------------------------------------------------------------------------------
[] spawn
{
	scriptName "initScTriggers.sqf: main trigger loop";

	private["_triggers","_keys","_trigger","_i","_max","_fn_eval","_key","_index"];

	_triggers = [];

	_fn_eval =
	{
		private["_tKey","_tObject","_tId","_tDistance","_tParams","_tCond","_tCode","_tCondExit","_tCodeExit","_tCounter","_tSleep","_tExecTime","_tCycleLength"];

		_tObject 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		_tId 		= [_this, 1, "default", [""]] call BIS_fnc_param;
		_tDistance 	= [_this, 2, 10, [123]] call BIS_fnc_param;
		_tParams 	= [_this, 3, [], [[]]] call BIS_fnc_param;
		_tCond 		= [_this, 4, {false}, [{}]] call BIS_fnc_param;
		_tCode		= [_this, 5, {}, [{}]] call BIS_fnc_param;
		_tCondExit	= [_this, 6, {false}, [{}]] call BIS_fnc_param;
		_tCodeExit	= [_this, 7, {false}, [{}]] call BIS_fnc_param;
		_tCounter	= [_this, 8, 1, [123]] call BIS_fnc_param;
		_tSleep		= [_this, 9, 10, [123]] call BIS_fnc_param;
		_tExecTime	= [_this,10, -1, [123]] call BIS_fnc_param;

		_tKey		= _this call BIS_ScTriggers_getKey;

		//init execution time
		if (_tExecTime == -1) then
		{
			_tExecTime = time - 6000;
			_this set [10, _tExecTime];
		};

		//make sure min. sleep time is bigger then min. cycle time
		_tCycleLength = 3 * CHECK_FREQUENCY * (count _triggers) + 2;

		if (_tSleep < _tCycleLength) then
		{
			//["[%1] Trigger sleep (%2) is shorter the cycle length (%3)!",_tKey,_tSleep,_tCycleLength] call BIS_fnc_logFormat;

			_tSleep = 2*_tCycleLength;
		};

		//["[%1] _tExecTime = %2",_tKey,_tExecTime] call BIS_fnc_logFormat;

		//check for the abort condition
		if (_tParams call _tCondExit) exitwith
		{
			//["[ScTriggers] Exit condition triggered: %1",_tKey] call BIS_fnc_logFormat;

			_tParams call _tCodeExit;
			_this call BIS_ScTriggers_remove;
		};

		//check for the trigger condition
		if !(_tParams call _tCond) exitWith
		{
		};

		//store the execution time
		_this set [10, time];

		//check for the time from last execution
		if (_tExecTime + _tSleep > time) exitwith
		{
			//["[%1] Trigger checked too soon!",_tKey] call BIS_fnc_logFormat;
		};

		//run the trigger code !!!
		//["[%1] Trigger executed!",_tKey] call BIS_fnc_logFormat;
		_tParams call _tCode;

		//update & store the counter
		_tCounter = _tCounter - 1;
		_this set [8,_tCounter];

		//remove the trigger if the counter reached zero
		if (_tCounter <= 0) then
		{
			//["[%1] Trigger counter reached 0!",_tKey] call BIS_fnc_logFormat;

			_this call BIS_ScTriggers_remove;
		};
	};


	while {!BIS_FFDetected} do
	{
		waitUntil
		{
			sleep CHECK_FREQUENCY;

			//get keys of all active triggers
			_keys = [];

			{
				_keys set [count _keys, _x call BIS_ScTriggers_getKey];
			}
			forEach _triggers;

			//check add
			{
				_key = _x call BIS_ScTriggers_getKey;

				if !(_key in _keys) then
				{
					_triggers set [count _triggers,_x];
					_keys set [count _keys, _key];
				};
			}
			forEach BIS_ScTriggers_addArray;BIS_ScTriggers_addArray = [];

			//check remove
			{
				_key = _x call BIS_ScTriggers_getKey;

				_index = _keys find _key;

				if (_index > -1) then
				{
					_triggers set [_index,"---"];
					_keys set [_index,"---"];
				};
			}
			forEach BIS_ScTriggers_removeArray;BIS_ScTriggers_removeArray = [];

			//remove marked array items
			_triggers = _triggers - ["---"];
			_keys = _keys - ["---"];

			count _triggers > 0
		};

		_max = (count _triggers) - 1;

		//debug
		BIS_ScTriggers_keys = _keys;

		//scan the triggers from end to start
		for "_i" from _max to 0 step -1 do
		{
			_trigger = _triggers select _i;
			_key = _trigger call BIS_ScTriggers_getKey;

			//["[%1]",_key] call BIS_fnc_logFormat;

			_trigger call _fn_eval;

			sleep CHECK_FREQUENCY;
		};

	};
};