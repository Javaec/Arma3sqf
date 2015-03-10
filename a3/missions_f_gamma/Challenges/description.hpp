author = $STR_A3_Bohemia_Interactive;
dev = "Joris";
briefing = 0;
enableTeamSwitch = 0;

onPauseScript = "a3\modules_f_beta\firingdrills\scripts\onPause.sqf";

#define SET_MISSION_META(_stage,_class,_version,_name,_text) \
	onLoadName = _name; \
	onLoadMission = _text; \
	stage = _stage; \
	name = _name; \
	loadScreen = \a3\Missions_F_Gamma\data\img\##_class##_overview_CA.paa; \
	briefingName = _name; \
	overviewPicture = \a3\Missions_F_Gamma\data\img\##_class##_overview_CA.paa; \
	overviewText = _text;

class CfgDebriefing
{
	class End1
	{
        title = $STR_A3_FIRING_DRILLS_END1_TITLE;
        subtitle = "";
        description = $STR_A3_FIRING_DRILLS_END1_DESC;
		picture = "A3\Ui_f\data\GUI\Cfg\Hints\FiringDrills_ca";
	};
	class End2: End1 
	{
        title = $STR_A3_FIRING_DRILLS_END2_TITLE;
        subtitle = "";
        description = $STR_A3_FIRING_DRILLS_END2_DESC;
		picture = "A3\Ui_f\data\GUI\Cfg\Debriefing\endDeath_ca";
	};
	class End3: End1 
	{
        title = $STR_A3_FIRING_DRILLS_END3_TITLE;
        subtitle = "";
        description = $STR_A3_FIRING_DRILLS_END3_DESC;
		picture = "A3\Ui_f\data\GUI\Cfg\Debriefing\endDefault_ca";
	};
};

class CfgDebriefingSections
{
	class Results
	{
		title = $STR_A3_TIME_TRIALS_RESULTS;
		variable = "BIS_FD_results";
	};
};