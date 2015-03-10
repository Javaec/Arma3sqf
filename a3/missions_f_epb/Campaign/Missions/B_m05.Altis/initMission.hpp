BIS_sabotage_heli = FALSE;
BIS_sabotage_depot = FALSE;
BIS_fireMission = FALSE;
BIS_smokeTimeout = 10e10;

enableSentences FALSE;

["Init"] call BIS_fnc_InstructorFigure;

{_x disableAI "Move"} forEach [BIS_guerilla3, BIS_guerilla4, BIS_guerilla5, BIS_guerilla6];

{
	clearMagazineCargo _x; clearWeaponCargo _x; clearItemCargo _x;
} forEach [BIS_depotVeh1, BIS_depotVeh2, BIS_depotVeh3, BIS_depotVeh4, BIS_depotVeh5, BIS_depotVeh6, BIS_depotVeh7, BIS_depotVeh8];

sleep 1;

["\A3\Missions_F_EPB\video\B_m05_quotation.ogv", "STR_A3_campaign_quote_35"] call BIS_fnc_quotations;

waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

0 fadeMusic 0.15;
playMusic "LeadTrack01a_F_EPB";

waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

enableSentences TRUE;

sleep 1;
		
enableRadio TRUE;
BIS_inf enableSimulation TRUE;
(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
enableSaving [TRUE, TRUE];

sleep 1;

"start" spawn BIS_fnc_missionConversations;