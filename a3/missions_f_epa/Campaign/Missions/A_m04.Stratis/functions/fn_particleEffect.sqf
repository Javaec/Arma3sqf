//Parameters
private ["_object", "_effects"];
_object		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_effects	= [_this, 1, [], [[]]] call BIS_fnc_param;

//The effects container
private "_container";
_container = [];

//Loop classes and start effects
{
	//Parameters
	private ["_class", "_attachTo"];
	_class 		= [_x, 0, "AmmoSmokeParticles2", [""]] call BIS_fnc_param;
	_attachTo 	= [_x, 1, [], [[]]] call BIS_fnc_param;
	
	//Particle effect
	private "_effect";
	_effect = "#particlesource" createVehicleLocal position _object;
	_effect setParticleClass _class;

	//Should effect be attached to object?
	if (count _attachTo > 0) then {
		_effect attachto [_object, _attachTo];
	};
	
	//Store in container
	_container set [count _container, _effect];
	
} forEach _effects;

//Return
_container;
