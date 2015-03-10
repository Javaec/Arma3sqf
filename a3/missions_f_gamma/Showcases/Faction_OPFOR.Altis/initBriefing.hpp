BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		localize "str_a3_showcase_faction_opfor_mission"
	]
];

BIS_player createDiarySubject [
	"Showcase",
	localize "STR_A3_Diary_Showcase_title"
];

BIS_player createDiaryRecord [
	"Showcase",
	[
		localize "STR_A3_Diary_Summary_title",
		"<img image = 'a3\missions_f_gamma\data\img\Faction_opfor_briefing_CA.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Showcase_Faction_opfor_Summary_text"
	]
]; 
 //--- Select "Showcase" subject by default
[] spawn {
	 disableserialization;
	 _diary = finddisplay 37;
	 _diaryList = _diary displayctrl 1001;
	 waituntil {lbsize _diaryList > 4};
	 _diaryList lbsetcursel 4;
};