case "BIS_stayLow": {
	["01_Stay_Low", "A_in2", ["a_in2_01_stay_low_ICO_0", "a_in2_01_stay_low_ICO_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	["01_Stay_Low", "A_in2", ["a_in2_01_stay_low_ICO_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_moveOut": {
	["05_Move_Out", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_survivors": {
	["10_Survivors", "A_in2", ["a_in2_10_survivors_BRA_0", "a_in2_10_survivors_BRA_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	["10_Survivors", "A_in2", ["a_in2_10_survivors_ICO_1", "a_in2_10_survivors_ICO_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	// Set the correct group ID
	BIS_exp setGroupID [localize "STR_A3_CFGIDENTITIES_LACEY0"];
	
	["10_Survivors", "A_in2", ["a_in2_10_survivors_BRA_2"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_rendezvous": {
	["15_Rendezvous", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_trust": {
	["20_Trust", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_dead": {
	["24_Mine", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_mine": {
	["25_Mine", "A_in2", ["a_in2_25_mine_KER_0", "a_in2_25_mine_KER_0"], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 1;
	
	["25_Mine", "A_in2", ["a_in2_25_mine_KER_1"], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_situation": {
	["30a_Situation", "A_in2", ["a_in2_30a_situation_BRA_0", "a_in2_30a_situation_BRA_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 2;
	
	["30a_Situation", "A_in2", ["a_in2_30a_situation_BRA_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_explodedFine": {
	["35_Exploded_Fine", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_explodedHasKit": {
	["x01_Exploded_Has_Kit", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_explodedNoKit": {
	["x05_Exploded_No_Kit", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_contact": {
	["40_Contact", "A_in2", ["a_in2_40_contact_MIL_0", "a_in2_40_contact_MIL_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 0.5;
	
	["40_Contact", "A_in2", ["a_in2_40_contact_BRA_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_copy": {
	["45_Copy", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_warning1": {
	["x10_Warning1", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_warning2": {
	["x15_Warning2", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_outOfTime": {
	["x20_Out_Of_Time", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_position": {
	["50_Position", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_regrouped": {
	["55_Regrouped", "A_in2", nil, if (isNil "BIS_outOfTime") then {"DIRECT"} else {"SIDE"}, nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_plan": {
	["60_Plan", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_forest": {
	["65_Forest", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_stayAlert": {
	["70_Stay_Alert", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_tooQuiet": {
	["75_Too_Quiet", "A_in2", ["a_in2_75_too_quiet_BRA_0", "a_in2_75_too_quiet_BRA_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
	
	sleep 0.5;
	
	["75_Too_Quiet", "A_in2", ["a_in2_75_too_quiet_KER_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_badIdea": {
	["80_Bad_Idea", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_checkIn": {
	["85_Check_In", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_heliPatrol": {
	["90_Heli_Patrol", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_keepMoving": {
	["95_Keep_Moving", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_almostThere": {
	["100_Almost_There", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_leftForest": {
	["105_Left_Forest", "A_in2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_nearRV": {
	["110_Near_RV", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_reveal": {
	["115_Reveal", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	if (isNil "BIS_inCombat") then {enableSentences false};
};

case "BIS_RV": {
	["120_RV", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_survivorsAlive": {
	["125_Survivors_Alive", "A_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};