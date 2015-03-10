#include "functions\dev.sqf"
#include "functions\dev_vector_position.sqf"
#include "functions\dev_tasks.sqf"
#include "functions\dev_object_icons.sqf"

#include "functions\dev_hints_init.sqf"
#include "functions\dev_hints.sqf"

//--------------------------------------------------------------------------------------------------
// RESUPPLY
//--------------------------------------------------------------------------------------------------

Bis_printSampleText =
{
	[
		["CAMP ROGAIN, RESSUPLY POINT","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		["10 MINUTES LATER ...","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]

	] spawn Bis_printText;
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

	enableRadio false;
	clearRadio;

	Bis_Heli enableSimulation false;

	//black out
	cuttext ["","black out",_fadeSpeed];

	_fadeSpeed fadeSound _fadeVolume;
	_fadeSpeed fadeMusic 0;
	_fadeSpeed fadeRadio 0;

	sleep _fadeSpeed;

	[
		[localize "str_a3_showcase_helicopters_resupply_point","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		[localize "str_a3_showcase_gunships_rearm_text02","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]

	] call Bis_printText;

	skipTime 0.17;	//add 10 minutes

	Bis_Heli setVehicleAmmo 1;
	Bis_Heli setFuel 1;
	Bis_Heli setDamage 0;

	//black in
	cuttext ["","black in",_fadeSpeed * 3];

	_fadeSpeed fadeSound _volumeSound;
	_fadeSpeed fadeMusic _volumeMusic;
	_fadeSpeed fadeRadio _volumeRadio;

	enableRadio true;

	Bis_Heli enableSimulation true;

	sleep _fadeSpeed;
};

//--------------------------------------------------------------------------------------------------
// BOMBARDMENTS
//--------------------------------------------------------------------------------------------------

//[] spawn Bis_startKaminoBombardment;
Bis_startKaminoBombardment =
{
	Bis_startKaminoBombardment = {};

	private["_mortars","_targets","_target"];

	_mortars = [Bis_KaminoMortar1, Bis_KaminoMortar2, Bis_KaminoMortar3];

	_targets =
	[
		Bis_KaminoMortarTarget1,
		Bis_KaminoMortarTarget2,
		Bis_KaminoMortarTarget3,
		Bis_KaminoMortarTarget4,
		Bis_KaminoMortarTarget5
	];

	//start alarm
	[Bis_KaminoBase,10,{{canMove _x} count [Bis_KaminoMortar1, Bis_KaminoMortar2, Bis_KaminoMortar3] > 0}] spawn Bis_createAlarm;


	["KAMINO BASE: BOMBARDMENT STARTED!"] call Bis_debugLog;

	while {{canMove _x} count _mortars > 0} do
	{
		{
			if (canMove _x) then
			{
				//select pre-defined target position
				if ((count _targets > 0) && ((random 100) < 10)) then
				{
					_target = _targets select 0;

					if (typeName _target == typeName objNull) then
					{
						_target = getPos _target;
					};

					_targets set [0, objNull]; _targets = _targets - [objNull];
				}
				//calc random target position
				else
				{
					_target = getPos Bis_KaminoBase;
					_target set [0, (_target select 0) + (random 80) - 40];
					_target set [1, (_target select 1) + (random 80) - 40];
				};

				//["FIRE!"] call Bis_debugLog;
				//["Distance",Bis_Mike26 distance _target] call Bis_debugLog;

				_x commandArtilleryFire [_target, "8Rnd_82mm_Mo_shells", ceil random 3];

				sleep ((random 3) + 3);
			};
		}
		forEach _mortars;

		sleep ((random 10) + 10);
	};

	["KAMINO BASE: BOMBARDMENT ENDED!"] call Bis_debugLog;
};

//[] spawn Bis_startMike26Bombardment;
Bis_startMike26Bombardment =
{
	//allow to run only once
	Bis_startMike26Bombardment = {};

	//exit if mortars are destroyed
	if ({canMove _x} count [Bis_Mortar1,Bis_Mortar2] == 0) exitWith {};

	private["_mortars","_targets","_target"];

	_mortars = [Bis_Mortar1, Bis_Mortar2];

	_targets =
	[
		[4311.75,3919.14,0.000686646],
		[4300.56,3868.42,0.00228882],
		[4308.27,3887.19,0.000793457],
		[4287.35,3904.98,0.0015564],		//closest fotification point with vehicle

		[4318.95,3818.3,0.00152588],
		[4325.75,3838.18,0.000854492],
		[4255.52,3829.93,0.00137329],
		[4304.85,3836.23,0.00134277],		//next fotification point with vehicle

		[4356.83,3696.12,0.00192261],
		[4351.71,3667.34,0.00157166],
		[4369.44,3687.34,0.000717163],
		[4364.07,3677.57,0.00144958]		//southern guard tower
	];


	//add *fired* event handler to detect when the 1st shell drops at Mike-26
	{
		_x addEventHandler ["fired",{
			_missile = nearestObject [_this select 0,_this select 4];

			Bis_Mortar1 removeAllEventHandlers "fired";
			Bis_Mortar2 removeAllEventHandlers "fired";

			_missile spawn {
				private["_pos","_posStored","_objects"];

				_pos = getPos _this;
				_posStored = _pos;

				while {!(isnull _this)} do {
					sleep 0.001;

					_pos = getPos _this;

					if ((_pos distance [0,0,0]) > 100) then
					{
						_posStored = _pos;
					};
				};

				["BOMBARDMENT STARTED!"] call Bis_debugLog;
				["MORTAR SHELL LANDED @ %1",_posStored] call Bis_debugLogF;

				sleep 2;

				//start siren
				[Bis_Mike26,10,{{canMove _x} count [Bis_Mortar1, Bis_Mortar2] > 0}] spawn Bis_createAlarm;

				Bis_BombardmentRunning = true;
			};
		}];
	}
	forEach [Bis_Mortar1, Bis_Mortar2];

	while {{canMove _x} count _mortars > 0} do
	{
		{
			if (canMove _x) then
			{
				//select pre-defined target position
				if (count _targets > 0) then
				{
					_target = _targets select 0;

					if (typeName _target == typeName objNull) then
					{
						_target = getPos _target;
					};

					_targets set [0, objNull]; _targets = _targets - [objNull];
				}
				//calc random target position
				else
				{
					_target = getPos Bis_Mike26;
					_target set [0, (_target select 0) + (random 80)  - 40];
					_target set [1, (_target select 1) + (random 150) - 75];
				};

				//["FIRE!"] call Bis_debugLog;
				//["Distance",Bis_Mike26 distance _target] call Bis_debugLog;

				_x commandArtilleryFire [_target, "8Rnd_82mm_Mo_shells", ceil random 3];

				sleep ((random 3) + 3);
			};
		}
		forEach _mortars;

		sleep ((random 10) + 10);
	};

	["BOMBARDMENT ENDED!"] call Bis_debugLog;
};

//--------------------------------------------------------------------------------------------------
// OTHER
//--------------------------------------------------------------------------------------------------

//[Bis_Mortar1,"HelicopterExploSmall"] call Bis_createExplosion;
Bis_createExplosion =
{
	private["_class","_pos","_shell"];

	_pos = _this select 0;
	_class = _this select 1;

	if (typeName _pos == typeName objNull) then
	{
		_pos = getPos _pos;
	};

	_pos set [2,3];

	_shell = createVehicle [_class,_pos,[],0,"FLY"];
	_shell setVelocity [0,0,-1000];
};

//"cfgAmmo" call Bis_getCfgClasses;
Bis_getCfgClasses =
{
	private["_cfg","_count","_class"];

	_cfg = configFile >> _this;

	_count = (count _cfg) - 1;

	for "_i" from 0 to _count do
	{
		_class = configName(_cfg select _i);

		[_class] call Bis_debugLog;
	};
};

//0 = [3896.67,3574.39,0.0] spawn Bis_testExplosions;
//0 = [3950.2,3545.94,0.00151062] spawn Bis_testExplosions;
Bis_testExplosions =
{
	private["_cfg","_count","_class","_sufix","_chars","_char","_ii"];

	_cfg = configFile >> "cfgAmmo";

	_count = (count _cfg) - 1;

	for "_i" from 2 to _count do
	{
		_class = configName(_cfg select _i);

		_chars = toArray _class;

		if (count _chars > 4) then
		{
			_sufix = [];

			for "_ii" from ((count _chars) - 4) to ((count _chars) - 1) do
			{
				_char = _chars select _ii;
				_sufix = _sufix + [_char];
			};

			_sufix = toString _sufix;

			if !(_sufix in ["Core","Base"]) then
			{
				["TESTING", _class] call Bis_debugLog;

				hint _class;

				[_this,_class] call Bis_createExplosion;

				sleep 2.5;

				hint "";

				sleep 0.5;
			};
		};
	};
};

//create the sound effect
//we will cheat it and play the sound closer to player
//[_soundPosition:array,_soundScale:number] spawn Bis_createAlarm;
//0=[Bis_HQ,10] spawn Bis_createAlarm;
Bis_createAlarm =
{
	private["_scale","_sound","_distance","_posSpeaker","_posPlayer","_pos","_playCond"];

	_posSpeaker = [_this, 0, getPos player] call BIS_fnc_param;
	_scale 		= [_this, 1, 1] call BIS_fnc_param;
	_playCond	= [_this, 2, {true}] call BIS_fnc_param;

	_sound = createSoundSource ["Sound_Alarm", _posSpeaker, [], 0];

	if (typeName _posSpeaker == typeName objNull) then
	{
		_posSpeaker = getPos _posSpeaker;
	};

	while _playCond do
	{
		sleep 1;

		if (_scale != 1) then
		{
			_posPlayer  = getPos player;

			_distance = _posPlayer distance _posSpeaker;

			_pos = [_posPlayer,_posSpeaker,_distance/_scale] call BIS_getPosInDistance;

			_sound setPos _pos;
		};
	};

	//turn of the alarm sound
	_sound setPos [10,10,10]; deleteVehicle _sound;
};

Bis_playAllConversations =
{
	{
		hint format["Playing: %1",_x];

		_kb = [_x,"Showcase_Helicopters"] call bis_fnc_kbTell;

		sleep 0.5;

		hintSilent "";

		sleep 2;
	}
	forEach
	[
		"01_Intro",
		"05_In_Heli",
		"10_Enemy_vehicles_revealed",
		"15_Enemy_vehicle_destroyed",
		"20_Enemy_vehicles_destroyed",
		"25_bombardment_started_while_landing",
		"30_Mortars_destroyed",
		"35_Land_at_mike26",
		"40_Landed_at_mike26",
		"45_Squad_unloaded",
		"50_Resuppy",
		"53_Resupplied",
		"55_Go_kamino",
		"60_Mortars_destroyed_kamino",
		"65_Fly_home",
		"70_At_Home",
		"x01_Idle_Getin",
		"x05_Idle_Getin",
		"x10_Low_on_ammo",
		"x15_Enemy_vehicles_near_base_both_alive",
		"x20_Enemy_vehicles_near_base_one_alive",
		"x25_Enemy_vehicles_near_base_reported_by_hq",
		"x30_Bombardment_started_reported_by_hq",
		"x35_Mortars_detected",
		"x40_Land_at_mike26_intro",
		"x45_Land_at_mike26_after_mortars",
		"x50_Landed_at_camp_rogain"
	];
};