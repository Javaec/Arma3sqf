/*
	Author: Jiri Wainar

	Description:
	Initialize given POI; all POI functionality is handled there.

	Example:
	["POI_Checkpoint_01"] call BIS_fnc_camp_poiInit;
*/

#define VAR_ENEMIES		(format["BIS_%1_enemies",_poi])
#define GET_ENEMIES		(missionNamespace getVariable [VAR_ENEMIES,[]])
#define GET_ITEMS		(items player)

/*--------------------------------------------------------------------------------------------------

	LOCAL FUNCTIONS

--------------------------------------------------------------------------------------------------*/
private["_fn_proximityTrigger","_fn_completionTrigger","_fn_saveTrigger"];

_fn_saveTrigger =
{
	private["_poi","_proximity","_center"];

	_poi	   = _this;
	_proximity = ["POIs",_poi,"detection"] call BIS_fnc_getCfgData;
	_center    = ["POIs",_poi,"center"] call BIS_fnc_getCfgData;

	if (_center == "auto") then
	{
		_center = format["BIS_%1_%2",_poi,"center"];
	};

	_center	 = missionNamespace getVariable [_center,objNull];

	if (_proximity < 450) then
	{
		_proximity = 450;
	};

	waitUntil
	{
		sleep 4;

		(player distance _center) < _proximity
	};

	sleep 4;

	if (canStand player) then
	{
		[player] call BIS_fnc_saveGame;
	};
};

_fn_proximityTrigger =
{
	private["_poi","_proximity","_center"];

	_poi	   = _this;
	_proximity = ["POIs",_poi,"detection"] call BIS_fnc_getCfgData;
	_center    = ["POIs",_poi,"center"] call BIS_fnc_getCfgData;

	if (_center == "auto") then
	{
		_center = format["BIS_%1_%2",_poi,"center"];
	};

	_center	 = missionNamespace getVariable [_center,objNull];

	waitUntil
	{
		sleep 1;

		(player distance _center) < _proximity
	};

	//reveal the POI, add task, show task notification
	[_poi,true,true] call BIS_fnc_camp_poiReveal;
};

_fn_completionTrigger =
{
	private["_poi","_type","_center","_cond","_items","_enemies","_conv","_stage"];

	_poi  	= _this;
	_type 	= ["POIs",_poi,"type"] call BIS_fnc_getCfgData;
	_center	= ["POIs",_poi,"center"] call BIS_fnc_getCfgData;
	_cond	= ["POIs",_poi,"doneCond"] call BIS_fnc_getCfgData;
	_conv	= ["POIs",_poi,"doneConv"] call BIS_fnc_getCfgData;

	_cond	= compile _cond;

	if (typeName _conv == typeName []) then
	{
		_stage 	= _conv select 1;
		_conv	= _conv select 0;
	}
	else
	{
		_stage 	= ["stage"] call BIS_fnc_getCfgData;
	};

	if (_center == "auto") then
	{
		_center = format["BIS_%1_%2",_poi,"center"];
	};

	_center = missionNamespace getVariable [_center,objNull];

	waitUntil
	{
		sleep (2 + (random 1));

		_items 	 = GET_ITEMS;
		_enemies = GET_ENEMIES;

		([] call _cond)
	};

	[_poi] call BIS_fnc_camp_poiComplete;

	sleep 2;

	if (_conv != "") then
	{
		_kb = [_conv,format["%1_hub",_stage]] call bis_fnc_kbTell;

		sleep 5;
	};

	if (canStand player) then
	{
		[player] call BIS_fnc_saveGame;
	};
};

/*--------------------------------------------------------------------------------------------------

	MAIN

--------------------------------------------------------------------------------------------------*/

private["_poi","_linked","_status","_center","_size","_enemies"];

_poi 	   = [_this, 0, missionName, [""]] call BIS_fnc_param;
_linked    = [missionName] call BIS_fnc_camp_poiGetLinked;

//exit if POI is wrong
if !(_poi in _linked) exitWith {};

_status    = [_poi] call BIS_fnc_camp_poiGetStatus;

//gather some useful data for triggers
_center	 = ["POIs",_poi,"center"] call BIS_fnc_getCfgData;
_size 	 = ["POIs",_poi,"size"] call BIS_fnc_getCfgData;

if (_center == "auto") then
{
	_center = format["BIS_%1_%2",_poi,"center"];
};

_center	 = missionNamespace getVariable [_center,objNull];
_enemies = (nearestObjects [_center, ["man"], _size]) - [player];

//exit if POI is already completed
if (_status == 1) exitWith
{
	["POI [%1] is not initialized, as it is already completed!",_poi] call BIS_fnc_logFormat;

	//draw the marker
	[_poi] call BIS_fnc_camp_poiDrawMarker;
};

missionNamespace setVariable [VAR_ENEMIES,_enemies];

//save trigger
_poi spawn _fn_saveTrigger;

//unknow POI
if (_status == -1) then
{
	//setup the proximity trigger
	_poi spawn _fn_proximityTrigger;
}
//known POI
else
{
	//draw the marker
	[_poi] call BIS_fnc_camp_poiDrawMarker;

	//create task
	[_poi] call BIS_fnc_camp_poiAddTask;
};

//setup the completion condition trigger
_poi spawn _fn_completionTrigger;