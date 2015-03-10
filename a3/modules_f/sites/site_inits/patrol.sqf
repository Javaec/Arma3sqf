_groupsPool =  call compile (_this getVariable "groupsPool");
_waypointsPool =  call compile (_this getVariable "waypointsPool");
_patrolSide = EAST;

// ---------- grab waypoints from the input window
{
	if (!((group _x) in _waypointsPool)) then {
		_waypointsPool = _waypointsPool + [group _x];
	};
	_waypointsPool = _waypointsPool - [_x];
} forEach _waypointsPool;

// ---------- sort all synced objects into patrols or waypoints
{
	if (!isNull group _x) then {
		if (side _x == CIVILIAN && !((group _x) in _waypointsPool)) then {
			_waypointsPool = _waypointsPool + [group _x];
		} else {
			if (!((group _x) in _groupsPool)) then {
				_groupsPool = _groupsPool + [group _x];
				(group _x) setVariable ["BIS_patrolSyncUnit", _x];
			}
		}
	}
} forEach synchronizedObjects _this;

_pickedGrp = _groupsPool select floor random count _groupsPool;
_pickedWPs = objNull;

// ---------- pick waypoints, check for specific routes for picked group
if (typeName _pickedGrp == typeName grpNull) then {
	_specificWPs = [];
	{
		if ((group _x) in _waypointsPool && !((group _x) in _specificWPs)) then {
			_specificWPs = _specificWPs + [group _x]
		}
	} forEach synchronizedObjects (_pickedGrp getVariable "BIS_patrolSyncUnit");
	if (count _specificWPs > 0) then {
		_pickedWPs = _specificWPs select floor random count _specificWPs
	} else {
		_pickedWPs = _waypointsPool select floor random count _waypointsPool
	}
} else {
	_pickedWPs = _waypointsPool select floor random count _waypointsPool;
};

if (count _groupsPool == 0 || isNull _pickedWPs) exitWith {"Missing input parameters" call BIS_fnc_error};

// ---------- clean up groups
{
	if (typeName _x == typeName grpNull) then {
		_grp = _x;
		{
			deleteVehicle vehicle _x;
			deleteVehicle _x;
		} forEach units _grp;
		deleteGroup _grp;
	};
} forEach (_groupsPool - [_pickedGrp]);

// ---------- clean up waypoints
{
	_grp = _x;
	{
		deleteVehicle vehicle _x;
		deleteVehicle _x;
	} forEach units _grp;
	deleteGroup _grp;
} forEach (_waypointsPool - [_pickedWPs]);

// ---------- if a group is picked as a config entry, spawn the group
if (typeName _pickedGrp != typeName grpNull) then {
	if (getText (_pickedGrp >> "faction") == "BLU_F") then {
		_patrolSide = WEST
	} else {
		if (getText (_pickedGrp >> "faction") in ["IND_F", "Guerilla"]) then {
			_patrolSide = RESISTANCE
		}
	};
	_pickedGrp = [position _this, _patrolSide, _pickedGrp, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
	_pickedGrp setFormDir direction _this;
};

_pickedGrp copyWaypoints _pickedWPs;

// ---------- final clean-up
{
	deleteVehicle vehicle _x;
	deleteVehicle _x;
} forEach units _pickedWPs;
deleteGroup _pickedWPs;