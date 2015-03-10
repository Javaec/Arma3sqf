// ---------- timeout - restart stage

BIS_interruptable = FALSE;

//playMusic "EventTrack02_F_Curator";

call BIS_fnc_VRFadeOut;
sleep 1;

_null = [] execVM "stageStart.sqf";