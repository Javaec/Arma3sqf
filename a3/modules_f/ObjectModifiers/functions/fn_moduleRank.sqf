private ["_logic","_units","_rank"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_rank = _logic getvariable ["rank",""];

	{
		(vehicle _x) call bis_fnc_setrank;
	} foreach _units;
};

true