//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

/*
	Initial tasks
*/
{
	_x call BIS_fnc_missionTasks;
} forEach ["BIS_solar", "BIS_base"];

/*
	Initial notes
*/
{
	player createDiaryRecord ["Diary", _x];
} forEach [
	//Signal
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Campaign_C_out1_Briefing_Signal",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_insertion'>",
			"<marker name = 'BIS_apc'>",
			"<marker name = 'BIS_infantry'>"
		]
	],
	//Execution
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Campaign_C_out1_Briefing_Execution",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_solar'>",
			"<marker name = 'BIS_rally'>",
			"<marker name = 'BIS_base'>"
		]
	],
	//Mission
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Campaign_C_out1_Briefing_Mission",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_solar'>",
			"<marker name = 'BIS_base'>"
		]
	],
	//Situation
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Campaign_C_out1_Briefing_Situation",
			"<br />"
		]
	]
];

/*
	Show tasks tab by default when entering the briefing screen
*/
[] spawn {
	//Disable serialization
	disableSerialization;

	//Wait for display to be available
	waituntil { !isNull (findDisplay 37) };

	//Select Tasks subject by default
	private "_diary";
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};

/*
	Animate map
*/
[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.120, markerPos "BIS_mrk_BriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
