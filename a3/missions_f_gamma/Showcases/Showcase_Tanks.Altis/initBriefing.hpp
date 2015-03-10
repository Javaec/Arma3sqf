"BIS_objGetIn" call BIS_fnc_missionTasks;
"BIS_objMeeting" call BIS_fnc_missionTasks;
"BIS_obj1" call BIS_fnc_missionTasks;

// Normal briefing
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_signal_title",
		format [localize "STR_A3_Showcase_Tanks_diary_signal_text", "</marker>", "<marker name = 'candy1_1'>", "<br/>", "<marker name = 'candy1'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [localize "STR_A3_Showcase_Tanks_diary_execution_text", "<br/>", "1.", "2.", "3.", "4.", "</marker>", "<marker name='candy1_1'>", "<marker name='candy8_1'>", "<marker name='molos'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		format [localize "STR_A3_Showcase_Tanks_diary_mission_text", "<marker name='molos'>", "</marker>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [localize "STR_A3_Showcase_Tanks_diary_situation_text", "</marker>", "<marker name='airf_2'>", "<marker name='airf_3'>", "<marker name='airf_4'>", "<marker name='candy1'>", "<br/>", "<marker name='molos'>"]
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
		"<img image = 'a3\missions_f_gamma\data\img\showcase_tanks_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_tanks_Showcase_Summary_text"
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

[] spawn
{
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.12, markerPos "BIS_mrkBriefingCenter"]; 
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};