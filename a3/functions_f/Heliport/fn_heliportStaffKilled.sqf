/*
	Author: Karel Moricky

	Description:
	Fail the mission when VIP died

	Parameter(s):
	_this select 0: OBJECT

	Returns:
	BOOL
*/


private ["_unit"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_unit addeventhandler [
	"killed",
	{
		_unit = _this select 0;
		_killer = _this select 1;
		_player = vehicle player;
		if (isnil {_unit getvariable "BIS_canDie"}) then {
			if (_unit == _killer && _unit distance _player < (sizeof typeof _player) && alive player) then {
				["lost",2,localize "STR_HSIM_BIS_fnc_heliportInit_ImportantDied",false] call bis_fnc_endmission;
				["%1 died, killed by Player",name _unit] call bis_fnc_logFormat;
			} else {
				["%1 died, killed by %2",name _unit,name _killer] call bis_fnc_logFormat;
			};
		};
	}
];
true