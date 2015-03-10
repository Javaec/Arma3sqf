case "start": {
	sleep 1;
	["01_Start"] call BIS_fnc_kbTell;
};

case "MRAP_01": {
	sleep 1;
	["05_Steal"] call BIS_fnc_kbTell;
};

case "MRAP_01_dead": {
	sleep 3;
	["x01_Car_Dead", nil, ["showcase_vehicles_x01_car_dead_PLA_0", "showcase_vehicles_x01_car_dead_PLA_0"], nil, nil, [BIS_player, BIS_player]] call BIS_fnc_kbTell;
	["x01_Car_Dead", nil, ["showcase_vehicles_x01_car_dead_PLA_1", "showcase_vehicles_x01_car_dead_HQ_0"]] call BIS_fnc_kbTell;
};

case "depot": {
	sleep 1;
	["10_Depot"] call BIS_fnc_kbTell;
};

case "depot_hardcore": {
	sleep 1;
	["x05_Depot_Hardcore"] call BIS_fnc_kbTell;
};

case "green_trouble": {
	sleep 13;
	if (!(alive BIS_tower)) exitWith {};
	["15_Green_Trouble", nil, nil, nil, {if ((_this select 2) == "showcase_vehicles_15_green_trouble_PLA_0") then {"BIS_objCleanup" call BIS_fnc_missionTasks; "BIS_mrkDestroy" setMarkerType "mil_destroy"}}] call BIS_fnc_kbTell;
};

case "green_ok": {
	sleep 10;
	["20_Green_Ok"] call BIS_fnc_kbTell;
};

case "green_dead": {
	["x10_Green_Dead", nil, ["showcase_vehicles_x10_green_dead_HQ_0", TRUE], BIS_player] call BIS_fnc_kbTell;
	sleep 3;
	["x10_Green_Dead", nil, ["showcase_vehicles_x10_green_dead_HQ_1", TRUE], BIS_player] call BIS_fnc_kbTell;
	sleep 3;
	["BIS_objCleanup", "Failed"] call BIS_fnc_missionTasks;
	["BIS_objExfil", "Current"] call BIS_fnc_missionTasks;
	["x10_Green_Dead", nil, ["showcase_vehicles_x10_green_dead_HQ_2", FALSE], BIS_player] call BIS_fnc_kbTell;
};

case "end": {
	["25_End"] call BIS_fnc_kbTell;
	["BIS_objExfil", position BIS_SDV] call BIS_fnc_taskSetDestination;
};