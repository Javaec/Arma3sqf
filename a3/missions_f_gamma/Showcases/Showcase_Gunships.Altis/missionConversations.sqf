case "01_Prologue": {
	["01_Prologue", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "05_InTheAir": {
	["05_InTheAir", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "10_Contact": {
	["10_Contact", "Showcase_Gunships", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "15_PyrgosDefended": {
	["15_PyrgosDefended", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "20_NewTasks": {
	["20_NewTasks", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "25_NavalBaseDestroyed": {
	["25_NavalBaseDestroyed", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "30_SPGsDestroyed": {
	["30_SPGsDestroyed", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "35_ObjectivesCompleted": {
	["35_ObjectivesCompleted", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "40_ReconDistressCall": {
	["40_ReconDistressCall", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "45_AllIn": {
	// Make Viper actually one of the recon team
	BIS_viper = (crew BIS_Mi48 - [BIS_player, BIS_gunner]) select 0;
	BIS_viper setGroupID [localize "STR_A3_Group_ViperGreen"];
	
	["45_AllIn", "Showcase_Gunships", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "50_ReconSaved": {
	["50_ReconSaved", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x01_PyrgosLost": {
	["x01_PyrgosLost", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x05_OutOfAmmo": {
	["x05_OutOfAmmo", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x10_ShotDown": {
	["x10_ShotDown", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x15_ReconDead": {
	["x15_ReconDead", "Showcase_Gunships", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};