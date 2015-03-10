case "01_Start": {
	["01_Start", "C_out2", [["KER", 0], ["KER", 0]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	waitUntil {!(BIS_fnc_earthquake_inprogress)};
	
	["01_Start", "C_out2", [["BHQ", 0], ["JAM", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["01_Start", "C_out2", [["KER", 2], ["KER", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["01_Start", "C_out2", [["KER", 3], ["KER", 3]], "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["01_Start", "C_out2", [["KER", 4]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "05_NATO_Chosen": {
	["05_NATO_Chosen", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "10_Orders": {
	["10_Orders", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "12_Plane_Sent": {
	["12_Plane_Sent", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "13_Plane_Fired": {
	["13_Plane_Fired", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "14_Plane_Disengage": {
	["14_Plane_Disengage", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "15_Neutralized": {
	["15_Neutralized", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "20_Contact": {
	["20_Contact", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "25_Defeated": {
	["25_Defeated", "C_out2", [["BHQ", 0], ["BHQ", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["25_Defeated", "C_out2", [["BHQ", 3], ["BHQ", 3]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["25_Defeated", "C_out2", [["ABB", 0], ["ABB", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["25_Defeated", "C_out2", [["BHQ", 4], ["BHQ", 4]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["25_Defeated", "C_out2", [["ABB", 1], ["ABB", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["25_Defeated", "C_out2", [["BHQ", 5], ["BHQ", 5]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	["25_Defeated", "C_out2", [["KER", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "30_Wave": {
	["30_Wave", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "35_The_Device": {
	[
		"35_The_Device",
		"C_out2",
		nil,
		"DIRECT",
		{
			private ["_sentence"];
			_sentence = _this select 3;
			
			if (_sentence == 9) then {
				[] spawn {
					scriptName "missionConversations.sqf: kill James";
					
					sleep 2;
					
					// Kill James
					BIS_james removeEventHandler ["Killed", BIS_james getVariable "BIS_killedEH"];
					
					if (!(isNil {BIS_james getVariable "BIS_posEH"})) then {
						removeMissionEventHandler ["Draw3D", BIS_james getVariable "BIS_posEH"];
						BIS_james setVariable ["BIS_posEH", nil];
					};
					
					BIS_james playMoveNow "Acts_SittingWounded_out";
				};
			};
		},
		nil,
		1
	] call BIS_fnc_kbTell;
	
	enableSentences false;
	
	// Actually kill James
	BIS_james setDamage 1;
	BIS_james setHitPointDamage ["HitHead", 0];
};

case "40_James_Dead": {
	["40_James_Dead", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "45_Danger": {
	["45_Danger", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "50_NATO_Angered": {
	["50_NATO_Angered", "C_out2", [["BHQ", 0], ["BHQ", 0]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 1;
	
	["50_NATO_Angered", "C_out2", [["BHQ", 1]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "55_Hang_Up": {
	["55_Hang_Up", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "60_Truck_Found": {
	["60_Truck_Found", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
};

case "65_In_Truck": {
	["65_In_Truck", "C_out2", nil, "VEHICLE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "70_Miller": {
	["70_Miller", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "75_CSAT_Inbound": {
	["75_CSAT_Inbound", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "80_Return": {
	["80_Return", "C_out2", nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "85_The_End_Of_All_Things": {
	["85_The_End_Of_All_Things", "C_out2", [["BHQ", 0], ["BHQ", 2]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
	
	sleep 2;
	
	["85_The_End_Of_All_Things", "C_out2", [["BHQ", 3]], "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
	enableSentences false;
};

case "x01_Out_Of_Ammo": {
	["x01_Out_Of_Ammo", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x03_Plane_Destroyed": {
	["x03_Plane_Destroyed", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};

case "x05_James_Bypassed": {
	["x05_James_Bypassed", "C_out2", nil, "SIDE", nil, nil, 1] call BIS_fnc_kbTell;
};