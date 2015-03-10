//[{removeAllMusicEventHandlers "MusicStop"}] call BIS_fnc_onEnd;

BIS_SUPP_reportNewSupports = FALSE;

[] spawn {
	scriptName "initMission.hpp: mission start";
	["a3\missions_f\video\scuba.ogv","STR_A3_SHOWCASE_SCUBA_TITLECARD"] spawn BIS_fnc_titlecard;	// Todo: enable only showing it once
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};

	// Start establishing shot
	private ["_colorWest", "_colorEast"];
	_colorWest = WEST call BIS_fnc_sideColor;
	_colorEast = EAST call BIS_fnc_sideColor;
	{_x set [3, 0.33]} forEach [_colorWest, _colorEast];

	[
		[1930.854,3398.912,0],				// Target position
		localize "STR_A3_Showcase_SCUBA_SITREP_text",	// SITREP text
		500,						// 500m altitude
		200,						// 200m radius
		45,						// 45 degrees viewing angle
		0,						// Anti-clockwise movement
		[
			["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorWest, markerPos "start", 1, 1, 0, localize "STR_A3_callsign_omega", 0],
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "BIS_mrkTempest", 1, 1, 0, "", 0],
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "BIS_mrkBoat", 1, 1, 0, "", 0]
		]
	] spawn BIS_fnc_establishingShot;
};

waitUntil {!isNil "BIS_missionStarted"};

[BIS_player, BIS_req, BIS_prov] call BIS_fnc_addSupportLink;