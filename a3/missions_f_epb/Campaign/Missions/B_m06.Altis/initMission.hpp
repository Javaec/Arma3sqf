BIS_convoyGo = FALSE;
BIS_convoyAttacked = FALSE;
BIS_jamesPlanChanged = FALSE;

["Init"] call BIS_fnc_InstructorFigure;

BIS_convoyFSM = [] execFSM "convoy.fsm";

{
	_x setCaptive TRUE;
	_x hideObject TRUE;
	vehicle _x hideObject TRUE;
	_x enableSimulation FALSE;
	vehicle _x enableSimulation FALSE;
} forEach ((units BIS_grpGroundAttack1) + (units BIS_grpGroundAttack2));

{_x setWaypointVisible FALSE} forEach waypoints group BIS_inf;

_null = [] spawn {
	sleep 0.1;
	{_x switchMove "amovpknlmstpslowwrfldnon";} forEach units group BIS_inf;
};

_garage = ([5100.97,16798,0.14986] nearObjects ["Land_i_Shed_Ind_F", 50]) select 0;
[_garage, 'Door_1_rot', 'Door_Handle_1_rot_1', 'Door_Handle_1_rot_2'] execVM "\A3\Structures_F\scripts\Door_open.sqf";
[_garage, 'Door_2_rot', 'Door_Handle_2_rot_1', 'Door_Handle_2_rot_2'] execVM "\A3\Structures_F\scripts\Door_open.sqf";

sleep 1;

["\A3\Missions_F_EPB\video\B_m06_quotation.ogv", "STR_A3_campaign_quote_32"] call BIS_fnc_quotations;

waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

0 fadeMusic 0.15;
playMusic "EventTrack03_F_EPB";

waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

sleep 1;
		
enableRadio TRUE;
BIS_inf enableSimulation TRUE;
(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
enableSaving [TRUE, TRUE];

sleep 1;

_null = "start" spawn BIS_fnc_missionConversations;

_addAmmo = [
	["30Rnd_65x39_caseless_green","6Rnd_45ACP_Cylinder","16Rnd_9x21_Mag","30Rnd_9x21_Mag","10Rnd_762x51_Mag","150Rnd_762x51_Box","1Rnd_HE_Grenade_shell","RPG32_F","HandGrenade","MiniGrenade"],
	[12,6,6,6,12,4,6,1,6,6]
];

{
	BIS_supplies addMagazineCargo [_x, (_addAmmo select 1) select _forEachIndex];
} forEach (_addAmmo select 0);