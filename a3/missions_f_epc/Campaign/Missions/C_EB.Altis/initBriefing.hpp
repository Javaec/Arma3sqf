//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

"BIS_tskWait" call BIS_fnc_missionTasks;
["BIS_tskWait", "Current"] call BIS_fnc_missionTasks;

// "BIS_tskEscape" call BIS_fnc_missionTasks;
// "BIS_tskDevice" call BIS_fnc_missionTasks;
// "BIS_tskJoinNATO" call BIS_fnc_missionTasks;
// "BIS_tskJoinFIA" call BIS_fnc_missionTasks;

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		localize "STR_A3_Campaign_C_EB_Briefing_Situation_text"
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		localize "STR_A3_Campaign_C_EB_Briefing_Mission_text"
	]
];
