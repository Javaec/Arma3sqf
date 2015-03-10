player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Signal_title",
		localize "STR_A3_Showcase_Arma_Briefing_Signal_text"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		localize "STR_A3_Showcase_Arma_Briefing_Execution_text"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		localize "STR_A3_Showcase_Arma_Briefing_Mission_text"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Situation_title",
		localize "STR_A3_Showcase_Arma_Briefing_Situation_text"
	]
];

player createDiarySubject [
	"Showcase",
	localize "STR_A3_diary_showcase_title"
];

player createDiaryRecord [
	"Showcase", [
		localize "STR_A3_diary_summary_title",	
		"<img image = 'a3\missions_f_gamma\data\img\showcase_arma_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Arma_Showcase_Summary_text"	
	]
];

[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 4;
};

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "BIS_mrkBriefingCenter"]; 
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
