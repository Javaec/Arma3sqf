0 setFog [0.25, 0.125, 5];

enableTeamSwitch false;

// Variables

// Pyrgos - Besieged, Defended, Fallen
BIS_missionScope setVariable ["Pyrgos","Besieged"];

// NavalBase - Standing, Destroyed
BIS_missionScope setVariable ["NavalBase","Standing"];

// SPGs - Active, Destroyed
BIS_missionScope setVariable ["SPGs","Active"];

// Recon - Alive, Saved, Dead
BIS_missionScope setVariable ["Recon","Alive"];

// tasks

// 01 - defend Pyrgos - if fail > failMission
// 02 - destroy enemy naval base - must accomplish
// 03 - destroy enemy SPGs - must accomplish
// 04 - save friendly recon team - could fail
// 05 - RTB (given when tasks 1,2,3,4 done or 1,2,3 done and 4 fail


BIS_attack01 = false;
BIS_attack02 = false;
BIS_reconProblems = false;

BIS_task01Done = false;
BIS_task02Done = false;
BIS_task03Done = false;
BIS_task04Done = false;
BIS_task05Done = false;


// To prevent player to unintentionally fulfills tasks that 
// are not active yet - would result in error
BIS_newTasksReceived = false;

// Define units for hiding/unhiding
BIS_Ambient = ([BIS_Tank01, BIS_Tank02] + units BIS_grpAmbient01);
BIS_Attackers = [BIS_B_Ship01, BIS_B_Ship02, BIS_B_Ship03, BIS_AH9, BIS_AH99];
BIS_Naval = ([BIS_Naval01, BIS_Naval02, BIS_Naval03, BIS_Naval04, BIS_Naval05, BIS_Naval06, BIS_Naval07] + units BIS_grp_B_Inf03 + units BIS_grp_B_Inf04);
BIS_Artillery = [BIS_Scorcher01, BIS_Scorcher02, BIS_Scorcher03];
BIS_Recon = [BIS_Recon01, BIS_Recon02, BIS_Recon03, BIS_Recon04, BIS_Recon05, BIS_Recon06, BIS_Recon07];
BIS_Pursuers = ([BIS_Dead01, BIS_Dead02, BIS_Dead03, BIS_Dead04, BIS_Dead05, BIS_Dead06, BIS_Dead07, BIS_Dead08, BIS_Wreck01, BIS_AMV01] + units BIS_grpPursue01 + units BIS_grpPursue02 + units BIS_grpPursue03 + units BIS_grpPursue04 + units BIS_grpPursue05 + units BIS_grpPursue06);

// Move sequences to get Recon units off castle
BIS_recon1Move = compile preprocessFile "scenes\recon1Move.sqf";
BIS_recon2Move = compile preprocessFile "scenes\recon2Move.sqf";
BIS_recon3Move = compile preprocessFile "scenes\recon3Move.sqf";
BIS_recon4Move = compile preprocessFile "scenes\recon4Move.sqf";
BIS_recon5Move = compile preprocessFile "scenes\recon5Move.sqf";
BIS_recon6Move = compile preprocessFile "scenes\recon6Move.sqf";
BIS_recon7Move = compile preprocessFile "scenes\recon7Move.sqf";

// Save guard tower for detection of naval base task
BIS_GuardTower = [14296.054,13029.816,0.000] nearestObject "Land_Cargo_Tower_V3_F";

// Function for unhiding units
BIS_hideUnits = {
	private ["_units", "_mode"];
	_units = [_this, 0, objNull, [objNull, []]] call BIS_fnc_param;
	_mode = [_this, 1, 0, [0]] call BIS_fnc_param;	// 0 - hide (default), 1 - unhide
	
	if (_mode == 0) then {
		// Hide
		{
			{
				private ["_unit"];
				_unit = _x;
				
				_unit hideObject true;
				_unit enableSimulation false;
				_unit allowDamage false;
				_unit setCaptive true;
				
				{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
			} forEach ([vehicle _x, commander _x,  gunner _x, driver _x, _x] + crew _x);
		} forEach _units;
	} else {
		// Unhide
		{
			{
				private ["_unit"];
				_unit = _x;
				
				_unit hideObject false;
				_unit enableSimulation true;
				_unit allowDamage true;
				_unit setCaptive false;
				
				{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
			} forEach ([vehicle _x, commander _x,  gunner _x, driver _x, _x] + crew _x);
		} forEach _units;
	};
	
	true
};

// Hide units
[[BIS_Zamak] + BIS_Ambient + BIS_Recon + BIS_Pursuers + units BIS_grpAmbient02 + units BIS_grpAmbient03, 0] call BIS_hideUnits;

{_x allowFleeing 0} forEach allUnits;

{
	private ["_unit"];
	_unit = _x;
	
	// Remove pistols (ToDo: remove when fixed?)
	{
		private ["_type"];
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");
		
		if (_type == 2) then {
			{_unit removeMagazines _x} forEach (getArray (configFile >> "CfgWeapons" >> _x >> "magazines"));
			_unit removeWeapon _x;
		};
	} forEach weapons _unit;
	
	// Remove silencers (ToDo: remove when fixed?)
	{
		private ["_type"];
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
		if (_type == 101) then {_unit removePrimaryWeaponItem _x};
	} forEach primaryWeaponItems _unit;
} forEach (BIS_Recon + BIS_Pursuers);

// Stop player killing units on the airfield
{
	private ["_killedEH"];
	_killedEH = _x addEventHandler [
		"Killed",
		{
			private ["_unit", "_source"];
			_unit = _this select 0;
			_source = _this select 1;
			
			if (_source in [vehicle BIS_player, driver vehicle BIS_player, gunner vehicle BIS_player]) then {
				// Ensure he's court-martialed
				BIS_courtMartial = true;
				
				if (!(isNil {_unit getVariable "BIS_animEH"})) then {
					// Stop the unit's animations
					_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
					_unit switchMove "";
				};
			};
		}
	];
	
	_x setVariable ["BIS_killedEH", _killedEH];
} forEach ([BIS_Zamak, BIS_Mi48, BIS_Guard, BIS_Officer, BIS_Fuelman01, BIS_Fuelman02, BIS_ZamakFuel] + crew BIS_Zamak + crew BIS_Mi48 - [BIS_player]);

// Remind to rearm if necessary
[] spawn {
	scriptName "initMission.hpp: ammo tracking";
	
	// Wait for a weapon to be selected
	waitUntil {
		currentWeapon BIS_Mi48 != ""
		||
		BIS_task05Done
		||
		{!(isNil _x)} count ["BIS_courtMartial", "BIS_rearmedOnce"] > 0
	};
	
	while {
		!(BIS_task05Done)
		&&
		{!(isNil _x)} count ["BIS_courtMartial", "BIS_rearmedOnce"] == 0
	} do {
		private ["_currentWeapon", "_currentMagazine", "_count"];
		_currentWeapon = currentWeapon BIS_Mi48;
		_currentMagazine = currentMagazine BIS_Mi48;
		_count = getNumber (configFile >> "CfgMagazines" >> _currentMagazine >> "count");
		
		// Wait for the player to use up most of his ammo
		waitUntil {
			(BIS_Mi48 ammo _currentWeapon) / _count <= 0.25
			||
			currentWeapon BIS_Mi48 != _currentWeapon
			||
			currentMagazine BIS_Mi48 != _currentMagazine
			||
			BIS_task05Done
			||
			{!(isNil _x)} count ["BIS_courtMartial", "BIS_rearmedOnce"] > 0
		};
		
		if (
			currentWeapon BIS_Mi48 == _currentWeapon
			&&
			currentMagazine BIS_Mi48 == _currentMagazine
			&&
			!(BIS_task05Done)
			&&
			{!(isNil _x)} count ["BIS_courtMartial", "BIS_rearmedOnce"] == 0
		) exitWith {
			sleep 1;
			
			// Play reminder conversation
			"x05_OutOfAmmo" call BIS_fnc_missionConversations;
		};
	};
};

Bis_printText =
{
	private["_blocks","_block","_blockCount","_blockNr","_blockArray","_blockText","_blockTextF","_blockTextF_","_blockFormat","_formats","_inputData","_processedTextF","_char","_cursorBlinks","_cursorInvis"];

	_blockCount = count _this;

	_invisCursor = "<t color ='#00000000' shadow = '0'>_</t>";

	//process the input data
	_blocks = [];
	_formats = [];

	{
		_inputData = _x;

		_block 	= [_inputData, 0, "", [""]] call BIS_fnc_param;
		_format = [_inputData, 1, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", [""]] call BIS_fnc_param;

		//convert strings into array of chars
		_blockArray = toArray _block;
		{_blockArray set [_forEachIndex, toString [_x]]} forEach _blockArray;

		_blocks  = _blocks + [_blockArray];
		_formats = _formats + [_format];
	}
	forEach _this;

	//do the printing
	_processedTextF  = "";

	{
		_blockArray  = _x;
		_blockNr 	 = _forEachIndex;
		_blockFormat = _formats select _blockNr;
		_blockText   = "";
		_blockTextF  = "";
		_blockTextF_ = "";

		{
			_char = _x;

			_blockText = _blockText + _char;

			_blockTextF  = format[_blockFormat, _blockText + _invisCursor];
			_blockTextF_ = format[_blockFormat, _blockText + "_"];

			//print the output
			[(_processedTextF + _blockTextF_), 0, 0.15, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			playSound "click";
			sleep 0.08;
			[(_processedTextF + _blockTextF), 0, 0.15, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep 0.02;
		}
		forEach _blockArray;

		if (_blockNr + 1 < _blockCount) then
		{
			_cursorBlinks = 5;
		}
		else
		{
			_cursorBlinks = 15;
		};

		for "_i" from 1 to _cursorBlinks do
		{
			[_processedTextF + _blockTextF_, 0, 0.15, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep 0.08;
			[_processedTextF + _blockTextF, 0, 0.15, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep 0.02;
		};

		//store finished block
		_processedTextF  = _processedTextF + _blockTextF;
	}
	forEach _blocks;

	//clean the screen
	["", 0, 0.15, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
};

Bis_resupply =
{
	private["_volumeSound","_volumeMusic","_volumeRadio","_fadeSpeed","_fadeVolume"];

	_fadeSpeed = 1;
	_fadeVolume = 0.1;

	_volumeSound = soundVolume;
	_volumeMusic = musicVolume;
	_volumeRadio = radioVolume;

	//enableRadio false;
	//clearRadio;

	BIS_Mi48 enableSimulation false;

	//black out
	cuttext ["","black out",_fadeSpeed];

	_fadeSpeed fadeSound _fadeVolume;
	_fadeSpeed fadeMusic 0;
	_fadeSpeed fadeRadio 0;

	sleep _fadeSpeed;

	[
		[
			localize "STR_A3_Showcase_Gunships_rearm_text01",
			"<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"
		],
		[
			localize "STR_A3_Showcase_Gunships_rearm_text02",
			"<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"
		]
	] call Bis_printText;

	skipTime 0.17;	//add 10 minutes

	BIS_Mi48 setVehicleAmmo 1;
	BIS_Mi48 setFuel 1;
	BIS_Mi48 setDamage 0;

	//black in
	cuttext ["","black in",_fadeSpeed * 3];

	_fadeSpeed fadeSound _volumeSound;
	_fadeSpeed fadeMusic _volumeMusic;
	_fadeSpeed fadeRadio _volumeRadio;

	//enableRadio true;

	BIS_Mi48 enableSimulation true;

	sleep _fadeSpeed;
};

// Start rearm control
execFSM "rearm.fsm";

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	// Titlecard (ToDo: change to Gunships video when it exists)
	["a3\missions_f_gamma\video\gunships.ogv", "STR_A3_SHOWCASE_GUNSHIPS_TITLECARD"] spawn BIS_fnc_titlecard;
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
	
	// Establishing shot
	private ["_colorWest", "_colorEast"];
	_colorWest = WEST call BIS_fnc_sideColor;
	_colorEast = EAST call BIS_fnc_sideColor;
	{_x set [3, 0.83]} forEach [_colorWest, _colorEast];
	
	[
		[20795.127,7231.677,0.000],				// Target position
		localize "STR_A3_Showcase_Gunships_SITREP_text",	// SITREP text
		300,							// 350m altitude
		200,							// 150m radius
		50,							// 0 degrees viewing angle
		1,                                                      // Clockwise movement
		[
			["\a3\ui_f\data\map\markers\nato\o_hq.paa", _colorEast, markerPos "BIS_mrkAirfield", 1.5, 1.5, 0, "", 0],
			["\a3\ui_f\data\map\markers\nato\o_air.paa", _colorEast, markerPos "BIS_mrkHeli", 1, 1, 0, "", 0],
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "BIS_mrkSection", 1, 1, 0, "", 0],
			["\a3\ui_f\data\map\markers\Military\start_CA.paa", _colorEast, markerPos "BIS_mrkStart", 1, 1, 0, "", 0]
		]							
	] spawn BIS_fnc_establishingShot;
	
	waitUntil {!(isNil "BIS_missionStarted")};
	
	enableEnvironment false;
	0 fadeSound 0;
	titleCut ["", "BLACK FADED", 10e10];
	
	// Unhide units
	[[BIS_Zamak] + BIS_Ambient, 1] call BIS_hideUnits;
	
	sleep 1;
	
	0 fadeMusic 0.25;
	playMusic "Track13_StageC_negative";
	
	sleep 2;
	
	enableEnvironment true;
	3 fadeSound 1;
	titleCut ["", "BLACK IN", 3];
	
	"01_Prologue" call BIS_fnc_missionConversations;
};
