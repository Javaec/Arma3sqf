scriptName "initHubIntro2.sqf";

if (BIS_SkipHubIntro) exitWith
{
	BIS_HubIntro_finished = true;
};

private["_prevMission","_isSkirmish"];

_prevMission = missionNamespace getVariable ["BIS_PER_prevMission",""];
_isSkirmish  = [_prevMission] call BIS_fnc_camp_getMissionMeta select 2;

if (_isSkirmish) exitWith
{
	BIS_HubIntro_finished = true;
};

/*--------------------------------------------------------------------------------------------------

	CREATE WELCOME ON HUB & HUB INTRO SCENES

	* Also handles the quatations

--------------------------------------------------------------------------------------------------*/

#define EH_SKIP		(uiNamespace getVariable "BIS_HubIntro_ehSkip")

if (isNil "BIS_PER_IDENT_return") then {BIS_PER_IDENT_return = []};

BIS_HubIntro_execWelcome =
{
	//check if player has a primary weapon if not give a default weapon to him
	if (primaryWeapon player == "") then
	{
		["[!][HubIntro] Player doesn't have a primary weapon! Will get a default weapon."] call BIS_fnc_logFormat;

		private["_stage","_weapon"];

		_stage = ["stage"] call BIS_fnc_getCfgData;

		_weapon = switch (_stage) do
		{
			case "A":
			{
				"arifle_mx_f"
			};
			case "B":
			{
				"arifle_trg21_f"
			};
			case "C":
			{
				"arifle_mx_f"
			};
			default
			{
				"arifle_mx_f"
			};
		};

		player addWeapon _weapon;
		player selectWeapon _weapon;
	};

	//load data from config
	private["_mission","_gUnit","_gPos","_gDir","_gAnim","_pUnit","_pPos","_pDir","_pAnim"];

	_mission = missionName;
	_gUnit 	 = ["Hubs",_mission,"HubIntro","Guide","unit"] call BIS_fnc_getCfgDataObject;
	_gPos 	 = ["Hubs",_mission,"HubIntro","Guide","position"] call BIS_fnc_getCfgData;
	_gDir 	 = ["Hubs",_mission,"HubIntro","Guide","direction"] call BIS_fnc_getCfgData;
	_gAnim 	 = ["Hubs",_mission,"HubIntro","Guide","animation"] call BIS_fnc_getCfgData;
	_pUnit 	 = ["Hubs",_mission,"HubIntro","Player","unit"] call BIS_fnc_getCfgDataObject;
	_pPos 	 = ["Hubs",_mission,"HubIntro","Player","position"] call BIS_fnc_getCfgData;
	_pDir 	 = ["Hubs",_mission,"HubIntro","Player","direction"] call BIS_fnc_getCfgData;
	_pAnim 	 = ["Hubs",_mission,"HubIntro","Player","animation"] call BIS_fnc_getCfgData;

	//register units that are used by this component
	//BIS_HubIntro_regUnits set [count BIS_HubIntro_regUnits,_gUnit];

	//hide squad members from intro ------------------------------------------------------------
	{
		_x setPos [100,100,0];
		_x enableSimulation false;
	}
	forEach _survivors;

	//terminate possible ambient animations ----------------------------------------------------
	{_gUnit disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

	_gUnit enableSimulation false;
	_pUnit enableSimulation false;

	_gUnit switchMove "";
	_pUnit switchMove "";

	//start quotations -------------------------------------------------------------------------
	waitUntil{!(isNull ([] call BIS_fnc_displayMission))};

	if !(BIS_SkipQuotation) then
	{
		private["_quotation"];

		_quotation = ["Hubs",missionName,"quote"] call BIS_fnc_getCfgData;

		if (count _quotation > 0) then
		{
			_quotation call BIS_fnc_quotations;

			waitUntil {BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
			waitUntil {!BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
		}
		else
		{
			BIS_SkipQuotation = true;
		};
	};

	//setup animations and sounds --------------------------------------------------------------
	private["_pPrefix","_pTimekeys","_gPrefix","_gTimekeys","_topic","_bikb","_offset"];

	_pPrefix 	= ["Hubs",_mission,"HubIntro","Player","prefix"] call BIS_fnc_getCfgData;
	_pTimekeys 	= ["Hubs",_mission,"HubIntro","Player","timekeys"] call BIS_fnc_getCfgData;
	_gPrefix 	= ["Hubs",_mission,"HubIntro","Guide","prefix"] call BIS_fnc_getCfgData;
	_gTimekeys 	= ["Hubs",_mission,"HubIntro","Guide","timekeys"] call BIS_fnc_getCfgData;

	_topic 		= ["Hubs",_mission,"HubIntro","topic"] call BIS_fnc_getCfgData;
	_bikb 		= ["Hubs",_mission,"HubIntro","bikb"] call BIS_fnc_getCfgData;
	_offset		= ["Hubs",_mission,"HubIntro","offset"] call BIS_fnc_getCfgData;

	//add skip mechanics -----------------------------------------------------------------------
	BIS_HubIntro_skip = false;

	//["[i] Mission display initialized to: %1",[] call BIS_fnc_displayMission] call BIS_fnc_logFormat;

	if (!(isNil {EH_SKIP})) then
	{
		//["[i] Event handler [BIS_HubIntro_ehSkip = %1] removed!",EH_SKIP] call BIS_fnc_logFormat;

		([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
		uiNamespace setVariable ["BIS_HubIntro_ehSkip",nil];
	};

	private["_ehSkip"];

	_ehSkip = ([] call BIS_fnc_displayMission) displayAddEventHandler
	[
		"KeyDown",
		"
			if (_this select 1 == 57) then
			{
				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',uiNamespace getVariable 'BIS_HubIntro_ehSkip'];
				uiNamespace setVariable ['BIS_HubIntro_ehSkip',nil];

				playSound ['click',true];

				BIS_HubIntro_skip = true;
			};

			if !((_this select 1) in (actionKeys 'PersonView' + [1])) then {true};
		"
	];

	uiNamespace setVariable ["BIS_HubIntro_ehSkip",_ehSkip];

	//["[i] Event handler [BIS_HubIntro_ehSkip = %1] added!",EH_SKIP] call BIS_fnc_logFormat;

	//setup both units -------------------------------------------------------------------------
	sleep 0.1;

	if !(isNil "BIS_fnc_ambientAnim__terminate") then
	{
		_gUnit call BIS_fnc_ambientAnim__terminate;
	}
	else
	{
		detach _gUnit;
	};

	//add primary weapon
	private["_storedWeapon"];

	{
		_storedWeapon = _x getVariable ["BIS_fnc_ambientAnim__weapon",""];

		if (primaryWeapon _x == "" && _storedWeapon != "") then
		{
			["Weapon [%1] provided to unit [%2].",_storedWeapon,_x] call BIS_fnc_logFormat;

			_x addWeapon _storedWeapon;
			_x selectWeapon _storedWeapon;
		};
	}
	forEach [_pUnit,_gUnit];

	_pUnit setpos _pPos;
	_pUnit setdir _pDir;
	(group _pUnit) setFormDir _pDir;

	_gUnit setpos _gPos;
	_gUnit setdir _gDir;
	(group _gUnit) setFormDir _gDir;

	{_gUnit disableAI _x} forEach ["AUTOTARGET","MOVE","TARGET"];
	{_gUnit enableAI _x} forEach ["ANIM","FSM"];

	//set guide behaviour to "CARELESS"
	(group _gUnit) setBehaviour "CARELESS";
	(group _gUnit) setCombatMode "BLUE";

	_pUnit switchMove _pAnim;
	_gUnit switchMove _gAnim;

	_gUnit enableSimulation true;
	_pUnit enableSimulation true;

	_gUnit kbAddTopic [_topic,_bikb,""];
	_pUnit kbAddTopic [_topic,_bikb,""];

	//create cinematic subtitles & start black-in ----------------------------------------------
	private["_bordersUsed"];

	if !(BIS_HubIntro_skip) then
	{
		[0,0,false] spawn BIS_fnc_cinemaBorder;

		_bordersUsed = true;
	}
	else
	{
		_bordersUsed = false;
	};


	[] spawn
	{
		if (BIS_SkipQuotation) then
		{
			sleep 2;
		};

		sleep 2;

		["BIS_HubIntro"] call BIS_fnc_blackIn;
	};

	//start cutscene ---------------------------------------------------------------------------
	private["_guideScript","_playerScript"];

	if (_gPrefix != "" && count _gTimekeys > 0) then
	{
		_guideScript = [_gPrefix,_gTimekeys,_topic,_offset,_gUnit] spawn BIS_HubIntro_play;
	}
	else
	{
		_guideScript = BIS_scriptNull;
	};

	if (_pPrefix != "" && count _pTimekeys > 0) then
	{
		_playerScript = [_pPrefix,_pTimekeys,_topic,_offset,_pUnit] spawn BIS_HubIntro_play;
	}
	else
	{
		_playerScript = BIS_scriptNull;
	};

	waitUntil {(scriptDone _guideScript && scriptDone _playerScript) || BIS_HubIntro_skip};

	//remove the 'KeyDown' event handler
	if (!(isNil {EH_SKIP})) then
	{
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
		uiNamespace setVariable ["BIS_HubIntro_ehSkip",nil];
	};

	//stop animations if cutscene was terminated
	if (BIS_HubIntro_skip) then
	{
		terminate _guideScript;
		terminate _playerScript;

		if !(BIS_fnc_blackOut_completed) then
		{
			["bis_hubintro_skippressed"] call BIS_fnc_blackOut; waitUntil{BIS_fnc_blackOut_completed};
		};
	}
	else
	{
		//add black out if cutscene played to the end
		["bis_hubintro_cutsceneend"] call BIS_fnc_blackOut; waitUntil{BIS_fnc_blackOut_completed};
	};

	if (primaryWeapon _pUnit != "") then {_pUnit switchMove "amovpercmstpslowwrfldnon"} else {_pUnit switchMove "amovpercmstpsnonwnondnon"};
	if (primaryWeapon _gUnit != "") then {_gUnit switchMove "amovpercmstpslowwrfldnon"} else {_gUnit switchMove "amovpercmstpsnonwnondnon"};

	//repos guide and send him away
	private["_gWalkTarget","_gWatchTarget"];

	{_gUnit enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

	_gPos 		= ["Hubs",_mission,"HubIntro","Guide","AfterCutscene","position"] call BIS_fnc_getCfgData;
	_gDir 		= ["Hubs",_mission,"HubIntro","Guide","AfterCutscene","direction"] call BIS_fnc_getCfgData;
	_gWalkTarget 	= ["Hubs",_mission,"HubIntro","Guide","AfterCutscene","walkTarget"] call BIS_fnc_getCfgDataObject;
	_gWatchTarget 	= ["Hubs",_mission,"HubIntro","Guide","AfterCutscene","watchTarget"] call BIS_fnc_getCfgDataObject;

	if (count _gPos == 3) then
	{
		_gUnit setPos _gPos;
		_gUnit setDir _gDir;
	};

	//hide cinema borders
	if (_bordersUsed) then
	{
		[1,nil,false] spawn BIS_fnc_cinemaBorder;
	};

	[_gUnit,_gWalkTarget,_gWatchTarget] call BIS_HubIntro_sendSoldier;

	sleep 3;

	if (BIS_HubIntro_skip && ("bis_hubintro_skippressed" in BIS_fnc_blackOut_ids)) then
	{
		["bis_hubintro_skippressed"] call BIS_fnc_blackIn;
	};

	["bis_hubintro_cutsceneend"] call BIS_fnc_blackIn;
};

BIS_HubIntro_sendSoldier =
{
	private["_unit","_end","_watch","_group"];

	_unit 	= _this select 0;
	_end	= _this select 1;
	_watch  = [_this, 2, objNull, [objNull]] call BIS_fnc_param;

	//make sure unit is not playing ambient animations
	if ((_unit getVariable ["BIS_fnc_ambientAnim__animset",""]) != "") then
	{
		_unit call BIS_fnc_ambientAnim__terminate;
	};

	//send unit to the exit point
	_unit setUnitPos "UP";
	_unit setBehaviour "CARELESS";
	_unit forceWalk true;

	_unit doMove (getPos _end);
	_unit moveTo (getPos _end);
	(group _unit) move (getPos _end);

	[_unit,_end,_watch] spawn
	{
		scriptName "initHubIntro.sqf: BIS_HubIntro_sendSoldier";

		private["_unit","_point","_watch","_stilltime","_checkfrequence","_animset","_stilllimit","_watchPos"];

		_unit 	= _this select 0;
		_point  = _this select 1;
		_watch  = _this select 2;

		_stilltime = 0;
		_checkfrequence = 0.1;

		sleep 10;

		waitUntil {(_unit distance _point) < 10};

		if !(isNull _watch) then
		{
			_watchPos = getPos _watch;
			_watchPos set [2, 1.75];

			_unit lookAt _watchPos;
			_unit doWatch _watchPos;
		};

		waituntil
		{
			sleep _checkfrequence;

			if (speed _unit < 0.3) then
			{
				_stilltime = _stilltime + _checkfrequence;
			}
			else
			{
				_stilltime = 0;
			};

			_stilllimit = 1;

			_stilltime > _stilllimit
		};

		if (BIS_selectedMission != "") exitWith {};

		if (BIS_IntroBriefing_completed) exitWith {};
		if (BIS_IntroBriefing_running) exitWith {};

		//set animation
		_animset = _point getVariable ["BIS_UseAnimSet",""];

		if (_animset == "") then
		{
			_animset = "STAND";
			_unit setUnitPos "UP";
		};

		["[!][HubIntro] Unit [%1] is starting to play animset [%2]!",_unit,_animset] call BIS_fnc_logFormat;

		[_unit,_animset,"ASIS",nil,true] call BIS_fnc_ambientAnim;

	};
};

BIS_HubIntro_exec =
{
	scriptName "initHubIntro.sqf: BIS_HubIntro_exec";

	if (BIS_SkipHubIntro) exitWith
	{
		BIS_HubIntro_finished = true;
	};

	disableSerialization;

	if (BIS_debugMode) then
	{
		([] call BIS_fnc_displayMission) displayRemoveAllEventHandlers "KeyDown";
		uiNamespace setVariable ['BIS_HubIntro_ehSkip',nil];
	};

	private["_survivors","_survivor"];

	_survivors = [];

	{
		_survivor = missionNamespace getVariable [_x,objNull];

		if (isNull _survivor) exitWith {};

		_survivors set [count _survivors,_survivor];
	}
	forEach
	[
		"BIS_squadMember1",
		"BIS_squadMember2",
		"BIS_squadMember3",
		"BIS_squadMember4",
		"BIS_squadMember5",
		"BIS_squadMember6",
		"BIS_squadMember7",
		"BIS_squadMember8",
		"BIS_squadMember9",
		"BIS_squadMember10"
	];

	private["_playWelcome"];

	_playWelcome = ["Hubs",missionName,"HubIntro","playWelcome"] call BIS_fnc_getCfgDataBool;

	if !(_playWelcome) then
	{
		["[HubIntro] Welcome on hub cutscene is disabled in config! Playing short intro instead ..."] call BIS_fnc_logFormat;

		BIS_HubIntro_execWelcome = BIS_HubIntro_execIntro;
	};

	if !(missionName in BIS_PER_missionsQue) then BIS_HubIntro_execWelcome else BIS_HubIntro_execIntro;

	BIS_HubIntro_finished = true;
};

BIS_HubIntro_execIntro =
{
	if (missionName == "C_in1") then
	{
		//start quotations -------------------------------------------------------------------------
		waitUntil{!(isNull ([] call BIS_fnc_displayMission))};

		if !(BIS_SkipQuotation) then
		{
			private["_quotation"];

			_quotation = ["Hubs",missionName,"quote"] call BIS_fnc_getCfgData;

			if (count _quotation > 0) then
			{
				_quotation call BIS_fnc_quotations;

				waitUntil {BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
				waitUntil {!BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
			}
			else
			{
				BIS_SkipQuotation = true;
			};
		};
	};

	//remove the 'KeyDown' event handler (just for sure)
	if (!(isNil {EH_SKIP})) then
	{
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
		uiNamespace setVariable ["BIS_HubIntro_ehSkip",nil];
	};

	//create cinematic subtitles
	[0,0,false] spawn BIS_fnc_cinemaBorder;

	if (isNil "BIS_PER_prevMission") then {BIS_PER_prevMission = ""};

	/*
	if (BIS_PER_prevMission == "") exitWith
	{
		["No previously completed mission detected. Welcome scene should be played instead!"] call BIS_fnc_error;
		["BIS_HubIntro"] call BIS_fnc_blackIn;
	};
	*/

	//detect and unhide possible survivors
	private["_endPoints"];

	_endPoints =
	[
		BIS_point_introSquad1End,
		BIS_point_introSquad2End,
		BIS_point_introSquad3End,
		BIS_point_introSquad4End,
		BIS_point_introSquad5End
	];

	//create walking squad members
	{
		//register units that are used by this component
		BIS_HubIntro_regUnits set [count BIS_HubIntro_regUnits,_x];

		_x enableSimulation true;
		_x hideObject false;

		[_x,_endPoints select _forEachIndex] call BIS_HubIntro_sendSoldier;
	}
	forEach _survivors;

	//crate player walking cutscene
	player setPos getPos BIS_point_introPlayer;
	player setDir getDir BIS_point_introPlayer;

	if (primaryWeapon player != "") then
	{
		player switchMove "HubSpectator_walk";
	}
	else
	{
		player switchMove "HubSpectator_walkU";
	};

	sleep 1;

	["BIS_HubIntro"] call BIS_fnc_blackIn;

	sleep 10;

	//hide cinema borders
	[1,nil,false] spawn BIS_fnc_cinemaBorder;

	//un-lock player from the walk animation
	if (primaryWeapon player != "") then
	{
		player playMoveNow "amovpercmstpslowwrfldnon";
	}
	else
	{
		player playMoveNow "amovpercmstpsnonwnondnon";
	};

};


BIS_HubIntro_play =
{
	scriptName "initHubIntro.sqf: play";

	private["_prefix","_timekeys","_topic","_offset","_sentenceToPlay","_index","_actor","_lineScripts","_lastSentence"];

	_prefix 	= [_this,0,"",[""]] call BIS_fnc_param;
	_timekeys 	= [_this,1,[],[[]]] call BIS_fnc_param;
	_topic 		= [_this,2,"",[""]] call BIS_fnc_param;
	_offset 	= [_this,3,0,[0]] call BIS_fnc_param;
	_actor 		= [_this,4,objNull,[objNull]] call BIS_fnc_param;
	_lastSentence	= ["Hubs",missionName,"HubIntro","last"] call BIS_fnc_getCfgData;
	_sentenceToPlay = "";

	//disable mimics on the intro actor
	_actor enableMimics false;

	_lineScripts = [];

	_index = 0;
	{
		 if (BIS_HubIntro_skip) exitWith {};

		 _sentenceToPlay = call compile format ["'%1%2'",_prefix,_index];

		 _lineScripts set
		 [count _lineScripts,
		 	[_x,_sentenceToPlay,_index,_topic,_offset,_actor] spawn
			{
				scriptName "initHubIntro.sqf: playback";

				private ["_t","_timekey","_index","_offset","_sentenceToPlay","_topic","_actor"];

				_timekey 	= _this select 0;
				_sentenceToPlay = _this select 1;
				_index 		= _this select 2;
				_topic  	= _this select 3;
				_offset 	= _this select 4;
				_actor 		= _this select 5;
				_t = time;

				waitUntil
				{
					(time >= (_t + _timekey + _offset)) || (BIS_HubIntro_skip)
				};

				if (BIS_HubIntro_skip) exitWith {};

				_actor kbTell [_actor,_topic,_sentenceToPlay];

				waitUntil
				{
					(_actor kbWasSaid [_actor,_topic,_sentenceToPlay,60]) || (BIS_HubIntro_skip)
				};
			}
		];

		 _index = _index + 1;
	}
	forEach _timekeys;

	if (_lastSentence > 0) then
	{
		waitUntil
		{
			if (BIS_HubIntro_skip) exitWith {};

			sleep 0.1;

			(({scriptDone _x} count _lineScripts) == (count _lineScripts) - 1);
		};

		sleep _lastSentence;
	}
	else
	{
		waitUntil
		{
			if (BIS_HubIntro_skip) exitWith {};

			sleep 0.1;

			(({scriptDone _x} count _lineScripts) == (count _lineScripts));
		};
	};

	//re-enable mimics on the intro actor
	_actor enableMimics true;
};

addMissionEventHandler
[
	"Ended",
	{
		if (!(isNil {EH_SKIP})) then
		{
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
			uiNamespace setVariable ["BIS_HubIntro_ehSkip",nil];
		}
	}
];

private["_prevMission","_isSkirmish"];

_prevMission = missionNamespace getVariable ["BIS_PER_prevMission",""];
_isSkirmish  = [_prevMission] call BIS_fnc_camp_getMissionMeta select 2;

[] call BIS_HubIntro_exec;