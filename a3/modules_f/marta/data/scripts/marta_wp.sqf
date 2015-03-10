scriptName "Marta\data\scripts\marta_wp.sqf";
/*
	File: marta_wp.sqf
	Author: Karel Moricky

	Description:
	Displaying group waypoints.

	Parameter(s):
	_this select 0: Group - Group of which wayponts gonna be tracked
*/

_grp = _this;
_logic = BIS_marta_mainscope;
_usedMarkers = [];

_display = findDisplay 12;
_map = _display displayCtrl 51;

//--- Main loop
while {_grp in (_logic getvariable "WPgroups")} do {
	_delay = _logic getvariable "delay";
	if (_delay <= 0) then {_delay = 0.01};
	_markerGroup = ["MARKER",_grp] call BIS_marta_getParams;
	_oldpos = markerpos _markerGroup;

	_waypoints = waypoints _grp;
	_currentwaypoint = currentwaypoint _grp;
	_pendingWaypoints = [_waypoints, _currentwaypoint] call BIS_fnc_subSelect;
	_pendingWaypointsCount = count _pendingWaypoints;

	for "_i" from 0 to (_pendingWaypointsCount - 1) do {
		_element = _pendingWaypoints select _i;
		_markername = format ["%1_WP_%2",_markerGroup,_i];
		_marker = "";
		_markerLine = "";
		_wppos = waypointposition _element;

		//--- Create new marker
		if (markercolor _markername == "") then {
			_marker = createmarkerlocal [_markername,[1,1]];
			_marker setmarkertypelocal "waypoint";
			_marker setmarkersizelocal [.6,.6];
			
			_markerLine = createmarkerlocal [_marker + "_LINE",[1,1]];
			_markerLine setmarkershapelocal "rectangle";
			_markerLine setmarkerbrushlocal "solid";

			//--- Register marker
			_usedMarkers = _usedMarkers + [_marker];

			//--- Fade in effect
			["FADE IN",_marker,0.5] spawn BIS_marta_effect;
			["FADE IN",_markerLine,0.5] spawn BIS_marta_effect;
		} else {
			_marker = _markername;
			_markerLine = _markername + "_LINE";
		};

		//--- Set marker
		_marker setmarkerposlocal _wppos;
		_marker setmarkercolorlocal (markercolor _markerGroup);

		//--- Line marker
		_mpos = markerpos _marker;
		_ppos = _oldpos;

		_difX = (_mpos select 0) - (_ppos select 0) +0.1;
		_difY = (_mpos select 1) - (_ppos select 1) +0.1;
		_lx = (_ppos select 0) + _difX / 2;
		_ly = (_ppos select 1) + _difY / 2;
		_dis = sqrt(_difX^2 + _difY^2);
		_dir = atan (_difX / _difY);
		_width = ctrlmapscale _map * 6.66 * 3;
		_markerLine setmarkerposlocal [_lx,_ly];
		_markerLine setmarkersizelocal [_width,_dis/2];
		_markerLine setmarkerdirlocal _dir;
		_markerLine setmarkercolorlocal (markercolor _markerGroup);
		
		_oldpos = markerpos _marker;

		//--- Description
		_istext = _grp getvariable "MARTA_WP_ISTEXT";
		if !(isnil "_istext") then {
			_wpnumber = _i + 1;
			if (_istext) then {_marker setmarkertextlocal str _wpnumber} else {_marker setmarkertextlocal ""};
		} else {
			_marker setmarkertextlocal "";
		};

		//--- Alpha (stored in group variable)
		_alpha = _grp getvariable "MARTA_WP_ALPHA";
		if !(isnil "_alpha") then {
			_marker setmarkeralphalocal _alpha;
			_markerLine setmarkeralphalocal _alpha;
		} else {
			_marker setmarkeralphalocal 1;
			_markerLine setmarkeralphalocal 1;
		};
	};

	//--- Delete obsolete markers
	if (_pendingWaypointsCount < count _usedMarkers) then {
		_deleteList = [_usedMarkers, _pendingWaypointsCount] call BIS_fnc_subSelect;
		{
			deletemarker _x;
			deletemarker (_x + "_LINE");

			_usedMarkers = _usedMarkers - [_x];
		} foreach _deleteList;
	};
	_grp setvariable ["MARTA_waypoints",_usedMarkers];


	//--- Time for sleep
	sleep (_delay);

};

//--- Delete all markers
{
	deletemarker _x;
	deletemarker (_x + "_LINE");
} foreach _usedMarkers;
	
//--- Remove from active list
_WPgroups_current = _logic getvariable "WPgroups_current";
_WPgroups_current = _WPgroups_current - [_grp];
_logic setvariable ["WPgroups_current",_WPgroups_current];
