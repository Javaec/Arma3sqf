/*
	Author: Karel Moricky

	Description:
	Plays conversation. Script terminates itself when conversation is finished.

	Parameter(s):
	_this select 0: STRING - Topic name
	_this select 1 (Optional): STRING - container name (default: current mission ID)
	_this select 2 (Optional): ARRAY - section to be played. Elements can be:
		* STRING - "variant" - play specific variant
		* ARRAY
			* [startingSentence,(endingSentence)] - play al sentences between specific start and end
				startingSentence can be in format:
					* STRING - full sentence name (example: 04_intro_team_PLA_0")
					* ARRAY - [<actorID>(,<sentenceID>)] (example: ["PLA",0] or just ["PLA_0"])
					* BOOL - true to play random sentence, false to play first sentence
					* default - first sentence
				endingSentence can be in format:
					* STRING - full sentence name (example: 04_intro_team_PLA_0")
					* ARRAY - [<actorID>(,<sentenceID>)] (example: ["PLA",0] or just ["PLA_0"])
					* BOOL - true to play only one sentence, false if continue to last sentence
					* default - last sentence
		* (default: play everything)
	_this select 3 (Optional): BOOL or STRING or OBJECT or CODE - true to force radio, name of custom radio channel, listener's channel, returned value of code
	_this select 4 (Optional): CODE - code executed at the start of every sentence (arguments are same as in kbAddTopic event handler) (default: {})
				   ARRAY - code with arguments in format [code,arguments]
	_this select 5 (Optional):
		ARRAY - replacement units for those defined in .bikb file (in chronological order)
		BOOL - when true, dummy logics will be created for all actor units which doesn't exist (default: false or value of 'bis_fnc_kbTell_createDummy' variable)
	_this select 6 (Optional): NUMBER - music and sound volumes will be multiplied by this value when conversation starts (default: 0.1)
	_this select 7 (Optional): BOOL - true to disable radio protocol message while the conversation is playing (default: true)

	Returns:
	NOTHING
*/
//Todo: priority kbTell stppoing current conversation, split into several functions (config loading)
private ["_topicName","_mission","_section","_channel","_sentenceCode","_sentenceCodeParams","_sentenceCodeHandle","_listUnits","_volumeCoef","_disableRadio","_exit","_cfgTopic","_cfgSentences","_bikb","_priority","_priorityCurrent","_cfgSentencesCount","_listActors","_listSentences","_listSentencesFrom","_listSentencesTo","_listSentencesVariants","_actorUnitLast","_actorUnitPrev","_sLast","_actor","_actorUnit","_listUnitsCount","_listUnits","_createDummy","_sectionVariant","_listVariants","_listVariantTexts","_variantText"];

_topicName =	[_this,0,"",[""]] call bis_fnc_param;
_mission =	[_this,1,missionname,[""]] call bis_fnc_param;
_section =	[_this,2,"",[[],""]] call bis_fnc_param;
_channel =	[_this,3,false,[false,"",0,{},objnull]] call bis_fnc_param;
_sentenceCode =	[_this,4,{true},[{},[]]] call bis_fnc_param;
_listUnits =	[_this,5,[],[[],true]] call bis_fnc_param;
_volumeCoef =	[_this,6,-1,[1]] call bis_fnc_param;
_disableRadio =	[_this,7,true,[true]] call bis_fnc_param;
_exit = false;
_sectionVariant = "";

//check for code params
_sentenceCodeParams = [_sentenceCode,1,[],[[]]] call bis_fnc_paramin;
_sentenceCode = [_sentenceCode,0,{true},[{}]] call bis_fnc_paramin;

_cfgTopic = [_mission,_topicName] call bis_fnc_kbTopicConfig;
if (isnil "_cfgTopic") exitwith {};
_cfgSentences = _cfgTopic >> "sentences";

//--- ERROR - no .bikb file found
_bikb = gettext (_cfgTopic >> "file");
if (_bikb == "") exitwith {
	["'file' param not found in '%1'",_topicName] call bis_fnc_error;
};

//--- EXIT - low priority
_priority = getnumber (_cfgTopic >> "priority");
_priorityCurrent = [] call bis_fnc_kbPriority;
if !(_priority in _priorityCurrent) exitwith {
	["Conversation '%1' for '%2' terminated, priority %3 is not in %4.",_topicName,_mission,_priority,_priorityCurrent] call bis_fnc_logFormat;
};


//--- Get sentences
_cfgSentencesCount = count _cfgSentences - 1;
_listActors = [];
_listSentences = [];
_listSentencesFrom = [];
_listSentencesTo = [];
_listSentencesVariants = [];
_listVariants = [];
_listVariantTexts = [];
_actorUnitLast = -1;
_actorUnitPrev = 0;
_sLast = 0;
for "_s" from 0 to _cfgSentencesCount do {
	_current = _cfgSentences select _s;
	if (isclass _current) then {

		//--- Sort by actors
		_actor = gettext (_current >> "actor");
		if (_actor != "") then {
			if !(_actor in _listActors) then {_listActors = _listActors + [_actor]};
		} else {
			["Actor config param not defined for '%1' in '%2'",configname _current,_topicName] call bis_fnc_error;
		};
		_actorUnit = _listActors find _actor;
		if (_actorUnitLast < 0) then {_actorUnitLast = _actorUnit};
		if (_actorUnitLast != _actorUnit) then {
			_actorUnitPrev = _actorUnitLast;
			for "_i" from _sLast to (_s - 1) do {
				_listSentencesTo set [count _listSentencesTo,_actorUnit];
			};
			_sLast = _s;
		};

		_listSentences = _listSentences + [tolower configname _current];
		_listSentencesFrom = _listSentencesFrom + [_actorUnit];
		_actorUnitLast = _actorUnit;

		//--- Sort by variants
		_variant = gettext (_current >> "variant");
		_listSentencesVariants set [count _listSentencesVariants,_variant];

		//--- Register variants
		if !(_variant in _listVariants) then {
			_variantText = gettext (_current >> "variantText");
			_listVariants set [count _listVariants,_variant];
			_listVariantTexts set [count _listVariantTexts,_variantText];
		};
	};
};
for "_i" from (count _listSentencesTo) to (count _listSentencesFrom - 1) do {
	_listSentencesTo set [count _listSentencesTo,_actorUnitPrev];
};

//--- Get units
_createDummy = if (!isnil "bis_fnc_kbTell_createDummy") then {[bis_fnc_kbTell_createDummy,0,false,[false]] call bis_fnc_param} else {false};
if (typename _listUnits == typename true) then {_createDummy = _listUnits; _listUnits = [];};
_listUnitsCount = count _listUnits;
_listUnits = if (_listUnitsCount == 0) then {

	//--- Default actors
	{
		_unit = if (_createDummy) then {

			//--- If unit doesn't exist, create logic with it's identity
			_x call bis_fnc_kbCreateDummy;
		} else {
			missionnamespace getvariable _x;
		};

		//--- Unit doesn't exist - terminate
		if (!isnil "_unit") then {
			_unit = if (_unit in crew _unit) then {_unit} else {effectivecommander _unit}; //--- No vehicles
			_listUnits = _listUnits + [_unit];
		} else {
			_exit = true;
			["Unit %1 does not exist for %2 / %3",_x,_mission,_topicName] call bis_fnc_error;
		};
	} foreach _listActors;
	_listUnits
} else {

	//--- Custom actors
	if (_listUnitsCount == count _listActors) then {
		_listUnits
	} else {
		_exit = true;
		["Number of units (%1) does not match number of actors (%2) in '%3'",_listUnitsCount,count _listActors,_topicName] call bis_fnc_error;
		[]
	};
};
if (_exit) exitwith {};

//--- Conversation
if (count _listUnits > 0) then {
	private ["_sentenceStartDefault","_senteceStartDefaultId","_sentenceEndDefault","_sentenceEndDefaultId","_sentenceStart","_sentenceEnd","_sentenceStartId","_sentenceEndId","_topic","_errorMsg","_volumeSound","_volumeMusic"];

	//--- Set defaults and correct typenames
	_sentenceStartDefaultId = 0;
	_sentenceStartDefault = _listSentences select _sentenceStartDefaultId;
	_sentenceEndDefaultId = count _listSentences - 1;
	_sentenceEndDefault = _listSentences select _sentenceEndDefaultId;

	//--- Play variant
	if (typename _section == typename "") then {
		//_section = [_section,_sentenceEndDefault];
		_sectionVariant = _section;
		_section = [];
		{
			if (_x == _sectionVariant) then {
				private ["_sentenceId"];
				_sentenceId = _listSentences select _forEachIndex;
				if (count _section == 0) then {
					_section set [0,_sentenceId];
				} else {
					_section set [1,_sentenceId];
				};
			};
			if !(_x in _listVariants) then {_listVariants set [count _listVariants,_x]};
		} foreach _listSentencesVariants;
	};

	//--- Section must be [start] or [start,end]
	if !(count _section in [1,2,3]) then {
		if (count _section != 0) then {["%1 items in (_this select 3), must be 2",count _section] call bis_fnc_error};
		_section = [_sentenceStartDefault,_sentenceEndDefault];
	};

	_sentenceStart =	[_section,0,_sentenceStartDefault,["",[],true]] call bis_fnc_param;
	_sentenceEnd =		[_section,1,_sentenceEndDefault,["",[],true]] call bis_fnc_param;

	//--- Simplified variant used, convert to sentence name
	if (typename _sentenceStart == typename true) then {_sentenceStart = [_sentenceStartDefault,_listSentences call bis_fnc_selectrandom] select _sentenceStart};
	if (typename _sentenceStart == typename []) then {_sentenceStart = _sentenceStart call bis_fnc_kbSentence};
	if (typename _sentenceEnd == typename true) then {_sentenceEnd = [_sentenceEndDefault,_sentenceStart] select _sentenceEnd};
	if (typename _sentenceEnd == typename []) then {_sentenceEnd = _sentenceEnd call bis_fnc_kbSentence};

	//--- Ignore empty strings
	if (_sentenceStart == "") then {_sentenceStart = _sentenceStartDefault};
	if (_sentenceEnd == "") then {_sentenceEnd = _sentenceEndDefault};

	//--- Check if exists
	_sentenceStartId = _listSentences find (tolower _sentenceStart);
	if (_sentenceStartId < 0) then {
		 ["Sentence '%1' not found in '%2'. First sentence used instead.",_sentenceStart,_topicName] call bis_fnc_error;
		_sentenceStart = _sentenceStartDefault;
		_sentenceStartId = _sentenceStartDefaultId;
	};
	_sentenceEndId = _listSentences find (tolower _sentenceEnd);
	if (_sentenceEndId < 0) then {
		 ["Sentence '%1' not found in '%2'. Last sentence used instead.",_sentenceEnd,_topicName] call bis_fnc_error;
		_sentenceEnd = _sentenceEndDefault;
		_sentenceEndId = _sentenceEndDefaultId;
	};

	//--- Singleplayer - add topic to player if not in the list yet
	//if (!ismultiplayer && !(player in _listUnits)) then {
	//	_listUnits set [count _listUnits,player];
	//};


	//--- Wait until actors are unlocked
	waituntil {{_x call bis_fnc_kbIsSpeaking} count _listUnits == 0};

	//--- Lock actors
	_topic = _mission + "_" + _topicName;
	{
		_x setvariable [_fnc_scriptName,_topic];
	} foreach _listUnits;

	//--- Add topics to participants and to all playable units
	{
		if !(_x kbhastopic _topic) then {
			_x kbaddtopic [
				_topic,
				_bikb,
				"",
				{}
			];
		};
	} foreach (_listUnits + playableunits + switchableunits);

	//--- Speak
	_errorMsg = {
		if (!alive _this) then {
			["Cannot play topic '%1', %2 is not alive. Function terminated.",_topic,_this] call bis_fnc_error;
		} else {
			if (_this in crew _this) then {
				["Topic '%1' not available for %2. Function terminated.",_topic,_this] call bis_fnc_error;
			} else {
				["Topic '%1' not available, %2 is vehicle, must be unit. Function terminated.",_topic,_this] call bis_fnc_error;
			};
		};
	};

	//--- Execute local starting function
	[["conversationStart",[_volumeCoef]],"BIS_fnc_kbTellLocal",_listUnits] call bis_fnc_mp;

	for "_s" from _sentenceStartId to _sentenceEndId do {
		private ["_sentenceIndex","_sentenceId","_fromId","_toId","_from","_to","_toActual","_params","_time","_noText","_noChannel","_to"];
		_sentenceIndex = _s;

		_sentenceId = _listSentences select _s;
		_fromId = _listSentencesFrom select _s;
		_from = _listUnits select _fromId;

		_toId = _listSentencesTo select _s;
		_to = _listUnits select _toId;
		_toActual = _to;

		//--- Topics removed - terminate
		if (!(_from kbhastopic _topic) || !alive _from) exitwith {_from call _errorMsg};
		if (!(_to kbhastopic _topic) || !alive _to) exitwith {_to call _errorMsg};

		//--- Compose kbTell params

		//--- Titletext effect - narrator
		_noText = gettext (_cfgSentences >> _sentenceId >> "text") == "";
		if (_noText) then {_channel = true;};

		//--- Custom channel
		_noChannel = false;
		switch (typename _channel) do {
			case (typename {}): {
				_channel = [_from,_to] call _channel;
				_channel = [_channel,0,false,[false,"",0,{}]] call bis_fnc_paramIn;
			};
			case (typename 00): {
				_channel radioChannelAdd _listUnits
			};
			case (typename true): {
				_noChannel = !_channel;
			};
			case (typename objnull): {
				_toActual = _channel;
				_noChannel = true;
			};
		};
		_params = if (_noChannel) then {
			[_toActual,_topic,_sentenceId]
		} else {
			[_toActual,_topic,_sentenceId,_channel]
		};

		//--- Set acctime to default value to ensure conversation is played
		_acctime = acctime;
		setacctime 1;

		//--- Look at each other
		/*_from lookat _to;
		_to lookat _from;*/

		//--- Execute custom code
		_sentenceCodeHandle = [_from,_toActual,_sentenceId,_s,_sentenceCodeParams] spawn _sentenceCode;

		//--- Speak!
		[["sentence",[_from,_params]],"BIS_fnc_kbTellLocal",_from] call bis_fnc_mp;
		["%1 / %2 / %3: %4 > %5 (channel: %6; variant: %7)",_mission,_topicName,_sentenceId,_from,_to,_channel,_listSentencesVariants select _s] call bis_fnc_logFormat;

		waitUntil{scriptDone _sentenceCodeHandle};

		//--- Titletext effect - movie subtitles
		_clearRadio = false;
		if (_noText) then {_channel = "DIRECT"};
/*
		if (typename _channel == typename "") then {
			if (_channel == "DIRECT") then {
				_text = if (_noText) then {
					gettext (_cfgSentences >> _sentenceId >> "textPlain");
				} else {
					gettext (_cfgSentences >> _sentenceId >> "text");
				};
				//titletext [name _from + ": " + _text,"plain down"];
				(
					"<t size='0.7' color='#aaaaaa'>" + name _from + ":</t> "
					+
					_text
					+
					"<t size='0.7' color='#00000000' shadow='0'>" + name _from + ":</t> " //--- Invisible name to center the text
				) spawn bis_fnc_titletext;
				_clearRadio = true;
			};
*/

		//--- Load handler
		if (isnil "bis_fnc_kbTell_loadId") then {
			bis_fnc_kbTell_loadId = {bis_fnc_kbTell_load = true;} call bis_fnc_onLoad;
		};
		bis_fnc_kbTell_load = false;

		//--- Return acctime to previous value
		_time = time;
		waituntil {
			if (_clearRadio) then {clearradio;};
			time - _time > 0.1
		};
		setacctime _acctime;

		//--- Wait until said
		_time = time;
		waituntil {
			if (_clearRadio) then {clearradio;};
			sleep 0.01;

			//--- Sentence said
			(
				_from kbwassaid [_toActual,_topic,_sentenceId,10]
				&&
				time - _time > 1
			)
			||
			//--- Game loaded - skip
			bis_fnc_kbTell_load
			//||
			//([_topicName,_mission,[]] call bis_fnc_kbSkip == 0) //--- Immediate skip (not implemented)
			||
			//--- Speaker no longer has topic - terminate
			!(_from kbhastopic _topic)
			||
			//--- Receiver no longer has topic - terminate
			!(_to kbhastopic _topic)
			||
			//--- Timeout
			(time - _time) > 60
		};

		//--- Conversation skipped - terminate
		if ([_topicName,_mission,[]] call bis_fnc_kbSkip >= 0) exitwith {
			["%1 / %2: TERMINATED",_mission,_topicName] call bis_fnc_logFormat;
		};

		//--- Topics removed - terminate
		if (!(_from kbhastopic _topic) || !alive _from) exitwith {_from call _errorMsg};
		if (!(_to kbhastopic _topic) || !alive _to) exitwith {_to call _errorMsg};
	};
	_topic = _mission + "_" + _topicName;

	//--- Execute local ending function
	[["conversationEnd",[_volumeCoef]],"BIS_fnc_kbTellLocal",_listUnits] call bis_fnc_mp;

	//--- Unlock actors
	{
		private ["_lock"];
		_lock = _x getvariable _fnc_scriptName;
		if (!isnil "_lock") then {
			if (_lock == _topic) then {
				_x setvariable [_fnc_scriptName,nil];
			};
		};
	} foreach _listUnits;
	sleep 0.5;
};

//--- Open conversation menu
if (count _listVariants > 1) then {

	if (_sectionVariant == "") then {
		private ["_menuArray","_text"];
		_menuArray = [];
		{
			if (_x != "") then {
				_text = _listVariantTexts select _foreachindex;
				_menuArray set [
					count _menuArray,
					[_text,_topicName,_mission,_x,_channel,_sentenceCode,_listUnits,_volumeCoef]
				];
			};
		} foreach _listVariants;

		_menuArray call bis_fnc_kbMenu;
	};
};