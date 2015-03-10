//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Initialize Instructor Figure
["Init"] call BIS_fnc_InstructorFigure;

// Hide markers
{_x setMarkerAlpha 0} forEach ["BIS_attack1", "BIS_attack2", "BIS_attack5"];

// Move ORBAT markers
BIS_pyrgos setPos markerPos "BIS_pyrgosArea";

// Tasks
"BIS_patrol" call BIS_fnc_missionTasks;

[] spawn {
	//Wait for display to be available
	waituntil { !isNull (findDisplay 37) };

	//Select Tasks subject by default
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};

// Situation
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_C_in2_Briefing_Situation_text",
			"<marker name = 'BIS_airport'>",	// %1
			"</marker>",				// %2
			"<br/><br/>",				// %3
			"<br/><br/>",				// %4
			"<br/><br/>"				// %5
		]
	]
];

//Map
[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.125, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};