//Parameters
private ["_condition", "_vehicle", "_weapon", "_target", "_rateOfFire", "_delay"];
_condition	= [_this, 0, { true }, [{}]] call BIS_fnc_param;
_vehicle	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_weapon		= [_this, 2, "", [""]] call BIS_fnc_param;
_target		= [_this, 3, objNull, [objNull]] call BIS_fnc_param;
_rateOfFire	= [_this, 4, [10, 20], [[]]] call BIS_fnc_param;
_delay		= [_this, 5, [2, 4], [[]]] call BIS_fnc_param;

//The main loop
while _condition do {
	//Aim
	{
		_x reveal [_target, 4];
		_x doWatch _target;
		_x glanceAt _target;
		_x lookAt _target;
		_x doTarget _target;
		_x doFire _target;
	} forEach [_vehicle, gunner _vehicle];
	
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
