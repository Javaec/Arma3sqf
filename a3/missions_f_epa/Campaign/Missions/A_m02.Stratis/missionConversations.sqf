case "BIS_bravoDead": {
	["x01_Bravo_Dead", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_start": {
	BIS_leader = leader BIS_inf;
	["01_Start", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_report": {
	BIS_leader = leader BIS_inf;
	["05_Report", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_report2": {
	BIS_leader = leader BIS_inf;
	["07_Report2", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_letsGo": {
	BIS_leader = leader BIS_inf;
	["10_Lets_Go", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_pointManHit": {
	BIS_leader = leader BIS_inf;
	["15_Point_Man_Hit", "A_m02", ["a_m02_15_point_man_hit_POI_0", "a_m02_15_point_man_hit_POI_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	BIS_leader = leader BIS_inf;
	["15_Point_Man_Hit", "A_m02", ["a_m02_15_point_man_hit_ALP_0", "a_m02_15_point_man_hit_ALP_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	BIS_leader = leader BIS_inf;
	["15_Point_Man_Hit", "A_m02", ["a_m02_15_point_man_hit_ALP_1", "a_m02_15_point_man_hit_ALP_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
};

case "BIS_pointManDivert": {
	enableSentences false;
	
	BIS_leader = leader BIS_inf;
	["17_Point_Man_Divert", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_pointManDead": {
	BIS_leader = leader BIS_inf;
	["20_Point_Man_Dead", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_reportCasualties": {
	BIS_leader = leader BIS_inf;
	["25_Report_Casualties", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_concentrateFire": {
	BIS_leader = leader BIS_inf;
	["30_Concentrate_Fire", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_docDead": {
	BIS_leader = leader BIS_inf;
	["x05_Doc_Dead", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_noHope": {
	BIS_leader = leader BIS_inf;
	["35_No_Hope", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_takingCasualties": {
	BIS_leader = leader BIS_inf;
	["40_Taking_Casualties", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_keepMoving": {
	BIS_leader = leader BIS_inf;
	["45_Keep_Moving", "A_m02", ["a_m02_45_keep_moving_ALP_0", "a_m02_45_keep_moving_ALP_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_flank": {
	BIS_leader = leader BIS_inf;
	["45_Keep_Moving", "A_m02", ["a_m02_45_keep_moving_ALP_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_ridgelines": {
	BIS_leader = leader BIS_inf;
	["50_Ridgelines", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_townApproach": {
	BIS_leader = leader BIS_inf;
	["55_Town_Approach", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_townClear": {
	BIS_leader = leader BIS_inf;
	["60_Town_Clear", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_lazy": {
	// Try to ensure someone says the line
	if (!(alive BIS_BLU1)) then {
		BIS_BLU1 = (units group BIS_inf - [BIS_inf, BIS_BLU5]) call BIS_fnc_selectRandom;
	};
	
	["65_Lazy", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_mortarSplashed": {
	["70_Mortar_Splashed", "A_m02", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_spotters": {
	["75_Spotters", "A_m02", ["a_m02_75_spotters_BRA_0", "a_m02_75_spotters_BRA_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["75_Spotters", "A_m02", ["a_m02_75_spotters_BRA_1", "a_m02_75_spotters_BRA_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["75_Spotters", "A_m02", ["a_m02_75_spotters_BRA_2"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_volunteer": {
	BIS_leader = leader BIS_BLU_group3;
	BIS_BLU_group3 setGroupID [localize "STR_A3_Group_Alpha"];
	
	["80_Volunteer", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_gotIt": {
	private ["_char1"];
	_char1 = BIS_inf;
	
	BIS_inf setGroupID [localize "STR_A3_Group_Alpha"];
	["85_On_It", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_designate": {
	["90_Designate", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_designated": {
	["95_Designated", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_UAVDestroyed": {
	["x10_UAV_Destroyed", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_spottersDead": {
	["100_Spotters_Dead", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_mortarDead": {
	["x15_Mortar_Dead", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_plane": {
	["105_Plane", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 3;
};

case "BIS_RTB": {
	["110_RTB", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_takeCover": {
	["115_Take_Cover", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_bombs": {
	["120_Bombs", "A_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_faster": {
	["125_Faster_Bravo", "A_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};