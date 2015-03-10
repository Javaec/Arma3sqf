scriptName "Showcase_Combined_Arms\scripts\reinforcements.sqf";

//Params
private ["_centerVehicles", "_centerTroops", "_vehicleClasses", "_troopCfgs", "_delay"];
_centerVehicles 	= [_this, 0, getMarkerPos "BIS_vehiclesReinforcements", [[]]] call BIS_fnc_param;
_centerTroops		= [_this, 1, getMarkerPos "BIS_troopsReinforcements", [[]]] call BIS_fnc_param;
_vehicleClasses 	= [_this, 2, ["O_APC_Wheeled_02_rcws_F"], [[]]] call BIS_fnc_param;
_troopCfgs 		= [_this, 3, [configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam", configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam", configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"], [[]]] call BIS_fnc_param;
_delay			= [_this, 4, 45, [0]] call BIS_fnc_param;

//Containers
private ["_vehicles", "_infantry"];
_vehicles	= [];
_troops		= [];

//Some delay until reinforcements are actually spawned
sleep _delay;

//Spawn the vehicles
{
	//Position and direction of spawn
	private ["_position", "_direction"];
	_position	= [_centerVehicles, 0, 100, 5, 0, 10, 0, [], [_centerVehicles]] call BIS_fnc_findSafePos;
	_direction	= [_position, getMarkerPos "BIS_enemy"] call BIS_fnc_dirTo;
	
	//The vehicle
	private ["_container", "_vehicle", "_crew", "_group"];
	_container	= [_position, _direction, _x, EAST] call BIS_fnc_spawnVehicle;
	_vehicle	= _container select 0;
	_crew		= _container select 1;
	_group		= _container select 2;
	
	//Do not allow flee
	_group allowFleeing 0;
	
	//Add SAD waypoint
	private "_wp";
	_wp = _group addWaypoint [getMarkerPos "BIS_enemy", 50];
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointType "SAD";
	
	//Remove grenade magazine
	_vehicle removeMagazineTurret ["96Rnd_40mm_G_belt", [0]];
	
	//Store vehicle
	_vehicles set [count _vehicles, _vehicle];
	
} forEach _vehicleClasses;

//Spawn the troops
{
	//The spawn position
	private "_position";
	_position = [_centerTroops, 0, 100, 4, 0, 10, 0, [], [_centerTroops]] call BIS_fnc_findSafePos;
	
	//The group
	private "_group";
	_group = [_position, EAST, _x] call BIS_fnc_spawnGroup;
	
	//Do not allow flee
	_group allowFleeing 0;
	
	//Add Move waypoint
	private "_wp";
	_wp = _group addWaypoint [getMarkerPos "BIS_enemy", 50];
	_wp setWaypointType "MOVE";
	_wp setWaypointFormation "WEDGE";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointCombatMode "YELLOW";
	_wp setWaypointbehaviour "AWARE";
	
	{
		private "_unit";
		_unit = _x;
		
		//Remove optics
		{
			private "_type";
			_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
			
			if (_type == 201) then {
				_unit removePrimaryWeaponItem _x;
			};
		} forEach primaryWeaponItems _unit;
		 
		//Store the units
		_troops set [count _troops, _unit];
		
	} forEach units _group;
	
} forEach _troopCfgs;

//Vehicles must be destroyed or unable to move
//Troops must be dead or fleeing
waitUntil {
	{ alive _x && canMove _x && !fleeing _x } count _vehicles < 1
	&&
	{ alive _x && !fleeing _x } count _troops < 1
};

//Some delay after all reinfocements are killed
sleep 15;
