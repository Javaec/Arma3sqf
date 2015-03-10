_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;

_markers = _logic getvariable ["Markers",""];
_markers = call compile ("[" + _markers + "]");

{
	_x setmarkeralpha 0;
} foreach _markers;

true