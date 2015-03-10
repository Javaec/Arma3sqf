scriptName "initAnims3.sqf";

//check for intro briefing & if yes, execute the anims
private["_introBriefing"];

_introBriefing = ["Hubs",missionName,"IntroBriefing","active"] call BIS_fnc_getCfgDataBool;

if (_introBriefing) then
{
	[] call BIS_Anims_setupUnits;
};