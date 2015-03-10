//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

//Initial tasks
"BIS_outpostAttack" call BIS_fnc_missionTasks;

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
			localize "STR_A3_Campaign_B_m01_Briefing_Signal_text",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_alpha'>",
			"<marker name = 'BIS_bravo'>",
			"<marker name = 'BIS_charlie'>",
			"<marker name = 'BIS_delta'>"
		]
	]
];

//Execution
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Campaign_B_m01_Briefing_Execution_text",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_outpost'>",
			"<marker name = 'BIS_supplies'>",
			"<marker name = 'BIS_forest'>"
		]
	]
];

//Mission
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Campaign_B_m01_Briefing_Mission_text",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_outpost'>",
			"<marker name = 'BIS_supplies'>"
		]
	]
];

//Situation
player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Campaign_B_m01_Briefing_Situation_text",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_outpost'>",
			"<marker name = 'BIS_frini'>"
		]
	]
];

[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.025, position BIS_zoneRestrictionTrigger];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
