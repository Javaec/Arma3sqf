// ---------- stage aborted - return to hub

BIS_interruptable = FALSE;

call BIS_fnc_VRFadeOut;
sleep 1;

_null = [] execVM "hubStart.sqf";