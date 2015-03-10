"BIS_objSteal" call BIS_fnc_missionTasks;
"BIS_objDestroy" call BIS_fnc_missionTasks;

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
			"<img image='A3\missions_f\data\img\Showcase_Vehicles_briefing_CA.paa' width='370' align='center' />" + localize "STR_A3_Showcase_Vehicles_diary_summary_text"	
		]
	];	
	/*
	BIS_player createDiaryRecord [
		"Showcase",
		[
			localize "STR_A3_diary_summary_title",	
			"<t align='center'><img image='A3\missions_f\data\img\Showcase_Vehicles_briefing_CA.paa' width='300' align='center' /></t>" + localize "STR_A3_Showcase_Vehicles_diary_summary_text"	
		]
	];
	*/

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
		localize "STR_A3_diary_signal_title",	
		format [localize "STR_A3_Showcase_Vehicles_diary_signal_text", "<br/>", "<marker name = 'start'>", "</marker>", "<marker name = 'green'>"]	
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",	
		format [localize "STR_A3_Showcase_Vehicles_diary_execution_text", "</marker>", "<marker name = 'target'>", "<marker name = 'destr'>", "<marker name = 'out'>", "<br/>", "1.", "2.", "3.", "4."]	
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",	
		format [localize "STR_A3_Showcase_Vehicles_diary_mission_text", "</marker>", "<marker name = 'destr'>"]	
	]
];

BIS_player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",	
		format [localize "STR_A3_Showcase_Vehicles_diary_situation_text", "<br/>", "<marker name = 'mike'>", "</marker>"]
	]
];