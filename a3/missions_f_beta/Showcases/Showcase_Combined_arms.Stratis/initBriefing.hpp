player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Showcase_Combined_Arms_Briefing_Signal_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_insertion'>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Showcase_Combined_Arms_Briefing_Execution_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_insertion'>",
			"<marker name='BIS_enemy'>",
			"1",
			"2",
			"3"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Showcase_Combined_Arms_Briefing_Mission_text",
			"</marker>",
			"<marker name='BIS_enemy'>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Showcase_Combined_Arms_Briefing_Situation_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_airbase'>",
			"<marker name='BIS_militaryRange'>",
			"<marker name='BIS_enemy'>",
			"<marker name='BIS_kaminoArea'>"
		]
	]
];

player createDiarySubject [
	"Showcase",
	localize "STR_A3_diary_showcase_title"
];

player createDiaryRecord [
	"Showcase", [
		localize "STR_A3_diary_summary_title",	
		"<img image = 'a3\missions_f_beta\data\img\showcase_Combined_Arms_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Combined_Arms_Showcase_Summary_text"
	]
];

[] spawn {
	private "_index";
	_index = if (isMultiplayer) then { 5 } else { 4 };
	
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel _index;
};
