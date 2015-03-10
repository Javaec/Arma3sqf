//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

"BIS_objRendezvous" call BIS_fnc_missionTasks;
"BIS_objSabotages" call BIS_fnc_missionTasks;
"BIS_objSabotage2" call BIS_fnc_missionTasks;
"BIS_objSabotage1" call BIS_fnc_missionTasks;
"BIS_objRTB" call BIS_fnc_missionTasks;

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
			localize "STR_A3_campaign_b_m05_brief_signal",
			"</marker>",
			"<marker name='start'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [
			localize "STR_A3_campaign_b_m05_brief_execution",
			"<br/>",
			"1. ",
			"2. ",
			"3. ",
			"4. "
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		localize "STR_A3_campaign_b_m05_brief_mission"
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [
			localize "STR_A3_campaign_b_m05_brief_situation",
			"<br/><br/>",
			"</marker>",
			"<marker name='meet'>"
		]
	]
];



// Intel Subject
BIS_inf createDiarySubject [
	"Intel",
	localize "str_a3_mdl_category_intel"
];

// Intel Contents
BIS_inf createDiaryRecord [
	"Intel",
	[
		localize "STR_A3_CfgIdentities_Orestes",
		"<br/>" + "<img image = 'A3\Missions_F_EPB\data\img\B_m05_orestes_ca.paa' width = '370' align = 'center'/>"
	]
];

[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.065, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};