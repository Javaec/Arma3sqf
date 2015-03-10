//Parameters
private ["_position", "_condition"];
_position	= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_condition	= [_this, 1, { true }, [{}]] call BIS_fnc_param;

//The vehicle
private "_vehicle";
_vehicle = createvehicle ["B_Boat_Armed_01_minigun_F", _position, [], 0, "none"];
_vehicle hideobject true;
_vehicle allowDamage false;
_vehicle setvehicleammo 0;
_vehicle addmagazine "200Rnd_65x39_belt_Tracer_Green";
_vehPos = position _vehicle;
_vehPosX = _vehPos select 0;
_vehPosY = _vehPos select 1;
_vehPosZ = _vehPos select 2;

//The group
private "_group";
_group = creategroup RESISTANCE;

//The gunner
private "_gunner";
_gunner = _group createunit ["b_soldier_f", _vehPos, [], 0, "none"];
_gunner setbehaviour "combat";
_gunner moveingunner _vehicle;

//Disable AI and set as captive
["aiDisable", [group _gunner, true]] call BIS_fnc_C_m02_groupManager;
["setCaptive", [group _gunner, true]] call BIS_fnc_C_m02_groupManager;

//The weapon to fire
private "_weapon";
_weapon = (weapons _vehicle) select 0;
_vehicle selectweapon _weapon;
_vehicle action ["lightoff", _vehicle];

while _condition do {
	_vehicle setvehicleammo 1;
	_time = time + 0.1 + random 0.9;
	_delay = 0.05 + random 0.1;
	_direction = -5 + random 10;
	
	while { time < _time } do {
		_vehicle fire _weapon;
		_ammo = _vehicle ammo _weapon;
		_vehicle setdir (direction _vehicle + _direction);
		sleep _delay;
		if (random 1 > 0.95) then {sleep (2 * _delay)};
	};
	
	_vehicle setdir (random 360);
	_vehicle dowatch ([_vehicle, 10, random 360] call BIS_fnc_relPos);
};

//Clean up
deleteVehicle _vehicle;
deleteVehicle _gunner;
deleteGroup _group;

//Return
true;
