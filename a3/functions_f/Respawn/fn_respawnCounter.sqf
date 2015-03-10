/*
	Author: Karel Moricky

	Description:
	Set or execute respawn counter params

	Parameter(s):
		0: TEXT - text displayed below the respawn counter
		1: NUMBER - counter color (0 - default, 1 - warning, 2 - error)

	Returns:
	BOOL
*/

_player = [_this,0,"",["",objnull]] call bis_fnc_param;

if (typename _player == typename objnull) then {
	_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

	if (!isplayer _player && !isnull _player && _respawnDelay > 0) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

	//--- Engine-triggered respawn
	_layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;

	if (!alive _player) then {
		if (playerrespawntime < 1) exitwith {};
		_layer cutrsc ["RscRespawnCounter","plain"];
	} else {
		_layer cuttext ["","plain"];
	};

} else {
	//--- Designer settings
	_text = _player;
	_colorID = [_this,1,0,[0]] call bis_fnc_param;
	missionnamespace setvariable ["RscRespawnCounter_description",_text];
	missionnamespace setvariable ["RscRespawnCounter_colorID",_colorID];
};
true