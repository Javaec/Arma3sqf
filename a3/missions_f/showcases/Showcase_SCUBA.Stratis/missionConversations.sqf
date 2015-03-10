case "start": {
	sleep 3;
	["01_Start", nil, ["showcase_scuba_01_start_JIM_0", "showcase_scuba_01_start_KER_0"], nil, nil, [BIS_jimmy, BIS_player, BIS_player]] call BIS_fnc_kbTell;
	["01_Start", nil, ["showcase_scuba_01_start_HQ_0", "showcase_scuba_01_start_HQ_0"]] call BIS_fnc_kbTell;
};

case "chopper": {
	sleep 4;
	["05_Chopper"] call BIS_fnc_kbTell;
	sleep 5;
	saveGame;
	10 fadeMusic 0;
};

case "end": {
	["10_End", nil, ["showcase_scuba_10_end_KER_0", "showcase_scuba_10_end_KER_0"], nil, nil, [BIS_player, BIS_player]] call BIS_fnc_kbTell;
	["10_End", nil, ["showcase_scuba_10_end_KER_1", "showcase_scuba_10_end_HQ_0"]] call BIS_fnc_kbTell;
	{_x setBehaviour "AWARE"; _x setUnitPos "UP"; _x move markerPos "BIS_mrkHQ"} forEach [BIS_jimmy, BIS_otherGuy];
	["end1"] call BIS_fnc_endMission;
};