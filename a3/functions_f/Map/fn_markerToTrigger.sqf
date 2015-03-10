/*
	File: markerToTrigger.sqf
	Author: Mika Hannola
	
	Description:
	Makes an existing or new marker cover a trigger area.
	
	Parameter(s):
	_this select 0: <string> marker name - if no marker uses the name, a marker will be created
	_this select 1: <object> trigger that will be covered by the marker
	_this select 2 (Optional): <boolean> changes are local (default: false)
	
	Returns:
	Marker name (string). Returns empty string if a marker couldn't be moved or created.
	
	How to use:
	_marker = ["marker1", trigger1] call BIS_fnc_markerToTrigger;
*/

private ["_marker", "_trigger", "_local", "_triggerSize", "_triggerDir", "_triggerShape"];

_marker = [_this, 0, "", [""]] call BIS_fnc_param;
_trigger = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_local = [_this, 2, false, [false]] call BIS_fnc_param;



if (_marker != "" && count triggerArea _trigger > 0) then
{
	_triggerSize = [triggerArea _trigger select 0, triggerArea _trigger select 1];
	_triggerDir = triggerArea _trigger select 2;
	_triggerShape = if (triggerArea _trigger select 3) then {"RECTANGLE"} else {"ELLIPSE"};
	if (_local) then
	{
		if (markerShape _marker == "") then
		{
			_marker = createMarkerLocal [_marker, getPosATL _trigger];
		}
		else
		{
			_marker setMarkerPosLocal getPosATL _trigger;
		};
		_marker setMarkerSizeLocal _triggerSize;
		_marker setMarkerDirLocal _triggerDir;
		_marker setMarkerShapeLocal _triggerShape;
	}
	else
	{
		if (markerShape _marker == "") then
		{
			_marker = createMarker [_marker, getPosATL _trigger];
		}
		else
		{
			_marker setMarkerPos getPosATL _trigger;
		};
		_marker setMarkerSize _triggerSize;
		_marker setMarkerDir _triggerDir;
		_marker setMarkerShape _triggerShape;
	};
}
else
{
	_marker = "";
};

_marker;