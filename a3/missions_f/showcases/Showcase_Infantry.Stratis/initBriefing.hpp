{_x setMarkerAlpha 0} forEach ["BIS_spotters_marker1", "BIS_spotters_area"];
{_x call BIS_fnc_missionTasks} forEach ["BIS_pointMan", "BIS_village"];

if (!([] call BIS_fnc_isCampaign)) then {
	// Showcase briefing
	BIS_player createDiarySubject [
		"Showcase",
		localize "STR_A3_Diary_Showcase_title"
	];
	
	BIS_player createDiaryRecord [
		"Showcase",
		[
			localize "STR_A3_Diary_Summary_title",
			"<img image = 'a3\missions_f\data\img\showcase_infantry_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Infantry_Showcase_Summary_text"
		]
	];

	//--- Select "Showcase" subject by default
	[] spawn {
		disableserialization;
		_diary = finddisplay 37;
		_diaryList = _diary displayctrl 1001;
		_diaryList lbsetcursel 4;
	};
};

// Normal briefing
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Showcase_Infantry_Briefing_Signal_text",
			"<marker name = 'BIS_alpha'>",		// %1
			"</marker>",				// %2
			"<br/>",				// %3
			"<marker name = 'BIS_village'>",	// %4
			"</marker>",				// %5
			"<br/>",				// %6
			"<marker name = 'BIS_charlie'>",	// %7
			"</marker>",				// %8
			"<br/>"					// %9
		]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		localize "STR_A3_Showcase_Infantry_Briefing_Execution_text"
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Showcase_Infantry_Briefing_Mission_text",
			"<marker name = 'BIS_charlie'>",	// %1
			"</marker>"				// %2
		]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Showcase_Infantry_Briefing_Situation_text",
			"<br/><br/>",				// %1
			"<marker name = 'BIS_village'>",	// %2
			"</marker>",				// %3
			"<br/><br/>"				// %4
		]
	]
];