case "01_Start": {
	["01_Start", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "05_Idiots": {
	["05_Idiots", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "10_Gather": {
	["10_Gather", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "15_Map": {
	["15_Map", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "20_Lesson": {
	["20_Lesson", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "25_Grids": {
	["25_Grids", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_Triangulate": {
	["30_Triangulate", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "35_Info": {
	["35_Info", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "40_Mark_Town": {
	["40_Mark_Town", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "45_Town_Marked": {
	["45_Town_Marked", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "49_More_Info": {
	["49_More_Info", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "50_Mark_Hill": {
	["50_Mark_Hill", "BOOT_m03", [["ADA", 0], ["ADA", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["50_Mark_Hill", "BOOT_m03", [["ADA", 1]], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
	enableSentences false;
};

case "55_Hill_Marked": {
	["55_Hill_Marked", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "60_Mark_Location": {
	["60_Mark_Location", "BOOT_m03", [["ADA", 0], ["ADA", 2]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	["60_Mark_Location", "BOOT_m03", [["ADA", 3]], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
	enableSentences false;
};

case "65_Location_Marked": {
	["65_Location_Marked", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "70_En_Route": {
	["70_En_Route", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "75_Orders": {
	["75_Orders", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "80_Get_In": {
	["80_Get_In", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "85_Left_1": {
	["85_Left_1", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "90_GPS": {
	["90_GPS", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "90_GPS": {
	["90_GPS", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "95_Left_2": {
	["95_Left_2", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "100_Left_3": {
	["100_Left_3", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "105_Earthquake_1": {
	["105_Earthquake", "BOOT_m03", [["BSA", 0], ["BSA", 0]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "105_Earthquake_2": {
	["105_Earthquake", "BOOT_m03", [["BSA", 1]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "110_SITREP": {
	["110_SITREP", "BOOT_m03", [["ADA", 0], ["ADA", 0]], "VEHICLE", nil, [BIS_adams, BIS_lacey, BIS_lacey, BIS_lacey], 1] call BIS_fnc_kbTell;
	["110_SITREP", "BOOT_m03", [["ADA", 1], ["ADA", 3]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	["110_SITREP", "BOOT_m03", [["BSA", 0]], "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "115_Right_1": {
	["115_Right_1", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "120_Arrived": {
	["120_Arrived", "BOOT_m03", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "125_Disembark": {
	["125_Disembark", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "d01_Situation": {
	// Conway
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m03_d01_situation_LAC_";
	_timekeys = 	[
				0,	// Christ
				6,	// Patrol
				13,	// Excessive force
				15.5,	// Just civilians
				35.5	// Are you kidding me
			];
	
	_topic = "d01_situation_LAC_";
	_actor = BIS_lacey;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m03\boot_m03_d01_situation.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// Adams
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m03_d01_situation_ADA_";
	_timekeys = 	[
				1.5,	// What the hell
				8,	// And these people
				14.5,	// Cool it
				18,	// What's the deal
				23.5,	// All of them
				30.5,	// Medical inbound
				36.75,	// Search the buildings
				37.5,	// Set up perimeter
				38.5	// Call for medevac
			];
	
	_topic = "d01_situation_ADA_";
	_actor = BIS_adams;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m03\boot_m03_d01_situation.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
	
	// AAF Idiot
	private ["_prefix", "_timekeys", "_topic", "_actor"];
	_prefix = "boot_m03_d01_situation_ISA_";
	_timekeys = 	[
				3.5,	// We were attacked
				7.25,	// Yes
				10.75,	// Was I unclear
				21.5,	// Yes again
				29,	// Only these ones
				33.5	// No medical
			];
	
	_topic = "d01_situation_ISA_";
	_actor = BIS_idiot1;	
	
	_actor kbAddTopic [ _topic, "\A3\Missions_F_Bootcamp\kb\BOOT_m03\boot_m03_d01_situation.bikb", ""];
	[_prefix, _timekeys, _topic, 0, _actor] call BIS_fnc_kbTellSync;
};

case "130_Clear_1": {
	["130_Clear_1", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "135_Clear_2": {
	["135_Clear_2", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "140_Clear_3": {
	["140_Clear_3", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "145_Stash_Found": {
	["145_Stash_Found", "BOOT_m03", [["LAC", 0], ["LAC", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	["145_Stash_Found", "BOOT_m03", [["ADA", 0]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
	enableSentences false;
};

case "d05_Returned": {
	["d05_Returned", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "150_RTB": {
	["150_RTB", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x01_Mark_Start_Wrong_1": {
	["x01_Mark_Start_Wrong_1", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x05_Mark_Start_Wrong_2": {
	["x05_Mark_Start_Wrong_2", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x10_Mark_Town_Wrong_1": {
	["x10_Mark_Town_Wrong_1", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x15_Mark_Town_Wrong_2": {
	["x15_Mark_Town_Wrong_2", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x20_Mark_Hill_Wrong_1": {
	["x20_Mark_Hill_Wrong_1", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x25_Mark_Hill_Wrong_2": {
	["x25_Mark_Hill_Wrong_2", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x30_Mark_Location_Wrong": {
	["x30_Mark_Location_Wrong", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x35_Mark_Location_Info": {
	["x35_Mark_Location_Info", "BOOT_m03", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x40_Mark_Location_Again": {
	["x40_Mark_Location_Again", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x45_Closed_Map_1": {
	["x45_Closed_Map_1", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x50_Closed_Map_2": {
	["x50_Closed_Map_2", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x55_Closed_Map_3": {
	["x55_Closed_Map_3", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x60_Already_Cleared": {
	["x60_Already_Cleared", "BOOT_m03", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};