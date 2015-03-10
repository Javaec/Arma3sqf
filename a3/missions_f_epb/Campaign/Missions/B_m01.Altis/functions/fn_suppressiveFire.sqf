//Parameters
private ["_unit", "_target", "_roundsPerBurst", "_delayBetweenBursts", "_delayBetweenShots", "_condition"];
_unit 			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target			= [_this, 1, [0,0,0], [[]]] call BIS_fnc_param;
_roundsPerBurst		= [_this, 2, 20, [0]] call BIS_fnc_param;
_delayBetweenBursts	= [_this, 3, 2, [0]] call BIS_fnc_param;
_delayBetweenShots	= [_this, 4, 0.2, [0]] call BIS_fnc_param;
_condition		= [_this, 5, { true }, [{}]] call BIS_fnc_param;

//The magazine type so we can add magazines if needed
private ["_magazines", "_magazine"];
_magazines 	= getArray (configfile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
_magazine	= _magazines select 0;

//The relative direction between unit and target
private "_direction";
_direction = [_unit, _target] call BIS_fnc_dirTo;

//Prepare unit
_unit disableAi "MOVE";
_unit disableAi "ANIM";

//The shots fired
private "_shotsFired";
_shotsFired = 0;

//Main loop
while { alive _unit && _condition } do {
	//In deed to reload weapon?
	if (needReload _unit < 1) then {
		//Add magazines
		if ({ _x == _magazine } count magazines _unit < 2) then {
			_unit addMagazine _magazine;
		};
		
		//The shots fired
		_shotsFired = _shotsFired + 1;
		
		if (_shotsFired >= _roundsPerBurst) then {
			//Reset counter
			_shotsFired = 0;
			
			//Delay between bursts
			sleep _delayBetweenBursts;
		} else {
			//Force unit to fire his weapon
			_unit setDir _direction;
			_unit doWatch _target;
			_unit selectWeapon primaryWeapon _unit;
			_unit forceWeaponFire [primaryWeapon _unit, "Manual"];
			
			//Delay between each shot
			sleep _delayBetweenShots;
		};
	} else {
		sleep 1;
	};
};

//Enable AI
_unit enableAi "MOVE";
_unit enableAi "ANIM";

//Log
["Unit (%1) stopped suppressing fire", _unit] call BIS_fnc_logFormat;
