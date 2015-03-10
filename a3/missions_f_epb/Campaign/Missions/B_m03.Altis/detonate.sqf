BIS_detonated = TRUE;

{_bomb = "Bo_Mk82_MI08" createVehicle position BIS_cistern2; _bomb setPos position BIS_cistern2} forEach [1];
BIS_cistern2 setDamage 1;

[] spawn {
	sleep 1;
	BIS_tgtCar setDamage 1;
	BIS_tgt setDamage 1;
};