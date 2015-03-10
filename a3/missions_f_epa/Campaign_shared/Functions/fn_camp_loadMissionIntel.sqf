/*
	Author: Jiri Wainar

	Description:
	Function handles the timeline shifts and sets time & weather according to the previously saved persistent data or timeline phase settings.

	Behaviour when entering HUB:
	* from Skirmish: load persistant data
	* from Mission: load persistant data (travel offset is applied when campaign mission ends)

	Behaviour when entering mission:
	* from HUB: load cfg data for 'mission start'

	Behaviour when entering Skirmish:
	* from HUB: load persistant data

	Stored data are:
		0: date: array
		1: weather: array

	Parameter(s):
	- none -

	Returns (optional):
	Restored intel data.

	Example:
	_intel = [] call BIS_fnc_camp_loadMissionIntel;
*/

private ["_missionMeta", "_isHub", "_isSkirmish"];

_missionMeta	= [] call BIS_fnc_camp_getMissionMeta;
_isHub		= _missionMeta select 1;
_isSkirmish	= _missionMeta select 2;

private["_intel","_date","_weather","_showIntel"];

_showIntel = 1;

//hub or skirmish started -> load persistent data
if (_isHub || _isSkirmish) then
{
	//stored data found
	if !(["bis_per_intel"] call BIS_fnc_camp_hasImplicitValue) then
	{
		_intel = BIS_PER_intel;

		_date 	  = [_intel, 0, [2035,6,24,9,0], [[]]] call BIS_fnc_param;
		_weather  = [_intel, 1, [0.25,0], [[]]] call BIS_fnc_param;

		["[!] Mission intel loaded: %1!",[_date,_weather]] call BIS_fnc_logFormat;
	}
	else
	{
		["[!] Persistant data 'BIS_PER_intel' not found!"] call BIS_fnc_logFormat;

		private ["_timelineMeta"];

		_timelineMeta = [BIS_PER_phase] call BIS_fnc_camp_getTimelineMeta;
		_date 	      = [_timelineMeta, 0, [2035,6,24,9,0], [[]]] call BIS_fnc_param;
		_weather      = [_timelineMeta, 2, [0.25,0], [[]]] call BIS_fnc_param;
		_showIntel    = [_timelineMeta, 4, 1, [123]] call BIS_fnc_param;

		_date 	  = [_date,[0,0,0,-2,0]] call BIS_fnc_vectorAdd;

		["[!] Mission date hotfixed to next operation date -2 hrs: %1",[_date,_weather]] call BIS_fnc_logFormat;
	};
}
//campaign mission started -> read data from config
else
{
	private ["_timelineMeta"];

	_timelineMeta = [BIS_PER_phase] call BIS_fnc_camp_getTimelineMeta;
	_date 	      = [_timelineMeta, 0, [2035,6,24,9,0], [[]]] call BIS_fnc_param;
	_weather      = [_timelineMeta, 2, [0.25,0], [[]]] call BIS_fnc_param;
	_showIntel    = [_timelineMeta, 4, 1, [123]] call BIS_fnc_param;

	["[!] Mission intel read from timeline config: %1!",[_date,_weather]] call BIS_fnc_logFormat;
};

//safecheck _date to make sure no values are out of boundries
_date = _date call BIS_fnc_fixDate;

//set the mission intel
[_date,_weather,_showIntel] call BIS_fnc_camp_setTimeWeather;

/*--------------------------------------------------------------------------------------------------

	SETUP TIMERS

--------------------------------------------------------------------------------------------------*/

if !(_isHub || _isSkirmish) exitWith {};	//watch time only on skirmishes and/or hubs

BIS_fnc_camp_loadMissionIntel_timerHandle = [_isHub,_isSkirmish] spawn
{
	waitUntil{!(isNil "BIS_fnc_blackIn_completed")};
	waitUntil{BIS_fnc_blackIn_completed};

	private ["_isHub", "_isSkirmish"];

	_isHub		= _this select 0;
	_isSkirmish	= _this select 1;

	if (_isHub) then
	{
		waitUntil {!(isNil "BIS_HubIntro_finished")};
		waitUntil {(BIS_HubIntro_finished)};
	};

	private["_dateOp","_dateBriefing","_dateWarning1","_dateWarning2","_dateNote"];
	private["_offsetBriefing","_offsetTravel","_offsetWarning1","_offsetWarning2","_offsetNote"];
	private["_timeCurrent","_timeDifference","_timeWarning1","_timeWarning2","_timeBriefing","_timeNote"];

	//note: offsets are in minutes
	_offsetBriefing	= 15;
	_offsetTravel	= (([BIS_PER_phase] call BIS_fnc_camp_getTimelinePhaseTravelTimes) select 0) * 60;
	_offsetWarning1	= 30;		//30 mins before briefing starts
	_offsetWarning2	= 5;		// 5 mins before briefing starts
	_offsetNote	= 180;		// 3 hrs  before briefing starts

	_dateOp		= [BIS_PER_phase] call BIS_fnc_camp_getTimelinePhaseDate;
	_dateBriefing	= [_dateOp,[0,0,0,0,-_offsetBriefing-_offsetTravel]] call BIS_fnc_vectorAdd;
	_dateNote	= [_dateBriefing,[0,0,0,0,-_offsetNote]] call BIS_fnc_vectorAdd;
	_dateWarning1	= [_dateBriefing,[0,0,0,0,-_offsetWarning1]] call BIS_fnc_vectorAdd;
	_dateWarning2	= [_dateBriefing,[0,0,0,0,-_offsetWarning2]] call BIS_fnc_vectorAdd;

	BIS_fnc_camp_loadMissionIntel_dateBriefing =+ _dateBriefing call BIS_fnc_fixDate;

	_timeNote	= _dateNote call BIS_fnc_camp_dateToTime;
	_timeWarning1	= _dateWarning1 call BIS_fnc_camp_dateToTime;
	_timeWarning2	= _dateWarning2 call BIS_fnc_camp_dateToTime;
	_timeBriefing	= _dateBriefing call BIS_fnc_camp_dateToTime;

	_timeCurrent = date call BIS_fnc_camp_dateToTime;

	//display notification, if anywhere between notification time and briefing start time
	if (_timeCurrent < _timeBriefing) then
	{
		sleep 5;

		waitUntil
		{
			sleep 60;

			_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
			_timeDifference = round((_timeNote-_timeCurrent) * 525600);

			if (cheat1) then
			{
				skipTime (_timeDifference/60);

				_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
				_timeDifference = round((_timeNote-_timeCurrent) * 525600);

				cheat1 = false;
			};

			if (_timeDifference < 0) then {_timeDifference = 0};

			["[!] Time to early notification: %1 hr %2 mins",floor(_timeDifference/60),_timeDifference mod 60] call BIS_fnc_logFormat;

			(_timeDifference <= 0)
		};

		setAccTime 1;

		["[!] NOTIFICATION"] call BIS_fnc_logFormat;

		_timeDifference = round((_timeBriefing-_timeCurrent) * 525600); if (_timeDifference < 0) then {_timeDifference = 0};

		["BriefingNotification",[floor(_timeDifference/60),_timeDifference mod 60]] call BIS_fnc_showNotification;
	};

	_timeCurrent = date call BIS_fnc_camp_dateToTime;

	//display 1st warning
	if (_timeCurrent < _timeWarning1) then
	{
		sleep 5;

		waitUntil
		{
			sleep 60;

			_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
			_timeDifference = round((_timeWarning1-_timeCurrent) * 525600);

			if (cheat1) then
			{
				skipTime (_timeDifference/60);

				_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
				_timeDifference = round((_timeWarning1-_timeCurrent) * 525600);

				cheat1 = false;
			};

			if (_timeDifference < 0) then {_timeDifference = 0};

			["[!] Time to Warning #1: %1 hr %2 mins",floor(_timeDifference/60),_timeDifference mod 60] call BIS_fnc_logFormat;

			(_timeDifference <= 0)
		};

		setAccTime 1;

		["[!] WARNING #1"] call BIS_fnc_logFormat;

		if (_isHub) then
		{
			["BriefingWarningHub",[floor(_offsetWarning1/60),_offsetWarning1 mod 60]] call BIS_fnc_showNotification;
		}
		else
		{
			["BriefingWarningSkirmish",[floor(_offsetWarning1/60),_offsetWarning1 mod 60]] call BIS_fnc_showNotification;
		};
	};

	_timeCurrent = date call BIS_fnc_camp_dateToTime;

	//display 2nd warning
	if (_timeCurrent < _timeWarning2) then
	{
		sleep 5;

		waitUntil
		{
			sleep 60;

			_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
			_timeDifference = round((_timeWarning2-_timeCurrent) * 525600);

			if (cheat1) then
			{
				skipTime (_timeDifference/60);

				_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
				_timeDifference = round((_timeWarning2-_timeCurrent) * 525600);

				cheat1 = false;
			};

			if (_timeDifference < 0) then {_timeDifference = 0};

			["[!] Time to Warning #2: %1 hr %2 mins",floor(_timeDifference/60),_timeDifference mod 60] call BIS_fnc_logFormat;

			(_timeDifference <= 0)
		};

		setAccTime 1;

		["[!] WARNING #2"] call BIS_fnc_logFormat;

		if (_isHub) then
		{
			["BriefingWarningHub",[floor(_offsetWarning2/60),_offsetWarning2 mod 60]] call BIS_fnc_showNotification;
		}
		else
		{
			["BriefingWarningSkirmish",[floor(_offsetWarning2/60),_offsetWarning2 mod 60]] call BIS_fnc_showNotification;
		};
	};

	_timeCurrent = date call BIS_fnc_camp_dateToTime;

	//wait until time runs out
	if (_timeCurrent < _timeBriefing) then
	{
		waitUntil
		{
			sleep 60;

			_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
			_timeDifference = round((_timeBriefing-_timeCurrent) * 525600);

			if (cheat1) then
			{
				skipTime (_timeDifference/60);

				_timeCurrent 	= date call BIS_fnc_camp_dateToTime;
				_timeDifference = round((_timeBriefing-_timeCurrent) * 525600);

				cheat1 = false;
			};

			if (_timeDifference < 0) then {_timeDifference = 0};

			["[!] Time to briefing: %1 hr %2 mins",floor(_timeDifference/60),_timeDifference mod 60] call BIS_fnc_logFormat;

			(_timeDifference <= 0)
		};

		setAccTime 1;

		["[!] BRIEFING STARTS"] call BIS_fnc_logFormat;
	};

	//if in skirmish -> go to the hub
	if (_isSkirmish) exitWith
	{
		private["_hubs","_hub"];

		_hubs = [["isHub"]] call BIS_fnc_camp_getLinkedMissions;

		if (count _hubs == 1) then
		{
			_hub = _hubs select 0;

			["[!] Returning to Hub '%1'!",_hub] call BIS_fnc_logFormat;
			[_hub,true,3] call BIS_fnc_endMission;
		}
		else
		{
			["[!] Skirmish '%1' doesn't have (single) linked Hub!",missionName] call BIS_fnc_logFormat;
		};
	};

	//if on Hub -> select 1st available mission and start briefing
	private["_missions","_mission"];

	_missions = [["isHubMission","isOutro"]] call BIS_fnc_camp_getLinkedMissions;

	if (count _missions > 0) then
	{
		_mission = _missions select 0;

		["[!] Auto-starting briefing for mission '%1'!",_mission] call BIS_fnc_logFormat;
		[_mission,1] spawn BIS_HubBriefing_exec;
	}
	else
	{
		["[!] No available mission detected to auto-start!",missionName] call BIS_fnc_logFormat;
	};
};