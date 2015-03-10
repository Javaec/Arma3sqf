_v = _this;

// --- engine exhaust smoke 1 ---
if ((random 1) < 0.75) then {
	[_v] spawn {
		_v = _this select 0;
		while {!(isNull _v)} do {
			_posV = getPos _v;
			_smoke1 = "#particlesource" createVehicleLocal getpos _v;
			_smoke1 attachTo [_v,[0,0,0],"engine_effect_1"];
			_pos = getPos _smoke1;
			deleteVehicle _smoke1;
			_smoke1 = "#particlesource" createVehicleLocal getpos _v;
			_smoke1 setPos _pos;
			_smoke1 setParticleClass "WreckSmokeSmall";
			if (isNil {_v getVariable "smokeSound"}) then {
				_smokeSound1 = createSoundSource ["Sound_SmokeWreck1", _pos, [], 0];
				_v setVariable ["smokeSound",_smokeSound1];
			};
			while {(_posV distance (getPos _v)) < 0.5} do {
				sleep 5
			};
			deleteVehicle _smoke1;
			if !(isNil {_v getVariable "smokeSound"}) then {deleteVehicle (_v getVariable "smokeSound")};
		};
	};
};

// --- engine exhaust smoke 2 ---
if ((random 1) < 0.75) then {
	[_v] spawn {
		_v = _this select 0;
		while {!(isNull _v)} do {
			_posV = getPos _v;
			_smoke2 = "#particlesource" createVehicleLocal getpos _v;
			_smoke2 attachTo [_v,[0,0,0],"engine_effect_2"];
			_pos = getPos _smoke2;
			deleteVehicle _smoke2;
			_smoke1 = "#particlesource" createVehicleLocal getpos _v;
			_smoke1 setPos _pos;
			_smoke1 setParticleClass "WreckSmokeSmall";
			if (isNil {_v getVariable "smokeSound"}) then {
				_smokeSound2 = createSoundSource ["Sound_SmokeWreck1", _pos, [], 0];
				_v setVariable ["smokeSound",_smokeSound2];
			};
			while {(_posV distance (getPos _v)) < 0.5} do {
				sleep 5.11
			};
			deleteVehicle _smoke1;
			if !(isNil {_v getVariable "smokeSound"}) then {deleteVehicle (_v getVariable "smokeSound")};
		};
	};
};

// --- avionics sparks 1 (gunner's display) ---
[_v] spawn {
	_v = _this select 0;
	sleep (5 + random 20);
	while {!(isNull _v)} do {
		_sparks = "#particlesource" createVehicleLocal getpos _v;
		_sparks attachTo [_v,[0,0,0],"avionics_effect_4"];
		_pos = getPos _sparks;
		deleteVehicle _sparks;
		_posV = getPos _v;
		
		while {(_posV distance (getPos _v)) < 0.5} do {
			_sparks = "#particlesource" createVehicleLocal getpos _v;
			_sparks setPos _pos;
			_sparks setParticleClass "AvionicsSparks";
			_sparksSound1 = createSoundSource ["Sound_SparklesWreck2", _pos, [], 0];
			sleep 1.5;
			deleteVehicle _sparksSound1;
			deleteVehicle _sparks;
			
			sleep (5 + random 20);
		};
	};
};

// --- avionics sparks 2 (gunner's controls) ---
[_v] spawn {
	_v = _this select 0;
	sleep (5 + random 20);
	while {!(isNull _v)} do {
		_sparks = "#particlesource" createVehicleLocal getpos _v;
		_sparks attachTo [_v,[0,0,0],"avionics_effect_6"];
		_pos = getPos _sparks;
		deleteVehicle _sparks;
		_posV = getPos _v;
		
		while {(_posV distance (getPos _v)) < 0.5} do {			
			_sparks = "#particlesource" createVehicleLocal getpos _v;
			_sparks setPos _pos;
			_sparks setParticleClass "AvionicsSparks";
			
			_smoke = "#particlesource" createVehicleLocal getpos _v;
			_smoke setPos _pos;
			_smoke setParticleClass "AvionicsSmoke";
			_sparksSound2 = createSoundSource ["Sound_SparklesWreck1", _pos, [], 0];
			
			sleep 1.5;
			deleteVehicle _sparks;
			sleep 1.5;
			deleteVehicle _sparksSound2;
			deleteVehicle _smoke;
			
			sleep (5 + random 20);
		};
	};
};

// --- avionics sparks 3 (pilot's controls) ---
[_v] spawn {
	_v = _this select 0;
	sleep (5 + random 20);
	while {!(isNull _v)} do {
		_sparks = "#particlesource" createVehicleLocal getpos _v;
		_sparks attachTo [_v,[0,0,0],"avionics_effect_5"];
		_pos = getPos _sparks;
		deleteVehicle _sparks;
		_posV = getPos _v;
		
		while {(_posV distance (getPos _v)) < 0.5} do {			
			_sparks = "#particlesource" createVehicleLocal getpos _v;
			_sparks setPos _pos;
			_sparks setParticleClass "AvionicsSparks";
			
			_smoke = "#particlesource" createVehicleLocal getpos _v;
			_smoke setPos _pos;
			_smoke setParticleClass "AvionicsSmoke";
			_sparksSound3 = createSoundSource ["Sound_SparklesWreck1", _pos, [], 0];
			
			sleep 1.5;
			deleteVehicle _sparks;
			sleep 1.5;
			deleteVehicle _sparksSound3;
			deleteVehicle _smoke;
			
			sleep (5 + random 20);
		};
	};
};