/*
	Author: Karel Moricky

	Description:
	Local task management executed by BIS_fnc_setTask
	Not to be called independently!
*/

//--- Apply
if (isdedicated) exitwith {false};

private ["_taskID","_taskVar","_showNotification","_servertime","_showNotification","_data","_params","_targets","_desc","_dest","_state","_priority","_units","_taskType","_taskTypeTexture"];
_taskID = [_this,0,"",[""]] call BIS_fnc_param;
_taskVar = _taskID call bis_fnc_taskVar;

_showNotification = [_this,1,true,[true]] call BIS_fnc_param;
_servertime = [_this,2,0,[0]] call BIS_fnc_param;
_showNotification = _showNotification && (servertime - _servertime < 1); //--- Don't show a notification to JIPped players

_data = +(missionnamespace getvariable [_taskVar,[["",""],[],[[""],[""],[""]],[objnull,false],"CREATED",-1]]);
_params = _data select 0;
_targets = _data select 1;
_desc = _data select 2;
_dest = _data select 3;
_state = toupper (_data select 4);
_priority = _data select 5;
_taskType = _data select 8;

_notificationSuffix = "";
if !(isNil "BIS_taskNotificationSuffix") then {_notificationSuffix = BIS_taskNotificationSuffix}; //--- For custom notifications

_units = [];
{
	private ["_target"];
	_target = _x;
	switch (typename _target) do {
		case (typename ""): {
			private ["_unit","_curatorUnit"];
			_unit = missionnamespace getvariable [_target,objnull];
			_curatorUnit = getassignedcuratorunit _unit;
			if !(isnull _curatorUnit) then {_unit = _curatorUnit;};
			_units set [count _units,_unit];
		};
		case (typename grpnull): {
			_units = _units + units _target;
		};
		case (typename sideunknown): {
			{
				if ((_x call bis_fnc_objectSide) == _target) then {_units set [count _units,_x];};
			} foreach (allunits + alldead);
		};
		case (typename []): {
			_units = _units + _target;
		};
		case (typename true): {
			if (_target) then {
				_units = _units + ([] call bis_fnc_listplayers);
			};
		};
	};
} foreach _targets;

//reset the marker label if the task type is being used
if (_taskType != "") then
{
	_desc set [2,[""]];
};

//--- Localize and format description
{
	private ["_xText"];
	_xText = _x select 0;
	if (islocalized _xText) then {_x set [0,localize _xText];};
	if (count _x > 1) then {
		_desc set [_foreachindex,format _x];
	} else {
		_desc set [_foreachindex,_x select 0];
	};
} foreach _desc;

//--- Select destination calculation
private ["_fnc_setDest"];
_fnc_setDest = if (count _dest == 2) then {
	if (isnull (_dest select 0)) then {{cancelsimpletaskdestination _task;}} else {{_task setsimpletasktarget _dest;}};
} else {
	{_task setsimpletaskdestination _dest;}
};

//--- Select state calculation
private ["_fnc_setState"];
_fnc_setState = switch _state do {
	case "ASSIGNED": {
		{_x setcurrenttask _task;}
	};
	case "AUTOASSIGNED": {
		{if !((taskstate currenttask _x) in ["Created","Assigned"]) then {_stateNew = "ASSIGNED"; _x setcurrenttask _task;} else {_stateNew = "CREATED"; _task settaskstate _stateNew;};}
	};
	default {
		{_task settaskstate _stateNew;}
	};
};

//get task type texture
_taskTypeTexture = getText(configFile >> "CfgTaskTypes" >> _taskType >> "icon");

private ["_unitsUsed"];
_unitsUsed = [];
{
	if (!(_x in _unitsUsed) && !isnull _x) then {
		private ["_task","_stateNew"];
		_task = _x getvariable _taskVar;
		_stateNew = _state;

		//--- Create the task
		_stateOld = if (isnil {_task}) then {
			private ["_taskParentVar","_taskParent","_xTasks"];
			_taskParentVar = (_params select 1) call bis_fnc_taskVar;
			_taskParent = _x getvariable [_taskParentVar,tasknull];
			_task = _x createSimpleTask [_taskID,_taskParent];
			_x setvariable [_taskVar,_task];

			//--- Register to the unit's task list
			_xTasks = _x getvariable ["BIS_fnc_setTaskLocal_tasks",[]];
			_xTasks set [count _xTasks,_taskID];
			_x setvariable ["BIS_fnc_setTaskLocal_tasks",_xTasks];
			""
		} else {
			taskstate _task
		};

		//--- Set task params
		_task setsimpletaskdescription _desc;
		call _fnc_setDest;
		call _fnc_setState;

		//--- Show notification
		if (_x == player && _showNotification) then {
			if (_stateNew == "CREATED" && _stateOld != "") exitwith {}; //--- Don't announce "Task created" when the task already exists
			if (_stateNew != _stateOld) then {
				["task" + _stateNew + _notificationSuffix,_desc] call bis_fnc_shownotification;
			};
		};

		//create custom data for new task type markers and tooltips
		if (_taskTypeTexture != "") then
		{
			_customData = _x getVariable ["bis_fnc_setTaskLocal_customData",[]];
			_customDataId = _customData find _task;
			if (_customDataId < 0) then
			{
				_customDataId = count _customData;
				_customData pushBack _task;
				_customData pushBack [];
			};
			_customDataParams = _customData select (_customDataId + 1);
			_customDataParams set [0,_taskTypeTexture];

			//get the task id and store it in the custom data
			private["_taskStr","_taskNum"];
			_taskStr = str _task;
			_taskNum = parseNumber(_taskStr select [(_taskStr find "(") + 4,100]);
			_customDataParams set [1,_taskNum];

			_x setVariable ["bis_fnc_setTaskLocal_customData",_customData];
		};

		//--- Select the new current task
		if (_stateOld == "ASSIGNED" && toupper _stateNew in ["SUCCEEDED","FAILED","CANCELED"]) then {
			private ["_maxPrio","_nextTask"];
			_maxPrio = -1;
			_nextTask = "";
			{
				private ["_xVar","_xData","_xState"];
				_xVar = _x call bis_fnc_taskVar;
				_xData = +(missionnamespace getvariable [_xVar,[["",""],[],["","",""],objnull,"CREATED",-1]]);
				_xState = _xData select 4;
				if !((toupper _xState) in ["SUCCEEDED","FAILED","CANCELED"]) then {
					private ["_xPrio"];
					_xPrio = _xData select 5;
					if (_xPrio > _maxPrio) then {
						_nextTask = _x;
						_maxPrio = _xPrio;
					};
				};
			} foreach (_x getvariable ["BIS_fnc_setTaskLocal_tasks",[]]);
			if (_nextTask != "") then {
				[_nextTask,nil,nil,nil,true,nil,false] call bis_fnc_setTask;
			};
		};

		//--- Mark as used to prevent double call
		_unitsUsed set [count _unitsUsed,_x];
	};
} foreach _units;
true