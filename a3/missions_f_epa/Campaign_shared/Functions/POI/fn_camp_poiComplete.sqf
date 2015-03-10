/*
	Author: Jiri Wainar

	Description:
	Completes the given POI.

	Example:
	["POI_FirstAid_01",true] call BIS_fnc_camp_poiComplete;
*/

private["_poi","_showNotification","_linked","_status"];

_poi 	   	  = [_this, 0, missionName, [""]] call BIS_fnc_param;
_showNotification = [_this, 1, true, [true]] call BIS_fnc_param;
_linked    	  = [missionName] call BIS_fnc_camp_poiGetLinked;

//wrong POI
if !(_poi in _linked) exitWith {};

//exit if POI is already completed
_status = [_poi] call BIS_fnc_camp_poiGetStatus;

if (_status == 1) exitWith
{
	["POI [%1] is already completed!",_poi] call BIS_fnc_logFormat;
};

//set POI status
[_poi,1] call BIS_fnc_camp_poiSetStatus;

//draw POI markers
[_poi] call BIS_fnc_camp_poiDrawMarker;

//complete the POI task
[_poi,_showNotification] call BIS_fnc_camp_poiCompleteTask;