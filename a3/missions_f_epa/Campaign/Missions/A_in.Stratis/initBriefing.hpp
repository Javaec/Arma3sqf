//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Move ORBAT markers to area markers
BIS_tempestORBAT setPos markerPos "BIS_tempest";
BIS_townORBAT setPos markerPos "BIS_town";

// Position area markers
"BIS_LZ1Area" setMarkerPos markerPos "BIS_LZ1";

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_A_in_Briefing_Situation_text",
			"<br/><br/>",			// %1
			"<marker name = 'BIS_camp'>",	// %2
			"</marker>",			// %3
			"<marker name = 'BIS_range'>",	// %4
			"</marker>",			// %5
			"<br/><br/>",			// %6
			"<br/><br/>"			// %7
		]
	]
];