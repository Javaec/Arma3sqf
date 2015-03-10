case "01_Start": {
	BIS_guerA = (units group BIS_inf - [BIS_inf]) call BIS_fnc_selectRandom;
	
	["01_Start", "B_out2", [["GUA", 0], ["GUA", 0]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 0.5;
	
	["01_Start", "B_out2", [["KER", 0], ["KER", 0]], "GROUP", nil, [BIS_guerA, BIS_inf, BIS_guerA], 1] call BIS_fnc_kbTell;
	["01_Start", "B_out2", [["KER", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "05_Arty_Destroyed": {
	["05_Arty_Destroyed", "B_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "10_Complex_Cleared": {
	["10_Complex_Cleared", "B_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "15_Special_Forces": {
	["15_Special_Forces", "B_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "20_Town_Clear": {
	["20_Town_Clear", "B_out2", [["STA", 0], ["STA", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	BIS_townClearConv = ["20_Town_Clear", "B_out2", [["KER", 0]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "25_Lights_Off": {
	["25_Lights_Off", "B_out2", [["KER", 0], ["KER", 0]], "GROUP", nil, [BIS_inf, BIS_inf], 1] call BIS_fnc_kbTell;
	sleep 1;
	
	["25_Lights_Off", "B_out2", [["KER", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "30_Helicopter": {
	["30_Helicopter", "B_out2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "35_Reinforcements": {
	["35_Reinforcements", "B_out2", [["GUA", 0], ["GUA", 0]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "40_Town_Held": {
	if ({alive _x} count (units group BIS_inf - [BIS_inf]) > 0) then {
		// Player still has teammates
		["40_Town_Held", "B_out2", [["KER", 0], ["KER", 0]], "GROUP", nil, [BIS_inf, BIS_inf], 1] call BIS_fnc_kbTell;
	};
	
	["40_Town_Held", "B_out2", [["KER", 1], ["STA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	BIS_townHeldConv = ["40_Town_Held", "B_out2", [["KER", 2]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "45_Americans": {
	["45_Americans", "B_out2", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "50_Airfield_Attack": {
	["50_Airfield_Attack", "B_out2", [["KER", 0], ["KER", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 2;
	
	["50_Airfield_Attack", "B_out2", [["KER", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "55_Friendly_Fire": {
	["55_Friendly_Fire", "B_out2", [["STA", 0], ["KER", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 1;
	
	["55_Friendly_Fire", "B_out2", [["KER", 1], ["KER", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	sleep 1;
	
	["55_Friendly_Fire", "B_out2", [["KER", 2], ["KER", 2]], "GROUP", nil, [BIS_inf, BIS_inf], 1] call BIS_fnc_kbTell;
	["55_Friendly_Fire", "B_out2", [["KER", 3]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "60_Engine_Failure": {
	["60_Engine_Failure", "B_out2", [["GUB", 0], ["KER", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	BIS_engineFailureConv = ["60_Engine_Failure", "B_out2", [["KER", 2]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "65_Stop_Attack": {
	["65_Stop_Attack", "B_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "70_Cease_Fire": {
	["70_Cease_Fire", "B_out2", [["LAR", 0], ["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	BIS_ceaseFireConv = ["70_Cease_Fire", "B_out2", [["BHQ", 2]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "75_Failed_Invasion": {
	["75_Failed_Invasion", "B_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};