//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Initialize Instructor Figure
["Init"] call BIS_fnc_InstructorFigure;

// Move markers to correct positions
"BIS_omega" setMarkerPos position BIS_omegaORBAT;
"BIS_arty" setMarkerPos position BIS_arty;
"BIS_sigma" setMarkerPos position BIS_sigmaORBAT;
"BIS_slingshot" setMarkerPos position BIS_slingshotORBAT;

{_x call BIS_fnc_missionTasks} forEach ["BIS_arty", "BIS_command"];

[] spawn {
	//Wait for display to be available
	waituntil { !isNull (findDisplay 37) };

	//Select Tasks subject by default
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
			localize "STR_A3_B_out2_Briefing_Signal_text",
			"<marker name = 'BIS_omega'>",		// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_sigma'>",		// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_slingshot'>",	// %7
			"</marker>"				// %8
		]
	]
];

// Execution
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_B_out2_Briefing_Execution_text",
			"<marker name = 'BIS_arty'>",		// %1
			"</marker>",				// %2
			"<marker name = 'BIS_command'>",	// %3
			"</marker>",				// %4
			"<marker name = 'BIS_slingshot'>",	// %5
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
			localize "STR_A3_B_out2_Briefing_Mission_text",
			"<marker name = 'BIS_airfield'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_arty'>",		// %3
			"</marker>",				// %4
			"<marker name = 'BIS_command'>",	// %5
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
			localize "STR_A3_B_out2_Briefing_Situation_text",
			"<br/><br/>",				// %1
			"<br/><br/>",				// %2
			"<br/><br/>",				// %3
			"<marker name = 'BIS_airport'>",	// %4
			"</marker>",				// %5
			"<br/><br/>",				// %6
			"<marker name = 'BIS_airfield'>",	// %7
			"</marker>"				// %8
		]
	]
];

[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.045, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};