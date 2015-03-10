private ["_logic","_units","_show"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_show = parsenumber (_logic getvariable ["state","0"]) > 0;

{
	_x hideobject !_show;
	_x enablesimulation _show;
} foreach _units;

true