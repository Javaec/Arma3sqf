private ["_curator","_units","_players"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;

_players = _curator getvariable ["bis_fnc_curatorSystem_players",[]];
{
	if !(_x in _players) then {
		_players set [count _players,_x];
		[_x,"bis_fnc_curatorSystem_curatorsPlayer",[_curator],true,true] call bis_fnc_variablespaceadd;
	};
} foreach _units;
_curator setvariable ["bis_fnc_curatorSystem_players",_players,true];
_players