/*
	Author: Karel Moricky

	Description:
	Set a task parameters.
	Create the task when it doesn't exist.

	Parameters:
		0: STRING or ARRAY - Task ID or array in the format [task ID, parent task ID]
		1: Task owner(s)
			BOOL - true to set task of all playable units
			OBJECT - set task of a specific object
			GROUP - set tasks of all objects in the group
			SIDE - set tasks of all objects of the given side
			ARRAY - collection of above types
		2: ARRAY or STRING - Task description in the format ["description", "title", "marker"] or CfgTaskDescriptions class
		3: Task destination
			OBJECT
			ARRAY - either position in format [x,y,z], or [object,precision] as used by setSimpleTaskTarget command
		4: Task state
			STRING - can be one of following:
				"CREATED"
				"ASSIGNED"
				"AUTOASSIGNED" ("ASSIGNED" when no task is assigned yet, otherwise "CREATED")
				"SUCCEEDED"
				"FAILED"
				"CANCELED"
			BOOL - true to set the task as current
		5: NUMBER - priority. When a current task is completed, system select a next one with the larges priority >= 0
		6: BOOL - true to show notification (default), false to disable it
		7: BOOL - true to set task globally (default), false to set it only locally
		8: STRING - task type from CfgTaskTypes, if not defined, the type "" is being used

	Returns:
	STRING - Task ID
*/
private ["_params","_taskID","_taskParentID","_taskVar","_data","_taskCreate","_fnc_addTarget","_target","_targets","_desc","_dest","_destTarget","_state","_params","_children","_showNotification","_isGlobal","_args","_taskType"];

//--- Register
_params = [_this,0,"",["",[]]] call BIS_fnc_param;


//--- Get the task ID
if (typeName _params == typeName "") then {_params = [_params, ""]};
_taskID = [_params,0,"",[""]] call BIS_fnc_paramIn;
_taskParentID = [_params,1,"",[""]] call BIS_fnc_paramIn;


//--- Register task data
_taskVar = _taskID call bis_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;
_taskCreate = isnil {_data};
if (_taskCreate) then {
	_data = [
		[_taskID,_taskParentID,[]],
		[],
		_taskID,
		objnull,
		"CREATED",
		-1,
		true,
		true,
		""
	]
};


//--- Add target
_fnc_addTarget = {
	switch (typename _this) do {
		case (typename true);
		case (typename grpnull);
		case (typename sideunknown): {
			if !(_this in _targets) then {_targets set [count _targets,_this];};
		};
		case (typename objnull): {
			_thisVar = _this call bis_fnc_objectVar;
			if !(_thisVar in _targets) then {_targets set [count _targets,_thisVar];};
		};
		case (typename []): {
			{_x call _fnc_addTarget;} foreach _this;
		};
	};
};
_target = [_this,1,_data select 1,[true,sideunknown,grpnull,objnull,[]]] call BIS_fnc_param;
_targets = _data select 1;
_target call _fnc_addTarget;
_data set [1,_targets];


//--- Set description
_desc = +[_this,2,_data select 2,[[],""],3] call BIS_fnc_param;
if (typename _desc == typename "") then {

	//--- Load description from CfgTaskDescriptions
	private ["_cfgTaskDescription"];
	_cfgTaskDescription = [["CfgTaskDescriptions",_desc],configfile >> ""] call bis_fnc_loadClass;
	_desc = [
		gettext (_cfgTaskDescription >> "description"),
		gettext (_cfgTaskDescription >> "title"),
		gettext (_cfgTaskDescription >> "marker")
	]
};
for "_i" from 0 to 2 do {
	private ["_text","_string"];
	_text = [_desc,_i,[],["",[]]] call bis_fnc_paramin;
	if (typename _text != typename []) then {_text = [_text];};
	_string = [_text,0,"",[""]] call bis_fnc_paramin;
	_text set [0,_string];
	_desc set [_i,_text];
};
_data set [2,_desc];


//--- Set destination / target
_dest = [_this,3,_data select 3,[objnull,[]]] call BIS_fnc_param;
_destTarget = [_dest,0,objnull,[objnull,0]] call bis_fnc_paramin;
if (typename _destTarget == typename objnull) then {
	_dest = [
		_destTarget,
		[_dest,1,false,[false]] call bis_fnc_paramin
	]
} else {
	_dest = [
		_destTarget,
		[_dest,1,0,[0]] call bis_fnc_paramin,
		[_dest,2,0,[0]] call bis_fnc_paramin
	]
};
_data set [3,_dest];


//--- Set state
_state = [_this,4,_data select 4,["",true]] call BIS_fnc_param;
if (typename _state == typename true) then {_state = [_data select 4,"ASSIGNED"] select _state;};
_data set [4,_state];


//--- Set children state
_params = _data select 0;
_children = _params select 2;
{
	private ["_xData","_xState"];
	_xData = missionnamespace getvariable (_x call bis_fnc_taskVar);
	if !(isnil {_xData}) then {
		_xState = _xData select 4;
		if (_xState == "CREATED" || _xState == "ASSIGNED") then {
			[_x,nil,nil,nil,_state,nil,false] call bis_fnc_setTask;
		};
	};
} foreach _children;


//--- Register to parent task
if (_taskParentID != "") then {
	private ["_taskParentVar","_dataParent","_childrenParent"];
	_taskParentVar = _taskParentID call bis_fnc_taskVar;
	if (isnil {missionnamespace getvariable _taskParentVar}) then {
		[_taskParentID,_target] call bis_fnc_setTask;
	};
	_dataParent = missionnamespace getvariable _taskParentVar;
	_paramsParent = _dataParent select 0;
	_childrenParent = _paramsParent select 2;
	_childrenParent set [count _childrenParent,_taskID];
	missionnamespace setvariable [_taskParentVar,_dataParent];
};


//--- Set priority
_priority = [_this,5,_data select 5,[0]] call BIS_fnc_param;
_data set [5,_priority];


//--- Show notification
_showNotification = [_this,6,_data select 6,[true]] call BIS_fnc_param;

//--- Set task type
_taskType = [_this,8,_data select 8,[""]] call BIS_fnc_param;
_data set [8,_taskType];

//--- Save global data
missionnamespace setvariable [_taskVar,_data];

//--- Get locality and execute
_isGlobal = [_this,7,_data select 7,[true]] call BIS_fnc_param;
_args = [_taskID,_showNotification,servertime];
if (_isGlobal && ismultiplayer) then {
	publicvariable _taskVar;
	[
		_args,
		"BIS_fnc_setTaskLocal",
		true,
		_taskCreate
	] call BIS_fnc_MP;
} else {
	_args call BIS_fnc_setTaskLocal;
};
_taskID