/*
	Author: Jiri Wainar

	Description:
	Reveals given POI to player. POI gets marked in the map and an audio-visual notification executes.

	Example:
	["POI_FirstAid_01",true,false] call BIS_fnc_camp_poiReveal;
*/

private["_poi","_addTask","_showNotification","_linked","_status"];

_poi 	          = [_this, 0, missionName, [""]] call BIS_fnc_param;
_addTask          = [_this, 1, true, [true]] call BIS_fnc_param;
_showNotification = [_this, 2, false, [true]] call BIS_fnc_param;
_linked           = [missionName] call BIS_fnc_camp_poiGetLinked;

//exit if wrong POI
if !(_poi in _linked) exitWith {};

//exit if POI is already revealed or revealed+completed
_status = [_poi] call BIS_fnc_camp_poiGetStatus;

if (_status != -1) exitWith
{
	["POI [%1] is already known to player [status = %2]!",_poi,_status] call BIS_fnc_logFormat;
};

//reveal the POI to player
[_poi,0] call BIS_fnc_camp_poiSetStatus;

//draw POI markers
[_poi] call BIS_fnc_camp_poiDrawMarker;

//give optional task(s)
if (_addTask) then
{
	[_poi,_showNotification] call BIS_fnc_camp_poiAddTask;
};