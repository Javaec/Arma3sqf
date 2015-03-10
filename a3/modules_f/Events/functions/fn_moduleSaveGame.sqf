_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	[] call bis_fnc_savegame;
};

true