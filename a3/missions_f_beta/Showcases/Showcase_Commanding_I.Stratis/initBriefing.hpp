"BIS_tskBeach" call BIS_fnc_missionTasks;
"BIS_tskVillage" call BIS_fnc_missionTasks;
"BIS_tskDefend" call BIS_fnc_missionTasks;
["BIS_tskBeach", "Current"] call BIS_fnc_missionTasks;

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [localize "STR_A3_Showcase_Commanding_I_Briefing_Signal_text", "</marker>", "<marker name = 'BIS_mrkStart'>", "<marker name = 'BIS_mrkGirna'>", "<marker name = 'BIS_mrkMike26'>", "<marker name = 'BIS_mrkTakeCommand'>", "<marker name = 'BIS_mrkTempest'>", "<marker name = 'BIS_mrkHawkeye'>", "<marker name = 'BIS_mrkMaxwell'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [localize "STR_A3_Showcase_Commanding_I_Briefing_Execution_text", "</marker>", "<marker name = 'BIS_mrkBeach'>", "<marker name = 'BIS_mrkGirna'>", "<marker name = 'BIS_mrkTakeCommand'>", "<marker name = 'BIS_mrkMaxwell'>", "<marker name = 'BIS_mrkAttack'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [localize "STR_A3_Showcase_Commanding_I_Briefing_Mission_text"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [localize "STR_A3_Showcase_Commanding_I_Briefing_Situation_text", "</marker>", "<marker name = 'BIS_mrkBeach'>", "<marker name = 'BIS_mrkMinefield'>", "<marker name = 'BIS_mrkHawkeye'>"]
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
   "<img image = 'a3\missions_f_beta\data\img\showcase_commanding_I_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_Commanding_I_Showcase_Summary_text"
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
