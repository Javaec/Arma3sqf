_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

if (!isplayer _unit && !isnull _unit) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

if (!alive _unit) then {

	waituntil {playerrespawntime <= 1 || alive player};
	if (alive player) exitwith {};
	setplayerrespawntime 99999;
	if !(dialog) then {createdialog "RscDisplayCommonMessage";};

	waituntil {!dialog || alive player};
	setplayerrespawntime -1;
} else {
	setplayerrespawntime _respawnDelay;
};