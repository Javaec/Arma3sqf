case "start": 
{
	["01_Start"] call BIS_fnc_kbTell;
	["BIS_objHighway", "Current"] call BIS_fnc_missionTasks;
	BIS_genericMember6 setGroupID ["TEMP"];
	BIS_genericMember1 setGroupID [localize "STR_A3_Group_Sigma"];
	BIS_genericMember6 setGroupID [localize "STR_A3_Group_Gamma"];
};

case "rendezvous": 
{
	BIS_regrouped = BIS_regrouped + 1;
	["06_Rendezvous_2"] call BIS_fnc_kbTell;
	{_x setMarkerType "hd_dot"} forEach ["BIS_intel_5", "BIS_intel_6", "BIS_intel_7"];
	[BIS_genericMember4, BIS_genericMember6] join BIS_inf;
	{_x setUnitPos "AUTO"} forEach [BIS_genericMember4, BIS_genericMember6];
	if (BIS_regrouped == 2) then {
		["BIS_objRendezvous", "Succeeded"] call BIS_fnc_missionTasks;
	};
	sleep 3;
	saveGame;
};

case "rendezvous2": 
{
	BIS_regrouped = BIS_regrouped + 1;
	/*if (dayTime < 10 && dayTime > 5) then {
		["05_Rendezvous_1"] call BIS_fnc_kbTell;
	} else {
		["05_Rendezvous_1", nil, ["b_m03_05_rendezvous_1_GUB_0"]] call BIS_fnc_kbTell;
	};*/
	["05_Rendezvous_1", nil, ["b_m03_05_rendezvous_1_GUB_0"]] call BIS_fnc_kbTell;
	{_x setMarkerType "hd_dot"} forEach ["BIS_intel", "BIS_intel_1", "BIS_intel_2", "BIS_intel_3", "BIS_intel_4"];
	[BIS_genericMember1, BIS_genericMember3] join BIS_inf;
	{_x setUnitPos "AUTO"} forEach [BIS_genericMember1, BIS_genericMember3];
	if (BIS_regrouped == 2) then {
		["BIS_objRendezvous", "Succeeded"] call BIS_fnc_missionTasks;
	};
	sleep 3;
	saveGame;
};

case "approaching_complex_1": 
{
	["08_Approaching_Complex_1", nil, nil, BIS_base] call BIS_fnc_kbTell;
	saveGame;
};

case "cistern": 
{
	["10_Cistern_Found"] call BIS_fnc_kbTell;
};

case "cistern_empty": 
{
	sleep 1;
	["15_Cistern_Empty", nil, ["b_m03_15_cistern_empty_KER_0", "b_m03_15_cistern_empty_KER_0"], BIS_inf] call BIS_fnc_kbTell;
	["15_Cistern_Empty", nil, ["b_m03_15_cistern_empty_KER_1"]] call BIS_fnc_kbTell;
	sleep 5;
	"miller_plan_b" spawn BIS_fnc_missionConversations;
};

case "cistern_dead_no_matter": 
{
	["x01_Cistern_Dead_No_Matter", nil, ["b_m03_x01_cistern_dead_no_matter_KER_0", "b_m03_x01_cistern_dead_no_matter_KER_0"], BIS_inf] call BIS_fnc_kbTell;
	["x01_Cistern_Dead_No_Matter", nil, ["b_m03_x01_cistern_dead_no_matter_KER_1"]] call BIS_fnc_kbTell;
	sleep 5;
	"miller_plan_b" spawn BIS_fnc_missionConversations;
};

case "miller_plan_b": 
{
	["20_Plan_B"] call BIS_fnc_kbTell;
	sleep 3;
	["21_ItsOn", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	"BIS_objDepot" call BIS_fnc_missionTasks;
	"BIS_fuelDump" setMarkerType "hd_warning";
	"BIS_warn1_5_1" setMarkerType "hd_warning";
	"BIS_warnArea1_2_1_1" setMarkerSize [150, 150];
	"BIS_warnArea1_2_1" setMarkerSize [50, 50];
	saveGame;
};

case "approaching_complex_2": 
{
	["23_Approaching_Complex_2", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	"BIS_team2" setMarkerType "hd_start";
	saveGame;
	BIS_suppReq_kappa = [BIS_inf, "Team2"] call BIS_fnc_addCommMenuItem;
	["AddTopic", ["i05_Attacking_Complex_2", "B_m03", localize "STR_A3_campaign_b_m03_instructor01"]] call BIS_fnc_InstructorFigure;
};

case "team_2_attack": 
{
	["25_Team_2_Attack"] call BIS_fnc_kbTell;
};

case "hvt_info": 
{
	["30_HVT_Wait"] call BIS_fnc_kbTell;
	0 fadeMusic 0;
	playMusic "LeadTrack02a_F_EPB";
	10 fadeMusic 0.15;
	sleep 1;
	["31_HVT_Hell"] call BIS_fnc_kbTell;
	sleep 3;
	["32_HVT_Intel"] call BIS_fnc_kbTell;
	{
		_x setMarkerAlpha 1;
	} forEach 
	[
		"BIS_convoy1", 
		"BIS_convoy1_1", 
		"BIS_convoy1_2", 
		"BIS_convoy1_3", 
		"BIS_convoy1_4",
		"BIS_convoy1_5",
		"BIS_convoy1_5_1", 
		"BIS_convoy1_5_2", 
		"BIS_convoy1_5_3", 
		"BIS_convoy1_5_4", 
		"BIS_convoy1_6"
	];
	BIS_convoyTime = time + 600;
	"ice" setMarkerType "hd_destroy";
	"BIS_handover" setMarkerSize [15, 15];
	"BIS_objHVT" call BIS_fnc_missionTasks;
	sleep 1;
	["33_HVT_Decision"] call BIS_fnc_kbTell;
	5 fadeMusic 0.25;
	saveGame
};

case "cistern_dead": 
{
	["x05_Cistern_Dead", nil, ["b_m03_x05_cistern_dead_KER_0", "b_m03_x05_cistern_dead_KER_0"]] call BIS_fnc_kbTell;
	if (!triggerActivated BIS_away) then {
		["x05_Cistern_Dead", nil, ["b_m03_x05_cistern_dead_KER_1", "b_m03_x05_cistern_dead_KER_1"]] call BIS_fnc_kbTell;
		saveGame;
	};
};

case "miller_angry": 
{
	["35_Miller_angry", nil, ["b_m03_35_miller_angry_MIL_0", "b_m03_35_miller_angry_MIL_0"]] call BIS_fnc_kbTell;
	["35_Miller_angry", nil, ["b_m03_35_miller_angry_KER_0", "b_m03_35_miller_angry_KER_0"], BIS_inf] call BIS_fnc_kbTell;
	["35_Miller_angry", nil, ["b_m03_35_miller_angry_KER_1"]] call BIS_fnc_kbTell;
};

case "miller_grateful": 
{
	["x10_Miller_Grateful", nil, ["b_m03_x10_miller_grateful_KER_0", "b_m03_x10_miller_grateful_MIL_1"]] call BIS_fnc_kbTell;
	["x10_Miller_Grateful", nil, ["b_m03_x10_miller_grateful_KER_1"], BIS_inf] call BIS_fnc_kbTell;
};

case "miller_impressed": 
{
	["x15_Miller_Impressed"] call BIS_fnc_kbTell;
};

case "empty_handed": 
{
	["x20_Empty_Handed"] call BIS_fnc_kbTell;
	[["B_hub02", 3]] call BIS_fnc_endMission;
};