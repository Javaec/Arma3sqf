scriptName "initConversations.sqf";

/*--------------------------------------------------------------------------------------------------

	GENERAL CONVERSATION PLAYBACK FUNCTIONALITY

	Handles:
	--------
	* sidechat temp. solution
	* kbTell solution

--------------------------------------------------------------------------------------------------*/

/*
"hubbriefing_loop"
"hubbriefing_lookaround1"
"hubbriefing_lookaround2"
"hubbriefing_pointleft"
"hubbriefing_scratch"
"hubbriefing_stretch"
"hubbriefing_talkaround"
*/

/*
BIS_Conversations_gestureOverride =
[
	[1.4,"hubbriefing_pointleft","hubbriefing_loop"],
	[0,"hubbriefing_scratch","hubbriefing_loop"],
	[0,"hubbriefing_lookaround1","hubbriefing_loop"],
	[],
	[2.2,"hubbriefing_pointleft","hubbriefing_loop"]
];
*/

BIS_Conversations_playGesture =
{
	//["[!] PLAY GESTURE: %1",_this] call BIS_fnc_logFormat;

	private["_unit","_sentenceid","_xtraParams","_mission","_module","_conv"];
	private["_data","_time","_anim","_gestures","_current","_fn_playGesture"];

	_unit		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_sentenceid	= [_this, 3, 0, [123]] call BIS_fnc_param;
	_xtraParams	= [_this, 4, [], [[]]] call BIS_fnc_param;
	_mission 	= [_xtraParams, 0, "mission_not_defined", [""]] call BIS_fnc_param;
	_module 	= [_xtraParams, 1, "module_not_defined", [""]] call BIS_fnc_param;
	_conv 		= [_xtraParams, 2, "conversation_not_defined", [""]] call BIS_fnc_param;

	if (isNull _unit) exitWith
	{
		["No speaker unit defined for '%1' conversation.",_conv] call BIS_fnc_logFormat;
	};

	//debug: override gesture definition
	if (isNil "BIS_Conversations_gestureOverride") then
	{
		BIS_Conversations_gestureOverride = [];
	};

	if (count BIS_Conversations_gestureOverride > 0) then
	{
		_data = BIS_Conversations_gestureOverride;
	}
	else
	{
		_data = ["Missions",_mission,_module,"Conversations",_conv,"gestures"] call BIS_fnc_getCfgData;
	};

	if (isNil "_data") exitWith
	{
		//["No gestures defined for conversation '%1'.",_conv] call BIS_fnc_logFormat;
	};

	//create list of all conversation gestures
	_gestures = [];
	_current  = toLower (animationState _unit);

	{
		if (count _x > 1) then
		{
			_gestures set [count _gestures, toLower(_x select 1)];
		};
	}
	forEach _data;

	//if unit is still playing previous gesture, skip the new one
	if (_current in _gestures) exitWith
	{
		["[!] Previous gesture is still playing! New gesture will be skipped."] call BIS_fnc_logFormat;
	};

	//get the sentence data
	_data = [_data, _sentenceid, [], [[]]] call BIS_fnc_param;

	if (count _data == 0) exitWith
	{
		["No gesture defined for conversation '%1', sentence #%2.",_conv,_sentenceid] call BIS_fnc_logFormat;
	};

	_unit setVariable ["BIS_Gestures",_gestures];

	//add animation event handler
	_unit setVariable ["BIS_GestureDone",""];
	_unit addEventHandler
	[
		"AnimDone",
		{
			private["_unit","_anim","_gestures"];

			_unit 	  = _this select 0;
			_anim 	  = toLower(_this select 1);
			_gestures = _unit getVariable ["BIS_Gestures",[]];

			//store only gestures
			if (_anim in _gestures) then
			{
				_unit setVariable ["BIS_GestureDone",_anim];
			};
		}
	];

	//play gesture code
	_fn_playGesture =
	{
		scriptName "initConversations.sqf: _fn_playGesture";

		private["_unit","_data"];

		_unit = _this select 0;
		_data = _this select 1;

		private["_t","_time","_anim","_exitAnim"];

		_t = time;

		_time 	  = (_data select 0) + _t;
		_anim 	  = (_data select 1);
		_exitAnim = (_data select 2);

		waitUntil {time > _time};

		_unit setVariable ["BIS_GestureDone",""];
		_unit playMoveNow _anim;

		waitUntil {animationState _unit == _anim};

		waitUntil {(_unit getVariable ["BIS_GestureDone",""]) == _anim};

		_unit playMoveNow _exitAnim;

		waitUntil {animationState _unit == _exitAnim};
	};

	//wait for gesture to complete or not?
	private["_wait"];

	_wait = [_data, 3, 0, [123]] call BIS_fnc_param;
	_wait = _wait > 0;

	//["[%1] _wait = %2",_sentenceid,_wait] call BIS_fnc_logFormat;

	//play the timed gestures
	if (_wait) then
	{
		//["[%1] CALL",_sentenceid] call BIS_fnc_logFormat;

		[_unit,_data] call _fn_playGesture;
	}
	else
	{
		//["[%1]SPAWN",_sentenceid] call BIS_fnc_logFormat;

		[_unit,_data] spawn _fn_playGesture;
	};
};


//["A_m01","FullStart","MissionIntro"] call BIS_Conversations_play;
//[_mission,"HubBriefing","MissionBriefing"] call BIS_Conversations_play;
BIS_Conversations_play =
{
	private["_mission","_module","_conv","_cfg","_kb","_stage","_container"];

	_mission 	= [_this, 0, "mission_not_defined", [""]] call BIS_fnc_param;
	_module 	= [_this, 1, "module_not_defined", [""]] call BIS_fnc_param;
	_conv 		= [_this, 2, "conversation_not_defined", [""]] call BIS_fnc_param;

	//check if defined in cfgHubMissions or in cfgHubs
	_kb = ["Missions",_mission,_module,"Conversations",_conv,"kb"] call BIS_fnc_getCfgData;

	if !(isNil "_kb") then
	{
		_cfg = "Missions";
	}
	else
	{
		_cfg = "Hubs";
	};

	_kb = [_cfg,_mission,_module,"Conversations",_conv,"kb"] call BIS_fnc_getCfgData;

	if (typeName _kb == typeName []) then
	{
		_container = _kb select 1;
		_kb 	   = _kb select 0;
	}
	else
	{
		_stage 	   = [_mission,"stage"] call BIS_fnc_camp_getMissionDescData;
		_container = format["%1_hub",_stage];
	};

	if (isNil "_kb") exitWith
	{
		format["CFG attribute not defined: %1 >> %2 >> %3 >> Conversations >> %4 >> kb",_cfg,_mission,_module,_conv] call BIS_fnc_error;
	};

	//kb defined as an empty string > play sidechat conversation
	if (_kb == "") then
	{
		private["_data","_lines","_i","_line","_actorStr","_text","_delay","_actor"];

		_data 	= [];
		_lines	= [_cfg,_mission,_module,"Conversations",_conv,"lines"] call BIS_fnc_getCfgDataArray;

		for "_i" from 0 to (count _lines - 1) do
		{
			_line = _lines select _i;

			_actorStr 	= _line select 0;				//actor name in string
			_text 		= _line select 1;				//sentence
			_delay 		= [_line, 2, 0, [123]] call BIS_fnc_param;	//delay adjustment
			_delay 		= _delay + count(toArray _text)/15 + 1.5;

			if (_actorStr in ["speaker","trigger"]) then
			{
				//1st: check the conversation class
				_actor = [_cfg,_mission,_module,"Conversations",_actorStr] call BIS_fnc_getCfgDataObject;

				if !(isNull _actor) exitWith {};

				//2nd: check the module class
				_actor = [_cfg,_mission,_module,_actorStr] call BIS_fnc_getCfgDataObject;

				if !(isNull _actor) exitWith {};

				//3rd: check the mission class
				_actor = [_cfg,_mission,_actorStr] call BIS_fnc_getCfgDataObject;
			}
			else
			{
				if (_actorStr == "player") then
				{
					_actor = player;
				}
				else
				{
					_actor = missionNamespace getVariable [_actorStr,objNull];
				};
			};

			if (isNull _actor) then
			{
				["Conversation actor doesn't exist!"] call BIS_fnc_error;
			}
			else
			{
				//gather the data
				_data = _data + [[_actor,_text,_delay]];
			};
		};

		//display the sideChat conversation
		[_data,_conv] call BIS_Conversations_displaySidechat;
	}
	//play the ordinary (kbTell) conversation
	else
	{
		_stage = [_mission,"stage"] call BIS_fnc_camp_getMissionDescData;

		[_kb,_container,nil,nil,[BIS_Conversations_playGesture,[_mission,_module,_conv]],nil,1] call bis_fnc_kbTell;

	};
};


/*--------------------------------------------------------------------------------------------------

	SIDECHAT SOLUTION FOR DEV VERSIONS

	* Used only for the developer version & for debug.

--------------------------------------------------------------------------------------------------*/

//init conversation playlist
BIS_ConvSidechat_Playlist  = [];
BIS_ConvSidechat_Skippable = [];

//display the conversations via sidechat
BIS_Conversations_displaySidechat =
{
	private["_data","_conv","_actor","_content","_gap"];

	_data 	= [_this, 0] call BIS_fnc_param;
	_conv 	= [_this, 1] call BIS_fnc_param;

	//skip skippable or skip conversation already on list
	if ( (count BIS_ConvSidechat_Playlist > 0) && ((_conv in BIS_ConvSidechat_Skippable) || (_conv in BIS_ConvSidechat_Playlist)) ) exitWith {};

	["[%1] ADDED %2 + [""%1""]",_conv,BIS_ConvSidechat_Playlist] call BIS_fnc_logFormat;

	BIS_ConvSidechat_Playlist set [count BIS_ConvSidechat_Playlist, _conv];

	waitUntil
	{
		sleep 0.1;

		(BIS_ConvSidechat_Playlist select 0) == _conv
	};
	["[%1] PLAYING...",_conv] call BIS_fnc_logFormat;

	for "_line" from 0 to ((count _data) - 1) do
	{
		if (BIS_FFDetected) exitWith {};

		_actor   = (_data select _line) select 0;
		_content = (_data select _line) select 1;
		_gap	 = [_data select _line, 2, 4] call BIS_fnc_param;

		_actor sideChat _content;

		sleep _gap;
	};

	["[%1] STOPPED",_conv] call BIS_fnc_logFormat;

	BIS_ConvSidechat_Playlist = BIS_ConvSidechat_Playlist - [_conv];
};