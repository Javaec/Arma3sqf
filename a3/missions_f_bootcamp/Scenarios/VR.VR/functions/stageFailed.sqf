// ---------- general fail - restart stage

if (!BIS_interruptable) exitWith {};

BIS_interruptable = FALSE;
enableRadio FALSE;
clearRadio;

sleep 2;

//playMusic "EventTrack02_F_Curator";

call BIS_fnc_VRFadeOut;
sleep 1;

_null = [] execVM "stageStart.sqf";