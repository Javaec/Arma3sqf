//Parameters
private ["_group", "_waypoints"];
_group 		= [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;
_waypoints 	= [_this, 1, [], [[]]] call BIS_fnc_param;

//Waypoints
{
	//Parameters
	private ["_position", "_type", "_radius", "_properties", "_statements", "_setCurrent"];
	_position 	= [_x, 0, [0,0,0], [[]]] call BIS_fnc_param;
	_type		= [_x, 1, "MOVE", [""]] call BIS_fnc_param;
	_radius 	= [_x, 2, 25, [0]] call BIS_fnc_param;
	_properties 	= [_x, 3, [], [[]]] call BIS_fnc_param;
	_statements	= [_x, 4, [], [[]]] call BIS_fnc_param;
	_setCurrent	= [_x, 5, false, [false]] call BIS_fnc_param;
	
	//Properties
	private ["_behaviour", "_combatMode", "_formation", "_speed"];
	_behaviour 	= [_properties, 0, "AWARE", [""]] call BIS_fnc_param;
	_combatMode	= [_properties, 1, "YELLOW", [""]] call BIS_fnc_param;
	_formation	= [_properties, 2, "WEDGE", [""]] call BIS_fnc_param;
	_speed		= [_properties, 3, "NORMAL", [""]] call BIS_fnc_param;
	
	//Statements
	private ["_condition", "_statement"];
	_condition	= [_statements, 0, "true", [""]] call BIS_fnc_param;
	_statement	= [_statements, 1, "", [""]] call BIS_fnc_param;
	
	//Waypoint
	private "_waypoint";
	_waypoint = _group addWaypoint [_position, _radius];
	
	//Waypoint properties
	_waypoint setWaypointType _type;
	_waypoint setWaypointBehaviour _behaviour;
	_waypoint setWaypointCombatMode _combatMode;
	_waypoint setWaypointFormation _formation;
	_waypoint setWaypointSpeed _speed;
	_waypoint setWaypointCompletionRadius _radius;
	_waypoint setWaypointStatements [_condition, _statement];
	
	//Hide
	_waypoint setWaypointVisible false;
	_waypoint showWaypoint "NEVER";
	
	//Set as current waypoint
	if (_setCurrent) then {
		_group setCurrentWaypoint _waypoint;
	};
} forEach _waypoints;

//Return
true;
