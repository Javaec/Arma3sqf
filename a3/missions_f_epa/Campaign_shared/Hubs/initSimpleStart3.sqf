scriptName "initSimpleStart3.sqf";

//destroy the briefing timer
if !(isNil "BIS_fnc_camp_loadMissionIntel_timerHandle") then
{
	if !(scriptDone BIS_fnc_camp_loadMissionIntel_timerHandle) then
	{
		terminate BIS_fnc_camp_loadMissionIntel_timerHandle;
	};
};

//create main task "BIS_ReportIn"
[player,"BIS_ReportIn",
[
	["Hubs",missionName,"Tasks","BIS_ReportIn","desc"] call BIS_fnc_getCfgData,
	["Hubs",missionName,"Tasks","BIS_ReportIn","title"] call BIS_fnc_getCfgData,
	["Hubs",missionName,"Tasks","BIS_ReportIn","marker"] call BIS_fnc_getCfgData
],
[BIS_BriefingCenter,true],true,nil,true] call BIS_fnc_taskCreate;

//create proximity trigger for mission briefing
[] spawn
{
	scriptName "initSimpleStart.sqf: proximity trigger";

	private["_fnc_log_disable"]; _fnc_log_disable = true;

	private["_nextMission","_triggerPos","_missions","_triggerHeight","_triggerRadius","_t"];

	_missions      = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions; if (count _missions == 0) exitWith {};
	_nextMission   = _missions select 0;
	_triggerPos    = ["Missions",_nextMission,"SimpleStart","center"] call BIS_fnc_getCfgData;
	_triggerRadius = ["Missions",_nextMission,"SimpleStart","radius"] call BIS_fnc_getCfgData;
	_triggerHeight = _triggerPos select 2;

	//display notification
	["BriefingNotification"] call BIS_fnc_showNotification;

	_t = time + 300;

	waitUntil
	{
		sleep 0.1;

		_playerHeight = (getPosATL player) select 2;

		((player distance _triggerPos < _triggerRadius) && (abs(_playerHeight - _triggerHeight) < 1.5)) || (_t < time)
	};

	_nextMission call BIS_SimpleStart_exec;
};



BIS_SimpleStart_exec =
{
	if (BIS_FFDetected) exitWith {};
	if (BIS_HubBriefing_executed) exitWith {};

	private["_fnc_log_disable"]; _fnc_log_disable = true;

	private["_mission"];

	if (typeName _this == typeName []) then
	{
		_mission = (_this select 3) select 0;
	}
	else
	{
		_mission = _this;
	};

	["[SimpleStart] Briefing for '%1' triggered!",_mission] call BIS_fnc_logFormat;

	//store the selected mission in gvar
	BIS_SelectedMission = _mission;

	//complete the task
	["BIS_ReportIn","SUCCEEDED",true] call BIS_fnc_taskSetState;

	//end hub if module "HubBriefing" is not loaded
	if !("HubBriefing" in BIS_HubComponents) exitWith
	{
		["[SimpleStart] Exiting hub with ending: '%1'!",_mission] call BIS_fnc_logFormat;

		[_mission,true,0] call BIS_fnc_endMission;
	};

	//briefing launched by (briefing area) proximity trigger
	[_mission,0] call BIS_HubBriefing_exec;
};