if (call BIS_fnc_isCampaign) then {
	BIS_player setPos markerPos "BIS_op"
};

BIS_SUPP_reportNewSupports = FALSE;
BIS_bravoGo = FALSE;
BIS_echoGo = FALSE;
BIS_timeTeamsSentIn = 10e10;

0 setFog [0.1, 0.12, 22];

//Initial showcase video
["a3\missions_f_beta\video\SUPPORTS.ogv","STR_A3_SHOWCASE_SUPPORTS_TITLECARD"] spawn BIS_fnc_titlecard;
waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
// Start establishing shot
private ["_colorWest", "_colorEast"];
_colorWest = WEST call BIS_fnc_sideColor;
_colorEast = EAST call BIS_fnc_sideColor;
{_x set [3, 0.33]} forEach [_colorWest, _colorEast];

[
	markerPos "BIS_base",				// Target position
	localize "STR_A3_Showcase_Supports_SITREP_text",	// SITREP text
	500,						// 500m altitude
	200,						// 200m radius
	45,						// 45 degrees viewing angle
	0,						// Anti-clockwise movement
	[
		["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "BIS_establish1", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, markerPos "BIS_establish2", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_motor_inf.paa", _colorEast, markerPos "BIS_establish3", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_air.paa", _colorEast, markerPos "BIS_establish4", 1, 1, 0, "", 0],
		["\a3\ui_f\data\map\markers\nato\o_air.paa", _colorEast, markerPos "BIS_reinforcements", 1, 1, 0, "", 0]
	]
] spawn BIS_fnc_establishingShot;

sleep 0.5;

{
	if (side _x == WEST) then {
		_x addEventHandler ["Killed", {if ((_this select 1) in ((units BIS_player) + (units BIS_grpMortar))) then {["FriendlyFire", FALSE] call BIS_fnc_endMission}}]
	};
} forEach (allUnits - [BIS_player]);

waitUntil {!isNil "BIS_missionStarted"};

0 fadeMusic 0;
playMusic "Track01_Proteus";
3 fadeMusic 0.25;