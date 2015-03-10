/*
	Author: Josef Zemanek

	Description:
	Creates a marker on each uncompleted waypoint and marks it checked after completing that WP.
	Note: "On Activation" WP code is used for handling the markers; if this code is overwritten during the course, it can break this functionality

	Parameter(s):
	_this select 0: OBJECT - unit who will have its waypoints marked
	_this select 1 (Optional, use "" for default): STRING - text of hint shown after completing a waypoint, %1 is used for WP number (default "")
	_this select 2 (Optional, use [] for default): ARRAY of STRINGS - marker text format for [uncompleted, completed] waypoints, %1 is used for WP number (default ["%1", "%1"])
	_this select 3 (Optional, use [] for default): ARRAY of STRINGS - marker icon for [uncompleted, completed] waypoints (default ["mil_circle", "mil_circle"])
	_this select 4 (Optional, use [] for default): ARRAY of STRINGS - marker color for [uncompleted, completed] waypoints (default ["ColorRed", "ColorGreen"])
	_this select 5 (Optional, use [] for default): ARRAY of NUMBERS - marker size for [uncompleted, completed] waypoints (default [0.75, 0.75])

	Returns:
	NOTHING
*/

_unit = _this select 0;
_popup = "";
_texts = ["%1", "%1"];
_icons = ["mil_circle", "mil_circle"];
_colors = ["ColorRed", "ColorGreen"];
_sizes = [0.75, 0.75];

if (isNil "BIS_markedWPsID") then {BIS_markedWPsID = 0} else {BIS_markedWPsID = BIS_markedWPsID + 1};

if (count _this > 1) then {_popup = _this select 1};
if (count _this > 2) then {if (count (_this select 2) > 0) then {_texts = _this select 2}};
if (count _this > 3) then {if (count (_this select 3) > 0) then {_icons = _this select 3}};
if (count _this > 4) then {if (count (_this select 4) > 0) then {_colors = _this select 4}};
if (count _this > 5) then {if (count (_this select 5) > 0) then {_sizes = _this select 5}};

_allWaypoints = waypoints _unit;
_i = 1;

for [{_x = currentWaypoint group _unit}, {_x < count _allWaypoints}, {_x = _x + 1}] do {
	_curWP = _allWaypoints select _x;
	_mrkrName = format ["BIS_markedWP_%1_%2", BIS_markedWPsID, _x];
	_mrkr = createMarkerLocal [_mrkrName, waypointPosition _curWP];
	_mrkrName setMarkerTextLocal format [_texts select 0, _i];
	_mrkrName setMarkerTypeLocal (_icons select 0);
	_mrkrName setMarkerColorLocal (_colors select 0);
	_mrkrName setMarkerSizeLocal [_sizes select 0, _sizes select 0];
	_curWP setWaypointStatements [(waypointStatements _curWP) select 0, format ["%1; ""%2"" setMarkerTextLocal ""%3""; ""%2"" setMarkerTypeLocal ""%4""; ""%2"" setMarkerColorLocal ""%5""; ""%2"" setMarkerSizeLocal [%6, %6]; if (""%7"" != """") then {hintSilent ""%7""}", (waypointStatements _curWP) select 1, _mrkrName, format [_texts select 1, _i], _icons select 1, _colors select 1, _sizes select 1, _popup]];
	_i = _i + 1
};