//Params
private "_logic";
_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Validate logic object
if (isNull _logic) exitWith {
	"Logic object must not be null" call BIS_fnc_error;
};

//Site related variables
private ["_id", "_statement", "_center", "_radius"];
_id 		= _logic getVariable "BIS_id";
_statement 	= _logic getVariable "BIS_detectedStatement";
_center 	= _logic getVariable "BIS_center";
_radius		= (_logic getVariable "BIS_radius") select 0;
_alarm		= _logic getVariable "BIS_alarm";

//Flag
_logic setVariable ["BIS_detected", true];

//Execute statement
_logic call _statement;

//Alarm sound
if (!isNull _alarm) then {
	[_logic, _alarm] spawn BIS_fnc_b_m02_2_alarm;
};

//Flare position
private "_flarePosition";
_flarePosition = [_center select 0, _center select 1, 5];

//Flare creation
[_flarePosition, position player] call BIS_fnc_b_m02_2_flare;

//All enemy sites, we need a new array
private "_sites";
_sites = [];

//Copy&paste elements from main list
{ _sites set [count _sites, _x]; } forEach BIS_sites;

//Remove current site from list
_sites = _sites - [_logic];

//Valid sites
private "_validSites";
_validSites = [];

//All the enemy sites that have not detected and been cleared yet
{
	//Site has been cleared?
	if (isNil { _x getvariable "BIS_detected" } && isNil { _x getvariable "BIS_cleared" }) then {
		_validSites set [count _validSites, _x];
	};
} forEach _sites;

//Make sure we have sites left
if (count _validSites > 0) then {
	//Sort by nearest site
	private "_sortByNearest";
	_sortByNearest = [_validSites, [], { _logic distance _x }, "ASCEND"] call BIS_fnc_sortBy;
	
	//The nearest enemy site
	private "_nearestSite";
	_nearestSite = _sortByNearest select 0;
	
	//Make sure player is no where near the nearest site
	if (player distance _nearestSite > _radius) then {
		//Nearest site becomes alerted
		{
			if (leader _x distance position _nearestSite < _radius) then {
				//Enable AI abilities
				{
					_x enableAi "MOVE";
					_x enableAi "ANIM";
				} forEach units _x;
				
				//Set group behaviour
				_x setCombatMode "RED";
				_x setBehaviour "COMBAT";
			};
		} forEach allGroups;
		
		//Spawn enemy group that will investigate the current site
		private "_group";
		_group = [position _nearestSite, RESISTANCE, configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSentry"] call BIS_fnc_spawnGroup;
		
		//Init group
		[_group] call BIS_fnc_B_m02_2_initGroup;
		
		//Send the enemy group to the site where player has been detected
		private "_wp";
		_wp = _group addWaypoint [position _logic, 50];
		_wp setWaypointType "GUARD";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointBehaviour "AWARE";
		
		//Log
		[
			"Enemy group sent from %2 to investigate site %1",
			_logic,
			_nearestSite
		] call BIS_fnc_logFormat;
	};
};

//Groups at the site
//	Enable AI abilities
//	Reveal player
//	Add seek and destroy waypoint
{
	//Make sure group is near the site
	if (side _x != WEST && leader _x distance _center <= _radius) then {
		//Enable AI abilities
		{
			_x enableAi "MOVE";
			_x enableAi "ANIM";
		} forEach units _x;
		
		//Enable attack
		_x enableAttack true;
		
		//Do not flee
		_x allowFleeing 0;
		
		//Reveal player
		_x reveal [player, 4];
		
		//Add waypoint
		private "_waypoint";
		_waypoint = _x addWaypoint [_center, _radius];
		
		//Set waypoint properties
		_waypoint setWaypointType "SAD";
		_waypoint setWaypointBehaviour "COMBAT";
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointSpeed "FULL";
		_waypoint setWaypointCompletionRadius _radius;
		
		//Set as current
		_x setCurrentWaypoint _waypoint;
		
		//Log
		["Group (%1) is now hunting player at (%2)", _x, _id] call BIS_fnc_logFormat;
	};
} forEach allGroups;

//Log
[
	"%1 as detected player",
	_id
] call BIS_fnc_logFormat;

//Return value
true;
