// Flying sequence
_data = call compile preprocessFileLineNumbers "Littlebird.sqf";

If (!([] call BIS_fnc_isCampaign)) Then {[BIS_Littlebird, _data, [BIS_Littlebird, "finished"], false, false, 0, 40] spawn BIS_fnc_unitPlay} Else
{
BIS_Littlebird disableAI "anim";
BIS_player action ["Eject", BIS_Littlebird];
unassignVehicle BIS_A1;
[BIS_A1] orderGetIn false;
BIS_A1 action ["Eject",BIS_Littlebird];
BIS_player setPos [2147.14,1877.83,0.00130177];
BIS_player setDir 320;
BIS_A1 setDir 320;
BIS_A1 setPos [2152.7,1879.28,0.00130939];
BIS_Littlebird setPos [(getPos BIS_Helipad select 0), (getPos BIS_Helipad select 1), 0.25];
BIS_Littlebird setDir 210;
"BIS_mrkStart" setMarkerPos (getPos BIS_helipad);
};

//Mission flow (Prolog, Battle, Victory/Defeat)
BIS_missionScope setVariable ["missionFlow","Prolog"];

{_x allowFleeing 0} forEach allUnits;
// {_x removeWeapon handgunWeapon _x} forEach allUnits;
// {_x removeMagazines "16Rnd_9x21_Mag"} forEach allUnits;
{_x unassignItem "NVGoggles"} forEach allunits;
{_x removeItem "NVGoggles"} forEach allunits;

enableTeamSwitch false;

Hints_script = BIS_MissionScope execFSM "Hints.fsm";
Jukebox_script = BIS_missionScope execFSM "Jukebox.fsm";

//Initial showcase video
["a3\missions_f_beta\video\COMMANDING.ogv","STR_A3_SHOWCASE_COMMANDING_I_TITLECARD"] spawn BIS_fnc_titlecard;
waitUntil {!(isNil "BIS_fnc_titlecard_finished")};

// Start establishing shot

	private ["_colorWest", "_colorEast"];
	_colorWest = WEST call BIS_fnc_sideColor;
	_colorEast = EAST call BIS_fnc_sideColor;
	{_x set [3, 0.33]} forEach [_colorWest, _colorEast];

[
	[2209.83,1848.7,0],					// Target position
	localize "STR_A3_Showcase_Commanding_I_SITREP_text",	// SITREP text
	500,							// 500m altitude
	200,							// 200m radius
	0,							// 0 degrees viewing angle
	1,							// Clockwise movement
	
	[
		["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorWest, markerPos "BIS_mrkBeach", 1, 1, 0, "", 0]
	]

] spawn BIS_fnc_establishingShot;
