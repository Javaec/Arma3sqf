case "BIS_start": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	["01_Start", "A_m01", ["a_m01_01_start_ALP_0", "a_m01_01_start_ALP_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	["01_Start", "A_m01", ["a_m01_01_start_MIL_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_contact": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	["05_Contact", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_secure": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	["10_Secure", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_report": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	["15_Report", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_survivor": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	if (BIS_leader in [BIS_BLU1, BIS_BLU2, BIS_inf]) then {
		// It's not just the medic and player left
		["20_Survivor", "A_m01", ["a_m01_20_survivor_ALP_0", "a_m01_20_survivor_ALP_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		
		if ("APERSBoundingMine_Range_Mag" in magazines BIS_inf) then {
			// Player still has his mines
			["20_Survivor", "A_m01", ["a_m01_20_survivor_ALP_2"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		};
	} else {
		// Only the medic and player survived
		["x01_Survivor_Casualties", "A_m01", ["a_m01_x01_survivor_casualties_MED_0", "a_m01_x01_survivor_casualties_MED_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
		
		if ("APERSBoundingMine_Range_Mag" in magazines BIS_inf) then {
			// Player still has his mines
			["x01_Survivor_Casualties", "A_m01", ["a_m01_x01_survivor_casualties_MED_2"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
		};
	};
};

case "BIS_inform": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	if (BIS_leader in [BIS_BLU1, BIS_BLU2, BIS_inf]) then {
		// It's not just the medic and player left
		["25_Inform", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	} else {
		// Only the medic and player survived
		["x05_Inform_Casualties", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	};
};

case "BIS_medevac": {
	["30_Medevac", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_medevacResult": {
	["33_Medevac_Result", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_spotted": {
	BIS_leader = if (alive BIS_BLU1) then {BIS_BLU1} else {if (alive BIS_BLU2) then {BIS_BLU2} else {leader BIS_inf}};
	
	if (BIS_leader != BIS_inf) then {
		// Only play if the player has a leader
		["35_Spotted", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	};
};

case "BIS_onStation": {
	["40_On_Station", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_medicReady": {
	["45_Survivor_Dead", "A_m01", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_plant": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	if (BIS_leader != BIS_inf) then {
		if (BIS_leader in [BIS_BLU1, BIS_BLU2]) then {
			// It's not just the medic and player left
			["50_Plant", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		} else {
			// Only the medic and player survived
			["x10_Plant_Casualties", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		};
	};
};

case "BIS_planting": {
	["55_Planting", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_noCharges": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_alphaLead = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_alphaLead = BIS_BLU3;
		} else {
			BIS_alphaLead = BIS_inf;
		};
	};
	
	BIS_alphaLead setGroupID [localize "STR_A3_Group_Alpha"];
	
	if (BIS_alphaLead != BIS_inf) then {
		["x12_No_Charges", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		
		if (BIS_alphaLead in [BIS_BLU1, BIS_BLU2]) then {
			// It's not just the medic and player left
			["x13_Reprimand", "A_m01", nil, "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
		} else {
			// Only the medic and player survived
			["x14_Reprimand_Casualties", "A_m01", nil, "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
		};
	};
};

case "BIS_planted": {
	if (leader BIS_inf != BIS_inf) then {
		["60_Planted", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	};
};

case "BIS_getClear": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	if (BIS_leader != BIS_inf) then {
		if (BIS_leader in [BIS_BLU1, BIS_BLU2]) then {
			// It's not just the medic and player left
			["65_Get_Clear", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		} else {
			// Only the medic and player survived
			["x15_Get_Clear_Casualties", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		};
	};
};

case "BIS_allClear": {
	// Choose the leader
	if ({alive _x} count [BIS_BLU1, BIS_BLU2] > 0) then {
		BIS_leader = leader BIS_inf;
	} else {
		if (alive BIS_BLU3) then {
			BIS_leader = BIS_BLU3;
		} else {
			BIS_leader = BIS_inf;
		};
	};
	
	BIS_leader setGroupID [localize "STR_A3_Group_Alpha"];
	
	if (BIS_leader != BIS_inf) then {
		if (BIS_leader in [BIS_BLU1, BIS_BLU2]) then {
			// It's not just the medic and player left
			["70_Detonate", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		} else {
			// Only the medic and player survived
			["x20_Detonate_Casualties", "A_m01", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
		};
	};
};