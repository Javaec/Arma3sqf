// Situation
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		format [
			localize "STR_A3_BOOT_m02_Briefing_Situation_text",
			"<br/><br/>",	// %1
			"<br/><br/>"	// %2
		]
	]
];

// Move markers into position
"BIS_AO1" setMarkerPos position BIS_AO1;
"BIS_return" setMarkerPos position BIS_mat;
"BIS_crate" setMarkerPos position BIS_crate;
"BIS_sign" setMarkerPos position BIS_sign;
"BIS_tank" setMarkerPos position BIS_tank;
"BIS_flag" setMarkerPos position BIS_flag;