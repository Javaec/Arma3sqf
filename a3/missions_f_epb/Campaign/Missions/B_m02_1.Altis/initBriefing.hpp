//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

{_x setMarkerAlpha 0} forEach ["BIS_start_1", "BIS_start_2"];
[ "BIS_Meet", "assigned" ] call BIS_fnc_missionTasks;

//Tabs
[] spawn {
	//Wait for display to be available
	waituntil { !isNull (findDisplay 37) };

	//Select Tasks subject by default
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};


//Signal
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Campaign_B_m02_1_Briefing_Signal_text",
			"<br />",
			"</marker>",
			if (!isNil { BIS_B_m03_outcome } && { BIS_B_m03_outcome != 1 }) then { "<marker name = 'BIS_start_2'>" } else { "<marker name = 'BIS_start_1'>" },
			"<marker name = 'BIS_boats'>"
		]
	]
];

//Execution
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Campaign_B_m02_1_Briefing_Execution_text",
			"<br />",
			"</marker>",
			if (!isNil { BIS_B_m03_outcome } && { BIS_B_m03_outcome != 1 }) then { "<marker name = 'BIS_start_2'>" } else { "<marker name = 'BIS_start_1'>" },
			"<marker name = 'BIS_boats'>"
		]
	]
];

//Mission
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Campaign_B_m02_1_Briefing_Mission_text",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_enemy'>",
			"<marker name = 'BIS_boats'>"
		]
	]
];

//Situation
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Campaign_B_m02_1_Briefing_Situation_text",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_boats'>"
		]
	]
];


[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.045, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};