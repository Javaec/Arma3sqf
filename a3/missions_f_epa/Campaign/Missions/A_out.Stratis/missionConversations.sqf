case "BIS_spotted": {
	["x01_Spotted", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_start": {
	BIS_leader = leader group BIS_inf;
	
	["01_Start", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 8;
	
	["03_Warning", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_rendezvous": {
	["10_Rendezvous", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_attack": {
	["15_Attack", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "BIS_rangeClear": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["20_Range_Clear", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
};

case "BIS_toTown": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["25_To_Town", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
};

case "BIS_checkIn": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["27_Charlie_Status", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
};

case "BIS_NATOInbound": {
	BIS_alphaLead = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["30_NATO_Inbound", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
};

case "BIS_helisSpotted": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["35_Helis_Spotted", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
};

case "BIS_orders": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["40_Orders", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
};

case "BIS_underAttack": {
	["45_Under_Attack", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_confused": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["50_Confused", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
};

case "BIS_retreat": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["55_Retreat", "A_out", ["a_out_55_retreat_ALP_0", "a_out_55_retreat_ALP_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
	
	sleep 1;
	
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["55_Retreat", "A_out", ["a_out_55_retreat_ALP_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	BIS_leader allowDamage true;
};

case "BIS_toRV": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["60_To_RV", "A_out", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
};

case "BIS_mortars": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["65_Mortars", "A_out", ["a_out_65_mortars_ALP_0", "a_out_65_mortars_ALP_0"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
	
	sleep 2;
	
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["65_Mortars", "A_out", ["a_out_65_mortars_ALP_1"], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
};

case "BIS_paratroopers": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["70_Paratroopers", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
};

case "BIS_cover": {
	BIS_leader = leader BIS_inf;
	if (BIS_leader != BIS_inf) then {BIS_leader allowDamage false};
	
	["75_Cover", "A_out", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	
	BIS_leader allowDamage true;
};

case "BIS_boats": {
	["80_Boats", "A_out", ["a_out_80_boats_MIL_0", "a_out_80_boats_MIL_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 0.5;
	
	["80_Boats", "A_out", ["a_out_80_boats_MIL_1"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_allIn": {
	BIS_leader = leader BIS_inf;
	
	if (BIS_leader != BIS_inf) then {
		["85_All_In", "A_out", nil, "SIDE", nil, true, 1] call BIS_fnc_kbTell;
		enableSentences false;
	};
};

case "BIS_away": {
	BIS_leader = leader BIS_inf;
	
	if (BIS_leader != BIS_inf) then {
		["90_Away", "A_out", ["a_out_90_away_ALP_0", "a_out_90_away_ALP_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
		enableSentences false;
		
		sleep 1;
		
		["90_Away", "A_out", ["a_out_90_away_MIL_0"], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
		enableSentences false;
	};
};

case "BIS_situation": {
	["95_Situation", "A_out", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_insane": {
	["100_Insane", "A_out", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_contacts": {
	BIS_gunnerA = BIS_CTRG1;
	["105_Contacts", "A_out", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_instructions": {
	["110_Instructions", "A_out", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "BIS_openFire": {
	["115_Open_Fire", "A_out", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};