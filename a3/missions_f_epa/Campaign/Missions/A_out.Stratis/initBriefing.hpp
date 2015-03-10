//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Create Alpha's ORBAT marker
"BIS_alpha" call BIS_fnc_camp_createAlphaORBAT;

// Set Miller as Delta's leader
[
	configFile >> "CfgORBAT" >> "BIS" >> "B_Falcon_D",
	nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,
	localize "STR_A3_CFGIDENTITIES_MILLER0",
	"CAPTAIN"
] call BIS_fnc_ORBATSetGroupParams;

[
	configFile >> "CfgORBAT" >> "BIS" >> "B_Falcon_C",
	nil,nil,
	"Artillery"	// Make Charlie's marker artillery
] call BIS_fnc_ORBATSetGroupParams;

// Move dummy markers to ORBAT markers
"BIS_bravo" setMarkerPos position BIS_bravoORBAT;
"BIS_charlie" setMarkerPos position BIS_charlieORBAT;
"BIS_delta" setMarkerPos position BIS_deltaORBAT;

// Move ORBAT markers to area markers
BIS_townORBAT setPos markerPos "BIS_town";
BIS_rogainORBAT setPos markerPos "BIS_rogain";
BIS_kaminoORBAT setPos markerPos "BIS_kamino";

// Position area markers

// Add frontline
execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m04.sqf";

// Tasks
{_x call BIS_fnc_missionTasks} forEach ["BIS_bravo", "BIS_range", "BIS_town"];

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
			localize "STR_A3_A_out_Briefing_Signal_text",
			"<marker name = 'BIS_alpha'>",		// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_bravo'>",		// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_charlie'>",	// %7
			"</marker>",				// %8
			"<marker name = 'BIS_rogain'>",		// %9
			"</marker>",				// %10
			"<br/>",				// %11
			"<marker name = 'BIS_delta'>",		// %12
			"</marker>",				// %13
			"<marker name = 'BIS_town'>",		// %14
			"</marker>"				// %15
		]
	]
];

// Execution
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_A_out_Briefing_Execution_text",
			"<marker name = 'BIS_range'>",	// %1
			"</marker>",			// %2
			"<marker name = 'BIS_town'>",	// %3
			"</marker>",			// %4
			"",				// %5	(removed)
			""				// %6	(removed)
		]
	]
];

// Mission
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_A_out_Briefing_Mission_text",
			"<marker name = 'BIS_range'>",	// %1
			"</marker>",			// %2
			"<marker name = 'BIS_town'>",	// %3
			"</marker>"			// %4
		]
	]
];

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_out_Briefing_Situation_text",
			"<br/><br/>",				// %1
			"",					// %2	(removed)
			"",					// %3	(removed)
			"<br/><br/>",				// %4
			"",					// %5	(removed)
			"",					// %6	(removed)
			"<br/><br/>",				// %7
			"<marker name = 'BIS_delta'>",		// %8
			"</marker>",				// %9
			"<marker name = 'BIS_alpha'>",		// %10
			"</marker>",				// %11
			"<marker name = 'BIS_bravo'>",		// %12
			"</marker>",				// %13
			"<marker name = 'BIS_range'>",		// %14
			"</marker>",				// %15
			"<marker name = 'BIS_charlie'>",	// %16
			"</marker>",				// %17
			"<marker name = 'BIS_rogain'>",		// %18
			"</marker>",				// %19
			"<br/><br/>",				// %20
			"<marker name = 'BIS_town'>",		// %21
			"</marker>",				// %22
			"<br/><br/>"				// %23
		]
	]
];

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};