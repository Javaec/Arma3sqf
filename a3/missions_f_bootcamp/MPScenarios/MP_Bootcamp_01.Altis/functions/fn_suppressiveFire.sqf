//Parameters
private ["_condition", "_vehicle", "_weapon", "_target", "_radius", "_rateOfFire", "_delay"];
_condition	= [_this, 0, { true }, [{}]] call BIS_fnc_param;
_vehicle	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_weapon		= [_this, 2, "", [""]] call BIS_fnc_param;
_target		= [_this, 3, [], [[]]] call BIS_fnc_param;
_radius		= [_this, 4, 0, [0]] call BIS_fnc_param;
_rateOfFire	= [_this, 5, [15, 20], [[]]] call BIS_fnc_param;
_delay		= [_this, 6, [0.5, 1], [[]]] call BIS_fnc_param;

//Validate vehicle
if (isNull _vehicle) exitWith {
	"Vehicle not defined" call BIS_fnc_error;
};

//Validate weapon
if (_weapon == "") exitWith {
	"Weapon not defined" call BIS_fnc_error;
};

//Validate target
if (count _target < 2) exitWith {
	"Target not defined" call BIS_fnc_error;
};

//The main loop
while _condition do {
	//The final target
	private "_targetFinal";

	//If radius is bigger then 0 we get a random position within a circle
	if (_radius > 0) then {
		_targetFinal = [_target, _radius, random 360] call BIS_fnc_relPos;
	} else {
		_targetFinal = _target;
	};

	//Aim
	_vehicle doWatch _targetFinal;
	_vehicle glanceAt _targetFinal;
	_vehicle lookAt _targetFinal;

	//Number of rounds to fire
	private "_rounds";
	_rounds = floor (_rateOfFire call BIS_fnc_randomNum);

	//The amount of time between bursts
	private "_delayFinal";
	_delayFinal = _delay call BIS_fnc_randomNum;

	//The delay
	sleep _delayFinal;

	//Fire
	for "_i" from 1 to _rounds do {
		if !(call _condition) exitWith {};
		
		//Add event handler
		private "_eventHandler";
		_eventHandler = _vehicle addEventHandler ["Fired", { (_this select 0) setVariable ["BIS_vehicleHasFired", true]; }];

		//Fire weapon
		_vehicle selectWeapon _weapon;
		_vehicle fire _weapon;

		//Wait
		waitUntil { !isNil { _vehicle getVariable "BIS_vehicleHasFired" } };

		//Reset
		_vehicle removeEventHandler ["Fired", _eventHandler];
		_vehicle setVariable ["BIS_vehicleHasFired", nil];
	};

	//Refill ammo
	_vehicle setVehicleAmmo 1;
};

//Log
["Vehicle (%1) has finished firing", _vehicle] call BIS_fnc_logFormat;
