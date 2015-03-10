if (!isdedicated) then {
	if (typeof cameraon == "Seagull") then {
		["playerRespawnSeagullScript",[cameraon,objnull]] call bis_fnc_selectRespawnTemplate;
	} else {
		_fnc_initRespawn = {
			disableserialization;
			waituntil {!isnull ([] call bis_fnc_displayMission)};
			"bis_fnc_initRespawn" call bis_fnc_startloadingscreen;
			["initRespawn",[player,objnull]] call bis_fnc_selectRespawnTemplate;
			"bis_fnc_initRespawn" call bis_fnc_endloadingscreen;
		};

		if (isnull ([] call bis_fnc_displayMission)) then {[] spawn _fnc_initRespawn;} else {[] call _fnc_initRespawn;};
	};
	true
};