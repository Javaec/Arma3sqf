case "BIS_diving": {
	["01_Diving", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_openHatches": {
	["05_Open_Hatches", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_treasure": {
	["10_Doubt", "A_m05", nil, "GROUP", {sleep 1}, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_bigBoat": {
	["15_Big_Boat", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_heads": {
	["20_Heads", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_mines": {
	["25_Mines", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_getOut": {
	["30_Get_Out", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_dontTouch": {
	["35_Dont_Touch", "A_m05", ["a_m05_35_dont_touch_ALPB_0", "a_m05_35_dont_touch_ALPB_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	["35_Dont_Touch", "A_m05", ["a_m05_35_dont_touch_ALPA_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_enemiesSpotted": {
	["40_Enemies_Spotted", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_guardsDead": {
	["45_Guards_Dead", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_reportIn": {
	["50_Report_In", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_move": {
	["53_Move", "A_m05", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_bravo": {
	["54_Report_In_Bravo", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_ready": {
	["55_Ready", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_attack": {
	["60_Attack", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_moving": {
	["65_Moving", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_moveIn": {
	["67_Move_In", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_townClear": {
	["70_Town_Clear", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_identify": {
	["75_Identify", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_reinfSpotted": {
	["80_Reinf_Spotted", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_identified": {
	["85_Identified", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_retreat": {
	["90_Retreat", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_truck": {
	["95_Truck", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_understood": {
	["100_Understood", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_noTruck": {
	["x01_No_Truck", "A_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};