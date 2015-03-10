// Markers
{_x setMarkerAlpha 0} forEach ["BIS_mrkArtillery", "BIS_Arrow01", "BIS_Arrow02", "BIS_Arrow03"];
"BIS_mrkHeli" setMarkerPos position BIS_Mi48;

// Tasks
"BIS_tskRearm" call BIS_fnc_missionTasks;
"BIS_tskHeli" call BIS_fnc_missionTasks;
"BIS_tskPyrgos" call BIS_fnc_missionTasks;
// "BIS_tskNavalBase" call BIS_fnc_missionTasks;
// "BIS_tskSaD" call BIS_fnc_missionTasks;
// "BIS_tskSave" call BIS_fnc_missionTasks;
// "BIS_tskRTB" call BIS_fnc_missionTasks;

// Signal
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Showcase_Gunships_Briefing_Signal_text",
			"<br/>",
			"<marker name = 'BIS_mrkStart'>",
			"</marker>"
		]
	]
];

// Execution
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Showcase_Gunships_Briefing_Execution_text",
			"<marker name = 'BIS_mrkHeli'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_mrkPyrgos'>",	// %3
			"</marker>",				// %4
			"<marker name = 'BIS_mrkNavalAttack'>",	// %5
			"</marker>"
		]
	]
];

// Mission
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Showcase_Gunships_Briefing_Mission_text",
			"<marker name = 'BIS_mrkAirfield'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_mrkPyrgos'>",	// %3
			"</marker>",				// %4
			"<marker name = 'BIS_mrkNavalAttack'>",	// %5
			"</marker>"				// %6
		]
	]
];

// Situation
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Showcase_Gunships_Briefing_Situation_text",
			"<marker name = 'BIS_mrkPanagia'>",	// %1
			"</marker>",				// %2
			"<marker name = 'BIS_mrkPyrgos'>",	// %3
			"</marker>",				// %4
			"<br/><br/>",				// %5
			"<marker name = 'BIS_mrkPyrgos'>",	// %6
			"</marker>",				// %7
			"<marker name = 'BIS_mrkNavalAttack'>",	// %8
			"</marker>",				// %9
			"<marker name = 'BIS_mrkNavalBase'>",	// %10
			"</marker>",				// %11
			"<marker name = 'BIS_mrkPyrgos'>",	// %12
			"</marker>",				// %13
			"<br/><br/>"				// %14
		]
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
		"<img image = 'a3\missions_f_gamma\data\img\showcase_gunships_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Gunships_Showcase_Summary_text"
	]
];

[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 4;
};

[] spawn
{

	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [0, 0.15, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};