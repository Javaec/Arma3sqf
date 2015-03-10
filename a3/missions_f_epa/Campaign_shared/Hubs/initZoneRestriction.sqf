/*
	private["_fail1","_fail2","_mission1","_mission2","_skirmish1","_skirmish2","_briefing1","_briefing2","_mode"];

	_fail1 		= ["Hubs",missionName,"ZoneRestriction","Notifications","fail1"] call BIS_fnc_getCfgData;
	_fail2 		= ["Hubs",missionName,"ZoneRestriction","Notifications","fail2"] call BIS_fnc_getCfgData;
	_mission1	= ["Hubs",missionName,"ZoneRestriction","Notifications","mission1"] call BIS_fnc_getCfgData;
	_mission2	= ["Hubs",missionName,"ZoneRestriction","Notifications","mission2"] call BIS_fnc_getCfgData;
	_skirmish1 	= ["Hubs",missionName,"ZoneRestriction","Notifications","skirmish1"] call BIS_fnc_getCfgData;
	_skirmish2 	= ["Hubs",missionName,"ZoneRestriction","Notifications","skirmish2"] call BIS_fnc_getCfgData;
	_briefing1 	= ["Hubs",missionName,"ZoneRestriction","Notifications","briefing1"] call BIS_fnc_getCfgData;
	_briefing2 	= ["Hubs",missionName,"ZoneRestriction","Notifications","briefing2"] call BIS_fnc_getCfgData;
*/


scriptName "initZoneRestriction.sqf";

if !(BIS_useZoneRestriction) exitWith {};

//create proximity trigger for mission briefing
[] spawn
{
	scriptName "initZoneRestriction.sqf: restriction trigger";

	private["_center","_radius1","_radius2","_distance","_terminate","_mode"];

	_center 	= ["Hubs",missionName,"ZoneRestriction","center"] call BIS_fnc_getCfgData;
	_radius1 	= ["Hubs",missionName,"ZoneRestriction","radius1"] call BIS_fnc_getCfgData;
	_radius2 	= ["Hubs",missionName,"ZoneRestriction","radius2"] call BIS_fnc_getCfgData;

	_terminate	= false;

	//use hub center if zone restriction center is not defined
	if (count _center == 0) then
	{
		_center = ["Hubs",missionName,"center"] call BIS_fnc_getCfgData;
	};

	waitUntil
	{
		sleep 0.1;

		_distance = player distance _center;

		if (true) then
		{
			//player is inside the action area
			if (_distance < _radius1) exitWith
			{
				//["[!] Checking delayed for next %1 secs",(_radius1-_distance)/5] call BIS_fnc_logFormat;

				sleep ((_radius1-_distance)/5);
			};

			//get current mode
			_mode = [] call BIS_ZR_getMode;

			//handle exec tigger
			if (_distance > _radius2) then
			{
				[_mode] call BIS_ZR_execTrigger2;

				if (_mode in ["mission","fail"]) then
				{
					_terminate = true;
				}
				else
				{
					waitUntil
					{
						sleep 0.1;

						_distance = player distance _center;

						!(_distance > _radius2)
					};
				};
			}
			//handle warning
			else
			{
				[_mode] call BIS_ZR_execTrigger1;

				//wait for player to leave it
				waitUntil
				{
					sleep 0.1;

					_distance = player distance _center;

					(_distance < _radius1) || (_distance > _radius2)
				};
			};
		};

		_terminate;
	};
};


BIS_ZR_getMode =
{
	private["_mode"];

	_mode = switch (true) do
	{
		case (!BIS_IntroBriefing_completed):
		{
			"introbriefing";
		};
		case (BIS_selectedMission != ""):
		{
			"mission";
		};
		default
		{
			"auto"
		};
	};

	if (_mode == "auto") then
	{
		if (isNil "BIS_fnc_camp_loadMissionIntel_dateBriefing") exitWith {};
		if (count BIS_fnc_camp_loadMissionIntel_dateBriefing == 0) exitWith {};

		private["_briefingTime","_toBriefing","_mins"];

		_briefingTime =+ BIS_fnc_camp_loadMissionIntel_dateBriefing;
		_toBriefing   = [date,_briefingTime] call BIS_fnc_vectorDiff;
		_mins = (_toBriefing select 4) + 60*(_toBriefing select 3) + 24*60*(_toBriefing select 2) + 30*24*60*(_toBriefing select 1);

		if (_mins > 0 && _mins < 30) exitWith
		{
			_mode = "briefing";
		};
	};

	if (_mode == "auto") then
	{
		if (BIS_Skirmish_disabled) exitWith {};

		private["_missions"];

		_missions = [["isSkirmish"]] call BIS_fnc_camp_getLinkedMissions;

		if (count _missions != 1) exitWith {};

		_mode = "skirmish";
	};

	if (_mode == "auto") then
	{
		_mode = "fail";
	};

	_mode
};

//warning trigger
BIS_ZR_execTrigger1 =
{
	private["_fail1","_mission1","_skirmish1","_briefing1","_mode"];

	_fail1 		= ["Hubs",missionName,"ZoneRestriction","Notifications","fail1"] call BIS_fnc_getCfgData;
	_mission1	= ["Hubs",missionName,"ZoneRestriction","Notifications","mission1"] call BIS_fnc_getCfgData;
	_skirmish1 	= ["Hubs",missionName,"ZoneRestriction","Notifications","skirmish1"] call BIS_fnc_getCfgData;
	_briefing1 	= ["Hubs",missionName,"ZoneRestriction","Notifications","briefing1"] call BIS_fnc_getCfgData;
	_mode 		= _this select 0;

	if (_mode == "skirmish" && BIS_skirmishMission == "") then
	{
		["[x] There is no valid skirmish mission linked to the hub!"] call BIS_fnc_logFormat;

		_mode = "fail";
	};

	switch (_mode) do
	{
		case "fail":
		{
			if (_fail1 != "") then
			{
				[_fail1] call BIS_fnc_showNotification;
			};
		};
		case "mission":
		{
			if (_mission1 != "") then
			{
				[_mission1] call BIS_fnc_showNotification;
			};
		};
		case "skirmish":
		{
			if (_skirmish1 != "") then
			{
				[_skirmish1] call BIS_fnc_showNotification;
			};
		};
		case "briefing";
		case "introbriefing":
		{
			if (_briefing1 != "") then
			{
				[_briefing1] call BIS_fnc_showNotification;
			};
		};
		default
		{
			["[x] Cannot detect zone restriction mode."] call BIS_fnc_logFormat;
		};
	};
};

//action trigger
BIS_ZR_execTrigger2 =
{
	private["_fail2","_mission2","_skirmish2","_briefing2","_mode"];

	_fail2 		= ["Hubs",missionName,"ZoneRestriction","Notifications","fail2"] call BIS_fnc_getCfgData;
	_mission2	= ["Hubs",missionName,"ZoneRestriction","Notifications","mission2"] call BIS_fnc_getCfgData;
	_skirmish2 	= ["Hubs",missionName,"ZoneRestriction","Notifications","skirmish2"] call BIS_fnc_getCfgData;
	_briefing2 	= ["Hubs",missionName,"ZoneRestriction","Notifications","briefing2"] call BIS_fnc_getCfgData;
	_mode 		= _this select 0;

	if (_mode == "skirmish" && BIS_skirmishMission == "") then
	{
		["[x] There is no valid skirmish mission linked to the hub!"] call BIS_fnc_logFormat;

		_mode = "fail";
	};

	if (_mode in ["fail","mission"]) then
	{
		BIS_ZR_gameOver = true;			//stop dynamic hub navigation
	};

	switch (_mode) do
	{
		case "fail":
		{
			if (_fail2 != "") then
			{
				[_fail2] call BIS_fnc_showNotification;
			};

			sleep 2;

			["loser", false] call BIS_fnc_endMission;
		};
		case "mission":
		{
			private["_mission","_missionName","_requiredGear"];

			_mission 	= BIS_selectedMission;
			_requiredGear 	= [_mission,"bis_inf"] call BIS_fnc_camp_getRequiredGear;
			_missionName 	= [[_mission] call BIS_fnc_camp_getMissionDesc,"name"] call BIS_fnc_getCfgData;

			if ("BIS_Assemble" call BIS_fnc_taskExists) then
			{
				["BIS_Assemble","FAILED",false] call BIS_fnc_taskSetState;
			};

			//blackout
			["bis_outofbase",true] call BIS_fnc_blackOut; waitUntil {BIS_fnc_blackOut_completed};

			//setup gear on player, if his gear is not ready for the mission
			if (count _requiredGear > 0) then
			{
				[_mission,"bis_inf"] call BIS_fnc_camp_setupCharacter;
			};

			if (_mission2 != "") then
			{
				[_mission2,[toUpper _missionName]] call BIS_fnc_showNotification;
			};

			sleep 5;

			[_mission,true,0] call BIS_fnc_endMission;
		};
		case "briefing":
		{
			private["_missions","_mission"];

			_missions = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions;
			_missions = _missions call BIS_fnc_camp_sortMissions;
			_mission  = _missions select 0;

			BIS_selectedMission = _mission;

			if (_briefing2 != "") then
			{
				[_briefing2] call BIS_fnc_showNotification;
			};

			[_mission,3] spawn BIS_HubBriefing_exec;
		};
		case "introbriefing":
		{
			if (_briefing2 != "") then
			{
				[_briefing2] call BIS_fnc_showNotification;
			};

			if (isNil "BIS_fnc_blackOut_ids") then
			{
				BIS_fnc_blackOut_ids = [];
			};

			if !("bis_introbriefing" in BIS_fnc_blackOut_ids) then
			{
				["bis_introbriefing",true] call BIS_fnc_blackOut;
			};

			waitUntil {BIS_fnc_blackOut_completed};

			player setPos (getPos BIS_BriefingCenter);
		};
		case "skirmish":
		{
			[BIS_skirmishMission,vehicle player] call BIS_Skirmish_exec;
		};
	};
};