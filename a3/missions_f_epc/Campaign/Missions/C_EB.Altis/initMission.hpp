{_x addEventHandler ["Killed", {(If (_this select 1 == (vehicle BIS_inf))) Then {BIS_BlueOnBlue = true}}]} forEach (units BIS_grpNATO);
{_x addEventHandler ["Killed", {(If (_this select 1 == (vehicle BIS_inf))) Then {BIS_BlueOnBlue = true}}]} forEach (units BIS_grpFIA);

["NoSaves"] call BIS_fnc_disableSaving;

{_x allowFleeing 0} forEach allUnits;

BIS_ResearchBase = BIS_missionScope execVM "Scripts\ResearchBase.sqf";
BIS_Equipment = BIS_missionScope execVM "Scripts\Equipment.sqf";
BIS_Spawning = BIS_missionScope execVM "Scripts\Spawning.sqf";

sleep 2;

["\A3\Missions_F_EPC\video\C_EB_quotation.ogv", "STR_A3_campaign_quote_44"] call BIS_fnc_quotations;
WaitUntil {((BIS_fnc_quotations_playing)) or (!(isNil "BIS_fnc_quotations_skip"))};
WaitUntil {(!(BIS_fnc_quotations_playing)) or (!(isNil "BIS_fnc_quotations_skip"))};

sleep 0.05;

(format ["BIS_%1_blackScreen", missionName]) call BIS_fnc_blackIn;

BIS_missionStart = true;
