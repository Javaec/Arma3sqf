"BIS_objBase" call BIS_fnc_missionTasks;
"BIS_objAA" call BIS_fnc_missionTasks;
"BIS_objHeli" call BIS_fnc_missionTasks;
"BIS_objInf" call BIS_fnc_missionTasks;

// Normal briefing
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_signal_title",
		format [localize "STR_A3_Showcase_Supports_diary_signal_text", "</marker>", "<marker name = 'BIS_start'>", "<marker name = 'BIS_inf'>", "<marker name = 'BIS_inf2'>", "<marker name = 'BIS_heli'>", "<marker name = 'BIS_maxwell'>", "<br/>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [localize "STR_A3_Showcase_Supports_diary_execution_text", "<br/>", "</marker>", "<marker name = 'BIS_base'>", "<marker name = 'BIS_AA'>", "<marker name = 'BIS_maxwell'>", "1.", "2.", "3.", "4."]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		format [localize "STR_A3_Showcase_Supports_diary_mission_text", "</marker>", "<marker name = 'BIS_op'>", "<marker name = 'BIS_maxwell'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [localize "STR_A3_Showcase_Supports_diary_situation_text", "<br/>", "</marker>", "<marker name = 'BIS_base'>", "<marker name = 'BIS_inf'>", "<marker name = 'BIS_inf2'>", "<marker name = 'BIS_maxwell'>"]
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
		"<img image = 'a3\missions_f_beta\data\img\showcase_supports_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_supports_Showcase_Summary_text"
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