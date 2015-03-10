/*
	Author: Thomas Ryan
	
	Description:
	Disables the load/restart button.
	Currently only for BIS_fnc_cinemaBorder used within the Prologue and Survive campaigns.
	Only works in single player.
	
	Parameters:
	None.
	
	Returns:
	BOOL - will always be true
*/

if (missionNamespace getVariable ["BIS_fnc_cinemaBorder_loadingDisabled", false]) then {
	((_this select 0) displayCtrl 119) ctrlEnable false;
};

true