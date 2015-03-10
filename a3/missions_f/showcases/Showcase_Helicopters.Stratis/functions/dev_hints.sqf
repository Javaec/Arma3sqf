//advanced hints -----------------------------------------------------------------------------------
Bis_HintTime = time;
Bis_HintLog = [];

Bis_ContextHintsToAdd = [];
Bis_ContextHintsToRemove = [];

//context hint monitor
[] spawn
{
	waitUntil
	{
		sleep 0.5;

		{!isNil _x} count ["BIS_MissionStarted"] == 1
	};

	sleep 5;

	private["_params","_id","_category","_topic","_showMax","_showCond","_removeCond","_timeBetween","_lastDisplayed"];

	_timeBetween = 10;
	_lastDisplayed = "";

	while {true} do
	{
		//add context hints marked as "to be added"
		{
			if !(_x in Bis_ContextHints) then
			{
				Bis_ContextHints = Bis_ContextHints + [_x];
			};
		}
		forEach Bis_ContextHintsToAdd;

		Bis_ContextHintsToAdd = [];

		//scan through the context hint pool and show all matching
		{
			_id = _x;

			//make sure the context hints dont's show up to soon after each other or after non-context hint
			waitUntil{time > (Bis_HintTime + _timeBetween)};

			if (count Bis_HintLog > 0) then
			{
				_lastDisplayed = Bis_HintLog select ((count Bis_HintLog) - 1);
			}
			else
			{
				_lastDisplayed = "";
			};

			if (true) then
			{
				//skip hints marked as "to be removed"
				if (_id in Bis_ContextHintsToRemove) exitWith {};

				//dont show 2x same context hint in a row
				if (_lastDisplayed == _id) exitWith {};

				_params = missionNamespace getVariable [_id,["Common", "Gear"]];

				_removeCond	= [_params, 4, {false}] call BIS_fnc_param;

				//check if hint should be removed from the context hint pool
				if ([] call _removeCond) exitwith
				{
					Bis_ContextHintsToRemove = Bis_ContextHintsToRemove + [_id];
				};

				_showCond 	= [_params, 3, {true}] call BIS_fnc_param;

				//check if hint should be shown
				if ([] call _showCond) then
				{
					//["[Context Hint: Before]",_params] call Bis_debugLog;
					//["[Context Hint: Hint Gap]",time - Bis_HintTime] call Bis_debugLog;

					_params call Bis_showAdvHint;

					sleep 1;

					//["[Context Hint: After]",_params] call Bis_debugLog;
					//["[Context Hint: Hint Gap]",time - Bis_HintTime] call Bis_debugLog;
				};
			};

			sleep 0.01;
		}
		forEach Bis_ContextHints;

		//remove context hints marked as "to be removed"
		Bis_ContextHints = Bis_ContextHints - Bis_ContextHintsToRemove;
		Bis_ContextHintsToRemove = [];

		sleep 0.1;
	};
};


//["Common", "Gear", 1] spawn Bis_showAdvHint;
Bis_showAdvHint =
{
	private["_category","_topic","_showMax"];

	_category  	= [_this, 0, "Common", [""]] call BIS_fnc_param;
	_topic  	= [_this, 1, "Gear", [""]] call BIS_fnc_param;
	_showMax 	= [_this, 2, 1, [123]] call BIS_fnc_param;

	[[[_category,_topic], 15, ""],_showMax] call Bis_showAdvHintExt;
};

//[_params:array,_showOnlyOnce:bool] spawn Bis_showAdvHintExt;
//[[["Common", "Gear"], 15, ""], 3] spawn Bis_showAdvHintExt;
Bis_showAdvHintExt =
{
	private["_coreParams","_showMax","_id","_isIdle"];

	_coreParams  	= [_this, 0, [], [[]]] call BIS_fnc_param;
	_showMax 		= [_this, 1, 1, [123]] call BIS_fnc_param;

	if (_showMax < 0) then
	{
		_isIdle = true;
		_showMax = abs _showMax;
	}
	else
	{
		_isIdle = false;
	};

	//ignore the hint if its idle and another hint was previously displayed
	if (_isIdle && (time < Bis_HintTime + 30)) exitWith
	{
		//["[IDLE HINT SKIPPED]",_coreParams] call Bis_debugLog;
	};

	_id = format["%1|%2",(_coreParams select 0) select 0,(_coreParams select 0) select 1];

	if (({_x == _id} count Bis_HintLog) >= _showMax) exitWith {};

	Bis_HintLog = Bis_HintLog + [_id];

	//remove hint from the context hint pool if shown too many times

	if (({_x == _id} count Bis_HintLog) >= _showMax) then
	{
		Bis_ContextHintsToRemove = Bis_ContextHintsToRemove + [_id];
	};

	Bis_HintTime = time;		//store time of the last hint displayed

	_coreParams call BIS_fnc_advHint;
};