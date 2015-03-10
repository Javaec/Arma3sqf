
/*
	Author: Karel Moricky

	Description:
	Spawns enemies around players

	Parameter(s):
	_this select 0: OBJECT - player
	_this select 1: OBJECT - refence object (enemies will be spawned on opposite direction)
	_this select 2: SIDE - side of enemies
	_this select 3 (Optional): ARRAY - list of enemy classes
	_this select 4 (Optional): NUMBER - delay between spawning
	_this select 5 (Optional): CODE - code executed on every soldier. Unit is passed as _this

	Returns:
	ARRAY - list of all spawned crows
*/

_player = _this select 0;
_target = _this select 1;
_side = _this select 2;
_classList = _this select 3;
_maxCount = if (count _this > 4) then {_this select 4} else {10};
_delay = if (count _this > 5) then {_this select 5} else {30};
_code = if (count _this > 6) then {_this select 6} else {{}};

if (typename _target == typename objnull) then {_target = [_target,_target];};

_otherPlayer = (_players - [_player]) select 0;
_grp = creategroup _side;
_wp = _grp addwaypoint [position _player,10];
_wp setwaypointstatements ["false",""];
_wp setwaypointtype "guard";
_wp waypointattachvehicle _player;
_player setvariable ["BIS_spawnedEnemies",[]];

while {true} do {
	waituntil {sleep 1; isplayer _player};
	waituntil {sleep 1; {alive _x} count (_player getvariable "BIS_spawnedEnemies") < _maxCount};

	_class = _classList call bis_fnc_selectrandom;
	_dirToTarget = if (isMultiplayer) then {
		_targetTemp = _target select 1;
		([_player,_targetTemp] call bis_fnc_dirTo)
	} else {
		_targetTemp = _target select isMultiplayer;
		([_player,_targetTemp] call bis_fnc_dirTo) + 180
	};
	_pos = [position _player, 180 + random 40, _dirToTarget + 90 + random 180] call BIS_fnc_relPos;
	_unit = _grp createunit [_class,_pos,[],1,""];
	_unit setskill (random 0.5);
	_unit allowfleeing 0;
	_unit setvehicleammo (0.5 + random 0.5);
	if (random 1 > 0.5) then {_unit setunitpos "up"} else {_unit setunitpos "middle"};
	[_player,"BIS_spawnedEnemies",[_unit]] call bis_fnc_variablespaceadd;
	_wp setwaypointposition [position _player,0];

	_unit call _code;

	sleep _delay;
};