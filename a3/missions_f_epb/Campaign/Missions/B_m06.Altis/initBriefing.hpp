//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

[
	configfile >> "CfgORBAT" >> "BIS" >> "B_I_CTRG",
	nil,nil,nil,nil,
	localize "STR_A3_Group_Falcon2",
	nil,nil,nil,nil,nil,
	localize "STR_A3_B_CTRG_soldier_M_medic_F0",
	"Lieutenant",
	""
] call BIS_fnc_ORBATSetGroupParams;
[
	configfile >> "CfgORBAT" >> "BIS" >> "B_I_Omega",
	nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,
	""
] call BIS_fnc_ORBATSetGroupParams;

"BIS_objAmbush" call BIS_fnc_missionTasks;
"BIS_objHideout" call BIS_fnc_missionTasks;

[] spawn {
	//Wait for display to be available
	waituntil { !isNull (findDisplay 37) };

	//Select Tasks subject by default
	disableserialization;
	_diary = finddisplay 37;
	_diaryList = _diary displayctrl 1001;
	_diaryList lbsetcursel 1;
};


// Normal briefing
BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_signal_title",
		format [
			localize "STR_A3_campaign_b_m06_brief_signal",
			"<br/>",
			"</marker>",
			"<marker name='start'>",
			"<marker name='cars'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_execution_title",
		format [
			localize "STR_A3_campaign_b_m06_brief_execution",
			"<br/>",
			"</marker>",
			"<marker name='convoy_route_22'>",
			"<marker name='hideout'>",
			"1. ",
			"2. ",
			"3. "
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_mission_title",
		format [
			localize "STR_A3_campaign_b_m06_brief_mission",
			"</marker>",
			"<marker name='convoy_route_22'>",
			"<marker name='hideout'>"
		]
	]
];

BIS_inf createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_diary_situation_title",
		format [
			localize "STR_A3_campaign_b_m06_brief_situation",
			"<br/><br/>",
			"</marker>",
			"<marker name='convoy_route_22'>",
			"<marker name='outpost'>",
			"<marker name='hideout'>"
		]
	]
];

//Map
[] spawn {
	//animate map (center and zoom)
	(findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.17, markerPos "BIS_mrkBriefingCenter"];
	ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
};
