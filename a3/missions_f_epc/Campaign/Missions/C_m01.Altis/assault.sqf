BIS_assault = TRUE;

BIS_jet enableSimulation TRUE;

{
	_x enableSimulation TRUE;
	_x hideObject FALSE
} forEach list BIS_FUP;

_vehPool = [];

{
	if (!((vehicle _x) in _vehPool) && vehicle driver _x != driver _x) then {
		_vehPool = _vehPool + [vehicle _x];
	}
} forEach ((list BIS_FUP) - [BIS_arty1, BIS_arty2, BIS_arty3, BIS_arty4]);

BIS_landTarget1 setCaptive FALSE;
{_x setCaptive FALSE} forEach units BIS_grpAirBase;

{
	_x setPos markerPos format ["BIS_repos_%1", _forEachIndex + 1];
	_x allowDamage FALSE;
	_grp = group effectiveCommander _x;
	_x setDir 45;
	_grp setFormDir 45;
	_grp setBehaviour "COMBAT";
	leader _grp setSpeedMode "FULL";
	_grp setCombatMode "RED";
	leader _grp move ([position leader _grp, 500, 45] call BIS_fnc_relPos);
} forEach _vehPool;

{
	_veh = _x;
	{_x setPos position _x; deleteVehicle _x} forEach crew _veh;
	deleteVehicle _veh;
} forEach list BIS_FUP;