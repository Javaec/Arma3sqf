//Parameters
private ["_unit", "_animationCover", "_animationFire"];
_unit 				= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_animationCover		= toLower([_this, 1, "", [""]] call BIS_fnc_param);
_animationFire		= toLower([_this, 2, "", [""]] call BIS_fnc_param);
_target				= [_this, 3, [0,0,0], [[]]] call BIS_fnc_param;
_roundsPerBurst		= [_this, 4, 10, [0]] call BIS_fnc_param;
_delayBetweenBursts	= [_this, 5, 5, [0]] call BIS_fnc_param;
_delayBetweenShots	= [_this, 6, 0.5, [0]] call BIS_fnc_param;
_condition			= [_this, 7, { true }, [{}]] call BIS_fnc_param;

//Event handlers
private ["_handleDamage"];
_handleDamage = _unit addEventHandler ["HandleDamage", {
	private ["_damage", "_source"];
	_damage = [_this, 2, 0, [0]] call BIS_fnc_param;
	_source = [_this, 3, objNull, [objNull]] call BIS_fnc_param;
	
	//If player caused the damage let it through
	if (_source == player) then {
		_damage;
	} else {
		0;
	};
}];

//The magazine type so we can add magazines if needed
private ["_magazines", "_magazine"];
_magazines 	= getArray (configfile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines");
_magazine	= _magazines select 0;

//The fire mode
private ["_fireModes", "_fireMode"];
_fireModes 	= getArray (configfile >> "CfgWeapons" >> primaryWeapon _unit >> "modes");
_fireMode	= _fireModes select 0;

//The count of shots fired
private "_shotsFired";
_shotsFired = 0;

//Store status
private ["_position", "_animation"];
_position 	= getPosASL _unit;
_animation	= animationState _unit;

//Prepare unit
_unit disableAi "MOVE";
_unit disableAi "ANIM";

//Switch to cover animation
_unit playMoveNow _animationFire;
waitUntil { animationState _unit == _animationFire };

//Main loop
while { alive _unit && _condition } do {
	//In need to reload weapon?
	if (needReload _unit < 1) then {
		if (_shotsFired >= _roundsPerBurst) then {
			//Reset counter
			_shotsFired = 0;
			
			//Go into cover
			_unit playMove _animationCover;
			waitUntil { animationState _unit == _animationCover };
			_unit setPosASL _position;
			
			//Delay between bursts
			sleep _delayBetweenBursts;
			
			//Go into fire
			_unit playMove _animationFire;
			waitUntil { animationState _unit == _animationFire };
		} else {
			//The shots fired
			_shotsFired = _shotsFired + 1;
			
			//Force unit to fire his weapon
			_unit setDir ([_unit, _target] call BIS_fnc_dirTo);
			_unit glanceAt _target;
			_unit lookAt _target;
			_unit doWatch _target;
			_unit selectWeapon primaryWeapon _unit;
			_unit forceWeaponFire [primaryWeapon _unit, _fireMode];
			
			//Delay between each shot
			sleep _delayBetweenShots;
		};
	} else {
		//Add magazines if needed
		if ({ _x == _magazine } count magazines _unit < 4) then {
			_unit addMagazine _magazine;
		};
		
		//Some delay for the reload
		sleep 1.5;
	};
};

//Remove event handlers
_unit removeEventHandler ["HandleDamage", _handleDamage];

//If unit is alive we set old status
if (alive _unit) then {
	_unit enableAi "MOVE";
	_unit enableAi "ANIM";
	_unit setPosASL _position;
	_unit playMoveNow _animation;
};

//Log
["Unit (%1) stopped fire from cover", _unit] call BIS_fnc_logFormat;
