/*
	Author: Karel Moricky

	Description:
	Set or execute respawn time penalty

	Parameter(s):
		0: CODE - penalty condition
		1: NUMBER - penalty delay
		2: TEXT - text displayed when penalty is in effect

	Returns:
	BOOL
*/

_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_condition = [_this,0,{},[{},objnull]] call bis_fnc_param;

if (!isplayer _unit && !isnull _unit) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

if (typename _condition == typename objnull) then {

	//--- Engine-triggered respawn
	_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

	if (!alive _condition) then {
		_input = missionnamespace getvariable ["BIS_fnc_respawnDelayPenalty_input",[]];
		_condition = [_input,0,{false},[{}]] call bis_fnc_param;
		_penaltyMax = [_input,1,0,[0]] call bis_fnc_param;
		_description = [_input,2,"",[""]] call bis_fnc_param;
		_penalty = 0;
		["",0] call bis_fnc_respawnCounter;

		while {!alive player} do {
			_result = call _condition;
			if !(isnil {_result}) then {
				_penalize = [_result,0,false,[false]] call bis_fnc_paramIn;
				_descriptionLocal = [_result,1,_description,[""]] call bis_fnc_paramIn;
				if (_penalize) then {
					if (_penalty == 0) then {
						[_descriptionLocal,1] call bis_fnc_respawnCounter;
					};
					if (_penalty == 0 || _penaltyMax >= 3600) then {
						_penalty = _penaltyMax;
						setPlayerRespawnTime (playerrespawnTime + _penalty);
					};
				} else {
					if (_penalty != 0) then {
						setPlayerRespawnTime (playerrespawnTime - _penalty);
						_penalty = 0;
						["",0] call bis_fnc_respawnCounter;
					};
				};
			};

			_time = time + 1;
			waituntil {time > _time};
		};
		//--- Reset
		setPlayerRespawnTime _respawnDelay;
	};
} else {

	//--- Designer settings
	missionnamespace setvariable ["BIS_fnc_respawnDelayPenalty_input",_this];
};

true