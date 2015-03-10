//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

["BIS_meetJournalist"] call BIS_fnc_missionTasks;
["BIS_getCar"] call BIS_fnc_missionTasks;
["BIS_escort"] call BIS_fnc_missionTasks;

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		localize "STR_A3_C_EA_briefingMission"
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		localize "STR_A3_C_EA_briefingSituation"
	]
];