scriptName "initAiInteraction.sqf";

/*--------------------------------------------------------------------------------------------------

	SKIRMISH

	Handles:
	--------
	* triggering through conversation with trigger NPC
	* triggering by leaving the Hub

--------------------------------------------------------------------------------------------------*/

//create logic for tracking player's head
if (true) then
{
	private["_head"];

	//create a logic for tracking player's head
	_head = (createGroup west) createUnit ["Logic", getPos player, [], 0, "NONE"];
	_head setPos getPos player;
	_head setDir getDir player;

	player setVariable ["BIS_AiInteraction_head",_head];

	//attach head logic to player'S head
	_head attachTo [player,[0,0,0.25],"Pilot"];
};

//[_source,_max(,_min,_target)] call BIS_AiInteraction_isInFrontOf
BIS_AiInteraction_isInFrontOf =
{
	private["_source","_max","_min","_target","_inFront","_inRange","_distance","_isSameLevel","_heightDelta"];

	_source = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_max 	= [_this, 1, 10, [123]] call BIS_fnc_param;
	_min 	= [_this, 2, 0, [123]] call BIS_fnc_param;
	_target = [_this, 3, player, [objNull]] call BIS_fnc_param;

	if (isNull _source) exitWith {false};

	_inFront = abs([_tObject,player] call BIS_fnc_relativeDirTo) < 50;

	if !(_inFront) exitWith {false};

	_distance = _source distance _target;

	_inRange = (_distance < _max && _distance > _min);

	if !(_inRange) exitWith {false};

	if (getPosATL _source select 2 > 0.5 || getPosATL _target select 2 > 0.5) then
	{
		_heightDelta = abs((getPosASL _source select 2) - (getPosASL _target select 2));
		_isSameLevel = _heightDelta < 0.3;
	}
	else
	{
		_isSameLevel = true;
	};

	_isSameLevel
};


BIS_AiInteraction_setupAi =
{
	//release the unit from ambient animation
	if !(isNil "BIS_fnc_ambientAnim__terminate") then
	{
		_this call BIS_fnc_ambientAnim__terminate;
	};

	//set the animation
	{_this disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

	(group _this) setBehaviour "CARELESS";
	(group _this) setCombatMode "BLUE";
	_this setUnitPos "Up";
	[_this,"switchMove"] call BIS_AiInteraction_doIdle;
};

/*--------------------------------------------------------------------------------------------------

	GESTURES

--------------------------------------------------------------------------------------------------*/

BIS_AiInteraction_doWave =
{
	private["_source","_target"];

	_source = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_target = [_this, 3, player, [objNull]] call BIS_fnc_param;

	_target = _target getVariable ["BIS_AiInteraction_Head",_target];
	_source lookAt _target;
	_source doWatch _target;

	_source playMoveNow "Acts_PercMstpSlowWrflDnon_handup1b";
	[_source,"playmove"] call BIS_AiInteraction_doIdle;
};

BIS_AiInteraction_doSalute =
{
	private["_source","_target"];

	_source = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_target = [_this, 3, player, [objNull]] call BIS_fnc_param;

	_target = _target getVariable ["BIS_AiInteraction_Head",_target];
	_source lookAt _target;
	_source doWatch _target;

	_source playMoveNow "amovpercmstpslowwrfldnon_salutein";

	sleep 2;

	_source playMoveNow "amovpercmstpslowwrfldnon_saluteout";
	[_source] call BIS_AiInteraction_doIdle;
};

BIS_AiInteraction_doIdle =
{
	private["_unit","_mode","_idle"];

	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_mode = [_this, 1, "playmove", [""]] call BIS_fnc_param;
	_mode = toLower _mode;

	_idle =
	[
		"aidlpercmstpslowwrfldnon_g01",
		"aidlpercmstpslowwrfldnon_g02",
		"aidlpercmstpslowwrfldnon_g03",
		"aidlpercmstpslowwrfldnon_g05"
	]
	call BIS_fnc_selectRandom;

	//_idle = "amovpercmstpslowwrfldnon";

	switch (_mode) do
	{
		case "switchmove":
		{
			_unit switchMove _idle;
		};
		case "playmove":
		{
			_unit playMove _idle;
		};
		case "playmovenow":
		{
			_unit playMoveNow _idle;
		};

		default
		{
			_unit playMove _idle;
		};
	};
};

/*--------------------------------------------------------------------------------------------------

	SETUP FUNCTIONS

--------------------------------------------------------------------------------------------------*/

BIS_AiInteraction_initWaving =
{
	//set the Ai into the idle "interaction-ready" state
	_this call BIS_AiInteraction_setupAi;

	//set the trigger: wave
	if (true) then
	{
		private["_tObject","_tId","_tDistance","_tParams","_tCond","_tCode","_tCondExit","_tCodeExit","_tCounter","_tSleep"];

		_tObject 	= _this;
		_tId 		= "wave";
		_tDistance 	= 30;
		_tParams 	= [_tObject,_tDistance,10,player];
		_tCond 		= BIS_AiInteraction_isInFrontOf;
		_tCode		= BIS_AiInteraction_doWave;
		_tCondExit	= {BIS_SelectedMission != ""};
		_tCodeExit	= {/*["[AiInteraction] Trigger Removed: %1:%2",_tObject,_tId] call BIS_fnc_logFormat*/};
		_tCounter	= 5;
		_tSleep		= 60;

		[_tObject,_tId,_tDistance,_tParams,_tCond,_tCode,_tCondExit,_tCodeExit,_tCounter,_tSleep] call BIS_ScTriggers_add;
	};
};

BIS_AiInteraction_initSaluting =
{
	//set the Ai into the idle "interaction-ready" state
	_this call BIS_AiInteraction_setupAi;

	//set the trigger: salute
	if (true) then
	{
		private["_tObject","_tId","_tDistance","_tParams","_tCond","_tCode","_tCondExit","_tCodeExit","_tCounter","_tSleep"];

		_tObject 	= _this;
		_tId 		= "salute";
		_tDistance 	= 6;
		_tParams 	= [_tObject,_tDistance,0,player];
		_tCond 		= BIS_AiInteraction_isInFrontOf;
		_tCode		= BIS_AiInteraction_doSalute;
		_tCondExit	= {false};
		_tCodeExit	= {/*["[AiInteraction] Trigger Removed: %1:%2",_tObject,_tId] call BIS_fnc_logFormat*/};
		_tCounter	= 10;
		_tSleep		= 10;

		[_tObject,_tId,_tDistance,_tParams,_tCond,_tCode,_tCondExit,_tCodeExit,_tCounter,_tSleep] call BIS_ScTriggers_add;
	};
};

BIS_AiInteraction_initMissionIntro =
{
	private["_npc","_mission"];

	_npc 	 = _this select 0;
	_mission = _this select 1;

	//set the Ai into the idle "interaction-ready" state
	_npc call BIS_AiInteraction_setupAi;

	//set the trigger: salute
	if (true) then
	{
		private["_tObject","_tId","_tDistance","_tParams","_tCond","_tCode","_tCondExit","_tCodeExit","_tCounter","_tSleep"];

		_tObject 	= _npc;
		_tId 		= "salute";
		_tDistance 	= 3;
		_tParams 	= [_tObject,_tDistance,0,player,_mission];
		_tCond 		= {_this call BIS_AiInteraction_isInFrontOf && BIS_selectedMission == ""};
		_tCode		= BIS_FullStart_intro;
		_tCondExit	= {false};
		_tCodeExit	= {["[AiInteraction] Trigger Removed: %1:%2",_tObject,_tId] call BIS_fnc_logFormat};
		_tCounter	= 999;
		_tSleep		= 30;

		[_tObject,_tId,_tDistance,_tParams,_tCond,_tCode,_tCondExit,_tCodeExit,_tCounter,_tSleep] call BIS_ScTriggers_add;
	};
};