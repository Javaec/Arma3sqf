{
	_x setMarkerAlpha 0;
} forEach 
[
	"BIS_convoy1", 
	"BIS_convoy1_1", 
	"BIS_convoy1_2", 
	"BIS_convoy1_3", 
	"BIS_convoy1_4",
	"BIS_convoy1_5",
	"BIS_convoy1_5_1", 
	"BIS_convoy1_5_2", 
	"BIS_convoy1_5_3", 
	"BIS_convoy1_5_4", 
	"BIS_convoy1_6"
];

BIS_convoyTime = 10e10;
BIS_regrouped = 0;
BIS_detonated = FALSE;
BIS_team2Go = FALSE;

["Init"] call BIS_fnc_InstructorFigure;

sleep 1;
		
["\A3\Missions_F_EPB\video\B_m03_quotation.ogv", "STR_A3_campaign_quote_34"] call BIS_fnc_quotations;

waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

0 fadeMusic 0.15;
playMusic "BackgroundTrack01_F_EPB";
		
waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

sleep 1;
		
enableRadio TRUE;
BIS_inf enableSimulation TRUE;
(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
enableSaving [TRUE, TRUE];

sleep 1;

"start" spawn BIS_fnc_missionConversations;