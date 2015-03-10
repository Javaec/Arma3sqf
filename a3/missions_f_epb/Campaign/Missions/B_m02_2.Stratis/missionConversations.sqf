//***************************
//Main
//***************************
case "BIS_briefing" : {
	["00_briefing","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_stopBoats" : {
	["01_stopBoats","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_selectLocation" : {
	["02_selectLocation","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_position0" : {
	["03_position0","B_m02_2", nil, "VEHICLE"] call bis_fnc_kbTell;
};

case "BIS_slowDownBoat" : {
	["04_slowDownBoat","B_m02_2", nil, "VEHICLE"] call bis_fnc_kbTell;
};

case "BIS_reportIn" : {
	["05_reportLanding","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_quickBriefing1" : {
	["10_quickBriefing1","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_quickBriefing2" : {
	["15_quickBriefing2","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_goodLuck" : {
	["20_goodLuck","B_m02_2", nil, "VEHICLE"] call bis_fnc_kbTell;
};

case "BIS_reportArrival" : {
	["25_reportArrival","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_goLoud" : {
	["30_goLoud","B_m02_2", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_firstContact" : {
	["35_firstContact","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_chaosOneQuarter" : {
	["40_chaosOneQuarter","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_chaosTwoQuarters" : {
	["45_chaosTwoQuarters","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_chaosThreeQuarters" : {
	["50_chaosThreeQuarters","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_chaosThreshold" : {
	["55_chaosThreshold","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_extract" : {
	["60_extract","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_nikosSecure" : {
	["65_nikosSecure","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_extractComplete" : {
	["70_extractComplete","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

//***************************
//Exceptions
//***************************
case "BIS_x_selectionTimeout" : {
	["x00_selectionTimeout","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_position1" : {
	["x01_position1","B_m02_2", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_x_position2" : {
	["x02_position2","B_m02_2", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_x_position3" : {
	["x03_position3","B_m02_2", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_x_lighthouse" : {
	["x05_lighthouse","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_timeoutWarning" : {
	["x10_timeoutWarning","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_timeoutFailure" : {
	["x15_timeoutFailure","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_extractionWarning" : {
	["x20_extractionWarning","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_extractionFailure" : {
	["x25_extractionFailure","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_extractMeetingComplete" : {
	["x30_extractMeetingComplete","B_m02_2", nil, "SIDE"] call bis_fnc_kbTell;
};
