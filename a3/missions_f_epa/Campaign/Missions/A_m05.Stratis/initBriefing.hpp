//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Hide markers

// Move dummy markers to ORBAT markers
"BIS_bravo" setMarkerPos position BIS_bravoORBAT;
"BIS_maxwell" setMarkerPos position BIS_maxwellORBAT;

// Move ORBAT markers to area markers
BIS_tempestORBAT setPos markerPos "BIS_tempest";

// Position area markers

// Change markers if necessary
// Air Station Mike-26
if (!(isNil "BIS_mike26ORBAT")) then {
	BIS_mike26ORBAT setPos markerPos "BIS_mike26";
} else {
	"BIS_mike26" setMarkerColor "ColorBlack";
};

// Add frontline
if (isNil "BIS_A_m03") then {
	// Played first
	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m01.sqf";
} else {
	// Played after A_m03 and/or A_m02
	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m02-A_m03.sqf";
};

// Tasks
{_x call BIS_fnc_missionTasks} forEach ["BIS_insert", "BIS_position", "BIS_town"];

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
			localize "STR_A3_A_m05_Briefing_Signal_text",
			"<marker name = 'BIS_swordfish'>",	// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_bravo'>",		// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_maxwell'>",	// %7
			"</marker>",				// %8
			"<br/>"					// %9
		]
	]
];

// Execution
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_A_m05_Briefing_Execution_text",
			"",					// %1 (removed)
			"",					// %2 (removed)
			"<marker name = 'BIS_insert'>",		// %3
			"</marker>",				// %4
			"<marker name = 'BIS_position'>",	// %5
			"</marker>",				// %6
			"<marker name = 'BIS_town'>",		// %7
			"</marker>"				// %8
		]
	]
];

// Mission
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_A_m05_Briefing_Mission_text",
			"<marker name = 'BIS_insert'>",		// %1
			"</marker>",				// %2
			"<marker name = 'BIS_position'>",	// %3
			"</marker>",				// %4
			"<marker name = 'BIS_town'>",		// %5
			"</marker>",				// %6
			"<marker name = 'BIS_bravo'>",		// %7
			"</marker>"				// %8
		]
	]
];

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_m05_Briefing_Situation_text",
			"<marker name = 'BIS_town'>",		// %1
			"</marker>",				// %2
			"<br/><br/>",				// %3
			"<br/><br/>",				// %4
			"<br/><br/>",				// %5
			"",					// %6 (removed)
			"",					// %7 (removed)
			"<br/><br/>",				// %8
			"<marker name = 'BIS_insert'>",		// %9
			"</marker>",				// %10
			"<marker name = 'BIS_bravo'>",		// %11
			"</marker>",				// %12
			"<marker name = 'BIS_bravoOP'>",	// %13
			"</marker>"				// %14
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
		localize "STR_A3_Group_Goblin",
		"<br/>" + "<img image = 'A3\Missions_F_EPA\data\img\A_m05_intel_CA.paa' width = '370' align = 'center'/>"
	]
];

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.16, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};