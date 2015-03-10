/*
	File: triggerToMarker.sqf
	Author: Mika Hannola
	
	Description:
	Makes an existing or new trigger cover a marker area.
	
	Parameter(s):
	_this select 0: <object> trigger that will be used to cover the marker - objNull to create a new trigger
	_this select 1: <string> marker
	
	Returns:
	Trigger (object). Returns objNull if the function failed.
	
	How to use:
	_trigger = [objNull, "marker1"] call BIS_fnc_triggerToMarker;
*/

private ["_trigger", "_marker"];

_trigger = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_marker = [_this, 1, "", [""]] call BIS_fnc_param;

if (_marker != "" && (markerShape _marker in ["RECTANGLE", "ELLIPSE"])) then
{
	if (isNull _trigger) then
	{
		_trigger = createTrigger ["EmptyDetector", markerPos _marker];
	}
	else
	{
		_trigger setPosATL markerPos _marker;
	};
	_trigger setTriggerArea [markerSize _marker select 0, markerSize _marker select 1, markerDir _marker, markerShape _marker == "RECTANGLE"];
}
else
{
	_trigger = objNull;
};

_trigger;