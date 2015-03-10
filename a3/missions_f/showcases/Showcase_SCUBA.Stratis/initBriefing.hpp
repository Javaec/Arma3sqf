"BIS_objDisarm" call BIS_fnc_missionTasks;
"BIS_objMine1" call BIS_fnc_missionTasks;
"BIS_objMine2" call BIS_fnc_missionTasks;
"BIS_objMine3" call BIS_fnc_missionTasks;
"BIS_objAirPatrol" call BIS_fnc_missionTasks;
"BIS_objLauncher" call BIS_fnc_missionTasks;
"BIS_objHeli" call BIS_fnc_missionTasks;
"BIS_objSabotage" call BIS_fnc_missionTasks;

if (!([] call BIS_fnc_isCampaign)) then {
	// Showcase briefing
	BIS_player createDiarySubject [
		"Showcase",
		localize "STR_A3_diary_showcase_title"
	];
	
	BIS_player createDiaryRecord [
		"Showcase",
		[
			localize "STR_A3_diary_summary_title",
			"<img image='A3\missions_f\data\img\Showcase_SCUBA_briefing_CA.paa' width='370' align='center' />" + localize "STR_A3_Showcase_SCUBA_diary_summary_text"
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
};

// Normal briefing
BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_signal_title",
		format [localize "STR_A3_Showcase_SCUBA_diary_signal_text", "<br/>", "<marker name = 'start'>", "</marker>", "<marker name = 'arty'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [localize "STR_A3_Showcase_SCUBA_diary_execution_text", "</marker>", "<marker name = 'start'>", "<br/>", "<marker name = 'tempest'>", "<marker name = 'arty'>", "1.", "2.", "3.", "4.", "5.", "<marker name = 'BIS_mrkBoat'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		format [localize "STR_A3_Showcase_SCUBA_diary_mission_text", "</marker>", "<marker name = 'minefield'>"]
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [localize "STR_A3_Showcase_SCUBA_diary_situation_text", "</marker>", "<marker name = 'start'>", "<marker name = 'tempest'>", "<br/>", "<marker name = 'minefield'>"]
	]
];