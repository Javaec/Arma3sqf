/*
	File: fn_moduleEffectsShells.sqf
	Author: Borivoj Hlava

	Description:
	Module function. Creates empty ammo cartridges on position of the module logic.

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = _this;
_emitterArray = _logic getVariable "effectEmitter";
_emitter = _emitterArray select 0;
_pos = getPos _logic;

_pos = [_pos select 0,_pos select 1,0.2];
_typeArray = [
	"\A3\weapons_f\ammo\cartridge.p3d",
	"\A3\weapons_f\ammo\cartridge_127.p3d",
	"\A3\weapons_f\ammo\cartridge_65.p3d",
	"\A3\weapons_f\ammo\cartridge_762.p3d",
	"\A3\weapons_f\ammo\cartridge_slug.p3d",
	"\A3\weapons_f\ammo\cartridge_small.p3d"
];

_emitter setPos _pos;

//--- variables set by user
_typeId = parseNumber (_logic getVariable ["Type","0"]);
_size = _logic getVariable ["Size",1];
_number = _logic getVariable ["Density",20];
_lifeTime = _logic getVariable ["LifeTime",60];
_radius = _logic getVariable ["Radius",1];
//---

_int = 0;
_intDrop = 0;
if (_number > 2000) then {	//prevents too small (it wouldn't create any particles) interval or emitter life time
	_int = _number * 0.0001;
	_intDrop = 0.0001;
} else {
	_int = 0.2;
	_intDrop = 0.2/_number;
};

_size = if !(_size < 0) then {_size} else {1};
_lifeTime = if !(_lifeTime <= 0) then {_lifeTime} else {60};
_lifeTimeVar = if (_lifeTime < 100) then {_lifeTime/10} else {10};
_type = if ((_typeId < (count _typeArray)) && !(_typeId < 0)) then {_typeArray select _typeId} else {_typeArray select 0};
_expectedNumber = if (isNil {BIS_fnc_moduleEffectsShells_count}) then {_number} else {BIS_fnc_moduleEffectsShells_count + _number};

if (_expectedNumber > 2000) then {
	debugLog format ["PARTICLE MODULE - WARNING: Cartridge effect modules created %1 particles! Hard limit is 3000, there won't be more particles created!",_expectedNumber];
};

if ((_number > 0) && (_expectedNumber < 3000)) then {
	if (isNil {BIS_fnc_moduleEffectsShells_count}) then {
		BIS_fnc_moduleEffectsShells_count = _number;
		publicVariable "BIS_fnc_moduleEffectsShells_count";
	} else {
		BIS_fnc_moduleEffectsShells_count = BIS_fnc_moduleEffectsShells_count + _number;
		publicVariable "BIS_fnc_moduleEffectsShells_count";
	};
	
	//--- emitter setting
	_emitter setParticleParams [_type, "", "SpaceObject", 1, _lifeTime, [0, 0, 0], [0, 0, -5], 3, 6, 1, 0, [_size],
				  [[0.9,0.9,09.,1]], [1], 0.1, 0.05, "", "", "",0,false,0.1];
		// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],[Barva],
		// [FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt",Angle,OnSurface,BounceOnSurface,EmissiveColor;
	_emitter setParticleRandom [_lifeTimeVar, [_radius/2,_radius/2,0], [0.5,0.5,0], 0, 0, [0,0,0,1], 0, 0];
		// [lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface]
	_emitter setParticleCircle [_radius/2,[0,0,0]];

	//--- particle effect cycle
	_emitter setDropInterval _intDrop;
	sleep _int;
	[_lifeTime + _lifeTimeVar,_number] spawn {
		sleep (_this select 0); 
		BIS_fnc_moduleEffectsShells_count = BIS_fnc_moduleEffectsShells_count - (_this select 1);
		publicVariable "BIS_fnc_moduleEffectsShells_count";
	};
};
deleteVehicle _emitter;