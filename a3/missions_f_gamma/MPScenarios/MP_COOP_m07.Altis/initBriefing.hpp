player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_MP_COOP_04_Briefing_Signal_text",
			groupid group (playerside call bis_fnc_moduleHQ),
			groupid group player,
			"Green"
		]
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Execution_title",
		localize "STR_A3_MP_COOP_07_Briefing_Execution_text"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Mission_title",
		localize "STR_A3_MP_COOP_07_Briefing_Mission_text"
	]
];

player createDiaryRecord [
	"Diary", [
		localize "STR_A3_Diary_Situation_title",
		localize "STR_A3_MP_COOP_07_Briefing_Situation_text"
	]
];
