//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Create Alpha's ORBAT marker
"BIS_alpha" call BIS_fnc_camp_createAlphaORBAT;

// Move dummy markers to ORBAT markers
"BIS_bravo" setMarkerPos position BIS_bravoORBAT;
"BIS_charlie" setMarkerPos position BIS_charlieORBAT;
"BIS_maxwell" setMarkerPos position BIS_maxwellORBAT;

// Move ORBAT markers to area markers
BIS_villageORBAT setPos markerPos "BIS_village";
BIS_tempestORBAT setPos markerPos "BIS_tempest";
BIS_mike26ORBAT setPos markerPos "BIS_mike26";

// Position area markers
"BIS_crashSite" setMarkerPos markerPos "BIS_crashSite_area";

// Add frontline
execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m01.sqf";

"BIS_crashSite" call BIS_fnc_missionTasks;

//--- Select "Tasks" subject by default
[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_A_m01_Briefing_Signal_text",
			"<marker name = 'BIS_alpha'>",		// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_maxwell'>",	// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_bravo'>",		// %7
			"</marker>",				// %8
			"<br/>",				// %9
			"<marker name = 'BIS_charlie'>",	// %10
			"</marker>",				// %11
			"<br/>",				// %12
			"<marker name = 'BIS_maxwell'>",	// %13
			"</marker>"				// %14
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_A_m01_Briefing_Execution_text",
			"<marker name = 'BIS_crashSite'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_maxwell'>",	// %3
			"</marker>"				// %4
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_A_m01_Briefing_Mission_text",
			"<marker name = 'BIS_crashSite'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_maxwell'>",	// %3
			"</marker>"				// %4
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_m01_Briefing_Situation_text",
			"<br/><br/>",				// %1
			"<br/><br/>",				// %2
			"<br/><br/>",				// %3
			"<br/><br/>",				// %4
			"<marker name = 'BIS_maxwell'>",	// %5
			"</marker>",				// %6
			"<br/><br/>",				// %7
			"<marker name = 'BIS_crashSite'>",	// %8
			"</marker>",				// %9
			"<br/><br/>",				// %10
			"<marker name = 'BIS_alpha'>",		// %11
			"</marker>"				// %12
		]
	]
];

x = [] spawn
{
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};