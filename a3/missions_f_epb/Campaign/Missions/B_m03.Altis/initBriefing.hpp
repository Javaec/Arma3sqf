//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

"BIS_objHighway" call BIS_fnc_missionTasks;
"BIS_objRendezvous" call BIS_fnc_missionTasks;
"BIS_objFuelTruck" call BIS_fnc_missionTasks;
"BIS_objExfil_fuel" call BIS_fnc_missionTasks;

[] spawn {
	//Wait for display to be available
	waituntil { !isNull (findDisplay 37) };

	//Select Tasks subject by default
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};

// Normal briefing
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_signal_title",
		format [
			localize "STR_A3_campaign_b_m03_brief_signal",
			"</marker>",
			"<marker name='start'>",
			"<br/>",
			"<marker name='BIS_rendezvous_1'>",
			"<marker name='BIS_rendezvous'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [
			"1. " + localize "STR_A3_campaign_b_m03_brief_execution",
			"</marker>",
			"<marker name='BIS_dropOff'>",
			"<br/>",
			"1. ",
			"2. ",
			"3. ",
			"<marker name='start'>",
			"<marker name='BIS_area1'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		format [
			localize "STR_A3_campaign_b_m03_brief_mission",
			"</marker>",
			"<marker name='BIS_dropOff'>",
			"<marker name='BIS_area1'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [
			localize "STR_A3_campaign_b_m03_brief_situation",
			"<br/><br/>",
			"</marker>",
			"<marker name='BIS_area1'>",
			"<marker name='BIS_warn1_6'>",
			"<marker name='BIS_dropOff'>"
		]
	]
];


//Map
[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.055, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};