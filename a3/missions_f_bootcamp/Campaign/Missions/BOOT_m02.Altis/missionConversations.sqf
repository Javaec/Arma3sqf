case "01_Start": {
	["01_Start", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d01_Hello_World": {
	// Adams
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m02_d01_hello_world_ADA_";
	_timekeys = 	[
				0,
				3,
				5.5,
				12,
				15                   
			];
	
	_topic = "d01_hello_world_ADA_";
	_actor = BIS_adams;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m02\boot_m02_d01_hello_world.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Conway
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m02_d01_hello_world_LAC_";
	_timekeys = 	[
				1.25,
				18.25                     
			];
	
	_topic = "d01_hello_world_LAC_";
	_actor = BIS_lacey;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m02\boot_m02_d01_hello_world.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
};

case "05_Annoying": {
	// Set correct ID
	BIS_idiot1 setGroupID [name BIS_idiot1];
	
	["05_Annoying", "BOOT_m02", [["ISA", 0], ["ISA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["05_Annoying", "BOOT_m02", [["ADA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d05_AAF_Anger": {
	["d05_AAF_Anger", "BOOT_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "10_Assembled": {
	// Set correct ID
	BIS_train1 setGroupID [name BIS_train1];
	
	["10_Assembled", "BOOT_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Introduction_1": {
	["15_Introduction", "BOOT_m02", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Introduction_2": {
	["15_Introduction", "BOOT_m02", [["ADA", 1], ["ADA", 2]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Introduction_3": {
	["15_Introduction", "BOOT_m02", [["ADA", 3]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "20_Shot_Stand": {
	["20_Shot_Stand", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "25_Shot_Crouch": {
	["25_Shot_Crouch", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_Shot_Prone": {
	["30_Shot_Prone", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Suggest_Stand": {
	["35_Suggest_Stand", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "40_Suggest_Crouch": {
	["40_Suggest_Crouch", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Suggest_Prone": {
	["45_Suggest_Prone", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "50_Take_Scope": {
	["50_Take_Scope", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d10_Ballistics_and_Bearings": {
	["d10_Ballistics_and_Bearings", "BOOT_m02", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["d10_Ballistics_and_Bearings", "BOOT_m02", [["ADA", 1], ["ADA", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["d10_Ballistics_and_Bearings", "BOOT_m02", [["ADA", 2], ["ADA", 2]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["d10_Ballistics_and_Bearings", "BOOT_m02", [["LAC", 0], ["LAC", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["d10_Ballistics_and_Bearings", "BOOT_m02", [["ADA", 3], ["ADA", 3]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "49_CSAT": {
	["49_CSAT", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "55_Long_1": {
	["55_Long_1", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "60_Long_2": {
	["60_Long_2", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "65_Long_3": {
	["65_Long_3", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "70_Hold_Breath": {
	["70_Hold_Breath", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "75_Targets_Down": {
	["75_Targets_Down", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d15_Run_Around": {
	["d15_Run_Around", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d20_Fatigue": {
	["d20_Fatigue", "BOOT_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "80_Shoot_All": {
	["80_Shoot_All", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "85_Shot_Fatigued": {
	["85_Shot_Fatigued", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "90_Shot_Composed": {
	["90_Shot_Composed", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "95_Started_Composed": {
	["95_Started_Composed", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "100_Watch_Yourself": {
	["100_Watch_Yourself", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "105_All_Down": {
	["105_All_Down", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "110_Incident": {
	// Set correct ID
	BIS_idiot1 setGroupID [name BIS_idiot1];
	
	["110_Incident", "BOOT_m02", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x01_Long_1_Warning": {
	["x01_Long_1_Warning", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x05_Long_1_Reprimand": {
	["x05_Long_1_Reprimand", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x10_Long_2_Warning": {
	["x10_Long_2_Warning", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x15_Long_2_Reprimand": {
	["x15_Long_2_Reprimand", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x20_Long_3_Warning": {
	["x20_Long_3_Warning", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x25_Long_3_Reprimand": {
	["x25_Long_3_Reprimand", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x30_Left_Position_1": {
	["x30_Left_Position_1", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x35_Left_Position_2": {
	["x35_Left_Position_2", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x40_Left_Position_3": {
	["x40_Left_Position_3", "BOOT_m02", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};