case "01_Start": {
	["01_Start", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "05_Turn_On": {
	["05_Turn_On", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d01_Reveal": {
	["d01_Reveal", "BOOT_m01", [["LAC", 0], ["LAC", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["d01_Reveal", "BOOT_m01", [["ADA", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "10_Surprised": {
	["10_Surprised", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Move": {
	["15_Move", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "20_Targets": {
	["20_Targets", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "25_Targets_Spawned": {
	["25_Targets_Spawned", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_Fire": {
	["30_Fire", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Compass_1": {
	["35_Compass", "BOOT_m01", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Compass_2": {
	["35_Compass", "BOOT_m01", [["ADA", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "40_First_Target": {
	["40_First_Target", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Bearings": {
	["45_Bearings", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "50_Second_Target": {
	["50_Second_Target", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "55_All_Down": {
	["55_All_Down", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "60_To_Start": {
	["60_To_Start", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d05_Course": {
	["d05_Course", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "65_Interruption": {
	["65_Interruption", "BOOT_m01", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["65_Interruption", "BOOT_m01", [["ADA", 1], ["ADA", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["65_Interruption", "BOOT_m01", [["ADA", 2], ["ADA", 2]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["65_Interruption", "BOOT_m01", [["ADA", 3], ["ADA", 3]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["65_Interruption", "BOOT_m01", [["ADA", 4]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d10_Fun": {
	["d10_Fun", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d15_Deaf": {
	["d15_Deaf", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d20_Shutdown": {
	["d20_Shutdown", "BOOT_m01", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["d20_Shutdown", "BOOT_m01", [["LAC", 0], ["ADA", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["d20_Shutdown", "BOOT_m01", [["ADA", 2]], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
	enableSentences false;
};

case "x01_Adams_Shot_1": {
	["x01_Adams_Shot_1", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x05_Adams_Shot_2": {
	["x05_Adams_Shot_2", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x10_Adams_Shot_3": {
	["x10_Adams_Shot_3", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x15_Ammo_Depleted_1": {
	["x15_Ammo_Depleted_1", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x20_Ammo_Depleted_2": {
	["x20_Ammo_Depleted_2", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x25_Ammo_Depleted_3": {
	["x25_Ammo_Depleted_3", "BOOT_m01", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};