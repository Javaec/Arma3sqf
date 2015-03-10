/*
	Author: Karel Moricky

	Description:
	Return cargo index of a person turret and the other way around

	Parameter(s):
		0: OBJECT
		1: NUMBER (cargo index) or ARRAY (turret path)

	Returns:
	NUMBER (cargo index) or ARRAY (turret path)
*/

private ["_veh","_index","_transportSoldier","_personTurrets"];
_veh = [_this,0,objnull,[objnull]] call bis_fnc_param;
_index = [_this,1,[],[[],0]] call bis_fnc_param;

_transportSoldier = getnumber (configfile >> "cfgvehicles" >> typeof _veh >> "transportSoldier");
_personTurrets = (allturrets [_veh,true]) - (allturrets [_veh,false]);

if (typename _index == typename []) then {
	private ["_turretID"];
	_turretID = _personTurrets find _index;
	if (_turretID >= 0) then {
		_transportSoldier + _turretID
	} else {
		-1
	};
} else {
	private ["_cargoID"];
	_cargoID = _index - _transportSoldier;
	if (_cargoID < count _personTurrets && _cargoID >= 0) then {
		_personTurrets select _cargoID
	} else {
		[]
	};
};
