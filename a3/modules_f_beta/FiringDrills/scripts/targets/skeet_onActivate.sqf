private ["_skeet"];
_skeet = _this select 0;

_skeet enableSimulation true;

sleep 0.1; //Allow enabling simulation

_skeet say (["FD_Skeet_Launch1_F", "FD_Skeet_Launch1_F"] call BIS_fnc_selectRandom);
_skeet setVelocity [1 - (random 2), 1 - (random 2), 18 + (2 - (random 4))];

true