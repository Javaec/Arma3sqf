scriptName "initFullStart3.sqf";

//setup triggers and tasks for all available missions

//create a parent task "BIS_ReportIn"
[player,"BIS_ReportIn",
[
	["Hubs",missionName,"Tasks","BIS_ReportIn","desc"] call BIS_fnc_getCfgData,
	["Hubs",missionName,"Tasks","BIS_ReportIn","title"] call BIS_fnc_getCfgData,
	["Hubs",missionName,"Tasks","BIS_ReportIn","marker"] call BIS_fnc_getCfgData
],
objNull,0,nil,true] call BIS_fnc_taskCreate;

private["_missions","_npc","_npcName","_taskName","_taskDesc","_taskMarker","_mName","_mDescExt","_default","_mission"];

_missions = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions;
_missions = _missions call BIS_fnc_camp_sortMissions;
_default  = _missions select 0;

{
	_mission = _x;
	_npc 	 = ["Missions",_mission,"FullStart","trigger"] call BIS_fnc_getCfgDataObject;
	_npcName = format["%1 %2",[_npc,"displayNameShort"] call BIS_fnc_rankParams,name _npc];

	//add the navigation task
	_taskName	= ["Missions",_mission,"FullStart","Tasks","name"] call BIS_fnc_getCfgData;
	_taskMarker	= ["Missions",_mission,"FullStart","Tasks","marker"] call BIS_fnc_getCfgData;
	_mDescExt	= [_mission] call BIS_fnc_camp_getMissionDescData;
	_taskDesc	= _mDescExt select 2;
	_mName		= _mDescExt select 4;

	//autofill mission name for %1; player name, Miller, etc. can be added as well, if needed ...
	if (_taskName == "auto") then
	{
		_taskName = format["%1",_mName];
	}
	else
	{
		_taskName = format[_taskName,_mName,_npcName];
	};

	_taskDesc = format[_taskDesc,_mName];

	if (_taskMarker == "auto") then
	{
		_taskMarker = ["Hubs",missionName,"Tasks","BIS_ReportIn","marker"] call BIS_fnc_getCfgData;
	}
	else
	{
		_taskMarker = format[_taskMarker,_mName,_npcName];
	};

	//create task
	[player,[_mission,"BIS_ReportIn"],[_taskDesc,_taskName,_taskMarker],[_npc,true],0,nil,false] call BIS_fnc_taskCreate;

	//add the interaction with player
	if ("AiInteraction" in BIS_HubComponents) then
	{
		//["[FullStart] Mission '%2' giver '%1' initialized!",_npc,_mission] call BIS_fnc_logFormat;

		_npc call BIS_AiInteraction_initWaving;
		[_npc,_mission] call BIS_AiInteraction_initMissionIntro;
	};

	//re-pos mission giver
	private["_pos","_dir"];

	_pos = _npc getVariable ["BIS_pos", []];
	_dir = _npc getVariable ["BIS_dir", 0];

	//check 4 mission giver's weapon
	if (primaryWeapon _npc == "") then
	{
		_weapon = _npc getVariable ["BIS_fnc_ambientAnim__weapon","arifle_mx_f"];

		if (_weapon != "") then
		{
			_npc addWeapon _weapon;
			_npc selectWeapon _weapon;
		};
	};

	if (count _pos == 3) then
	{
		_npc setPosASL _pos;
		_npc setDir _dir;
		(group _npc) setFormDir _dir;
	}
	else
	{
		["[FullStart] Mission '%2' giver '%1' position cannot be verified!",_npc,_mission] call BIS_fnc_logFormat;
	};
}
forEach _missions;

//show the pre-selected mission task
_default spawn
{
	if (_this == "") exitWith
	{
		["[FullStart] There is no valid next mission to be pre-selected!"] call BIS_fnc_error;
	};

	waitUntil{BIS_fnc_blackIn_completed};

	[_this] call BIS_fnc_taskSetCurrent;
};

//create proximity trigger for mission briefing
[] spawn
{
	scriptName "initFullStart.sqf: proximity trigger";

	private["_fnc_log_disable"]; _fnc_log_disable = true;

	private["_current","_destination","_triggerPoint","_missions"];

	_missions     = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions;
	_triggerPoint = BIS_BriefingCenter;

	while {BIS_selectedMission == ""} do
	{
		if (true) then
		{
			//wait for player to have task guiding to the briefing area
			waitUntil
			{
				sleep 1;

				//mission already selected
				if (BIS_selectedMission != "") exitWith
				{
					//["[0] Mission already selected."] call BIS_fnc_logFormat;
				};

				_current = player call BIS_fnc_taskCurrent;

				//non-mission task selected!
				if !(_current in _missions) exitWith
				{
					//["[0] Non-mission task selected!"] call BIS_fnc_logFormat;
				};

				_destination = (_current call BIS_fnc_taskDestination) select 0;

				(_destination == _triggerPoint)
			};

			//non-mission task selected!
			if !(_current in _missions) exitWith
			{
				//["[1] Non-mission task selected!"] call BIS_fnc_logFormat;
			};

			waitUntil
			{
				sleep 0.1;

				//mission already selected
				if (BIS_selectedMission != "") exitWith
				{
					//["[1] Mission already selected."] call BIS_fnc_logFormat;
				};

				_current = player call BIS_fnc_taskCurrent;

				//non-mission task selected!
				if !(_current in _missions) exitWith
				{
					//["[2] Non-mission task selected!"] call BIS_fnc_logFormat;
				};

				_destination = (_current call BIS_fnc_taskDestination) select 0;

				//current task is not pointing to briefing area
				if (_destination != _triggerPoint) exitWith
				{
					//["[0] Current task is not pointing to briefing area!"] call BIS_fnc_logFormat;
				};

				(player distance _triggerPoint < 5)
			};

			//mission already selected
			if (BIS_selectedMission != "") exitWith
			{
				//["[2] Mission already selected."] call BIS_fnc_logFormat;
			};

			//non-mission task selected!
			if !(_current in _missions) exitWith
			{
				//["[3] Non-mission task selected!"] call BIS_fnc_logFormat;
			};

			//current task is not pointing to briefing area
			if (_destination != _triggerPoint) exitWith
			{
				//["[1] Current task is not pointing to briefing area!"] call BIS_fnc_logFormat;
			};

			if (player distance _triggerPoint < 5) then
			{
				//["[FullStart] Proximity trigger executed briefing for: '%1'!",_current] call BIS_fnc_logFormat;

				_current spawn BIS_FullStart_exec;
			};
		};
	};

	["[FullStart] Proximity trigger cancelled!"] call BIS_fnc_logFormat;
};