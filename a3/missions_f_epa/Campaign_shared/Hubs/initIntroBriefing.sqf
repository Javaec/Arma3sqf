scriptName "initIntroBriefing.sqf";

/*--------------------------------------------------------------------------------------------------

	TERMINATE IF NO DEBRIEFING

--------------------------------------------------------------------------------------------------*/
private["_introBriefing"];

_introBriefing = ["Hubs",missionName,"IntroBriefing","active"] call BIS_fnc_getCfgDataBool;

if !(_introBriefing && !(missionName in BIS_PER_missionsQue)) exitWith {BIS_IntroBriefing_completed = true};


/*--------------------------------------------------------------------------------------------------

	INIT

--------------------------------------------------------------------------------------------------*/
private["_units"];

//get all units that have ambient animations defined
_units = (allMissionObjects "Man") - [BIS_inf, BIS_armory];

{
	if (count (_x getVariable ["BIS_ambientAnim",[]]) == 0) then
	{
		_units set [_forEachIndex, objNull];
	};
}
forEach _units;

_units = _units - [objNull];

BIS_IntroBriefing_units =+ _units;

//create a parent task "BIS_ReportIn"
[player,"BIS_AttendDebriefing",
[
	["Hubs",missionName,"Tasks","BIS_AttendDebriefing","desc"] call BIS_fnc_getCfgData,
	["Hubs",missionName,"Tasks","BIS_AttendDebriefing","title"] call BIS_fnc_getCfgData,
	["Hubs",missionName,"Tasks","BIS_AttendDebriefing","marker"] call BIS_fnc_getCfgData
],
[BIS_BriefingCenter,true],true,1000] call BIS_fnc_taskCreate;

/*--------------------------------------------------------------------------------------------------

	SETUP

--------------------------------------------------------------------------------------------------*/
private["_points","_point","_center"];

_center 	= BIS_BriefingCenter;
_points 	= _center nearObjects ["Sign_Arrow_Direction_Yellow_F",10];

//functions ----------------------------------------------------------------------------------------

//_snappoint = _point call BIS_IntroBriefing_getSnappoint;
BIS_IntroBriefing_getSnappoint =
{
	private["_chairs","_chair","_anim"];

	_chairs = (_this nearObjects ["Land_CampingChair_V2_F",0.65]) + (_this nearObjects ["Land_ChairWood_F",0.65]);

	if (count _chairs == 0) exitWith
	{
		_this
	};

	_chair = _chairs select 0;
	_anim = _this getVariable ["BIS_UseAnimSet",""];

	if (_anim != "") then
	{
		_chair setVariable ["BIS_UseAnimSet",_anim];
	}
	else
	{
		_chair setVariable ["BIS_UseAnimSet","SIT1"];
	};

	_chair
};

//[_unitVar,_point] call BIS_IntroBriefing_setupUnit;
BIS_IntroBriefing_setupUnit =
{
	private["_unit","_point","_animset","_group","_identity","_xIdentity","_class"];

	//["[IntroBriefing] Function 'BIS_IntroBriefing_setupUnit' called with: %1",_this] call BIS_fnc_logFormat;

	_unit  = _this select 0;		//empty string used for dummy soldiers
	_point = _this select 1;

	if (typeName _unit == typeName "") then
	{
		_unit = missionnamespace getVariable [_unitVar,objNull];
	};

	//remove unwanted items
	_unit unassignItem "NVGoggles"; removeAllItems _unit;

	//check if should snap to object instead
	_point = _point call BIS_IntroBriefing_getSnappoint;

	//reposition the unit & set direction
	_unit setPos getPos _point;
	_unit setDir getDir _point;

	//set animation
	_animset = _point getVariable ["BIS_UseAnimSet",""];

	if (_animset == "") then
	{
		if ((_point isKindOf "Land_CampingChair_V2_F") || (_point isKindOf "Land_ChairWood_F")) then
		{
			_animset = ["SIT1","SIT2","SIT3"] call BIS_fnc_selectRandom;
			_unit setUnitPos "Middle";
		}
		else
		{
			_animset = "STAND";
			_unit setUnitPos "UP";
		};
	};

	[_unit,_animset,"ASIS",_point] call BIS_fnc_ambientAnim;

	_unit
};

//force off the rain -------------------------------------------------------------------------------
[] spawn
{
	scriptName "initIntroBriefing.sqf: no rain";

	while {true} do
	{
		sleep 0.1;
		0 setRain 0;
	};
};

//update whiteboard --------------------------------------------------------------------------------
private["_board","_path"];

_board = ["Hubs",missionName,"IntroBriefing","Map","object"] call BIS_fnc_getCfgDataObject;

if !(isNull _board) then
{
	_path = ["Hubs",missionName,"IntroBriefing","Map","texture"] call BIS_fnc_getCfgData;

	if (_path != "") then
	{
		_board setObjectTexture [0, _path];
	};
};

//setup speaker ------------------------------------------------------------------------------------
private["_speaker","_animset","_point"];

_speaker = ["Hubs",missionName,"IntroBriefing","SpecialCharacters","Speaker","unitName"] call BIS_fnc_getCfgDataObject;
_point   = ["Hubs",missionName,"IntroBriefing","SpecialCharacters","Speaker","position"] call BIS_fnc_getCfgDataObject;

if (BIS_DebugMode && BIS_ShowHelpers) then
{
	_point hideObject false;
};

_animset = _speaker getVariable ["BIS_fnc_ambientAnim__animset",""];

if (_animset != "") then
{
	_speaker call BIS_fnc_ambientAnim__terminate;
};

{_speaker disableAI _x} forEach ["AUTOTARGET", "FSM", "MOVE", "TARGET", "ANIM"];

_speaker setPos getPos _point;
_speaker setDir getDir _point;

//setup special characters -----------------------------------------------------------------
private["_point","_unit"];

{
	_unit = ["Hubs",missionName,"IntroBriefing","SpecialCharacters",_x,"unitName"] call BIS_fnc_getCfgDataObject;

	if !(isNull _unit) then
	{
		if !((vehicleVarName _unit) in ["BIS_SFA","BIS_SFB","BIS_SFC","BIS_SFD","BIS_SFX"]) then
		{
			_point = ["Hubs",missionName,"IntroBriefing","SpecialCharacters",_x,"position"] call BIS_fnc_getCfgDataObject;

			["[i] Special character [%1] will be placed on [%2].",_unit,_point] call BIS_fnc_logFormat;

			_unit  = [_unit,_point] call BIS_IntroBriefing_setupUnit;

			//spot was not used, make it available for squad members
			if ((isNull _unit) && (_x != "HotSeat")) then
			{
				_points set [count _points, _point];
			}
			//unit was placed, remove it from the pool
			else
			{
				["[i] Unit [%1] was placed on [%2] and removed from 'to-be-placed' pool.",_unit,_x] call BIS_fnc_logFormat;

				_units = _units - [_unit];
			};
		}
		else
		{
			_unit hideObject true;
			_unit enableSimulation false;
			_unit setPos [50,50,0];
		};
	};
}
forEach ["Speaker","HotSeat","VIP1","VIP2","VIP3"];

//reorganize snappoints according to the distance from the briefing center
_points = [_points,[_center],{_input0 distance _x},"ASCEND"] call BIS_fnc_sortBy;

private["_p1","_p2"];

{
	if !((vehicleVarName _x) in ["BIS_SFA","BIS_SFB","BIS_SFC","BIS_SFD","BIS_SFX"]) then
	{
		if !(count _points > 0) exitwith
		{
			["[IntroBriefing] Not enough snappoints for squad members!"] call BIS_fnc_error;
		};

		//roll 2x, select closer
		_p1 = floor random(count _points);
		_p2 = floor random(count _points);
		if (_p2 < _p1) then {_p1 = _p2};

		_point = _points select _p1;
		_points = _points - [_point];

		[_x,_point] call BIS_IntroBriefing_setupUnit;
	}
	else
	{
		_x hideObject true;
		_x enableSimulation false;
		_x setPos [50,50,0];
	};
}
forEach _units;