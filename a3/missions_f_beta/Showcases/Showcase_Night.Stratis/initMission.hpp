//Disable sounds and radio protocol
0 fadeSound 0;
0 fadeMusic 0;
enableRadio false;
enableSentences false;
enableEnvironment false;

//Volumetric fog
0 setFog [0.025, 0.275, 25];

//Initial showcase video
["a3\missions_f_beta\video\NIGHT.ogv","STR_A3_SHOWCASE_NIGHT2_TITLECARD"] spawn BIS_fnc_titlecard;
waitUntil { !isNil { BIS_fnc_titlecard_finished } };

//Establishing Shot
private "_colorEast";
_colorEast = EAST call BIS_fnc_sideColor;
_colorEast set [3, 0.33];

[
	[2667.74,1266.46,0],
	localize "STR_A3_Showcase_Night2_SITREP_text",
	200,
	200,
	270,
	1,
	[
		["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorEast, getMarkerPos "BIS_markerCampBig", 1, 1, 0, localize "STR_A3_Showcase_Night2_Marker_BIS_markerCampBig", 0]
	]
] spawn BIS_fnc_establishingShot;
waitUntil { !isNil { BIS_missionStarted } };

//Play music and fade in screen, music and sound
[] spawn {
	//Play some music
	if !([] call BIS_fnc_isCampaign) then {
		playMusic "Track09_Night_percussions";
	};
	
	//Screen starts black and no sound/music
	titleText ["", "BLACK FADED", 10];
	0 fadeSound 0;
	0 fadeMusic 0;
	enableRadio false;
	enableSentences false;
	enableEnvironment false;
	clearRadio;
	
	sleep 5;
	
	titleText ["", "BLACK IN", 5];
	5 fadeSound 0.4;
	5 fadeMusic 0.18;
	enableRadio true;
	enableSentences true;
	enableEnvironment true;
	
	waitUntil { !isNil { BIS_playerHasLanded } };
	
	0 fadeSound 1;
	10 fadeMusic 0;
};

//Player stuff
removeAllWeapons player;
removeHeadgear player;
removeVest player;
player addBackpack "B_AssaultPack_sgg";
clearAllItemsFromBackpack player;
player addMagazine "30Rnd_556x45_Stanag";
unitBackpack player addMagazineCargo ["30Rnd_556x45_Stanag", 8];
unitBackpack player addMagazineCargo ["16Rnd_9x21_Mag", 8];
unitBackpack player addMagazineCargo ["DemoCharge_Remote_Mag", 3];
unitBackpack player addMagazineCargo ["HandGrenade", 3];
unitBackpack player addMagazineCargo ["SmokeShellBlue", 4];
unitBackpack player addMagazineCargo ["Chemlight_blue", 4];
player addWeapon "Binocular";
player addWeapon "arifle_TRG20_Holo_F";
player addWeapon "hgun_P07_F";
player selectWeapon primaryWeapon player;
player addPrimaryWeaponItem "acc_flashlight";
player addPrimaryWeaponItem "optic_Aco";
player unassignItem "NVGoggles";
player removeItem "NVGoggles";
group player setGroupId ["Fox"];

//Spawn enemy foot patrols
{
	//Spawn the group
	private "_group";
	_group = [_x, EAST, configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry"] call BIS_fnc_spawnGroup;
	
	//Make the group patrol the area
	[_group, _x, 250] call BIS_fnc_taskPatrol;
} forEach [
	getMarkerPos "BIS_markerInfantry0",
	getMarkerPos "BIS_markerInfantry1",
	getMarkerPos "BIS_markerInfantry2"
];

//Init enemy groups
{
	if (side _x != WEST) then {
		[_x] call BIS_fnc_sn_initGroup;
	};
} forEach allGroups;
