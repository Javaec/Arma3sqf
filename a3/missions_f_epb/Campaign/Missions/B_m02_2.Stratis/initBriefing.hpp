//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

{_x setMarkerAlpha 0} forEach ["BIS_markerInsertion0", "BIS_markerInsertion1", "BIS_markerInsertion2", "BIS_markerInsertion3"];
"BIS_Chaos" call BIS_fnc_missionTasks;

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

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Campaign_B_m02_2_Briefing_Signal_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_markerCampTempest'>",
			"<marker name='BIS_markerNisiBay'>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Campaign_B_m02_2_Briefing_Execution_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_markerAo'>",
			"<marker name='BIS_markerCampTempest'>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Campaign_B_m02_2_Briefing_Mission_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_markerCampTempest'>",
			"<marker name='BIS_markerAo'>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Campaign_B_m02_2_Briefing_Situation_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_markerCampTempest'>",
			"<marker name='BIS_markerNisiBay'>",
			"<marker name='BIS_markerAirbase'>"
		]
	]
];

[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.27, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
