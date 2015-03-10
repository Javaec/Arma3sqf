/*
	Author: Warka

	Description:
	Function detects waypoint paths that are made of given helper types. Then it sends given groups to patrol along the paths.

	Suggested helpers to use:
	* "Sign_Arrow_Blue_F"
	* "Sign_Arrow_Yellow_F"
	* "Sign_Arrow_Pink_F"
	* "Sign_Arrow_Green_F"
	* "Sign_Arrow_Cyan_F"

	Parameter(s):
	0: ARRAY 	- [[_group1:group,_helper1:string],...]
	1: OBJECT	- center point for waypoint detection
	2: NUMBER	- radius from center point for waypoint detection
	3: BOOL		- show waypoint debug

	Returns:
	-

	Example:
	[[POI_Checkpoint_01_groupBlue,"Sign_Arrow_Blue_F"]] call BIS_fnc_camp_patrol;
*/

//["[!] Executed with: %1",_this] call BIS_fnc_logFormat;

private["_showDebug","_pairs","_center","_radius","_isLocal"];

_pairs 		= [_this, 0, [], [[]]] call BIS_fnc_param;
_center		= [_this, 1, objNull, [objNull,""]] call BIS_fnc_param;
_radius		= [_this, 2, -1, [123]] call BIS_fnc_param;
_showDebug 	= [_this, 3, false, [false]] call BIS_fnc_param;

if (count _pairs == 0) exitWith {};

if (typeName _center == typeName "") then
{
	_center	= missionNamespace getVariable [_center,objNull];
};

_isLocal = if (isNull _center || _radius == -1) then {false} else {true};

/*--------------------------------------------------------------------------------------------------

 	LOCAL FUNCTIONS

--------------------------------------------------------------------------------------------------*/
private["_fn_getClosestWp","_fn_getWaypoints","_fn_sortWaypoints","_fn_drawMarkers","_fn_createWaypointLoop"];

//get closest waypoint object
//_closest = [_current,_waypoints] call _fn_getClosestWp;
_fn_getClosestWp =
{
	private["_eval","_points","_stored","_storedDistance","_current","_currentDistance"];

	_eval 	= _this select 0;
	_points = _this select 1;

	if (count _points < 1) exitWith {objNull};

	_storedDistance = 10e10;
	_stored = _eval;

	{
		_current = _x;
		_currentDistance = _eval distance _current;

		if (_currentDistance < _storedDistance) then
		{
			_storedDistance = _currentDistance;
			_stored = _current;
		};
	}
	forEach _points;

	_stored
};

//get the waypoint objects
_fn_getWaypoints =
{
	private["_objects"];

	_objects = if (_isLocal) then
	{
		nearestObjects [_center, [_this], _radius];
	}
	else
	{
		allMissionObjects _this;
	};

	_objects
};

//sort waypoint objects into a line, endings are the furtherest waypoints
_fn_sortWaypoints =
{
	private["_objects","_visited","_available","_start","_current","_next","_dist","_linked","_last","_sorted"];
	private["_current1","_current2","_next1","_next2","_dist1","_dist2"];

	_objects = _this;

	if (count _objects < 2) exitWith {[]};

	//make sure, the pointers are deleted
	{
		_x setVariable ["BIS_LINKED",[]];
	}
	forEach _objects;

	//_start = _objects select 0;
	_start = _objects call BIS_fnc_selectRandom;

	_current1 = _start;
	_current2 = _start;

	_visited = [_start];
	_available = _objects - _visited;

	while {count _available > 0} do
	{
		_next1 = [_current1,_available] call _fn_getClosestWp;
		_next2 = [_current2,_available] call _fn_getClosestWp;
		_dist1 = _current1 distance _next1;
		_dist2 = _current2 distance _next2;

		//process only the 1 waypoint that is closer to one of the ends
		if (_dist1 < _dist2) then
		{
			//process ending #1
			_current = _current1;
			_next = _next1;

			//wp-chain ending #1 will move
			_current1 = _next1;
		}
		else
		{
			//process ending #2
			_current = _current2;
			_next = _next2;

			//wp-chain ending #2 will move
			_current2 = _next2;
		};

		//store link: current -> next
		_linked = _current getVariable ["BIS_LINKED",[]];
		_linked = _linked + [_next];
		_current setVariable ["BIS_LINKED",_linked];

		//store link: next -> current
		_linked = _next getVariable ["BIS_LINKED",[]];
		_linked = _linked + [_current];
		_next setVariable ["BIS_LINKED",_linked];

		//debug print
		//["%1 -> %2 | %3",_current,_next,_current getVariable ["BIS_LINKED",[]]] call BIS_fnc_logFormat;

		//update the wp pools
		_available = _available - [_next];
		_visited = _visited + [_next];

		//store last, as it will be 1 of the endings of the line
		_last = _next;
	};

	//debug print
	//["%1 -> %2 | %3",_last,"  ",_last getVariable ["BIS_LINKED",[]]] call BIS_fnc_logFormat;

	//["Visited WPs: %1",_visited] call BIS_fnc_logFormat;
	//["Start of the line detected at [%1].",_last] call BIS_fnc_logFormat;

	//sort the waypoints into a line and store it in soreted array
	_current = _last;
	_sorted = [];
	_available = _visited;

	while {count _available > 0} do
	{
		//update the waypoint pools
		_sorted = _sorted + [_current];
		_available = _available - [_current];

		//check for corrupted pointers, there should be always ONLY 1 pointer to "next"
		if (count _available == 0) exitWith
		{
			//["End of the line detected at [%1].",_current] call BIS_fnc_logFormat;
		};

		//get the "current" pointer(s)
		_linked = _current getVariable ["BIS_LINKED",[]];

		//check for corrupted pointers, there should be always ONLY 1 pointer to "next"
		if (count _linked != 1) exitWith
		{
			//["Waypoint pointer [%1] is corrupted! Linked waypoints: %2.",_current,_linked] call BIS_fnc_logFormat;
		};

		//get the pointer target, the "next" waypoint
		_next = _linked select 0;

		//remove the backward link from "next" that is pointing back to the "current"
		_linked = _next getVariable ["BIS_LINKED",[]];
		_linked = _linked - [_current];
		_next setVariable ["BIS_LINKED",_linked];

		//move "current" -> "next"
		_current = _next;
	};

	_sorted
};

//draw markers for debugging
_fn_drawMarkers =
{
	private["_waypoints","_class","_classes","_marker","_colors","_colorid","_color","_text"];

	_waypoints 	= [_this,0,[],[[]]] call BIS_fnc_param;
	_class 		= [_this,1,"Sign_Arrow_Pink_F",[""]] call BIS_fnc_param;

	_classes	= ["Sign_Arrow_Yellow_F","Sign_Arrow_Blue_F","Sign_Arrow_Pink_F","Sign_Arrow_Green_F","Sign_Arrow_Cyan_F"];
	_colors 	= ["ColorYellow","ColorBlue","ColorPink","ColorGreen","ColorGrey"];

	_colorid	= _classes find _class;
	_color		= [_colors,_colorid,"ColorBlack"] call BIS_fnc_param;

	{
		_marker = _x call BIS_fnc_objectVar;
		_text   = markerText _marker;

		if (_text == "") then
		{
			_marker = createMarker [_marker, position _x];
			_marker setMarkerType "mil_dot";
			_marker setMarkerText (str _forEachIndex);
			_marker setMarkerColor _color;
		}
		else
		{
			_text = _text + ", " + (str _forEachIndex);
			_marker setMarkerText _text;
		};
	}
	forEach _waypoints;
};

//scan waypoints and create a loop
_fn_createWaypointLoop =
{
	private["_wpsRaw","_loopDetected","_loopDetectedId","_current","_currentId","_next","_nextId","_wpsFixed","_i"];

	_wpsRaw = _this;
	_loopDetected = false;

	//check if there is a loop
	//loop is marked by 2 waypoints close to each other (max. 2m)
	{
		_current = _x;
		_currentId = _forEachIndex;

		if (_currentId == (count _wpsRaw)-1) then
		{
			_nextId = 0;
		}
		else
		{
			_nextId = _currentId + 1;
		};

		_next = _wpsRaw select _nextId;

		if (_current distance _next < 2) exitWith
		{
			_loopDetected = true;
			_loopDetectedId = _nextId;
		};
	}
	forEach _wpsRaw;

	_wpsFixed = [];

	//re-arrange the looped path
	if (_loopDetected) then
	{
		for "_i" from _loopDetectedId to ((count _wpsRaw)-1) do
		{
			_wpsFixed = _wpsFixed + [_wpsRaw select _i];
		};
		for "_i" from 0 to (_loopDetectedId-1) do
		{
			_wpsFixed = _wpsFixed + [_wpsRaw select _i];
		};

	}
	//create the backward path
	else
	{
		_wpsFixed = _wpsRaw;

		for "_i" from ((count _wpsRaw)-2) to 0 step -1 do
		{
			_wpsFixed = _wpsFixed + [_wpsRaw select _i];
		};
	};

	_wpsFixed
};


/*--------------------------------------------------------------------------------------------------

 	MAIN EXECUTION CODE

--------------------------------------------------------------------------------------------------*/
if (isNil "BIS_fnc_camp_patrol__units") Then
{
	BIS_fnc_camp_patrol__units = [];
};

private["_group","_class","_objects","_wp","_currentWp","_currentWpId"];

{
	//["Processed: %1",_x] call BIS_fnc_logFormat;

	if (true) then
	{
		_group = _x select 0;
		_class = _x select 1;

		if (typeName _group == typeName objNull) then
		{
			_group = group _group;

			_x set [0, _group];
		};

		//store units to gvar for possible outside usage
		BIS_fnc_camp_patrol__units = BIS_fnc_camp_patrol__units + (units _group);

		//get un-sorted waypoint objects
		_objects = _class call _fn_getWaypoints;

		//debug
		/*
		["----------------------------------------------------------------------"] call BIS_fnc_logFormat;
		["Center: %1",_center] call BIS_fnc_logFormat;
		["Class: %1",_class] call BIS_fnc_logFormat;

		{
			["[%1] %2m",_forEachIndex,floor(_x distance _center)] call BIS_fnc_logFormat;
		}
		forEach _objects;
		["----------------------------------------------------------------------"] call BIS_fnc_logFormat;
		*/

		if (count _objects < 2) exitWith {};

		//["Un-sorted WPs: %1",_objects] call BIS_fnc_logFormat;

		//sort waypoint objects to line
		_objects = _objects call _fn_sortWaypoints;

		//["Sorted WPs: %1",_objects] call BIS_fnc_logFormat;

		//create waypoint loop; applies to both line or circular pathways as both must be looped
		_objects = _objects call _fn_createWaypointLoop;

		//["Fixed WPs: %1",_objects] call BIS_fnc_logFormat;

		//draw markers
		if (_showDebug) then
		{
			[_objects,_class] call _fn_drawMarkers;
		};

		//we need at least 2 waypoints
		if (count _objects < 2) exitWith
		{
			["[_fn_spawnWalker]: Walker not created, at least 2 waypoints are needed!"] call BIS_fnc_log
		};

		//delete 'old' group waypoints
		while {count waypoints _group > 0} do
		{
			deleteWaypoint [_group, 0];
		};

		{
			_wp = _group addWaypoint [position _x, 0];

			/*
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointSpeed "LIMITED";
			*/

			if (_forEachIndex == (count _objects) - 1) then
			{
				_wp setWaypointType "CYCLE";
			}
			else
			{
				_wp setWaypointType "MOVE";
			};
		}
		forEach _objects;

		//find 1st/current waypoint
		_currentWp = [(units _group) select 0,_objects] call _fn_getClosestWp;

		//["Current: %1",_currentWp] call BIS_fnc_logFormat;
		//["Distance: %1",((units _group) select 0) distance _currentWp] call BIS_fnc_logFormat;

		_currentWpId = _objects find _currentWp;

		//set current waypoint
		_group setCurrentWaypoint [_group, _currentWpId];

		//["Current ID: %1",_currentWpId] call BIS_fnc_logFormat;
	};
}
forEach _pairs;