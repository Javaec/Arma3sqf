//Parameters
private ["_group", "_position", "_type", "_behaviour", "_combat", "_speed", "_formation", "_radius", "_statements", "_current", "_visible"];
_group		= [_this, 0, grpNull, [grpNull, objNull]] call BIS_fnc_param;
_position	= [_this, 1, [], [[]]] call BIS_fnc_param;
_type		= [_this, 2, "MOVE", [""]] call BIS_fnc_param;
_behaviour	= [_this, 3, "AWARE", [""]] call BIS_fnc_param;
_combat		= [_this, 4, "YELLOW", [""]] call BIS_fnc_param;
_speed		= [_this, 5, "NORMAL", [""]] call BIS_fnc_param;
_formation	= [_this, 6, "WEDGE", [""]] call BIS_fnc_param;
_radius		= [_this, 7, 0, [0]] call BIS_fnc_param;
_statements	= [_this, 8, ["true", ""], [[]]] call BIS_fnc_param;
_current	= [_this, 9, false, [false]] call BIS_fnc_param;
_visible	= [_this, 10, false, [false]] call BIS_fnc_param;

//Statements
private ["_condition", "_statement"];
_condition	= [_statements, 0, "true", [""]] call BIS_fnc_param;
_statement	= [_statements, 1, "", [""]] call BIS_fnc_param;

//Validate group
if (isNull _group) exitWith {
	"Group parameter must not be null. Accepted: GROUP or OBJECT" call BIS_fnc_error;
};

//Validate position
if (count _position < 2) exitWith {
	"Position is invalid" call BIS_fnc_error;
};

//Object given instead of group?
if (typeName _group == "OBJECT") then {
	//If object was given instead of group make sure it is either a unit or a vehicle with units
	if (_group isKindOf "MAN") then {
		//Use unit group
		_group = group _group;
	} else {
		//Vehicle does not have crew
		if (count crew _group < 1) exitWith {
			"Vehicle given as GROUP has no crew" call BIS_fnc_error;
		};
		
		//Vehicle has crew, get group of one of them, priority: driver, gunner, cargo
		if (!isNull group driver _group) then {
			//Driver
			_group = group driver _group;
		} else {
			if (!isNull group gunner _group) then {
				//Gunner
				_group = group gunner _group;
			} else {
				//Cargo
				_group = group ((crew _group) select 0);
			};
		};
	};
};

//The waypoint
private "_waypoint";
_waypoint = _group addWaypoint [_position, _radius];
_waypoint setWaypointType _type;
_waypoint setWaypointBehaviour _behaviour;
_waypoint setWaypointCombatMode _combat;
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointFormation _formation;
_waypoint setWaypointCompletionRadius _radius;
_waypoint setWaypointStatements [_condition, _statement];

//Should the waypoint be visible
if (!_visible) then {
	_waypoint setWaypointVisible false;
	_waypoint showWaypoint "NEVER";
};

//Set as current
if (_current) then {
	_group setCurrentWaypoint _waypoint;
};

//Log
["Group: %1 / Type: %2 / Behaviour: %3 / CombatMode: %4 / Speed: %5 / Formation: %6 / Radius: %7 / Statements: %8 / Current: %9 / Visible: %10", _group, _type, _behaviour, _combat, _speed, _formation, _radius, _statements, _current, _visible] call BIS_fnc_logFormat;

//Return
_waypoint;
