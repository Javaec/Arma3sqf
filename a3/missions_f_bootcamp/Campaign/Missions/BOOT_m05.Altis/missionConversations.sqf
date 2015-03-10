case "01_Start": {
	["01_Start", "BOOT_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "05_Situation": {
	["05_Situation", "BOOT_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "10_CSAT": {
	["10_CSAT", "BOOT_m05", [["BSA", 0], ["BSA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["10_CSAT", "BOOT_m05", [["BSB", 0], ["BSB", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	["10_CSAT", "BOOT_m05", [["BSB", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Checkpoint": {
	["15_Checkpoint", "BOOT_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "20_Fire": {
	["20_Fire", "BOOT_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "25_Truck": {
	["25_Truck", "BOOT_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_In_Truck": {
	["30_In_Truck", "BOOT_m05", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Mess": {
	["35_Mess", "BOOT_m05", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "40_Orders": {
	["40_Orders", "BOOT_m05", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Aftermath_1": {
	// Conway
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_45_aftermath_LAC_";
	_timekeys = 	[
				0,
				6,
				9,
				13,
				20.5,
				27.5
			];
	
	_topic = "45_aftermath_LAC_";
	_actor = BIS_lacey;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_45_aftermath.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Abusive AAF
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_45_aftermath_ISA_";
	_timekeys = 	[
				11                  
			];
	
	_topic = "45_aftermath_ISA_";
	_actor = BIS_abuser;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_45_aftermath.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Akhanteros
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_45_aftermath_IHQ_";
	_timekeys = 	[
				18,
				23.5,
				30
			];
	
	_topic = "45_aftermath_IHQ_";
	_actor = BIS_IHQ;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_45_aftermath.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
};

case "45_Aftermath_2": {
	["45_Aftermath", "BOOT_m05", [["LAC", 6], ["LAC", 6]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["45_Aftermath", "BOOT_m05", [["BHQ", 0], ["LAC", 7]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["45_Aftermath", "BOOT_m05", [["BHQ", 1], ["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Aftermath_3": {
	["45_Aftermath", "BOOT_m05", [["BHQ", 2], ["BHQ", 3]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["45_Aftermath", "BOOT_m05", [["LAC", 9], ["LAC", 9]], "SIDE", nil, [BIS_lacey, BIS_BHQ, BIS_BHQ, BIS_BHQ], 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Aftermath_4": {
	["45_Aftermath", "BOOT_m05", [["IHQ", 3]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d01_Hate": {
	["d01_Hate", "BOOT_m05", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d05_Results": {
	// Conway
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_d05_results_LAC_";
	_timekeys = 	[
				0,
				4.25,
				13
			];
	
	_topic = "d05_results_LAC_";
	_actor = BIS_lacey;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_d05_results.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Adams
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_d05_results_ADA_";
	_timekeys = 	[
				2,
				5.5
			];
	
	_topic = "d05_results_ADA_";
	_actor = BIS_adams;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_d05_results.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
};

case "d10_Ending": {
	// Conway
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_d10_ending_LAC_";
	_timekeys = 	[
				0
			];
	
	_topic = "d10_ending_LAC_";
	_actor = BIS_lacey;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_d10_ending.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Adams
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m05_d10_ending_ADA_";
	_timekeys = 	[
				3,
				6
			];
	
	_topic = "d10_ending_ADA_";
	_actor = BIS_adams;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m05\boot_m05_d10_ending.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
};