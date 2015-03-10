//[{removeAllMusicEventHandlers "MusicStop"}] call BIS_fnc_onEnd;

[] spawn {
	scriptName "initMission.hpp: mission start";

	["a3\missions_f\video\vehicles.ogv","STR_A3_SHOWCASE_VEHICLES_TITLECARD"] spawn BIS_fnc_titlecard;	// Todo: enable only showing it once
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};

	// Start establishing shot
	private ["_colorWest", "_colorEast"];
	_colorWest = WEST call BIS_fnc_sideColor;
	_colorEast = EAST call BIS_fnc_sideColor;
	{_x set [3, 0.33]} forEach [_colorWest, _colorEast];
	
	[
		[5144.187,5825.277,0],				// Target position
		localize "STR_A3_Showcase_Vehicles_SITREP_text",	// SITREP text
		500,						// 500m altitude
		200,						// 200m radius
		180,						// 180 degrees viewing angle
		0,						// Anti-clockwise movement
		[
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "start", 1, 1, 0, localize "STR_A3_callsign_bravo_black", 0],
			["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorWest, markerPos "target", 1, 1, 0, "", 0],
			["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorWest, markerPos "warn", 1, 1, 0, "", 0]
		]
	] spawn BIS_fnc_establishingShot;
};