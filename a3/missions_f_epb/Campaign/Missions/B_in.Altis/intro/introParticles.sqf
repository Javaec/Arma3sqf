private "_dummy";
_dummy = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

sleep 23.5;

//Particle effect
private "_effect";
_effect = "#particlesource" createVehicleLocal position _dummy;
_effect setParticleClass "DustMan";
_effect attachto [_dummy, [0,0,0], "LeftHand"];

sleep 1;

deleteVehicle _effect;
