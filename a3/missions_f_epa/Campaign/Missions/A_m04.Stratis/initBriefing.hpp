//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Hide markers
{_x setMarkerAlpha 0} forEach ["BIS_alphaAttack", "BIS_enemy"];

// Move dummy markers to ORBAT markers
"BIS_charlie" setMarkerPos position BIS_charlieORBAT;
"BIS_delta" setMarkerPos position BIS_deltaORBAT;
"BIS_enemy" setMarkerPos position BIS_enemyORBAT;

//***************************
//Tasks
//***************************
"BIS_regroup" call BIS_fnc_missionTasks;
"BIS_meet" call BIS_fnc_missionTasks;
"BIS_supplies" call BIS_fnc_missionTasks;
"BIS_maxwell" call BIS_fnc_missionTasks;

// Add frontline
execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m04.sqf";

//--- Select "Tasks" subject by default
[] spawn {
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};

player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Signal_title",
		format [
			localize "STR_A3_Campaign_A_m04_Callsigns_Description",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_maxwell'>",
			"<marker name = 'BIS_alpha'>",
			"<marker name = 'BIS_nikos'>",
			"<marker name = 'BIS_charlie'>",
			"<marker name = 'BIS_delta'>"
		]
	]
];

player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Execution_title",
		format [
			localize "STR_A3_Campaign_A_m04_Execution_Description",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_maxwell'>",
			"<marker name = 'BIS_alpha'>",
			"<marker name = 'BIS_nikos'>",
			"<marker name = 'BIS_lzConnor'>"
		]
	]
];

player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		format [
			localize "STR_A3_Campaign_A_m04_Mission_Description",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_maxwell'>",
			"<marker name = 'BIS_alpha'>",
			"<marker name = 'BIS_nikos'>",
			"<marker name = 'BIS_lzConnor'>"
		]
	]
];

player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_Campaign_A_m04_Situation_Description",
			"<br />",
			"</marker>",
			"<marker name = 'BIS_maxwell'>",
			"<marker name = 'BIS_lzConnor'>",
			"<marker name = 'BIS_nikos'>",
			"<marker name = 'BIS_alpha'>"
		]
	]
];

[] spawn {
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};