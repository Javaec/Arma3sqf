case "start": {
	["01_Start"] call BIS_fnc_kbTell;
	10 fadeMusic 0.5;
	BIS_inf switchMove "amovpercmstpslowwrfldnon";
	BIS_inf setBehaviour "AWARE";
	[1, nil, FALSE] spawn BIS_fnc_cinemaBorder;
	_null = ["BIS_objWait", "Succeeded"] call BIS_fnc_missionTasks;
	_null = ["BIS_objGetIn", "Current"] call BIS_fnc_missionTasks;
	sleep 4;
	_null = "stage_1" spawn BIS_fnc_missionConversations;
};

case "stage_1": {
	_null = [] execVM "arty.sqf";
	["03_Stage_1", nil, ["c_m01_03_stage_1_BHQ_0", "c_m01_03_stage_1_BHQ_0"]] call BIS_fnc_kbTell;
	sleep 3;
	["03_Stage_1", nil, ["c_m01_03_stage_1_KER_0"], BIS_inf] call BIS_fnc_kbTell;
};

case "hello": {
	3 fadeMusic 0.15;
	_null = ["BIS_objGetIn", "Succeeded"] call BIS_fnc_missionTasks;
	_null = ["BIS_objMove", "Current"] call BIS_fnc_missionTasks;
	_null = ["05_Hello", nil, nil, TRUE] call BIS_fnc_kbTell;
};

case "lift_overhead": {
	_null = ["10_Lift_Overhead", nil, nil, TRUE] call BIS_fnc_kbTell;
};

case "support_ready": {
	_null = "15_Support_Ready" call BIS_fnc_kbTell;
	["AddTopic", ["i01_Combined_Assault", "C_m01", localize "STR_A3_campaign_c_m01_other02"]] call BIS_fnc_InstructorFigure;
};

case "support_attacking": {
	["RemoveTopic", ["i01_Combined_Assault"]] call BIS_fnc_InstructorFigure;
	//{_x setCaptive FALSE} forEach [BIS_APC1, BIS_APC2];
	_null = "20_Support_Attacking" call BIS_fnc_kbTell;
};

case "support_lost": {
	_null = ["x01_Support_Lost", nil, nil, BIS_inf] call BIS_fnc_kbTell;
};

case "complex_seized": {
	[BIS_inf, BIS_suppReq_APCs] call BIS_fnc_removeCommMenuItem;
	["RemoveTopic", ["i01_Combined_Assault"]] call BIS_fnc_InstructorFigure;
	_null = ["BIS_objSeize", "Succeeded"] call BIS_fnc_missionTasks;
	if !(triggerActivated BIS_LZ) then {
		_null = ["BIS_objLZ", "Current"] call BIS_fnc_missionTasks;
	};
	_null = ["25_Complex_Seized", nil, ["c_m01_25_complex_seized_KER_0", "c_m01_25_complex_seized_BHQ_1"]] call BIS_fnc_kbTell;
	_null = ["25_Complex_Seized", nil, ["c_m01_25_complex_seized_KER_1", "c_m01_25_complex_seized_KER_1"], BIS_inf] call BIS_fnc_kbTell;
	BIS_ambience = TRUE;
	sleep 1;
	//if (viewDistance < 2000) then {setViewDistance 2000};
	saveGame;
	["AddTopic", ["i05_Securing_LZ", "C_m01", localize "STR_A3_campaign_c_m01_other03"]] call BIS_fnc_InstructorFigure;
};

case "lz_secured": {
	BIS_showdown = TRUE;
	["RemoveTopic", ["i05_Securing_LZ"]] call BIS_fnc_InstructorFigure;
	if ("BIS_objAssemble" call BIS_fnc_taskExists) then {_null = ["BIS_objAssemble", "Succeeded"] call BIS_fnc_missionTasks};
	_null = ["BIS_objLift", "Current"] call BIS_fnc_missionTasks;
	{
		_x enableSimulation TRUE;
		_x hideObject FALSE;
		_x setCaptive FALSE
	} forEach ((units BIS_grpBase) + [vehicle leader BIS_grpBase, vehicle BIS_shilka] + (units group BIS_shilka));
	{_x allowDamage FALSE} forEach ((units group BIS_shilka) + [vehicle BIS_Shilka]);
	_null = "30_LZ_Secured" call BIS_fnc_kbTell;
};

case "lift_going_down": {
	0 fadeMusic 0.0;
	playMusic ["LeadTrack02_F_EPC", 12];
	3 fadeMusic 0.5;
	sleep 2;
	_null = ["35_Lift_Going_Down", nil, ["c_m01_35_lift_going_down_KER_0", "c_m01_35_lift_going_down_KER_0"], BIS_inf] call BIS_fnc_kbTell;
	_null = ["35_Lift_Going_Down", nil, ["c_m01_35_lift_going_down_ABB_0", "c_m01_35_lift_going_down_ABB_0"]] call BIS_fnc_kbTell;
	sleep 0.25;
	driver BIS_heli allowDamage TRUE;
	vehicle BIS_heli allowDamage TRUE;
	sleep 0.25;
	driver BIS_heli setDamage 1;
	vehicle BIS_heli setDamage 1;
	gunner BIS_shilka setCombatMode "BLUE";
	gunner BIS_shilka disableAI "AUTOTARGET";
	{_x allowDamage TRUE} forEach ((units group BIS_shilka) + [vehicle BIS_Shilka]);
	_null = ["BIS_objLift", "Canceled"] call BIS_fnc_missionTasks;
	// random AA fire
	_null = [] execVM "aa.sqf";
	_null = ["35_Lift_Going_Down", nil, ["c_m01_35_lift_going_down_BHQ_0"]] call BIS_fnc_kbTell;
	"BIS_objAA" call BIS_fnc_missionTasks;
	sleep 45;
	saveGame;
};

case "aa_neutralized": {
	_null = [] execVM "assault.sqf";
	_null = ["BIS_objAA", "Succeeded"] call BIS_fnc_missionTasks;
	_null = "40_AA_Neutralized" call BIS_fnc_kbTell;
	_null = ["BIS_objJoin", "Canceled"] call BIS_fnc_missionTasks;
	_null = "43_AA_Aside" call BIS_fnc_kbTell;
	sleep 16;
	_null = "tremors" spawn BIS_fnc_missionConversations;
};

case "tremors": {
	enableSentences FALSE;
	_null = [2] spawn BIS_fnc_EarthQuake;
	sleep 11;
	enableSentences TRUE;
	_null = "45_Tremors" call BIS_fnc_kbTell;
	sleep 2;
	_null = ["47_Tremors2", nil, ["c_m01_47_tremors2_MEM_0", "c_m01_47_tremors2_BHQ_0"]] call BIS_fnc_kbTell;
	_null = ["47_Tremors2", nil, ["c_m01_47_tremors2_KER_0", "c_m01_47_tremors2_KER_0"], BIS_inf] call BIS_fnc_kbTell;
	[["C_m02", 1]] call BIS_fnc_endMission;
};