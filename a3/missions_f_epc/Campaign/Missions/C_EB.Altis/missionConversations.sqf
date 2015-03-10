case "Prolog": {
	["01_Prolog", "C_EB", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "Miller": {
	["05_Miller", "C_EB", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "LeftBehind" : {
	["10_LeftBehind", "C_EB", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "SOS": {
	["15_SOS", "C_EB", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "GameOver": {
	["20_GameOver", "C_EB", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "Device": {
	["25_Device", "C_EB", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "NATO": {
	["30_NATO", "C_EB", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "NATOJoin": {
	["35_NATOJoin", "C_EB", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "FIA": {
	["40_FIA", "C_EB", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "FIAJoin": {
	["45_FIAJoin", "C_EB", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "Escaped": {
	["50_Escaped", "C_EB", [["KER", 0], ["KER", 1]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	["50_Escaped", "C_EB", [["KER", 2]], "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
};
