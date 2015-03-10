_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

if (!isplayer _unit && !isnull _unit) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

if (!alive _unit) then {
	//--- Set the time only when it was not modified already
	if (_respawnDelay != 0 && _respawnDelay == playerrespawntime) then {
		setplayerrespawntime (_respawnDelay + _respawnDelay - (servertime % _respawnDelay));
	};
} else {
	setplayerrespawntime _respawndelay;
};