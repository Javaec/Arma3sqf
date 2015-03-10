/*
	Author: Karel Moricky

	Description:
	Returns when was helicopter last used

	Parameter(s):
	_this select 0: ARRAY or OBJECT - heliport heli path or helicopter object
	_this select 1 (Optional): NUMBER - return mission played on specific turn

	Returns:
	NUMBER - last turn when helicopter was used
	or
	STRING - mission played on given turn (only when param 1 is used)
*/
private ["_heli","_turn","_dbHeli","_default"];

_heli = [_this,0,objnull,[objnull,[]]] call bis_fnc_param;
_turn = [_this,1,-1,[0]] call bis_fnc_param;
_dbHeli = _heli;

//--- If object, search for heliport heli path
if (typename _heli == typename objnull) then {
	_dbHeli = _heli getvariable "BIS_item";
};
if (typename _heli == typename objnull && isnil "_dbHeli") exitwith {
	["Helicopter %1 is not heliport helicoper.",_heli] call bis_fnc_error;
	if (_turn < 0) then {-1} else {""};
};

//--- Convert turn to string
_default = -1;
_turn = if (_turn < 0) then {"lastTurn"} else {_default = ""; str _turn};

//--- Return turn
[hsim_heliportDB,_dbHeli + ["missionHistory",_turn],_default] call bis_fnc_dbValueReturn;