//wait for the time to get set before the briefign code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Hide markers
{_x setMarkerAlpha 0} forEach ["BIS_survivors", "BIS_mines", "BIS_minesArea", "BIS_RV", "BIS_route1", "BIS_route2", "BIS_route3"];

// Move ORBAT markers to area markers
BIS_tempestORBAT setPos markerPos "BIS_tempest";
BIS_townORBAT setPos markerPos "BIS_town";

// Align markers with area markers
"BIS_mines" setMarkerPos markerPos "BIS_minesArea";

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_in2_Briefing_Situation_text",
			"<br/><br/>"	// %1
		]
	]
];