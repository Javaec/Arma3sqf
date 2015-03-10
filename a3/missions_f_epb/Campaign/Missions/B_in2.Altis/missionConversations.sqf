case "BIS_CTRGReady": {
	["01_Start", "B_in2", [["ECA", 0], ["ECA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_hungry": {
	["01_Start", "B_in2", [["KER", 0], ["KER", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_enRoute": {
	["01_Start", "B_in2", [["ECH", 0], ["ECH", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_prepare": {
	["01_Start", "B_in2", [["JAM", 0], ["JAM", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_equipment": {
	["01_Start", "B_in2", [["ECH", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_moving": {
	["05_Moving", "B_in2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_nearRV": {
	["10_Near_RV", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_heli": {
	["15_Heli", "B_in2", [["ECA", 0], ["JAM", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	["15_Heli", "B_in2", [["ECH", 0], ["ECH", 0]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_split": {
	["15_Heli", "B_in2", [["JAM", 1]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_compromised": {
	["20_Compromised", "B_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	["23_Compromised_2", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_wait": {
	["25_Wait", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_hurry": {
	["30_Hurry", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_plan": {
	["35_Plan", "B_in2", [["JAM", 0], ["JAM", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	BIS_planConv = ["35_Plan", "B_in2", [["JAM", 2], ["JAM", 2]], "SIDE", nil, [BIS_2IC, BIS_inf, BIS_inf], 1] spawn BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_getIn": {
	["35_Plan", "B_in2", [["STA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	["36_GetIn", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_road": {
	["40_Road", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_follow": {
	["45_Follow", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_question": {
	["50_Question", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_straight1": {
	["55_Straight_1", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check1Slow": {
	["60_Check_1_Slow", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check1": {
	["65_Check_1", "B_in2", [["STA", 0], ["STA", 2]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_lackOfFaith": {
	["65_Check_1", "B_in2", [["KER", 1]], "VEHICLE", nil, [BIS_inf, BIS_inf], 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check1Wait": {
	["70_Check_1_Wait", "B_in2", [["KER", 0], ["KER", 0]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	["70_Check_1_Wait", "B_in2", [["KER", 1]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_returning": {
	["75_Returning", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check1Continue": {
	["80_Check_1_Continue", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_corruption": {
	["85_Corruption", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_stop": {
	["90_Stop", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_drop": {
	["95_Drop", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_allOut": {
	["100_All_Out", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_straight2": {
	["105_Straight_2", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_straight3": {
	["110_Straight_3", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_factory": {
	["115_Factory", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check2Slow": {
	["120_Check_2_Slow", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check2": {
	["125_Check_2", "B_in2", [["STA", 0], ["STA", 1]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_stress": {
	["125_Check_2", "B_in2", [["KER", 0]], "VEHICLE", nil, [BIS_inf, BIS_inf], 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_suspicious": {
	["130_Stress", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_recon": {
	["135_Recon", "B_in2", [["MIL", 0], ["MIL", 4]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_change": {
	["135_Recon", "B_in2", [["KER", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_inform": {
	["140_Inform", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_aware": {
	["145_Aware", "B_in2", [["STA", 0], ["STA", 0]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["145_Aware", "B_in2", [["STA", 1]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_surrounded": {
	["150_Surrounded", "B_in2", [["MIL", 0], ["MIL", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_rescue": {
	["150_Surrounded", "B_in2", [["STA", 1], ["STA", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_outnumbered": {
	["150_Surrounded", "B_in2", [["KER", 0]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_right": {
	["155_Right", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_left": {
	["160_Left", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_nearNewRV": {
	["165_Near_New_RV", "B_in2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_alone": {
	["167_TruckStay", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_sniper": {
	["170_Sniper", "B_in2", [["GUA", 0], ["GUA", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_engage": {
	["175_Engage", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_clear": {
	["180_Clear", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_foxDead": {
	["185_Slingshot_Dead", "B_in2", [["MIL", 0], ["MIL", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["185_Slingshot_Dead", "B_in2", [["MIL", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_regroup": {
	["190_Regroup", "B_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_regrouped": {
	["195_Regrouped", "B_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_explain": {
	["200_Explain", "B_in2", [["MIL", 0], ["KER", 2]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	["200_Explain", "B_in2", [["MIL", 2]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_warning1": {
	["x01_Warnings", "B_in2", [["STA", 0], ["STA", 0]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_warning2": {
	["x01_Warnings", "B_in2", [["STA", 1]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};