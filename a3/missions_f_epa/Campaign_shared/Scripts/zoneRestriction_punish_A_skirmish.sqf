_rndPos = [position _this, 5 + random 5, random 360] call BIS_fnc_relPos;
_rndPos set [2, 50];

_shell = "Sh_82mm_AMOS" createVehicle _rndPos;
_shell setVectorUp [0, -5, -0.01];
_shell setVelocity [0, 0, -50];