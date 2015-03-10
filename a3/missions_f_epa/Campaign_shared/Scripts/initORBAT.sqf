{
	if (missionNamespace getVariable [format ["BIS_%1",_x select 0],false]) then {
		[_x select 1,"mil_destroy",[1,0,0,1],1.2,1.2,45] call bis_fnc_ORBATAddGroupOverlay;
	};
} foreach [
	//--- A_in
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_HQCompany"],
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_ACompany"],
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_A_1"],
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_A_2"],
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_A_3"],
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_A_4"],
	["A_in",configfile >> "CfgORBAT" >> "BIS" >> "B_Aegis_HelicopterSquadron"],

	//--- A_m01
	["A_m01",configfile >> "CfgORBAT" >> "BIS" >> "I_B_2_3"],

	//--- A_m02
	["A_m02",configfile >> "CfgORBAT" >> "BIS" >> "I_B_3_2"],
	["A_m02",configfile >> "CfgORBAT" >> "BIS" >> "I_B_3_3"],

	//--- A_m03
	["A_m03",configfile >> "CfgORBAT" >> "BIS" >> "I_B_3_1"],
	["A_m03",configfile >> "CfgORBAT" >> "BIS" >> "I_B_1_2"],

	//--- A_m05
	["A_m05",configfile >> "CfgORBAT" >> "BIS" >> "I_B_4_1"],
	["A_m05",configfile >> "CfgORBAT" >> "BIS" >> "I_B_4_2"],

	//--- A_m04
	["A_m04",configfile >> "CfgORBAT" >> "BIS" >> "I_B_3"],
	["A_m04",configfile >> "CfgORBAT" >> "BIS" >> "I_B_3_4"]
];