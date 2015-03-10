//["[%1]: _taskState: %2",_taskID,_taskState] call Bis_debugLogF;
//["[%1]: _this: %2",_taskID,_this] call Bis_debugLogF;

//general state change
if (typeName _this == typeName "") then
{
	_this = toUpper _this;

	if (_this in ["SUCCEEDED","FAILED","CANCELED","CREATED","ASSIGNED"]) then
	{
		[_taskID,_this] call BIS_fnc_taskSetState;
	};

	if (_this == "CURRENT") then
	{
		[_taskID] call Bis_fnc_taskSetCurrent;
	};
};

//array means update the task object / position
if (typeName _this == typeName []) then
{
	private["_action","_param1","_param2","_param3"];

	_action = [_this,0,""] call BIS_fnc_param;
	_param1 = [_this,1,objNull] call BIS_fnc_param;
	_param2 = [_this,2,objNull] call BIS_fnc_param;
	_param3 = [_this,3,objNull] call BIS_fnc_param;

	if (_action == "") exitWith {};

	switch _action do
	{
		case "UPDATE_DESTINATION":
		{
			[_taskID,_param1] call Bis_fnc_taskSetDestination;
		};
		default
		{
			["[%1]: '_action = %2' not recognized!", _taskID, _action] call Bis_debugLogF;
		};
	};
};

//--------------------------------------------------------------------------------------------------
// INITIAL TASKS
//--------------------------------------------------------------------------------------------------

case "TRANSPORT":
{
	if (_taskState == "") then
	{
		[player,_taskID,[
		localize "STR_A3_Showcase_Helicopters_TRANSPORT_desc",
		localize "STR_A3_Showcase_Helicopters_TRANSPORT_title",
		localize "STR_A3_Showcase_Helicopters_TRANSPORT_marker"
		], objNull, 1] call BIS_fnc_taskCreate;
	};
};

case "TAKE_OFF":
{
	if (_taskState == "") then
	{
		[player,[_taskID,"TRANSPORT"],[
		localize "STR_A3_Showcase_Helicopters_TAKE_OFF_desc",
		localize "STR_A3_Showcase_Helicopters_TAKE_OFF_title",
		localize "STR_A3_Showcase_Helicopters_TAKE_OFF_marker"
		], Bis_Heli, 1] call BIS_fnc_taskCreate;
	};
};

//note: get cancelled when the Mike-26 gets attacked
case "FLY_TO_KAMINO":
{
	if (_taskState == "") then
	{
		[player,[_taskID,"TRANSPORT"],[
		localize "STR_A3_Showcase_Helicopters_FLY_TO_KAMINO_desc",
		localize "STR_A3_Showcase_Helicopters_FLY_TO_KAMINO_title",
		localize "STR_A3_Showcase_Helicopters_FLY_TO_KAMINO_marker"
		], getPos Bis_KaminoBase, 0] call BIS_fnc_taskCreate;
	};
	if (_taskState in ["CREATED","ASSIGNED"]) then
	{
		["Navigation", "Waypoint", 1] spawn Bis_showAdvHint;
	};
};

//note: get cancelled when the Mike-26 gets attacked
case "UNLOAD":
{
	if (_taskState == "") then
	{
		[player,[_taskID,"TRANSPORT"],[
		localize "STR_A3_Showcase_Helicopters_UNLOAD_desc",
		localize "STR_A3_Showcase_Helicopters_UNLOAD_title",
		localize "STR_A3_Showcase_Helicopters_UNLOAD_marker"
		], Bis_HelipadKaminoBase, 0] call BIS_fnc_taskCreate;
	};
};

//--------------------------------------------------------------------------------------------------
// COMBAT @ MIKE-26
//--------------------------------------------------------------------------------------------------

case "DESTROY_ENEMY_VEHICLES":
{
	if (_taskState == "") then
	{
		[player,[_taskID,"DEFEND_BASE"],[
		localize "STR_A3_Showcase_Helicopters_DESTROY_ENEMY_VEHICLES_desc",
		localize "STR_A3_Showcase_Helicopters_DESTROY_ENEMY_VEHICLES_title",
		localize "STR_A3_Showcase_Helicopters_DESTROY_ENEMY_VEHICLES_marker"
		], [Bis_EnemyTransport1,true], 1] call BIS_fnc_taskCreate;
	};
};

case "DEFEND_BASE":
{
	if (_taskState == "") then
	{
		[player,_taskID,[
		localize "STR_A3_Showcase_Helicopters_DEFEND_BASE_desc",
		localize "STR_A3_Showcase_Helicopters_DEFEND_BASE_title",
		localize "STR_A3_Showcase_Helicopters_DEFEND_BASE_marker"
		], getPos Bis_HelipadMike26, 1] call BIS_fnc_taskCreate;
	};
};

case "DEPLOY_TROOPS":
{
	if (_taskState == "") then
	{
		[player,[_taskID,"DEFEND_BASE"],[
		localize "STR_A3_Showcase_Helicopters_DEPLOY_TROOPS_desc",
		localize "STR_A3_Showcase_Helicopters_DEPLOY_TROOPS_title",
		localize "STR_A3_Showcase_Helicopters_DEPLOY_TROOPS_marker"
		], getPos Bis_HelipadMike26, 1] call BIS_fnc_taskCreate;
	};
};

case "DESTROY_MORTARS":
{
	if (_taskState == "") then
	{
		[player,[_taskID,"DEFEND_BASE"],[
		localize "STR_A3_Showcase_Helicopters_DESTROY_MORTARS_desc",
		localize "STR_A3_Showcase_Helicopters_DESTROY_MORTARS_title",
		localize "STR_A3_Showcase_Helicopters_DESTROY_MORTARS_marker"
		], getPos Bis_Mortars, 1] call BIS_fnc_taskCreate;
	};
};

//--------------------------------------------------------------------------------------------------
// CAMP ROGAIN
//--------------------------------------------------------------------------------------------------

case "RESUPPLY":
{
	if (_taskState == "") then
	{
		[player,_taskID,[
		localize "STR_A3_Showcase_Helicopters_RESUPPLY_desc",
		localize "STR_A3_Showcase_Helicopters_RESUPPLY_title",
		localize "STR_A3_Showcase_Helicopters_RESUPPLY_marker"
		], getPos Bis_HelipadCampRogain, 1] call BIS_fnc_taskCreate;
	};
};

//optional task; given/refreshed every time helicopter runs low on ammo
case "RESUPPLY_LOW_ON_AMMO":
{
	if (_taskState == "") then
	{
		[player,_taskID,[
		localize "STR_A3_Showcase_Helicopters_RESUPPLY_LOW_ON_AMMO_desc",
		localize "STR_A3_Showcase_Helicopters_RESUPPLY_LOW_ON_AMMO_title",
		localize "STR_A3_Showcase_Helicopters_RESUPPLY_LOW_ON_AMMO_marker"
		], getPos Bis_HelipadCampRogain, 0] call BIS_fnc_taskCreate;
	};
};

//--------------------------------------------------------------------------------------------------
// COMBAT @ KAMINO BASE & FLY HOME
//--------------------------------------------------------------------------------------------------

case "DESTROY_MORTARS_KAMINO":
{
	if (_taskState == "") then
	{
		[player,_taskID,[
		localize "STR_A3_Showcase_Helicopters_DESTROY_MORTARS_KAMINO_desc",
		localize "STR_A3_Showcase_Helicopters_DESTROY_MORTARS_KAMINO_title",
		localize "STR_A3_Showcase_Helicopters_DESTROY_MORTARS_KAMINO_marker"
		], getPos Bis_KaminoMortars, 1] call BIS_fnc_taskCreate;
	};
};

case "RTB":
{
	if (_taskState == "") then
	{
		[player,_taskID,[
		localize "STR_A3_Showcase_Helicopters_RTB_desc",
		localize "STR_A3_Showcase_Helicopters_RTB_title",
		localize "STR_A3_Showcase_Helicopters_RTB_marker"
		], getPos Bis_AirBaseHelipad1, 1] call BIS_fnc_taskCreate;
	};
};