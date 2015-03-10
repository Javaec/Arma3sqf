/*
	Author: Jiri Wainar

	Description:
	Create or update global variable for the POI and add it to list of gvars to be saved on mission exit.

	Example:
	["POI_Checkpoint_01"] call BIS_fnc_camp_poiGetStatus;
*/

private["_poi","_var","_status"];

_poi	= [_this, 0, "", [""]] call BIS_fnc_param; if (_poi == "") exitWith {};
_var 	= _poi call BIS_fnc_camp_poiGetVar;
_status = missionNamespace getVariable [_var,-1];

_status