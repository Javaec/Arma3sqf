BIS_QuickMove_addAction =
{
	private ["_object","_distance", "_missiondata"];

	_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	//_missiondata = [_this, 1, [], [ [] ]] call BIS_fnc_param;
	_distance = 4;

	_missiondata call BIS_fnc_Log;

	//ensure there is no delay in showing the action
	player reveal _object;

	_object addAction
	[
		localize "STR_A3_OpenStrategicMap",
		{
			[] call BIS_QuickMove_exec;
		},
		[],
		10e10,
		true,
		true,
		"",
		format["((vehicle player) distance (vehicle %1) <= %2)", _object, _distance]
	];
};


BIS_QuickMove_exec =
{
	private["_parentDisplay","_mapCenter","_missionsData","_ORBAT","_markers","_images","_overcast","_isNight"];
	private["_mClass","_mPos","_mOnClick","_mName","_mDesc","_mPlayer","_mOverview","_mSize","_mDescExt"];
	private["_missions", "_simul"];

	disableserialization;

	//_tasks = [ _this, 0, [] , [ [] ] ] call BIS_fnc_param;
	/*
	_tasks = 	[
						[ "Ground vehicles", "task 01 description", "task 01 overview ", position BIS_mrkGround, BIS_mrkGround ],
						[ "Air vehicles", "task 02 description", "task 02 overview ", position BIS_mrkAir, BIS_mrkAir ],
						[ "Water vehicles", "task 03 description", "task 03 overview ", position BIS_mrkWater, BIS_mrkWater ],
						[ "Autonomous vehicles", "task 04 description", "task 04 overview ", position BIS_mrkAutonomous, BIS_mrkAutonomous ],
						[ "Weapons", "task 05 description", "task 05 overview ", position BIS_mrkWeapons, BIS_mrkWeapons ]
				];
	 */
	_missionsData = [];

	{
		_mDescExt	= _x;

		_mName		= _mDescExt select 0;
		_mDesc		= _mDescExt select 1;
		_mOverview	= _mDescExt select 2;


		_mPos		= _mDescExt select 3;
		_mPlayer	= "";

		_mSize		= 1;
		_mOnClick	= BIS_QuickMove_onTaskSelected;

		_missionsData = _missionsData +
		[[
			_mPos,
			_mOnClick,
			_mName,
			_mDesc,
			_mPlayer,
			_mOverview,
			_mSize,
			_x
		]]
	}
	forEach BIS_tasks;

	_parentDisplay 	= [] call bis_fnc_displayMission;
	_mapCenter 		= position BIS_centerMap;
	_ORBAT 			= [];
	_markers 		= [];
	_images 		= [];
	_overcast 		= overcast;
	_isNight 		= !((dayTime > 6) && (dayTime < 20));
	_scale			= 0.3;
	_simul			= true;

	[
		_parentDisplay,
		_mapCenter,
		_missionsData,
		_ORBAT,
		_markers,
		_images,
		_overcast,
		_isNight,
		_scale,
		_simul
	]
	call Bis_fnc_strategicMapOpen;
};


BIS_QuickMove_onTaskSelected =
{
	private["_params","_task"];
	
	_this call BIS_fnc_Log; 
	    	
	_params = _this select 9;

	//_task = [_params, 3, objNull, [objNull]] call BIS_fnc_param;
	_task = [_params, 4, objNull, [objNull] ] call BIS_fnc_param;
		
	["[QuickMove]: Task '%1' selected!", _task] call BIS_fnc_logFormat;
	
	if(_task != BIS_mrkExit) then 
	{
		titleCut ["", "BLACK FADED", 10e10];                                                 
		private "_t";
		_cam = "camera" camCreate (position player);
		_cam cameraEffect ["INTERNAL", "BACK"];
		_cam camPreparePos getpos player; 
		_cam camPrepareDir getdir player;
		_cam camCommitPrepared 0;
		_cam camPreload 3; 
		waitUntil {camPreloaded _cam};
		_cam cameraEffect ["TERMINATE", "BACK"];
		camDestroy _cam; 
		player setpos position _task;
		player setdir getdir _task;
		titleCut ["", "BLACK IN", 3];
	}
	else
	{1 call BIS_exitShowcase};
};