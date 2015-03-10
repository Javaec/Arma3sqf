private ["_skeet", "_pos", "_vel"];
_skeet = (_this select 0) select 0;
_skeet setDamage 1;
_pos = getPos _skeet;
_vel = velocity _skeet;
deleteVehicle _skeet;

[_pos, _vel, _skeet getVariable ["color", "orange"]] spawn BIS_fnc_moduleFDSkeetDestruction;

true