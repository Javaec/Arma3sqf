0 fadeMusic 0;
0 fadeSound 0;
3 fadeMusic 0.35;
3 fadeSound 1;

0 setRain 0;

[BIS_FD_restartSelector1, 0.65] call BIS_fnc_setHeight;
[BIS_FD_quitSelector1, 0.63] call BIS_fnc_setHeight;

sleep 0.1;

BIS_FD_Competitor selectWeapon "hgun_ACPC2_F";

waitUntil {!(isNil "BIS_FD_target9_1")};
sleep 1;

BIS_FD_steelCP9 = 
[
	BIS_FD_target9_1, 
	BIS_FD_target9_2, 
	BIS_FD_target9_3, 
	BIS_FD_target9_4, 
	BIS_FD_target9_5, 
	BIS_FD_target9_6, 
	BIS_FD_target9_7
];

{
	_x hideObject true;
} forEach BIS_FD_steelCP9;

true