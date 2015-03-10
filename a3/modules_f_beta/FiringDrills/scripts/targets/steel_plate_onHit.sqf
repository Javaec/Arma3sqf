private ["_plate", "_velocity"];
_plate = _this select 0;

_velocity = _this select 1;
if (([_velocity, 1] call BIS_fnc_findExtreme) == 0) then 
{
	_velocity = [0, 0, 0];
} 
else 
{
	_velocity = [_velocity call BIS_fnc_unitVector, 2.75] call BIS_fnc_vectorMultiply;
};

_plate enableSimulation true;

sleep 0.05;

_plate setVelocity _velocity;

true