BIS_heliAttacked = FALSE;
BIS_APCsGo = FALSE;
BIS_showdown = FALSE;
BIS_assault = FALSE;
BIS_missionStarted = FALSE;
BIS_ambience = FALSE;

enableSentences FALSE;
BIS_inf enableSimulation FALSE;

["Init"] call BIS_fnc_InstructorFigure;

sleep 1;

["\A3\Missions_F_EPC\video\C_m01_quotation.ogv", "STR_A3_campaign_quote_40"] call BIS_fnc_quotations;

((markerPos "BIS_destr1") nearestObject "Land_Cargo_Tower_V3_F") setDamage 1;
((markerPos "BIS_destr2") nearestObject "Land_Cargo_Tower_V3_F") setDamage 1;
((markerPos "BIS_destr3") nearestObject "Land_Cargo_HQ_V3_F") setDamage 1;

waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

{_x enableSimulation FALSE; _x hideObject TRUE} forEach list BIS_complexArea;

0 fadeMusic 0.15;
playMusic "BackgroundTrack04_F_EPC";

//enableSentences TRUE;
BIS_missionStarted = TRUE;

sleep 0.5;

BIS_troop switchMove "Acts_welcomeOnHUB01_PlayerWalk_1";

sleep 0.5;

enableRadio TRUE;
enableSentences TRUE;
BIS_inf enableSimulation TRUE;
(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
enableSaving [TRUE, TRUE];

[0, 0, FALSE] spawn BIS_fnc_cinemaBorder;
BIS_inf enableSimulation TRUE;
BIS_inf switchMove "Acts_welcomeOnHUB01_PlayerWalk_3";

_null = [] spawn {
	sleep 30;
	BIS_troop switchMove "amovpercmstpslowwrfldnon";
	BIS_troop move markerPos "BIS_troopGo";
};

_null = [] spawn {
	while {vehicle BIS_inf != BIS_truck} do {
		_null = ["BIS_objGetIn", [position BIS_truck select 0, position BIS_truck select 1, 1.5]] call BIS_fnc_taskSetDestination;
		sleep 0.04;
	};
};

sleep 1;

"start" spawn BIS_fnc_missionConversations;

{deleteVehicle _x} forEach (units ((BIS_OP1 getVariable "garrison") select 3) + units ((BIS_OP1 getVariable "garrison") select 4));
BIS_factoryGarrison = +list BIS_factory;
{_x setCaptive TRUE; _x setBehaviour "CARELESS"; _x setCombatMode "BLUE"; _x allowFleeing 0} forEach BIS_factoryGarrison;

3600 setFog [0, 0, 0];