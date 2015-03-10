case "BIS_bravoDead": {
	["x10_Bravo_Dead", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_pointManReport": {
	BIS_alphaLead = leader BIS_player;
	["01_Enemy_Spotted", "Showcase_Infantry", nil, "SIDE", {sleep 1}, nil, 1] call BIS_fnc_kbTell;
	sleep 1;
	
	private ["_leader"];
	_leader = leader BIS_OP_group1;
	_leader fire primaryWeapon _leader;
	
	["03_Pointman_Hit", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_pointManDead": {
	if (alive BIS_BLU1) then {
		BIS_alphaLead = leader BIS_player;
		["05_Pointman_Dead", "Showcase_Infantry", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	};
};

case "BIS_medic": {
	BIS_alphaLead = leader BIS_player;
	["10_Medic", "Showcase_Infantry", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_medicDead": {
	BIS_alphaLead = leader BIS_player;
	["x01_Medic_Dead", "Showcase_Infantry", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_noPulse": {
	if (alive BIS_BLU1) then {
		["20_No_Hope", "Showcase_Infantry", nil, "SIDE", {sleep 1}, nil, 1] call BIS_fnc_kbTell;
		sleep 2;
		
		["23_Negative", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	};
};

case "BIS_continue": {
	BIS_alphaLead = leader BIS_player;
	["25_Keep_Moving", "Showcase_Infantry", nil, "SIDE", {sleep 1}, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_ridgelines": {
	["27_Ridgelines", "Showcase_Infantry", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell
};

case "BIS_village": {
	BIS_bravoLead = leader BIS_IND_group1;
	["30_Town_Clear", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_mortar": {
	BIS_bravoLead = leader BIS_IND_group1;
	["35_Mortars", "Showcase_Infantry", nil, "SIDE", {sleep 2}, nil, 1] call BIS_fnc_kbTell;
	
	if ({alive _x} count units group BIS_player > 1) then {
		BIS_alphaLead = leader BIS_player;
		["36_Volunteered", "Showcase_Infantry", nil, "SIDE", {sleep 1}, nil, 1] call BIS_fnc_kbTell;
	};
	
	if ({alive _x} count units BIS_BLU_group1 > 0) then {
		BIS_charlieLead = leader BIS_BLU_group1;
		["40_Charlie_Support", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	};
};

case "BIS_inPosition": {
	BIS_charlieLead = leader BIS_BLU_group1;
	["45_In_Position", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_spotted": {
	BIS_charlieLead = leader BIS_BLU_group1;
	["50_Spotters_Located", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_spottersDead": {
	["60_Spotters_Dead", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_mortarDead": {
	["x05_Mortar_Dead", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_RTB": {
	["70_Retreat", "Showcase_Infantry", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};