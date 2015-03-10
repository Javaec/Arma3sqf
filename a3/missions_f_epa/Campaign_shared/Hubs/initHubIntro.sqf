scriptName "initHubIntro.sqf";

if (BIS_SkipHubIntro) exitWith
{
	BIS_HubIntro_finished = true;
};

private["_prevMission","_isSkirmish"];

_prevMission = missionNamespace getVariable ["BIS_PER_prevMission",""];
_isSkirmish  = [_prevMission] call BIS_fnc_camp_getMissionMeta select 2;

if (_isSkirmish) exitWith
{
	BIS_HubIntro_finished = true;
};

//create a blackout for hub intro
["BIS_HubIntro",false] call BIS_fnc_blackOut;

//register the intro guide character
private["_introGuide"];

_introGuide = ["Hubs",missionName,"HubIntro","Guide","unit"] call BIS_fnc_getCfgDataObject;

BIS_HubIntro_regUnits set [count BIS_HubIntro_regUnits,_introGuide];