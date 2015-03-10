player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Showcase_Night2_Briefing_Signal_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_markerNisiBay'>",
			"<marker name='BIS_markerStart'>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Showcase_Night2_Briefing_Execution_text",
			"<br />",
			"1",
			"2",
			"3",
			"4",
			"<marker name='BIS_markerStart'>",
			"</marker>"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		localize "STR_A3_Showcase_Night2_Briefing_Mission_text"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Showcase_Night2_Briefing_Situation_text",
			"<br />",
			"</marker>",
			"<marker name='BIS_markerCampTempest'>",
			"<marker name='BIS_markerNisiBay'>",
			"<marker name='BIS_markerStart'>"
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
		"<img image = 'a3\missions_f_beta\data\img\showcase_Night_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Night2_Showcase_Summary_text"	
	]
];

[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 4;
};
