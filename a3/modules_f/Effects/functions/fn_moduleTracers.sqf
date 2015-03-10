_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_sideID = (_logic getvariable ["Side","0"]) call bis_fnc_parsenumber;
	_side = _sideID call bis_fnc_sideType;
	_min = (_logic getvariable ["Min","10"]) call bis_fnc_parsenumber;
	_max = (_logic getvariable ["Max","20"]) call bis_fnc_parsenumber;
	_max = _max - _min;

	_veh = createvehicle ["B_Boat_Armed_01_minigun_F",position _logic,[],0,"none"];
	_veh attachto [_logic,[0,0,10]];
	_veh hideobject true;
	_veh setvehicleammo 0;
	_veh addmagazine (["200Rnd_65x39_belt_Tracer_Green","200Rnd_65x39_belt_Tracer_Red","200Rnd_65x39_belt_Tracer_Yellow"] select _sideID);
	_vehPos = position _veh;
	_vehPosX = _vehPos select 0;
	_vehPosY = _vehPos select 1;
	_vehPosZ = _vehPos select 2;

	createcenter _side;
	_grp = creategroup _side;
	_gunner = _grp createunit ["b_soldier_f",_vehPos,[],0,"none"];
	_gunner disableai "move";
	_gunner disableai "target";
	_gunner disableai "autotarget";
	_gunner setbehaviour "combat";
	_gunner moveingunner _veh;

	_logic setvariable ["bis_fnc_moduleTracers_veh",_veh];

	_weapon = weapons _veh select 0;
	_veh selectweapon _weapon;
	_veh action ["lightoff",_veh];

	while {!isnull _veh} do {
		_veh setvehicleammo 1;
		_time = time + 0.1 + random 0.9;
		_delay = 0.05 + random 0.1;
		_dir = -5 + random 10;
		while {time < _time} do {
			_veh fire _weapon;
			_ammo = _veh ammo _weapon;
			_veh setdir (direction _veh + _dir);
			sleep _delay;
			if (random 1 > 0.95) then {sleep (2 * _delay)};
		};
		_veh setdir (random 360);
		_veh dowatch [_vehPosX,_vehPosY,_vehPosZ + 2 + random 8];
		sleep (_min + random _max);
	};
} else {
	_veh = _logic getvariable ["bis_fnc_moduleTracers_veh",objnull];
	deletevehicle _veh;
};