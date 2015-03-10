if (!([] call BIS_fnc_isCampaign)) then {
	BIS_player createDiarySubject [
		"Showcase",
		localize "str_a3_diary_showcase_title"
	];

	// Showcase briefing
	BIS_player createDiaryRecord [
		"Showcase",
		[
			localize "str_a3_diary_summary_title",
			"<img image='A3\missions_f\data\img\Showcase_Helicopters_briefing_CA.paa' width='370' align='center' />" + localize "STR_A3_Showcase_Helicopters_Showcase_Summary_text"
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
		localize "str_a3_diary_signal_title",
		format [
			localize "STR_A3_Showcase_Helicopters_Briefing_Signal_text",
			"</marker>",								// %1
			"<marker name = 'Bis_MrkStart'>",			// %2
			"<marker name = 'Bis_MrkHQ'>",				// %3
			"<marker name = 'Bis_MrkKaminoBase'>"		// %4
		]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "str_a3_diary_execution_title",
		format [
			localize "STR_A3_Showcase_Helicopters_Briefing_Execution_text",
			"</marker>",								// %1
			"<marker name = 'Bis_MrkStart'>",			// %2
			"<marker name = 'Bis_MrkKaminoBase'>"		// %3
		]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "str_a3_diary_mission_title",
		format [
			localize "STR_A3_Showcase_Helicopters_Briefing_Mission_text",
			"</marker>",								// %1
			"<marker name = 'Bis_MrkKaminoBase'>"		// %2
		]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "str_a3_diary_situation_title",
		format [
			localize "STR_A3_Showcase_Helicopters_Briefing_Situation_text",
			"</marker>",								// %1
			"<marker name = 'Bis_MrkStart'>",			// %2
			"<marker name = 'Bis_MrkKaminoBase'>"		// %3
		]
	]
];