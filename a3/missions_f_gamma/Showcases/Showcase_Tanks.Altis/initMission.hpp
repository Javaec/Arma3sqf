BIS_go = FALSE;
BIS_flyAway = FALSE;

_flightData = call compile preprocessFile "flight.hpp";

//{_x allowCrewInImmobile TRUE} forEach [BIS_tank1, BIS_tank2, BIS_tank3, BIS_tank4];

{_x assignAsCargo BIS_humm} forEach [BIS_player, BIS_crewLead1, BIS_crew2];

BIS_crewLead1 moveInCargo [BIS_humm, 0];
BIS_crew2 moveInCargo [BIS_humm, 1];
BIS_player moveInCargo [BIS_humm, 3];

//Initial showcase video
["a3\missions_f_gamma\video\TANKS.ogv","STR_A3_SHOWCASE_TANKS_TITLECARD"] spawn BIS_fnc_titlecard;
waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
// Start establishing shot
private ["_colorWest", "_colorEast"];
_colorWest = WEST call BIS_fnc_sideColor;
_colorEast = EAST call BIS_fnc_sideColor;
{_x set [3, 0.63]} forEach [_colorWest, _colorEast];

[
	markerPos "candy7",				// Target position
	localize "STR_A3_Showcase_Tanks_SITREP_text",	// SITREP text
	750,						// 750 altitude
	300,						// 300m radius
	270,						// 270 degrees viewing angle
	1,						// Clockwise movement
	[
		["\a3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, markerPos "candy3", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_mech_inf.paa", _colorEast, markerPos "candy5", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "candy7", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_armor.paa", _colorEast, markerPos "candy6", 1, 1, 0, "", 0]
	]
] spawn BIS_fnc_establishingShot;

waitUntil {!isNil "BIS_missionStarted"};

titleCut ["", "BLACK FADED", 10e10];

{_x allowFleeing 0} forEach allUnits;

0 fadeMusic 0;
playMusic "Track09_Night_percussions";
3 fadeMusic 0.25;

_flight = [vehicle BIS_humm, _flightData, nil, nil, nil, nil, 6] spawn BIS_fnc_UnitPlay;
sleep 0.5;

titleCut ["", "BLACK IN", 2];
sleep 6;

BIS_arty addMagazine "12Rnd_230mm_rockets";
BIS_arty commandArtilleryFire [markerPos "BIS_artyTarget", "12Rnd_230mm_rockets", 12];

waitUntil {scriptDone _flight};

BIS_humm allowDamage FALSE;

[] spawn {
	_pos = position BIS_humm;
	_dir = direction BIS_humm;
	while {!BIS_flyAway} do {
		BIS_humm setPos _pos;
		BIS_humm setDir _dir;
		BIS_humm setVelocity [0,0,0];
		sleep 0.01;
	};
};

waitUntil {{vehicle _x == BIS_humm} count [BIS_player, BIS_crewLead1, BIS_crew2] == 0};

[BIS_tank2, "commander"] call BIS_fnc_assignPlayerRole;
BIS_crewLead1 assignAsGunner BIS_tank2;
BIS_crew2 assignAsDriver BIS_tank2;

sleep 2;

BIS_flyAway = TRUE;
_null = "intro" spawn BIS_fnc_missionConversations;