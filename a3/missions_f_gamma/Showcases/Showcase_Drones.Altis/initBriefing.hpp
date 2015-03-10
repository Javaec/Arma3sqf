// Markers
{
	private ["_marker", "_amount"];
	_marker = _x;
	_amount = format ["%1Amount", _marker];
	
	_amount setMarkerPos [
		markerPos _marker select 0,
		(markerPos _marker select 1) + 5,
		0
	];
} forEach ["BIS_mrkPlayer", "BIS_mrkTeam02", "BIS_mrkTeam03"];

// Tasks
"BIS_tskRegroup" call BIS_fnc_missionTasks;
"BIS_tskAA" call BIS_fnc_missionTasks;
"BIS_tskRV" call BIS_fnc_missionTasks;

// Signal
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Showcase_Drones_Briefing_Signal_text",
			"<br/>",				// %1
			"<marker name = 'BIS_mrkPlayer'>",	// %2
			"</marker>",				// %3
			"<br/>",				// %4
			"<marker name = 'BIS_mrkTeam01'>",	// %5
			"</marker>",				// %6
			"<br/>",				// %7
			"<marker name = 'BIS_mrkTeam03'>",	// %8
			"</marker>",				// %9
			"<marker name = 'BIS_mrkNavalBase'>",	// %10
			"</marker>",				// %11
			"<br/>",				// %12
			"<marker name = 'BIS_mrkTeam02'>",	// %13
			"</marker>",				// %14
			"<marker name = 'BIS_mrkAirfield'>",	// %15
			"</marker>"				// %16
		]
	]
];

// Execution
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Showcase_Drones_Briefing_Execution_text",
			"<marker name = 'BIS_mrkRegroup'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_mrkNeochori'>",	// %3
			"</marker>",				// %4
			"<marker name = 'BIS_mrkTeam01'>",	// %5
			"</marker>"				// %6
		]
	]
];

// Mission
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Showcase_Drones_Briefing_Mission_text",
			"<marker name = 'BIS_mrkNeochori'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_mrkTeam01'>",	// %3
			"</marker>"				// %4
		]
	]
];

// Situation
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Showcase_Drones_Briefing_Situation_text",
			"<marker name = 'BIS_mrkAirbase'>",	// %1
			"</marker>",				// %2
			"<br/><br/>",				// %3
			"<marker name = 'BIS_mrkPlayer'>",	// %4
			"</marker>",				// %5
			"<marker name = 'BIS_mrkTeam01'>",	// %6
			"</marker>",				// %7
			"<marker name = 'BIS_mrkNeochori'>",	// %8
			"</marker>",				// %9
			"<marker name = 'BIS_mrkTeam03'>",	// %10
			"</marker>",				// %11
			"<marker name = 'BIS_mrkTeam02'>",	// %12
			"</marker>",				// %13
			"<br/><br/>",				// %14
			"<marker name = 'BIS_AO'>",		// %15
			"</marker>"				// %16
		]
	]
];

//extra intel
BIS_player createDiarySubject [
	"Intel",
	localize "str_a3_mdl_category_intel"
];

BIS_player createDiaryRecord [   
	"Intel",   
	[    
		localize "str_a3_showcase_drones_bis_tskcommander_title",    
		"<br/>" + "<img image = 'a3\missions_f_gamma\data\img\Showcase_Drones_Pegasus_photo_CA.paa' width = '370' align='center'/>"
	]  
];

BIS_player createDiaryRecord [   
	"Intel",   
	[    
		localize "str_a3_showcase_drones_bis_tskaa_title",    
		"<br/>" + "<img image = 'a3\missions_f_gamma\data\img\Showcase_Drones_AAA_CA.paa' width = '370' align='center'/>"
	]  
];

// Showcase
BIS_player createDiarySubject [
	"Showcase",
	localize "STR_A3_Diary_Showcase_title"
];

BIS_player createDiaryRecord [
	"Showcase",
	[
		localize "STR_A3_Diary_Summary_title",
		"<img image = 'a3\missions_f_gamma\data\img\showcase_drones_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Drones_Showcase_Summary_text"
	]
];

[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 5;
};

[] spawn
{
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.05, markerPos "BIS_mrkBriefingCenter"]; 
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};