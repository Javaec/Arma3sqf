//Params
private ["_player", "_jip"];
_player = _this select 0;
_jip 	= _this select 1;

//Disable team switch
enableTeamSwitch false;

//Disable sounds and radio protocol
0 fadeSound 0;
enableRadio false;
enableEnvironment false;

//Initial showcase video
if (!isMultiplayer) then {
	[
		"a3\missions_f_beta\video\COMBINED_ARMS.ogv",
		"STR_A3_SHOWCASE_COMBINED_ARMS1_TITLECARD"
	] spawn BIS_fnc_titlecard;
	waitUntil { !isNil { BIS_fnc_titlecard_finished } };
	
	//Establishing Shot
	private "_colorEast";
	_colorEast = EAST call BIS_fnc_sideColor;
	_colorEast set [3, 0.33];
	
	[
		getMarkerPos "BIS_enemy",
		localize "STR_A3_Showcase_Combined_Arms_SITREP_text",
		250,
		250,
		0,
		1,
		[
			["\a3\ui_f\data\map\markers\nato\b_unknown.paa", _colorEast, getMarkerPos "BIS_enemy", 1, 1, 0, localize "STR_A3_Showcase_Combined_Arms_Marker_BIS_enemyText", 0]
		]
	] spawn BIS_fnc_establishingShot;
	waitUntil { !isNil { BIS_missionStarted } };
};

//Screen starts black and no sound/music/radio
titleText ["", "BLACK FADED", 10];
0 fadeSound 0;
0 fadeMusic 0;
0 fadeSpeech 0;
enableRadio false;
enableEnvironment false;
clearRadio;

//Fade in screen, music, sound and radio
[] spawn {
	sleep 5;
	titleText ["", "BLACK IN", 5];
	5 fadeSound 1;
	5 fadeMusic 0.6;
	5 fadeSpeech 1;
	enableRadio true;
	enableEnvironment true;
};

//Play some music, not for JIP
[] spawn {
	if (time < 60 && !([] call BIS_fnc_isCampaign)) then {
		playMusic ["Track10_StageB_action", 12];
	};
};

//Friendly Fire module
if (!isMultiplayer) then {
	//Full crew
	private ["_crewFull", "_crew"];
	_crewFull 	= crew BIS_insertionChopper_1 + crew BIS_insertionChopper_2;
	_crew		= [];
	
	{
		if (group _x != BIS_group_1 && group _x != BIS_group_2) then {
			_crew set [count _crew, _x];
		};
	} forEach _crewFull;
	
	private ["_friendlies", "_module"];
	_friendlies	= units BIS_group_1 + units BIS_group_2 + _crew;
	_module		= ["Init", [_friendlies, true]] call BIS_fnc_moduleFriendlyFire;
};

//Manually eject player after insertion choppers have landed (SinglePlayer only)
if (!isMultiplayer && !([] call BIS_fnc_isCampaign)) then {
	waitUntil { isTouchingGround vehicle _player };
	unassignVehicle player;
	[_player] orderGetIn false;
	_player action ["Eject", vehicle _player];
	10 fadeMusic 0;
	sleep 25;
	[["Weapons_basic", "Launcher"], 15] spawn BIS_fnc_advHint;
};
