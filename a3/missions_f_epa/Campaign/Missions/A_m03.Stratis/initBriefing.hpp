//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Hide markers
"BIS_tower" setMarkerAlpha 0;

// Create Alpha's ORBAT marker
"BIS_alpha" call BIS_fnc_camp_createAlphaORBAT;

[
	configFile >> "CfgORBAT" >> "BIS" >> "B_Falcon_C",
	nil,nil,
	"Artillery"	// Change Charlie's marker to artillery
] call BIS_fnc_ORBATSetGroupParams;

// Move dummy markers to ORBAT markers
"BIS_bravo" setMarkerPos position BIS_bravoORBAT;
"BIS_charlie" setMarkerPos position BIS_charlieORBAT;
"BIS_delta" setMarkerPos position BIS_deltaORBAT;
"BIS_maxwell" setMarkerPos position BIS_maxwellORBAT;

// Move ORBAT markers to area markers
BIS_mike26ORBAT setPos markerPos "BIS_mike26";
BIS_rogainORBAT setPos markerPos "BIS_rogain";

// Change markers if necessary
// Camp Tempest
if (!(isNil "BIS_tempestORBAT")) then {
	BIS_tempestORBAT setPos markerPos "BIS_tempest";
} else {
	"BIS_tempest" setMarkerColor "ColorBlack";
};

// Girna
if (!(isNil "BIS_villageORBAT")) then {
	BIS_villageORBAT setPos markerPos "BIS_village";
} else {
	"BIS_village" setMarkerColor "ColorBlack";
};

// Add frontline
if ({!(isNil _x)} count ["BIS_A_m02", "BIS_A_m05"] == 0) then {
	// Played first
	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m01.sqf";
} else {
	if (isNil "BIS_A_m05") then {
		// Played after A_m02
		execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m03-A_m02.sqf";
	} else {
		// Played after A_m02 and A_m05
		execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m03-A_m02-A_m05.sqf";
	};
};

{_x call BIS_fnc_missionTasks} forEach ["BIS_OP", "BIS_towers", "BIS_mike26"];

//--- Select "Tasks" subject by default
[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};

// Signal
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_A_m03_Briefing_Signal_text",
			"<marker name = 'BIS_alpha'>",		// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_bravo'>",		// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_charlie'>",	// %7
			"</marker>",				// %8
			"<br/>",				// %9
			"<marker name = 'BIS_maxwell'>",	// %10
			"</marker>",				// %11
			"<br/>",				// %12
			"<marker name = 'BIS_delta'>",		// %13
			"</marker>"				// %14
		]
	]
];

// Execution
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_A_m03_Briefing_Execution_text",
			"<marker name = 'BIS_OP'>",		// %1
			"</marker>",				// %2
			"<marker name = 'BIS_mike26'>",		// %3
			"</marker>",				// %4
			"<marker name = 'BIS_charlie'>",	// %5
			"</marker>"				// %6
		]
	]
];

// Mission
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_A_m03_Briefing_Mission_text",
			"<marker name = 'BIS_charlie'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_bravo'>",		// %3
			"</marker>",				// %4
			"<marker name = 'BIS_mike26'>",		// %5
			"</marker>"				// %6
		]
	]
];

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_m03_Briefing_Situation_text",
			"<br/><br/>",				// %1
			"",					// %2 (removed)
			"",					// %3 (removed)
			"<marker name = 'BIS_mike26'>",		// %4
			"</marker>",				// %5
			"<br/><br/>",				// %6
			"<br/><br/>",				// %7
			"<marker name = 'BIS_charlie'>",	// %8
			"</marker>",				// %9
			"<marker name = 'BIS_alpha'>",		// %10
			"</marker>",				// %11
			"<marker name = 'BIS_OP'>",		// %12
			"</marker>",				// %13
			"<marker name = 'BIS_bravo'>",		// %14
			"</marker>"				// %15
		]
	]
];

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};