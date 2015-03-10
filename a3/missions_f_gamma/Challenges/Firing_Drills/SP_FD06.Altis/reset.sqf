//Re-position, repair and refuel both vehicles
BIS_FD_Veh1 engineOn false;
BIS_FD_Veh1 setPos BIS_FD_Veh1Pos;
BIS_FD_Veh1 setDamage 0;
BIS_FD_Veh1 setFuel 1;

BIS_FD_Veh2 engineOn false;
BIS_FD_Veh2 setPos BIS_FD_Veh2Pos;
BIS_FD_Veh2 setDamage 0;
BIS_FD_Veh2 setFuel 1;

{
	_x hideObject true;
} forEach BIS_FD_steelCP4;

sleep 0.1;

BIS_FD_Competitor selectWeapon "hgun_Rook40_snds_F";

true