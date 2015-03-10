private ["_logic","_units","_show"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_show = parsenumber (_logic getvariable ["state","0"]) > 0;

	{
		_veh = vehicle _x;
		_veh hideobject !_show;
		_veh enablesimulation _show;
	} foreach _units;
};

true