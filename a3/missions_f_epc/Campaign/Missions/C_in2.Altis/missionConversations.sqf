case "01_Report": {
	["01_Report", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "05_Bullshit": {
	["05_Bullshit", "C_in2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "10_Boats": {
	["10_Boats", "C_in2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Contact": {
	["15_Contact", "C_in2", [["KER", 0], ["KER", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_contactConv = ["15_Contact", "C_in2", [["MEM", 0]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "20_QRF": {
	["20_QRF", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "25_Mobilization": {
	["25_Mobilization", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_Team_Dead": {
	["30_Team_Dead", "C_in2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Attack": {
	BIS_neochori = BIS_neo1;
	
	["35_Attack", "C_in2", [["BHQ", 0], ["BHQ", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["35_Attack", "C_in2", [["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "40_Defend": {
	["40_Defend", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Plan": {
	["45_Plan", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "50_Anti_Air": {
	BIS_neochori = BIS_neo2;
	["50_Anti_Air", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "55_Push": {
	["55_Push", "C_in2", [["KER", 0], ["KER", 0]], "VEHICLE", nil, [BIS_inf, BIS_inf, BIS_inf], 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["55_Push", "C_in2", [["ABB", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "60_Pushing": {
	["60_Pushing", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "65_APC_Engage": {
	["65_APC_Engage", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "70_FIA": {
	["70_FIA", "C_in2", [["BHQ", 0], ["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_FIAConv = ["70_FIA", "C_in2", [["ABB", 0]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "75_Take_Command": {
	["75_Take_Command", "C_in2", [["BHQ", 0], ["BHQ", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_takeCommand = ["75_Take_Command", "C_in2", [["BHQ", 3]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "80_Taking_Command": {
	["80_Taking_Command", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "85_No_Gunships": {
	["85_No_Gunships", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "90_Sea_Assault": {
	BIS_neochori = BIS_neo1;
	["90_Sea_Assault", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "95_Defenses_Secured": {
	["95_Defenses_Secured", "C_in2", [["KER", 0], ["BHQ", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	["95_Defenses_Secured", "C_in2", [["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "100_Defend": {
	["100_Defend", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "105_Attack_Defeated": {
	["105_Attack_Defeated", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x01_Engaged_SF": {
	["x01_Engaged_SF", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x05_APC_Destroyed": {
	["x05_APC_Destroyed", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x10_Squad_Dead": {
	["x10_Squad_Dead", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x15_Support_APC_Destroyed": {
	["x15_Support_APC_Destroyed", "C_in2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};