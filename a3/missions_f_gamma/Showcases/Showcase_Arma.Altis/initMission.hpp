//Screen starts black and no sound/music
0 fadeSound 0;
0 fadeMusic 0;
enableEnvironment false;

[] spawn {
	while { isNil { BIS_fnc_titlecard_finished } || isNil { BIS_missionStarted } } do {
		enableRadio false;
		clearRadio;
	};
};

//Player loadout
{ if (_x == "SLAMDirectionalMine_Wire_Mag" || _x == "ClaymoreDirectionalMine_Remote_Mag" || _x == "APERSBoundingMine_Range_Mag" || _x == "APERSMine_Range_Mag") then { player removeMagazine _x; }; } forEach magazines player;
unitBackpack player addMagazineCargo ["DemoCharge_Remote_Mag", 3];
player addPrimaryWeaponItem "optic_Hamr";

//Title card
["a3\missions_f_gamma\video\ARMA.ogv","STR_A3_SHOWCASE_ARMA1_TITLECARD"] spawn BIS_fnc_titlecard;
waitUntil { !isNil { BIS_fnc_titlecard_finished } };

//Establishing Shot
private "_colorEast";
_colorEast = EAST call BIS_fnc_sideColor;
_colorEast set [3, 0.33];
[
	getMarkerPos "BIS_outpost",
	localize "STR_A3_Showcase_Arma_SITREP_text",
	500,
	200,
	0,
	1,
	[
		["\a3\ui_f\data\map\markers\nato\b_unknown.paa", _colorEast, getMarkerPos "BIS_outpost", 1, 1, 0, "", 0]
	]
] spawn BIS_fnc_establishingShot;
waitUntil { !isNil { BIS_missionStarted } };

//Play music and fade in screen, music and sound
titleText ["", "BLACK FADED", 10];
sleep 5;
titleText ["", "BLACK IN", 5];
5 fadeSound 1;
enableEnvironment true;
enableRadio true;
