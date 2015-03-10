case "01_Start": {
	// Adams
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m04_01_start_ADA_";
	_timekeys = 	[
				0,
				4.5,
				18.25,
				33.25
			];
	
	_topic = "01_start_ADA_";
	_actor = BIS_adams;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m04\boot_m04_01_start.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// MacKinnon
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m04_01_start_BHQ_";
	_timekeys = 	[
				3,
				8.5,
				13,
				16.5,
				19,
				23.25,
				27.5,
				29,
				31.5,
				33.75
			];
	
	_topic = "01_start_BHQ_";
	_actor = BIS_BHQ;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m04\boot_m04_01_start.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Conway
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m04_01_start_LAC_";
	_timekeys = 	[
				11,
				20                    
			];
	
	_topic = "01_start_LAC_";
	_actor = BIS_lacey;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m04\boot_m04_01_start.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
};

case "d01_Situation": {
	["d01_Situation", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "03_Checkpoint": {
	["03_Checkpoint", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "05_Near_Location": {
	["05_Near_Location", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "10_Convoy_Found": {
	["10_Convoy_Found", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_ROE": {
	["15_ROE", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "20_Confirm": {
	["20_Confirm", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "25_Orders": {
	["25_Orders", "BOOT_m04", [["ADA", 0], ["ADA", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	["25_Orders", "BOOT_m04", [["ADA", 1]], "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_Waiting": {
	["30_Waiting", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Overwatch": {
	["35_Overwatch", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "40_Continue": {
	["40_Continue", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Spotted": {
	["45_Spotted", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "50_Friendly": {
	["50_Friendly", "BOOT_m04", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "55_Covering": {
	["55_Covering", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "60_Engage": {
	["60_Engage", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "65_Regroup": {
	["65_Regroup", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "70_Move_Up": {
	["70_Move_Up", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "80_Wave_2": {
	["80_Wave_2", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "85_All_Clear": {
	["85_All_Clear", "BOOT_m04", [["ADA", 0], ["ADA", 1]], "GROUP", nil, [BIS_adams, BIS_lacey, BIS_lacey], 1] call BIS_fnc_kbTell;
	["85_All_Clear", "BOOT_m04", [["ADA", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "90_Wounded_Leader": {
	["90_Wounded_Leader", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "95_Check_Up_1": {
	["95_Check_Up", "BOOT_m04", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "95_Check_Up_2": {
	["95_Check_Up", "BOOT_m04", [["ADA", 1]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "100_Treat": {
	["100_Treat", "BOOT_m04", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "105_Report": {
	["105_Report", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "110_Treating": {
	["110_Treating", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "115_Medical": {
	["115_Medical", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "120_Treated": {
	["120_Treated", "BOOT_m04", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "125_Perimeter": {
	["125_Perimeter", "BOOT_m04", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["125_Perimeter", "BOOT_m04", [["ADA", 1]], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
};

case "x01_Ignored_ROE": {
	["x01_Ignored_ROE", "BOOT_m04", nil, "GROUP", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x05_Wounded_Player": {
	["x05_Wounded_Player", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x10_Status_Treated": {
	["x10_Status_Treated", "BOOT_m04", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};