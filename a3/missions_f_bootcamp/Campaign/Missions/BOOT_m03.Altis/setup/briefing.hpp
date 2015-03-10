// Situation
BIS_lacey createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Situation_title",
		localize "STR_A3_BOOT_m03_Briefing_Situation_text"
	]
];

// Hide markers
{_x setMarkerAlpha 0} forEach ["BIS_start_area", "BIS_town_area", "BIS_hill_area", "BIS_location_area", "BIS_cleared1", "BIS_cleared2", "BIS_cleared3", "BIS_stash1", "BIS_stash2", "BIS_stash3"];

// Align markers with triggers
"BIS_AO" setMarkerPos markerPos "BIS_AO";
"BIS_start_area" setMarkerPos position BIS_start;
"BIS_town_area" setMarkerPos position BIS_town;
"BIS_hill_area" setMarkerPos position BIS_hill;