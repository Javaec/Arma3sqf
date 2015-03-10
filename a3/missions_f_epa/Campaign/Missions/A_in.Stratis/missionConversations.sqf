case "BIS_wave": {
	["01_Wave", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_loadUp": {
	["05_Load_Up", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_allIn": {
	["10_All_In", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_roads": {
	["15_Roads", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_maxwell": {
	["20_Maxwell", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_mike26": {
	["25_Mike26", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_baldy": {
	["30_Baldy", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_lockDown": {
	["35_Lock_Down", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_landing": {
	["40_Landing", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_landed": {
	["40_Landed", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_report": {
	["50_Report", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_orders": {
	["55_Orders", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_understood": {
	["60_Understood", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_getIn": {
	["65_Get_In", "A_in", ["a_in_65_get_in_ICO_0", "a_in_65_get_in_ICO_0"], if (BIS_leader in BIS_truck) then {"VEHICLE"} else {if (BIS_inf in BIS_truck || BIS_leader distance BIS_inf > 5) then {"SIDE"} else {"DIRECT"}}, nil, nil, 1, false] call BIS_fnc_kbTell;
	["65_Get_In", "A_in", ["a_in_65_get_in_KER_0", "a_in_65_get_in_KER_0"], if (BIS_leader in BIS_truck) then {"VEHICLE"} else {if (BIS_inf in BIS_truck || BIS_leader distance BIS_inf > 5) then {"SIDE"} else {"DIRECT"}}, nil, nil, 1, false] call BIS_fnc_kbTell;
	["65_Get_In", "A_in", ["a_in_65_get_in_ICO_1", "a_in_65_get_in_ICO_1"], if (BIS_leader in BIS_truck) then {"VEHICLE"} else {if (BIS_inf in BIS_truck || BIS_leader distance BIS_inf > 5) then {"SIDE"} else {"DIRECT"}}, nil, nil, 1, false] call BIS_fnc_kbTell;
	["65_Get_In", "A_in", ["a_in_65_get_in_KER_1", "a_in_65_get_in_KER_1"], if (BIS_leader in BIS_truck) then {"VEHICLE"} else {if (BIS_inf in BIS_truck || BIS_leader distance BIS_inf > 5) then {"SIDE"} else {"DIRECT"}}, nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_follow": {
	["75_Road", "A_in", ["a_in_75_road_ICO_1"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_flyAway": {
	["70_Fly_Away", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_service": {
	["73_Great_Service", "A_in", nil, if (BIS_leader in BIS_truck) then {"VEHICLE"} else {"SIDE"}, nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_road": {
	["75_Road", "A_in", ["a_in_75_road_ICO_0", "a_in_75_road_ICO_0"], "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_offroading": {
	["x01_Offroading", "A_in", nil, "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_goats": {
	["76_Turn", "A_in", nil, "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_slowDown": {
	["80_Slow_Down", "A_in", nil, "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_tooFast": {
	["x05_SlowItDown", "A_in", nil, "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_stop": {
	["90_Stop", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_inspect": {
	["95_Inspect", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_tense": {
	["97_Tense", "A_in", ["a_in_97_tense_KER_0", "a_in_97_tense_KER_0"], "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	["97_Tense", "A_in", ["a_in_97_tense_ICO_0", "a_in_97_tense_ICO_0"], "VEHICLE", nil, [BIS_inf, BIS_leader, BIS_inf], 1, false] call BIS_fnc_kbTell;
	["97_Tense", "A_in", ["a_in_97_tense_ICO_1", "a_in_97_tense_BRA_0"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	["97_Tense", "A_in", ["a_in_97_tense_ICO_3", "a_in_97_tense_ICO_3"], "VEHICLE", nil, [BIS_inf, BIS_leader, BIS_inf], 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_clear": {
	["100_Clear", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_lingering": {
	["x10_MoveOn", "A_in", nil, "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_leftCheckpoint": {
	["105_Left_Checkpoint", "A_in", ["a_in_105_left_checkpoint_ICO_0", "a_in_105_left_checkpoint_ICO_1"], "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
	
	["105_Left_Checkpoint", "A_in", ["a_in_105_left_checkpoint_ICO_3"], "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_hazard": {
	["110_Hazard", "A_in", nil, "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_stopAgain": {
	["110_Hazard", "A_in", ["a_in_110_hazard_ICO_1"], "VEHICLE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_contactLost": {
	["128_Ambient_2", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_check": {
	["115_Check", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_requestHelp": {
	["117_Request_Help", "A_in", ["a_in_117_request_help_ICO_0", "a_in_117_request_help_ICO_0"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	["117_Request_Help", "A_in", ["a_in_117_request_help_ICO_1"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
};

case "BIS_range": {
	["120_Range", "A_in", ["a_in_120_range_RAN_0", "a_in_120_range_RAN_0"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["120_Range", "A_in", ["a_in_120_range_RAN_1", "a_in_120_range_BHQ_0"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_return": {
	["120_Range", "A_in", ["a_in_120_range_LOG_0"], "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_comply": {
	["125_Comply", "A_in", nil, "SIDE", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_planes": {
	["130_Planes", "A_in", nil, "DIRECT", nil, nil, 1, false] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_onFoot": {
	["135_On_Foot", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_reinf": {
	["140_Enemies", "A_in", ["a_in_140_enemies_BHQ_0", "a_in_140_enemies_BHQ_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_firefights": {
	["127_Ambient_1", "A_in", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_WTF": {
	["137_WTF", "A_in", ["a_in_137_wtf_KER_0", "a_in_137_wtf_KER_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["145_FUBAR", "A_in", ["a_in_145_fubar_ICO_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_enemies": {
	["140_Enemies", "A_in", ["a_in_140_enemies_BHQ_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_FUBAR": {
	["145_FUBAR", "A_in", ["a_in_145_fubar_KER_0", "a_in_145_fubar_ICO_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["137_WTF", "A_in", ["a_in_137_wtf_ICO_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_safer": {
	["150_Safer", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_contacts": {
	["155_Contacts", "A_in", ["a_in_155_contacts_ICO_0", "a_in_155_contacts_ICO_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	["155_Contacts", "A_in", ["a_in_155_contacts_ICO_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_evac": {
	["160_Evac", "A_in", ["a_in_160_evac_LOG_0", "a_in_160_evac_LOG_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	["160_Evac", "A_in", ["a_in_160_evac_BHQ_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_AA": {
	["165_AA", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_overCamp": {
	["170_Over_Camp", "A_in", ["a_in_170_over_camp_KER_0", "a_in_170_over_camp_KER_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 4;
	
	["170_Over_Camp", "A_in", ["a_in_170_over_camp_ICO_0"], "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "BIS_badSign": {
	["175_Bad_Sign", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_atAA": {
	["180_At_AA", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_evacSpotted": {
	["185_Evac_Spotted", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_evacConfirmed": {
	["183_Evac_Confirmed", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_requestEvac": {
	["185_Request_Evac", "A_in", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_flyOver": {
	["190_Fly_Over", "A_in", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_bomberSpotted": {
	["195_Bomber_Spotted", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_bombInbound": {
	["200_Bomb_Inbound", "A_in", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_heliDead": {
	["205_Heli_Dead", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_checkIn": {
	["210_Check_In", "A_in", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_nowWhat": {
	["215_Now_What", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_findShelter": {
	["220_Find_Shelter", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_nearForest": {
	["225_Near_Forest", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_inForest": {
	enableSentences false;
	["230_In_Forest", "A_in", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};