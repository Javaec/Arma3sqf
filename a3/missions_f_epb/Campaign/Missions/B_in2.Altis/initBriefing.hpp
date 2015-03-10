//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Initialize Instructor Figure
["Init"] call BIS_fnc_InstructorFigure;

BIS_route = [];
BIS_falseRoute = [];
BIS_newRoute = [];

// Build list of route markers
{
	private ["_i"];
	_i = 1;

	while {(markerPos (format ["%1_%2", _x, _i])) distance [0,0,0] > 0} do {
		private ["_marker"];
		_marker = format ["%1_%2", _x, _i];

		// Add marker to array
		(missionNamespace getVariable _x) set [_i - 1, _marker];

		// Increase index
		_i = _i + 1;
	};
} forEach ["BIS_route", "BIS_falseRoute", "BIS_newRoute"];

// Set-up markers
{_x setMarkerAlpha 0} forEach (BIS_route + BIS_falseRoute + BIS_newRoute + ["BIS_plant", "BIS_check1", "BIS_negardes", "BIS_check2", "BIS_factory", "BIS_factoryMarker", "BIS_RV", "BIS_rescue", "BIS_attackers1", "BIS_attackers2", "BIS_getOut", "BIS_dummyMarker"]);
"BIS_city" setMarkerPos markerPos "BIS_cityArea";
"BIS_factoryMarker" setMarkerPos markerPos "BIS_factory";

// Tasks
"BIS_falseRV" call BIS_fnc_missionTasks;

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_B_in2_Briefing_Situation_text",
			"<marker name = 'BIS_start'>",		// %1
			"</marker>",				// %2
			"<marker name = 'BIS_falseRV'>",	// %3
			"</marker>",				// %4
			"<br/><br/>",				// %5
			"<marker name = 'BIS_city'>",		// %6
			"</marker>",				// %7
			"<br/><br/>"				// %8
		]
	]
];