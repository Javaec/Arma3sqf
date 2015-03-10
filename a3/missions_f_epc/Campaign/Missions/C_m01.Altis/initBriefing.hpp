//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

"BIS_objWait" call BIS_fnc_missionTasks;
"BIS_objGetIn" call BIS_fnc_missionTasks;
"BIS_objMove" call BIS_fnc_missionTasks;
"BIS_objSeize" call BIS_fnc_missionTasks;
"BIS_objJoin" call BIS_fnc_missionTasks;
"BIS_objLZ" call BIS_fnc_missionTasks;
"BIS_objLift" call BIS_fnc_missionTasks;

[] spawn {
	//Wait for display to be available
	waitUntil {!isNull (findDisplay 37)};

	//Select Tasks subject by default
	disableSerialization;
	_diary = findDisplay 37;
	_diaryList = _diary displayCtrl 1001;
	_diaryList lbSetCurSel 1;
};

// Normal briefing
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_signal_title",
		format [
			localize "STR_A3_campaign_c_m01_brief_signal",
			"</marker>",
			"<marker name='BIS_start'>",
			"<br/>",
			"<marker name='BIS_APCs'>",
			"<marker name='BIS_heliBase'>",
			"<marker name='BIS_complex'>",
			"<marker name='BIS_airbase'>",
			"<marker name='BIS_airbase'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [
			localize "STR_A3_campaign_c_m01_brief_execution",
			"<br/>",
			"1. ",
			"2. ",
			"3. ",
			"4. ",
			"5. ",
			"<marker name='BIS_lakka'>",
			"</marker>",
			"<marker name='BIS_complex'>",
			"<marker name='BIS_LZ'>",
			"<marker name='BIS_airbase'>",
			"<marker name='BIS_APCs'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		format [
			localize "STR_A3_campaign_c_m01_brief_mission",
			"<marker name='BIS_complex'>",
			"</marker>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [
			localize "STR_A3_campaign_c_m01_brief_situation",
			"<br/><br/>",
			"</marker>",
			"<marker name='BIS_airbase'>",
			"<marker name='BIS_start'>",
			"<marker name='BIS_APCs'>",
			"<marker name='BIS_complex'>",
			"<marker name='BIS_lakka'>",
			"<marker name='BIS_AA'>"
		]
	]
];

[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlMapAnimAdd [1, 0.1, markerPos "BIS_mrkBriefingCenter"];
	ctrlMapAnimCommit (findDisplay 37 displayCtrl 51);
};