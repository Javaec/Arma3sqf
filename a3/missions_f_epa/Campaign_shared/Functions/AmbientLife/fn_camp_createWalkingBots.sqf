/*
	Author: Warka

	Description:
	Detect and create a walking soldier for every set of waypoint helpers.

	How to use it?
	1. Place several helper objects in the mission.
	2. Call the function.
	2. Done! :)

	Remarks:
	* Function will check if any of the given helpers are present in the mission.
	* If helpers are detected, it will create 1 set of waypoints for every helper type (=class).
	* After then it will create 1 soldier for every waypoint set.

	Parameter(s):
	0: ARRAY OF STRINGS - classes of the helpers used to mark the waypoints
	1: ARRAY OF STRINGS - classes of the soldiers spawned

	Returns:
	-

	Example:

	//2 sets of waypoints defined by "Sign_Arrow_Yellow_F", resp. "Sign_Arrow_Blue_F" and 1 possible soldier type
	[["Sign_Arrow_Yellow_F","Sign_Arrow_Blue_F"],["B_Soldier_F"]] call BIS_fnc_camp_createWalkingBots;

	//default - checks all helpers of the type "Sign_Arrow_*_F" and randomize soldier classes, most common being "B_Soldier_F"
	[] call BIS_fnc_camp_createWalkingBots;
*/

private["_showDebug","_wpClasses","_wpObjects","_aiClasses","_fn_getWaypoints","_fn_sortWaypoints","_fn_getClosestWp","_fn_drawMarkers","_fn_createWaypointLoop","_fn_spawnWalker"];

_wpClasses	= [_this, 0, ["Sign_Arrow_Yellow_F","Sign_Arrow_Blue_F","Sign_Arrow_Pink_F","Sign_Arrow_Green_F","Sign_Arrow_Cyan_F"], [[]]] call BIS_fnc_param;
_aiClasses 	= [_this, 1, ["B_Soldier_F"], [[]]] call BIS_fnc_param;
_showDebug 	= [_this, 2, false, [false]] call BIS_fnc_param;

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
	_objects = allMissionObjects _this;
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
		["%1 -> %2 | %3",_current,_next,_current getVariable ["BIS_LINKED",[]]] call BIS_fnc_logFormat;

		//update the wp pools
		_available = _available - [_next];
		_visited = _visited + [_next];

		//store last, as it will be 1 of the endings of the line
		_last = _next;
	};

	//debug print
	["%1 -> %2 | %3",_last,"  ",_last getVariable ["BIS_LINKED",[]]] call BIS_fnc_logFormat;

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
	private["_waypoints","_marker","_colors","_colorid","_color","_text","_markerid"];

	_waypoints 	= [_this,0,[]] call BIS_fnc_param;
	_colorid 	= [_this,1,4] call BIS_fnc_param;

	_colors 	= ["ColorYellow","ColorBlue","ColorPink","ColorGreen","ColorGrey"];
	_color		= [_colors,_colorid,"ColorBlack"] call BIS_fnc_param;

	{
		_markerid = _x call BIS_fnc_objectVar;
		_marker = format["BIS_%1",getPos _x];

		_text = markerText _marker;

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

//spawn soldier
_fn_spawnWalker =
{
	private["_waypoints","_classes","_group","_bot","_class","_spawnpoint","_wp","_currentWpId","_side"];

	_waypoints 	= _this select 0;
	_classes 	= _this select 1;

	//we need at least 2 waypoints
	if (count _waypoints < 2) exitWith
	{
		["[_fn_spawnWalker]: Walker not created, at least 2 waypoints are needed!"] call BIS_fnc_log
	};

	//randomize the spawnpoint
	_currentWpId = round random (count _waypoints - 1);
	_spawnpoint = _waypoints select _currentWpId;

	//randomize the class
	_class = _classes call BIS_fnc_selectRandom;

	_side = getNumber(configfile >> "cfgVehicles" >> _class >> "side");
	_side = [east,west,resistance,civilian] select _side;

	_group = createGroup _side;

	_bot = _group createUnit [_class,getPos _spawnpoint,[],0,"NONE"];
	_bot setSkill 1;
	_bot setCaptive true;
	_bot setPos getPos _spawnpoint;
	_bot setUnitPos "UP";

	//delete waypoints
	while {count waypoints _group > 0} do
	{
		deleteWaypoint [_group, 0];
	};

	//disable some parts of the bot's Ai
	{
		_bot disableAI _x;
	}
	forEach ["TARGET","AUTOTARGET","FSM"];

	{
		_wp = _group addWaypoint [position _x, 0];
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointCombatMode "BLUE";
		_wp setWaypointSpeed "LIMITED";

		if (_forEachIndex == (count _waypoints) - 1) then
		{
			_wp setWaypointType "CYCLE";
		}
		else
		{
			_wp setWaypointType "MOVE";
		};
	}
	forEach _waypoints;

	//set current waypoint
	_group setCurrentWaypoint [_group, _currentWpId];

	//debug
	_bot setVariable ["WAYPOINT_HELPERS",_waypoints];
	_bot
};

//--------------------------------------------------------------------------------------------------
// MAIN EXECUTION CODE
//--------------------------------------------------------------------------------------------------
private["_bot","_bots","_fnc_log_disable"];

_bots = [];

{
	if (true) then
	{
		_fnc_log_disable = true;

		//get sorted waypoint objects
		_wpObjects = _x call _fn_getWaypoints;

		if (count _wpObjects < 2) exitWith {};

		["Un-sorted WPs: %1",_wpObjects] call BIS_fnc_logFormat;

		//sort waypoint objects to line
		_wpObjects = _wpObjects call _fn_sortWaypoints;

		["Sorted WPs: %1",_wpObjects] call BIS_fnc_logFormat;

		//create waypoint loop; applies to both line or circular pathways as both must be looped
		_wpObjects = _wpObjects call _fn_createWaypointLoop;

		["Fixed WPs: %1",_wpObjects] call BIS_fnc_logFormat;

		//draw markers
		if (_showDebug) then
		{
			[_wpObjects,_forEachIndex] call _fn_drawMarkers;
		};

		/*
		{
			["[%1][%2]: %3",typeOf _x,_forEachIndex,(getPosATL _x) select 2] call BIS_fnc_logFormat;

		}
		forEach _wpObjects;
		*/

		//spawn soldier
		_bot = [_wpObjects,_aiClasses] call _fn_spawnWalker;

		_bots = _bots + [_bot];
	};
}
forEach _wpClasses;

_bots