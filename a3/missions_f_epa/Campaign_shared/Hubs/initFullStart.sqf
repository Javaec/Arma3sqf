scriptName "initFullStart.sqf";

/*--------------------------------------------------------------------------------------------------

	FULLSTART

	Handles:
	--------
	* initialization of the trigger characters [to be done later ...]
	* interaction with the characters
	* conversations
	* animations [to be done later ...]

--------------------------------------------------------------------------------------------------*/

//action on the trigger npc
BIS_FullStart_addAction =
{
	private ["_npc","_mission","_label","_distance"];

	_npc		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_mission 	= [_this, 1, "A_m01", [""]] call BIS_fnc_param;
	_label	 	= localize "STR_A3_UserAction_StartBriefing";
	_distance 	= 3;

	_label		= format["<img image='%1' size='1.8'/> <t size='1.2'>%2</t>","\A3\Ui_f\data\IGUI\Cfg\Actions\talk_ca.paa",_label];

	//ensure there is no delay in showing the action
	(group player) reveal _npc;

	_npc addAction
	[
		_label,
		BIS_FullStart_exec,
		[_mission],
		10e10,
		true,
		true,
		"",
		format["([%1,%2] call BIS_AiInteraction_isInFrontOf) && !(BIS_FFDetected) && (BIS_SelectedMission == '')", _npc, _distance]
	];
};

/*
Tiggered by going close to the trigger NPC.

1. gathers info from CFG
2. plays the introductory conversation
3. adds user action to trigger briefing
4. starts the briefing when the user action is executed
*/
BIS_FullStart_intro =
{
	private["_fnc_log_disable"]; _fnc_log_disable = true;

	private["_stage","_npc","_mission","_kb","_inFront"];

	_npc  	 = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_mission = [_this, 4, missionName, [""]] call BIS_fnc_param;

	_stage = ["stage"] call BIS_fnc_getCfgData;

	//play intro conversation
	_kb = [_mission,"FullStart","MissionIntro"] spawn BIS_Conversations_play;

	//make this NPC's task *current*
	_mission call BIS_fnc_taskSetCurrent;

	waituntil
	{
		_inFront = [_npc,3] call BIS_AiInteraction_isInFrontOf;

		(scriptDone _kb) || !(_inFront)
	};

	//show action *Start Briefing*
	[_npc,_mission] call BIS_FullStart_addAction;

	//update task waypoint
	[_mission,[BIS_BriefingCenter,true]] call BIS_fnc_taskSetDestination;
};

BIS_FullStart_exec =
{
	if (BIS_FFDetected) exitWith {};

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

	["[FullStart] Briefing for '%1' triggered!",_mission] call BIS_fnc_logFormat;

	//store the selected mission in gvar
	BIS_SelectedMission = _mission;

	//cancel tasks for other operations
	private["_otherMissions"];

	_otherMissions = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions;
	_otherMissions = _otherMissions - [_mission];

	{
		[_x,"CANCELED",false] call BIS_fnc_taskSetState;
	}
	forEach _otherMissions;

	//complete the task
	["BIS_ReportIn","SUCCEEDED",true] call BIS_fnc_taskSetState;
	[_mission,"SUCCEEDED",false] call BIS_fnc_taskSetState;

	//end hub if module "HubBriefing" is not loaded
	if !("HubBriefing" in BIS_HubComponents) exitWith
	{
		["[FullStart] Exiting hub with ending: '%1'!",_mission] call BIS_fnc_logFormat;

		[_mission,true,0] call BIS_fnc_endMission;
	};

	//briefing launched by conversation
	if (typeName _this == typeName []) then
	{
		[_mission] spawn BIS_HubBriefing_exec;
	}
	//briefing launched by (briefing area) proximity trigger
	else
	{
		[_mission,3] spawn BIS_HubBriefing_exec;
	};
};

//register the mission givers
private["_missions","_npc"];

_missions = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions;
_missions = _missions call BIS_fnc_camp_sortMissions;

{
	_npc = ["Missions",_x,"FullStart","trigger"] call BIS_fnc_getCfgDataObject;

	//register units that are used by this component
	BIS_FullStart_regUnits set [count BIS_FullStart_regUnits,_npc];
}
forEach _missions;