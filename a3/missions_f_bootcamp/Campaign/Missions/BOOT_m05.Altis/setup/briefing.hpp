// Signal
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		localize "STR_A3_BOOT_m05_Briefing_Signal_text"
	]
];

// Execution
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		localize "STR_A3_BOOT_m05_Briefing_Execution_text"
	]
];

// Mission
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_BOOT_m05_Briefing_Mission_text",
			"<marker name = 'BIS_reinf'>",	// %1
			"</marker>",			// %2
			"<marker name = 'BIS_cordon'>",	// %3
			"</marker>"			// %4
		]
	]
];

// Situation
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_BOOT_m05_Briefing_Situation_text",
			"<marker name = 'BIS_start'>",		// %1
			"</marker>",				// %2
			"<br/><br/>",				// %3
			"<marker name = 'BIS_meeting'>",	// %4
			"</marker>",				// %5
			"<marker name = 'BIS_cordon'>",		// %6
			"</marker>",				// %7
			"<marker name = 'BIS_meeting'>",	// %8
			"</marker>",				// %9
			"<br/><br/>"				// %10
		]
	]
];

// Tasks
"BIS_reinf" call BIS_fnc_missionTasks;

[] spawn {
	disableSerialization;
	
	waitUntil {!(isNull (findDisplay 37))};
	
	private ["_display"];
	_display = findDisplay 37;
	
	// Select Tasks tab by default
	private ["_tasks"];
	_tasks = _display displayCtrl 1001;
	_tasks lbSetCurSel 1;
	
	// Position the map
	private ["_map"];
	_map = _display displayCtrl 51;
	_map ctrlMapAnimAdd [0, 0.025, markerPos "BIS_briefingCenter"];
	ctrlMapAnimCommit _map;
};

// Setup markers
"BIS_meetingText" setMarkerPos [
	(markerPos "BIS_meeting" select 0) + 25,
	markerPos "BIS_meeting" select 1,
	markerPos "BIS_meeting" select 2
];