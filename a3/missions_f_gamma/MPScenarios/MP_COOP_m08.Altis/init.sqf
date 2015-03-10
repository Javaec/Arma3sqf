if (isServer) then {
	"BIS_obj1" call BIS_fnc_missionTasks;
	vehicle BIS_tank2 setPos [27995.5,25438.6,0.0555496];
	vehicle BIS_tank3 setPos [27968.7,25467.9,0.0342178];
	vehicle BIS_tank4 setPos [27959.9,25498.9,0.262108];

	{_x allowFleeing 0} forEach allUnits;
};

if !(isDedicated) then {
	waitUntil {isPlayer player && !isNull player};
	{_x setWaypointVisible FALSE} forEach waypoints group player;
	/*if (count simpleTasks player == 0) then {
		[
			player,
			"BIS_obj1",
			[
				localize "STR_A3_Showcase_Tanks_task3_text",
				localize "STR_A3_Showcase_Tanks_task3_title",
				localize "STR_A3_Showcase_Tanks_task3_wp"
			],
			position BIS_molosArea,
			TRUE
		] call BIS_fnc_taskCreate;
	};*/

	player createDiaryRecord [
		"Diary",
		[
			localize "STR_A3_diary_situation_title",
			format [localize "STR_A3_Showcase_Tanks_diary_situation_text", "</marker>", "<marker name='airf_2'>", "<marker name='airf_3'>", "<marker name='airf_4'>", "<marker name='candy1'>", "<br/>", "<marker name='molos'>"]
		]
	];

	player createDiarySubject [
	  	"Showcase",
	 	 localize "STR_A3_Diary_Showcase_title"
	];

	player createDiaryRecord [
	"Showcase",
	[
		localize "STR_A3_Diary_Summary_title",
		"<img image = 'a3\missions_f_gamma\data\img\showcase_tanks_briefing_ca.paa' width = '370' align='center'/>" + localize "STR_A3_Showcase_tanks_Showcase_Summary_text"
	]
];
};