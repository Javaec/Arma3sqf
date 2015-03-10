// Control SF Teams
BIS_SFTeam1 = [BIS_SF1, BIS_SF2, BIS_SF3, BIS_SF4, BIS_SF5];
BIS_SFTeam2 = [BIS_SF6, BIS_SF7, BIS_SF8, BIS_SF9, BIS_SF10];
BIS_SFTeam1_out = 0;
BIS_SFTeam2_out = 0;
1 execFSM "SFTeamControl.fsm";
2 execFSM "SFTeamControl.fsm";
{[1, _x] execFSM "SFUnitControl.fsm"} forEach BIS_SFTeam1;
{[2, _x] execFSM "SFUnitControl.fsm"} forEach BIS_SFTeam2;

// Define sets of units
BIS_AA = [BIS_AA1, BIS_AA2, BIS_AA3];
BIS_ambHelis = [BIS_ambHeli1, BIS_ambHeli2, BIS_ambHeli3];
BIS_ambUnits = (units group BIS_ambHeli1D + units group BIS_ambHeli2D + units group BIS_ambHeli3D);
BIS_earlyUnits = (units BIS_earlyTeam1 + units BIS_earlyTeam2 + units BIS_earlyTeam3 + units BIS_defGroup1 + units group BIS_earlyTruck1G);
BIS_earlyVehicles = [BIS_earlyTruck1];

BIS_attackUnits = [BIS_attack1, BIS_attack2, BIS_attack3, BIS_attack4, BIS_attack5, BIS_attack6, BIS_attack7, BIS_attackAPC1G, BIS_attackTruck1G];
BIS_attackVehicles = [BIS_attackAPC1, BIS_attackTruck1];

BIS_defVehicles = [BIS_defTank1, BIS_defTank2, BIS_defAPC1, BIS_defAPC2];
BIS_defUnits = (units group BIS_defTank1C + units group BIS_defTank2C + units group BIS_defAPC1C + units group BIS_defAPC2C);

{_x allowFleeing 0} forEach allUnits;

// Disable everything except conversations
[] spawn {
	scriptName "initMission.hpp: disable sentences";
	
	sleep 2;
	enableSentences false;
};

// Ensure NVGs are assigned to their slot
[] spawn {
	scriptName "initMission.hpp: assign NVGs";
	
	waitUntil {time > 0};
	
	private ["_classes", "_assignedItems", "_items"];
	_classes = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"];
	_assignedItems = assignedItems BIS_inf;
	_items = items BIS_inf;
	
	// Check if the player has NVGs and they aren't assigned
	if ({_x in _classes} count _assignedItems == 0 && {_x in _classes} count _items > 0) then {
		// Assign a pair
		private ["_class"];
		{if (_x in _classes) exitWith {_class = _x}} forEach _items;
		if (!(isNil "_class")) then {BIS_inf assignItem _class};
	};
};

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 2;
		
		["\A3\Missions_F_EPC\video\C_in2_quotation.ogv", "STR_A3_campaign_quote_39"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		private ["_time"];
		_time = time + 7;
		waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
		
		// Let units drive
		{_x enableAI "MOVE"} forEach [BIS_ambTruck1, BIS_SF5, BIS_SF10];
		
		sleep 4;
		
		waitUntil {!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")};
		
		BIS_inf enableSimulation true;
		BIS_inf action ["WeaponOnBack", BIS_inf];
		
		(format ["BIS_%1_blackScreen", missionName]) call BIS_fnc_blackIn;
		(format ["BIS_%1_disabledSave", missionName]) call BIS_fnc_enableSaving;
		
		sleep 2;
		
		"01_Report" call BIS_fnc_missionConversations;
		"05_Bullshit" call BIS_fnc_missionConversations;
	};
	
	// Register that the player reported in
	BIS_reported = true;
};