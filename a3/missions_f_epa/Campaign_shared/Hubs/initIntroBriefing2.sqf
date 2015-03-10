scriptName "initIntroBriefing2.sqf";

/*--------------------------------------------------------------------------------------------------

	TERMINATE IF NO DEBRIEFING

--------------------------------------------------------------------------------------------------*/
private["_introBriefing","_units"];

_introBriefing = ["Hubs",missionName,"IntroBriefing","active"] call BIS_fnc_getCfgDataBool;

if !(_introBriefing && !(missionName in BIS_PER_missionsQue)) exitWith {BIS_IntroBriefing_completed = true};

/*--------------------------------------------------------------------------------------------------

	SETUP EVENT HANDLERS

--------------------------------------------------------------------------------------------------*/
disableSerialization;

#define EH_SKIP			(uiNamespace getVariable "BIS_IntroBriefing_ehSkip")
#define EH_SKIP_SET_NIL		uiNamespace setVariable ["BIS_IntroBriefing_ehSkip",nil]

//remove the 'KeyDown' event handler (just for sure)
waitUntil{!(isNull ([] call BIS_fnc_displayMission))};

if (!(isNil {EH_SKIP})) then
{
	["[i] The 'KeyDown' event handler 'BIS_HubIntro_ehSkip' successfuly removed!"] call BIS_fnc_logFormat;

	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
	EH_SKIP_SET_NIL;
};

addMissionEventHandler
[
	"Ended",
	{
		if (!(isNil {EH_SKIP})) then
		{
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
			uiNamespace setVariable ["BIS_IntroBriefing_ehSkip",nil];
		}
	}
];

/*--------------------------------------------------------------------------------------------------

	SETUP THE PROXIMITY TRIGGER

--------------------------------------------------------------------------------------------------*/
private["_t"];

_t = time + 3*60;

waitUntil
{
	sleep 1;

	((player distance BIS_BriefingCenter) < 5) || (time > _t) || (BIS_FFDetected)
};

if (BIS_FFDetected) exitWith {};

if (time > _t) then
{
	["BIS_AttendDebriefing","Canceled",true] call BIS_fnc_taskSetState;
}
else
{
	["BIS_AttendDebriefing","Succeeded",true] call BIS_fnc_taskSetState;
};

/*--------------------------------------------------------------------------------------------------

	PLAY THE CUTSCENE

--------------------------------------------------------------------------------------------------*/
private["_units"];

_units =+ BIS_IntroBriefing_units;

BIS_IntroBriefing_running = true;

BIS_IntroBriefing_play =
{
	if (BIS_FFDetected) exitWith {};

	scriptName "initIntroBriefing.sqf: BIS_IntroBriefing_play";

	private["_mission","_timeout","_prefix","_timekeys","_topic","_offset","_sentenceToPlay","_index","_actor","_bikb","_animation","_lastSentence","_weapon"];

	_mission	= _this select 0;

	_actor 		= ["Hubs",_mission,"IntroBriefing","Cutscene","actor"] call BIS_fnc_getCfgDataObject;
	_weapon		= ["Hubs",_mission,"IntroBriefing","Cutscene","weapon"] call BIS_fnc_getCfgData;
	_prefix 	= ["Hubs",_mission,"IntroBriefing","Cutscene","prefix"] call BIS_fnc_getCfgData;
	_timekeys 	= ["Hubs",_mission,"IntroBriefing","Cutscene","timekeys"] call BIS_fnc_getCfgData;
	_topic 		= ["Hubs",_mission,"IntroBriefing","Cutscene","topic"] call BIS_fnc_getCfgData;
	_bikb 		= ["Hubs",_mission,"IntroBriefing","Cutscene","bikb"] call BIS_fnc_getCfgData;
	_offset		= ["Hubs",_mission,"IntroBriefing","Cutscene","offset"] call BIS_fnc_getCfgData;
	_animation	= ["Hubs",_mission,"IntroBriefing","Cutscene","anim"] call BIS_fnc_getCfgData;
	_lastSentence	= ["Hubs",_mission,"IntroBriefing","Cutscene","last"] call BIS_fnc_getCfgData;

	//used to timeout from cutscene when the cutscene is not implemented yet
	_timeout	= ["Hubs",_mission,"IntroBriefing","Cutscene","timeout"] call BIS_fnc_getCfgData;

	if (_timeout > 0) then
	{
		_timeout spawn
		{
			scriptName "initIntroBriefing.sqf: timeout safecheck";

			sleep _this;

			BIS_IntroBriefing_skip = true;
		};
	};

	removeAllWeapons _actor;

	if (_weapon != "") then
	{
		_actor addWeapon _weapon;
	};

	//disable mimics on the briefing actor
	_actor enableMimics false;

	_sentenceToPlay = "";

	detach _actor;
	_actor kbAddTopic [_topic,_bikb,""];

	BIS_IntroBriefing_play_spawned = [];

	_index = 0;
	{
		 if (BIS_IntroBriefing_skip) exitWith {};

		 _sentenceToPlay = call compile format ["'%1%2'",_prefix,_index];

		 BIS_IntroBriefing_play_spawned set
		 [count BIS_IntroBriefing_play_spawned,
		 	[_x,_sentenceToPlay,_index,_topic,_offset,_actor] spawn
			{
				scriptName "initIntroBriefing.sqf: playback";

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
					(time >= (_t + _timekey + _offset)) || (BIS_IntroBriefing_skip)
				};

				if (BIS_IntroBriefing_skip) exitWith {};

				_actor kbTell [_actor,_topic,_sentenceToPlay];

				waitUntil
				{
					(_actor kbWasSaid [_actor,_topic,_sentenceToPlay,60]) || (BIS_IntroBriefing_skip)
				};
			}
		];

		 _index = _index + 1;
	}
	forEach _timekeys;

	_actor switchMove _animation;

	waitUntil
	{
		if (BIS_IntroBriefing_skip) exitWith {};

		sleep 0.1;

		(({scriptDone _x} count BIS_IntroBriefing_play_spawned) == (count BIS_IntroBriefing_play_spawned) - 1);
	};

	sleep _lastSentence;

	//re-enable mimics on the briefing actor
	_actor enableMimics true;
};


//init ---------------------------------------------------------------------------------------------
disableSerialization;

private ["_ehSkip"];

if (isNil "BIS_fnc_blackOut_ids") then
{
	BIS_fnc_blackOut_ids = [];
};

if !("bis_introbriefing" in BIS_fnc_blackOut_ids) then
{
	["BIS_IntroBriefing",true] call BIS_fnc_blackOut;
};

//add skip mechanics -----------------------------------------------------------------------
BIS_IntroBriefing_skip = false;

_ehSkip = ([] call BIS_fnc_displayMission) displayAddEventHandler
[
	"KeyDown",
	"
		if (_this select 1 == 57) then
		{
			if (BIS_IntroBriefing_skip) exitWith {};

			playSound ['click',true];

			BIS_IntroBriefing_skip = true;
		};

		if !((_this select 1) in (actionKeys 'PersonView' + [1])) then {true};
	"
];

uiNamespace setVariable ["BIS_IntroBriefing_ehSkip",_ehSkip];

waitUntil {BIS_fnc_blackOut_completed};

//setup special characters -----------------------------------------------------------------
private["_point","_unit"];

{
	_unit = ["Hubs",missionName,"IntroBriefing","SpecialCharacters",_x,"unitName"] call BIS_fnc_getCfgDataObject;

	if !(isNull _unit) then
	{
		_point = ["Hubs",missionName,"IntroBriefing","SpecialCharacters",_x,"position"] call BIS_fnc_getCfgDataObject;

		["[i] Special character [%1] will be placed on [%2].",_unit,_point] call BIS_fnc_logFormat;

		_unit call BIS_fnc_ambientAnim__terminate;
		_unit  = [_unit,_point] call BIS_IntroBriefing_setupUnit;
	};
}
forEach ["Speaker","HotSeat","VIP1","VIP2","VIP3"];


//setup player -----------------------------------------------------------------------------
private["_point","_dir","_startPos","_endPos"];

_point    = ["Hubs",missionName,"IntroBriefing","SpecialCharacters","Player","position"] call BIS_fnc_getCfgDataObject;

_dir 	  = getDir _point;
_endPos	  = getPos _point;

//turn off nvgoggles
player action ["nvGogglesOff", player];

//player starts straight on the spot, no walk-in
if (primaryWeapon player != "") then
{
	player playMoveNow "HubSpectator_stand";
}
else
{
	player playMoveNow "HubSpectator_standU";
};

player setPos getPos _point;
player setDir getDir _point;

//toggle light setup & sunglasses hiding/unhiding
BIS_DayTime_forceUpdate = true;

//create cinematic subtitles
[0,0,false] spawn BIS_fnc_cinemaBorder;

if !(BIS_IntroBriefing_skip) then
{
	//start cutscene -------------------------------------------------------------------
	private["_script"];

	[] spawn
	{
		sleep 75;

		0 fadeMusic 0.4; playMusic "AmbientTrack01_F_EPB";
	};

	_script = [missionName] spawn BIS_IntroBriefing_play;

	//black in & wait
	["BIS_IntroBriefing"] call BIS_fnc_blackIn; waitUntil {BIS_fnc_blackIn_completed};

	waitUntil {scriptDone _script || BIS_IntroBriefing_skip};

	//black out & wait
	["BIS_IntroBriefing"] call BIS_fnc_blackOut; waitUntil {BIS_fnc_blackOut_completed};
};

//remove the 'KeyDown' event handler
if (!(isNil {EH_SKIP})) then
{
	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
	uiNamespace setVariable ["BIS_IntroBriefing_ehSkip",nil];
};

BIS_IntroBriefing_completed = true;