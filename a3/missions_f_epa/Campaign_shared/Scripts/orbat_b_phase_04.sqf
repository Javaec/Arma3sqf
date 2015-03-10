BIS_ORBAT_FIA_1 = createAgent  [ 'ModuleStrategicMapORBAT_F', [7483.43,20012.4,0], [], 0, 'NONE' ];
BIS_ORBAT_FIA_1 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_3"' ];
BIS_ORBAT_FIA_1 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_FIA"' ];
BIS_ORBAT_FIA_1 setVariable [ 'Tiers', '' ];
BIS_ORBAT_FIA_2 = createAgent  [ 'ModuleStrategicMapORBAT_F', [11285,19862.9,0], [], 0, 'NONE' ];
BIS_ORBAT_FIA_2 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_4"' ];
BIS_ORBAT_FIA_2 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_FIA"' ];
BIS_ORBAT_FIA_2 setVariable [ 'Tiers', '' ];
BIS_ORBAT_FIA_3 = createAgent  [ 'ModuleStrategicMapORBAT_F', [11016.5,9048.27,0], [], 0, 'NONE' ];
BIS_ORBAT_FIA_3 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_2"' ];
BIS_ORBAT_FIA_3 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_FIA"' ];
BIS_ORBAT_FIA_3 setVariable [ 'Tiers', '' ];

// Don't show Group North for B_out2
if (missionName != "B_out2") then {
	BIS_ORBAT_FIA_4 = createAgent  [ 'ModuleStrategicMapORBAT_F', [8343.08,15071,0], [], 0, 'NONE' ];
	BIS_ORBAT_FIA_4 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_1"' ];
	BIS_ORBAT_FIA_4 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "B_I_FIA"' ];
	BIS_ORBAT_FIA_4 setVariable [ 'Tiers', '' ];
};

BIS_ORBAT_AAF_1 = createAgent  [ 'ModuleStrategicMapORBAT_F', [14936.2,17864.8,0], [], 0, 'NONE' ];
BIS_ORBAT_AAF_1 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "I_BCompany"' ];
BIS_ORBAT_AAF_1 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "I_AAF"' ];
BIS_ORBAT_AAF_1 setVariable [ 'Tiers', '2' ];
BIS_ORBAT_AAF_7 = createAgent  [ 'ModuleStrategicMapORBAT_F', [11553.395,11736.623,0], [], 0, 'NONE' ];
BIS_ORBAT_AAF_7 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "I_HelicopterSquadron"' ];
BIS_ORBAT_AAF_7 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "I_AAF"' ];
BIS_ORBAT_AAF_7 setVariable [ 'Tiers', '2' ];
BIS_ORBAT_AAF_8 = createAgent  [ 'ModuleStrategicMapORBAT_F', [13912,15845,0], [], 0, 'NONE' ];
BIS_ORBAT_AAF_8 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "O_A"' ];
BIS_ORBAT_AAF_8 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "O_Brigade"' ];
BIS_ORBAT_AAF_8 setVariable [ 'Tiers', '2' ];
BIS_ORBAT_AAF_9 = createAgent  [ 'ModuleStrategicMapORBAT_F', [15235.3,11272.1,0], [], 0, 'NONE' ];
BIS_ORBAT_AAF_9 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "I_D_1"' ];
BIS_ORBAT_AAF_9 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "I_1stRegiment"' ];
BIS_ORBAT_AAF_9 setVariable [ 'Tiers', '2' ];
BIS_ORBAT_AAF_10 = createAgent  [ 'ModuleStrategicMapORBAT_F', [21315.7,7159.59,0], [], 0, 'NONE' ];
BIS_ORBAT_AAF_10 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "I_D_4"' ];
BIS_ORBAT_AAF_10 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "I_1stRegiment"' ];
BIS_ORBAT_AAF_10 setVariable [ 'Tiers', '2' ];
BIS_ORBAT_CSAT_1 = createAgent  [ 'ModuleStrategicMapORBAT_F', [16412.8,16943.2,0], [], 0, 'NONE' ];
BIS_ORBAT_CSAT_1 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "O_2"' ];
BIS_ORBAT_CSAT_1 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "O_Brigade"' ];
BIS_ORBAT_CSAT_1 setVariable [ 'Tiers', '2' ];
BIS_ORBAT_CSAT_4 = createAgent  [ 'ModuleStrategicMapORBAT_F', [14869.2,13012.2,-0.152949], [], 0, 'NONE' ];
BIS_ORBAT_CSAT_4 setVariable [ 'Path', 'configfile >> "CfgORBAT" >> "BIS" >> "O_3"' ];
BIS_ORBAT_CSAT_4 setVariable [ 'Parent', 'configfile >> "CfgORBAT" >> "BIS" >> "O_Brigade"' ];
BIS_ORBAT_CSAT_4 setVariable [ 'Tiers', '3' ];
