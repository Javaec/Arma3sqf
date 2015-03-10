BIS_fnc_missionEffect_fire = {
	private ["_v"];
	_v = _this select 0;
	BIS_fnc_missionEffect_control = true;
	
	//--- fire effect ---
	[_v] spawn {
		private ["_v","_fireEffect","_vel"];
		_v = _this select 0;
		
		_fireEffect = "#particlesource" createVehicleLocal [0,0,0];
		
		while {(alive _v) && BIS_fnc_missionEffect_control} do {
			_vel = abs ((speed _v) + 1);
			//hint str _vel;		//debug
			_fireEffect attachTo [_v,[0,0.006*_vel,0],"effect1_L"];
			if (_vel > 200) then {_vel = 200};
			_fireEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard", 1, 1 - (0.4*_vel), [0,0,0], 
						[0, 0, 1], 0, 1.275, 1.0, 0.08, [0.8 + (0.0025*_vel),0.13 + (0.00035*_vel)], [[1, 1, 1, 1],[1, 1, 1, 0.01]], [0,1], 0.1, 0.1, "", "", "", 0, false, 0, [[300,300,300,0]]];
			// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],[Barva],
			// [FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
			_fireEffect setParticleRandom [0.1 - (0.035*_vel), [0.2, 0.2, 0.2], [0.2, 0.2, 0.2], 20, 0.05, [0, 0, 0, 0.1], 0, 0];
			//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface] 
			_fireEffect setDropInterval (0.0075 - (0.00003*_vel));
			sleep 0.15;
		};
		deleteVehicle _fireEffect;
	};
	
	//--- light ---
	[_v] spawn {
		private ["_v","_light1"];
		_v = _this select 0;
		
		_light1 = createVehicle ["#lightpoint", (getPos _v), [], 0, "CAN_COLLIDE"];
		_light1 attachTo [_v,[-0.1,-0.3,0.5],"effect1_L"];
		_light1 setLightBrightness 1.0;
		_light1 setLightColor [1,0.65,0.4];
		_light1 setLightAmbient [0.15,0.05,0];
		_light1 setLightIntensity 400;
		_light1 setLightAttenuation [0,0,0,1];
		_light1 setLightDayLight false;
		
		waitUntil {!BIS_fnc_missionEffect_control};
		deleteVehicle _light1;
	};
	
	//--- smoke effect ---
	[_v] spawn {
		private ["_v","_smokeEffect","_vel"];
		_v = _this select 0;
		
		_smokeEffect = "#particlesource" createVehicleLocal [0,0,0];
		
		while {(alive _v) && BIS_fnc_missionEffect_control} do {
			_vel = abs ((speed _v) + 1);
			_smokeEffect attachTo [_v,[0,(0.006*_vel) - 0.4,0],"effect1_L"];
			if (_vel > 200) then {_vel = 200};
			_smokeEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 40], "", "Billboard", 1, 12, [0,0,0], 
						[0, 0, 0.1], 0, 1.2, 1.0, 0.6, [1.6 + (0.0015*_vel),9 + (0.0075*_vel)], [[0.1,0.1,0.1,0.25],[0.2,0.2,0.2,0.1],[0.3,0.3,0.3,0.04],[0.4,0.4,0.4,0.01]], [0,1], 0.1, 0.05 + (0.00125 * _vel), "", "", ""];
			// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],[Barva],
			// [FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
			_smokeEffect setParticleRandom [4, [0.2, 0.2, 0.2], [0.4/_vel, 0.4/_vel, 0.4/_vel], 20, 0.05, [0, 0, 0, 0.1], 0, 0];
			//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface] 
			_smokeEffect setDropInterval (0.06 - (0.00024*_vel));
			sleep 0.15;
		};
		deleteVehicle _smokeEffect;
	};
};

BIS_fnc_missionEffect_smoke = {
	private ["_v"];
	_v = _this select 0;
	BIS_fnc_missionEffect_control = false;
	
	//--- smoke effect ---
	[_v] spawn {
		private ["_v","_smokeEffect","_vel"];
		_v = _this select 0;
		
		_smokeEffect = "#particlesource" createVehicleLocal [0,0,0];
		
		while {(alive _v) && !BIS_fnc_missionEffect_control} do {
			_vel = abs ((speed _v) + 1);
			_smokeEffect attachTo [_v,[0,(0.006*_vel) - 0.4,0],"effect1_L"];
			if (_vel > 200) then {_vel = 200};
			_smokeEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 40], "", "Billboard", 1, 12, [0,0,0], 
						[0, 0, 0.1], 0, 1.2, 1.0, 0.6, [1.6 + (0.0015*_vel),9 + (0.0075*_vel)], [[0.1,0.1,0.1,0.25],[0.2,0.2,0.2,0.1],[0.3,0.3,0.3,0.04],[0.4,0.4,0.4,0.01]], [0,1], 0.1, 0.05 + (0.00125 * _vel), "", "", ""];
			// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],[Barva],
			// [FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
			_smokeEffect setParticleRandom [4, [0.2, 0.2, 0.2], [0.4/_vel, 0.4/_vel, 0.4/_vel], 20, 0.05, [0, 0, 0, 0.1], 0, 0];
			//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface] 
			_smokeEffect setDropInterval (0.06 - (0.00024*_vel));
			sleep 0.15;
		};
		deleteVehicle _smokeEffect;
	};
};