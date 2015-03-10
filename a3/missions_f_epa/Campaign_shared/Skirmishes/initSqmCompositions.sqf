//--------------------------------------------------------------------------------------------------
//
// 	FUNCTIONS
//
//--------------------------------------------------------------------------------------------------
BIS_SqmCompositions_executeTrigger =
{
	//["[i] SQM composition trigger executed: %1",_this] call BIS_fnc_logFormat;

	private["_explored","_exploredVar"];

	_exploredVar 	= format["BIS_PER_EXPLORED_%1",missionName];
	_explored 	= missionNamespace getVariable [_exploredVar,[]];
	_explored 	= _explored + [getPosASL _this];

	missionNamespace setVariable [_exploredVar,_explored];
};


BIS_SqmCompositions_init =
{
	//["[i] SQM composition initialized: %1",_this] call BIS_fnc_logFormat;

	//gather objects
	private["_objects"];

	_objects = _this call BIS_SqmCompositions_getObjects;

	_this setVariable ["BIS_SqmCompositionObjects",_objects];

	//delete already visited compositions
	if ({_x distance (getPosASL _this) < 10} count _explored > 0) exitWith
	{
		_this call BIS_SqmCompositions_delete;
	};

	//check probability
	private["_probability"];

	_probability = (triggerArea _this) select 2;

	if (random 100 > _probability) exitWith
	{
		_this call BIS_SqmCompositions_delete;
	};
};

BIS_SqmCompositions_delete =
{
	//["[i] SQM composition deleted: %1",_this] call BIS_fnc_logFormat;

	private["_objects"];

	_objects = _this getVariable ["BIS_SqmCompositionObjects",[]];

	{
		//["[ ] deleted object: %1 | class: %2",_x, typeOf _x] call BIS_fnc_logFormat;

		deleteVehicle _x;
	}
	forEach _objects;

	deleteVehicle _this;
};

BIS_SqmCompositions_getObjects =
{
	private["_radius","_objects","_pos"];

	_radius  = (triggerArea _this) select 0;
	_pos	 = getPosASL _this;
	_objects = [];

	{
		if (_pos distance (getPosASL _x) < _radius) then
		{
			_objects set [count _objects, _x];
		};
	}
	forEach (allMissionObjects "All");

	_objects
};

//--------------------------------------------------------------------------------------------------
//
// 	SCAN FOR AND SETUP ALL RELEVANT TRIGGERS
//
//--------------------------------------------------------------------------------------------------
private["_triggers","_activCode","_explored","_exploredVar"];

_triggers 	= allMissionObjects "EmptyDetector";

_exploredVar 	= format["BIS_PER_EXPLORED_%1",missionName];
_explored 	= missionNamespace getVariable [_exploredVar,[]];

missionNamespace setVariable [_exploredVar,_explored];

{
	_activCode = (triggerStatements _x) select 1;

	if (_activCode != "thisTrigger call BIS_SqmCompositions_executeTrigger;") then
	{
		_triggers set [_forEachIndex, objNull];
	}
	else
	{
		_x call BIS_SqmCompositions_init;
	};
}
forEach _triggers; _triggers = _triggers - [objNull];