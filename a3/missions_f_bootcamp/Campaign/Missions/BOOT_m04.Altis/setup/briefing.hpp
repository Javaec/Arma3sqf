// Setup markers
"BIS_secure" setMarkerAlpha 0;
"BIS_adams" setMarkerPos markerPos "BIS_lacey";

"BIS_meetingText" setMarkerPos [
	(markerPos "BIS_meeting" select 0) + 25,
	markerPos "BIS_meeting" select 1,
	markerPos "BIS_meeting" select 2
];

"BIS_treat" setMarkerPos position BIS_wounded_logic;

// Signal
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		localize "STR_A3_BOOT_m04_Briefing_Signal_text"
	]
];

// Execution
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		localize "STR_A3_BOOT_m04_Briefing_Execution_text"
	]
];

// Mission
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		localize "STR_A3_BOOT_m04_Briefing_Mission_text"
	]
];

// Situation
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_BOOT_m04_Briefing_Situation_text",
			"<marker name = 'BIS_farm'>",		// %1
			"</marker>",				// %2
			"<br/><br/>",				// %3
			"<br/><br/>",				// %4
			"<marker name = 'BIS_meeting'>",	// %5
			"</marker>",				// %6
			"<br/><br/>",				// %7
			"<marker name = 'BIS_lost'>",		// %8
			"</marker>",				// %9
			"<marker name = 'BIS_airfield'>",	// %10
			"</marker>",				// %11
			"<marker name = 'BIS_check'>",		// %12
			"</marker>",				// %13
			"<marker name = 'BIS_cordon'>",		// %14
			"</marker>"				// %15
		]
	]
];

// Tasks
"BIS_locate" call BIS_fnc_missionTasks;

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