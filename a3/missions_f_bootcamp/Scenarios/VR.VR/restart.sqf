// ---------- restart stage

BIS_interruptable = FALSE;
BIS_phase = 0;

call BIS_fnc_VRFadeOut;
sleep 1;

_null = [] execVM "stageStart.sqf";