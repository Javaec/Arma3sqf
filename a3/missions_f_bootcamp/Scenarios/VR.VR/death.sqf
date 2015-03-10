// ---------- player took too much damage - restart stage

if (!BIS_interruptable) exitWith {};

BIS_interruptable = FALSE;

//playMusic "EventTrack02_F_Curator";

["death"] call BIS_fnc_VRFadeOut;
sleep 1;

_null = [] execVM "stageStart.sqf";