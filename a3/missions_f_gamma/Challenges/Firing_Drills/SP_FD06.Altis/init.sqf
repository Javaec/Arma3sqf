0 fadeMusic 0;
0 fadeSound 0;
3 fadeMusic 0.35;
3 fadeSound 1;

BIS_FD_Veh1Pos = position BIS_FD_Veh1;
BIS_FD_Veh2Pos = position BIS_FD_Veh2;

sleep 0.1;

BIS_FD_Competitor selectWeapon "hgun_Rook40_snds_F";

waitUntil {!(isNil "BIS_FD_target4_5")};
sleep 1;

BIS_FD_steelCP4 = 
[
	BIS_FD_target4_5, 
	BIS_FD_target4_6, 
	BIS_FD_target4_7, 
	BIS_FD_target4_8, 
	BIS_FD_target4_9
];

{
	_x hideObject true;
} forEach BIS_FD_steelCP4;

true