//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Initialize Instructor Figure
["Init"] call BIS_fnc_InstructorFigure;

// Hide markers
{_x setMarkerAlpha 0} forEach ["BIS_OP", "BIS_CTRG", "BIS_research", "BIS_miller"];

// Move ORBAT markers
BIS_Foxtrot_1stPlatoon setPos markerPos "BIS_arty";
BIS_Golf_1stPlatoon setPos markerPos "BIS_air";
BIS_Echo_1stPlatoon setPos markerPos "BIS_armor";

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_C_out2_Briefing_Situation_text",
			"<marker name = 'BIS_paros'>",		// %1
			"</marker>",				// %2
			"<marker name = 'BIS_kalochori'>",	// %3
			"</marker>",				// %4
			"<marker name = 'BIS_destroy'>",	// %5
			"</marker>",				// %6
			"<br/><br/>",				// %7
			"<br/><br/>"				// %8
		]
	]
];