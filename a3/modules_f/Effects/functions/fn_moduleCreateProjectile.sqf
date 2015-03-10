_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	_type = _logic getvariable ["Type","SmokeShell"];
	_smoke = createvehicle [_type,position _logic,[],0,"none"];
	_smoke setpos position _logic;
};