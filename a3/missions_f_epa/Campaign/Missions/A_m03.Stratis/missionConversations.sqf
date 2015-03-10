case "BIS_compromised": {
	["x01_Compromised", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_start": {
	["01_Start", "A_m03", ["a_m03_01_start_ALP_0", "a_m03_01_start_ALP_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	["01_Start", "A_m03", ["a_m03_01_start_BRA_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_mike26": {
	["05_Mike26", "A_m03", ["a_m03_05_mike26_ALP_0", "a_m03_05_mike26_ALP_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["05_Mike26", "A_m03", ["a_m03_05_mike26_ALP_1"], "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_prone": {
	["10_Prone", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_atOP": {
	["15_At_OP", "A_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_targets": {
	["20_Targets", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_outOfAmmo": {
	["x05_Out_Of_Ammo", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_towersDead": {
	["25_Towers_Dead", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_attack": {
	["30_Attack", "A_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_mike26Clear": {
	BIS_leader = leader BIS_inf;
	["35_Mike26_Clear", "A_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_reinf": {
	["40b_Reinf", "A_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_defend": {
	BIS_leader = leader BIS_inf;
	
	if (BIS_leader != BIS_inf) then {
		// Player still has a squad leader
		["43_Defend", "A_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
		enableSentences false;
	};
};

case "BIS_designate": {
	BIS_leader = leader BIS_inf;
	["45_Designate", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_noAmmo": {
	BIS_leader = leader BIS_inf;
	["x10_No_Ammo", "A_m03", ["a_m03_x10_no_ammo_ALP_0", "a_m03_x10_no_ammo_ALP_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	BIS_leader = leader BIS_inf;
	["x10_No_Ammo", "A_m03", ["a_m03_x10_no_ammo_ALP_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_tooClose": {
	BIS_leader = leader BIS_inf;
	["x15_Too_Close", "A_m03", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_reinfDead": {
	BIS_leader = leader BIS_inf;
	
	if (BIS_leader != BIS_inf && alive BIS_leader) then {
		// Player still has a squad leader
		["50b_Reinf_Dead", "A_m03", ["a_m03_50b_reinf_dead_ALP_0", "a_m03_50b_reinf_dead_MIL_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
		enableSentences false;
	};
	
	["50b_Reinf_Dead", "A_m03", ["a_m03_50b_reinf_dead_MIL_1", "a_m03_50b_reinf_dead_MIL_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_failure": {
	["50b_Reinf_Dead", "A_m03", ["a_m03_50b_reinf_dead_DEL_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_getClear": {
	["55_Get_Clear", "A_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};