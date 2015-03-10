//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Hide markers
{_x setMarkerAlpha 0} forEach ["BIS_spotters", "BIS_spottersArea"];

// Create Alpha's ORBAT marker
"BIS_alpha" call BIS_fnc_camp_createAlphaORBAT;

// Move dummy markers to ORBAT markers
"BIS_bravo" setMarkerPos position BIS_bravoORBAT;
"BIS_charlie" setMarkerPos position BIS_charlieORBAT;
"BIS_maxwell" setMarkerPos position BIS_maxwellORBAT;
"BIS_attackers" setMarkerPos position BIS_attackersORBAT;

// Move ORBAT markers to area markers
BIS_tempestORBAT setPos markerPos "BIS_tempest";

// Change markers if necessary
// Air Station Mike-26
if (!(isNil "BIS_mike26ORBAT")) then {
	BIS_mike26ORBAT setPos markerPos "BIS_mike26";
} else {
	"BIS_mike26" setMarkerColor "ColorBlack";
};

// Position area markers
"BIS_spotters" setMarkerPos markerPos "BIS_spottersArea";

// Add frontline
if (isNil "BIS_A_m03") then {
	// Played first
	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m01.sqf";
} else {
	// Played after A_m03
	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m02-A_m03.sqf";
};

// Tasks
{_x call BIS_fnc_missionTasks} forEach ["BIS_overwatch", "BIS_village"];

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
			localize "STR_A3_A_m02_Briefing_Signal_text",
			"<marker name = 'BIS_alpha'>",		// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_bravo'>",		// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_maxwell'>",	// %7
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

// Execution
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_A_m02_Briefing_Execution_text",
			"<marker name = 'BIS_bravo'>",		// %1
			"</marker>",				// %2
			"<marker name = 'BIS_maxwell'>",	// %3
			"</marker>"				// %4
		]
	]
];

// Mission
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_A_m02_Briefing_Mission_text",
			"<marker name = 'BIS_villageMarker'>",	// %1
			"</marker>"				// %2
		]
	]
];

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_m02_Briefing_Situation_text",
			"<br/><br/>",				// %1
			"<marker name = 'BIS_villageMarker'>",	// %2
			"</marker>",				// %3
			"<marker name = 'BIS_maxwell'>",	// %4
			"</marker>",				// %5
			"<br/><br/>",				// %6
			"<br/><br/>",				// %7
			"<marker name = 'BIS_medicPos'>",	// %8
			"</marker>",				// %9
			"<br/><br/>",				// %10
			"<marker name = 'BIS_alpha'>",		// %11
			"</marker>"				// %12
		]
	]
];

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.17, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};