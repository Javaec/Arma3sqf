//Parameters
private ["_positions", "_classes", "_side"];
_positions	= [_this, 0, [[0,0,0], [0,0,0]], [[]], 2] call BIS_fnc_param;
_classes	= [_this, 1, ["I_Truck_02_transport_F", "O_Truck_02_transport_F", "I_Truck_02_covered_F", "O_Truck_02_covered_F", "I_MRAP_03_F", "I_MRAP_03_gmg_F", "I_MRAP_03_hmg_F", "O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"], [[]]] call BIS_fnc_param;
_side		= [_this, 2, EAST, [EAST]] call BIS_fnc_param;

if (isNil { missionNameSpace getVariable "BIS_trafficGroups" }) then {
	missionNameSpace setVariable ["BIS_trafficGroups", []];
};

//Shuffle the positions list
private "_positionsShuffled";
//_positionsShuffled = _positions call BIS_fnc_arrayShuffle;
_positionsShuffled = _positions;

//Start and end positions
private ["_positionStart", "_positionEnd"];
_positionStart 	= _positionsShuffled select 0;
_positionEnd	= _positionsShuffled select 1;

//The class
private "_class";
_class = _classes call BIS_fnc_selectRandom;

//Spawn the vehicle
private ["_container", "_vehicle", "_crew", "_group"];
_container 	= [_positionStart, [_positionStart, _positionEnd] call BIS_fnc_dirTo, _class, _side] call BIS_fnc_spawnVehicle;
_vehicle	= _container select 0;
_crew		= _container select 1;
_group		= _container select 2;

//Store the vehicle into the group namespace
_group setVariable ["BIS_groupVehicle", _vehicle];

//Lock vehicle
_vehicle lock 2;

//Add waypoint
private "_waypoint";
_waypoint = _group addWaypoint [_positionEnd, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed (["LIMITED", "NORMAL"] call BIS_fnc_selectRandom);
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";
_waypoint setWaypointFormation "FILE";
_waypoint setWaypointStatements ["true", format ["_group = group this; _units = units _group; _vehicle = _group getVariable ['BIS_groupVehicle', objNull]; missionNameSpace setVariable ['BIS_trafficGroups', (missionNameSpace getVariable 'BIS_trafficGroups') - [_group]]; { if (_x distance %1 < 50) then {deleteVehicle _x; }; } forEach _units + [_vehicle]; if (count units _group < 1) then { deleteGroup _group; };", _positionEnd]];

//Add to list
missionNameSpace setVariable ["BIS_trafficGroups", (missionNameSpace getVariable "BIS_trafficGroups") + [_group]];

//Remove radio from all units
{
	_x unassignItem "itemRadio";
	_x removeItem "itemRadio";
} forEach units _group;

//Log
["Traffic group (%1)", _group] call BIS_fnc_logFormat;

//Return
true;
