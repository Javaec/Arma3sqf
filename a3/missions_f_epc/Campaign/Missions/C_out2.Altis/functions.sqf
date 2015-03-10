
/*******************************************************************************
	Author: <Author's name>

	Description:
	<Short description>

*******************************************************************************/
BIS_HubBriefing_play =
{
	private["_prefix","_timekeys","_topic","_offset","_sentenceToPlay","_index", "_actor"];

	_prefix 	= [_this, 0, "", [ "" ]] call BIS_fnc_param;
	_timekeys 	= [_this, 1, [], [ [] ] ] call BIS_fnc_param;
	_topic 		= [_this, 2, "", [ "" ]] call BIS_fnc_param;
	_offset 	= [_this, 3, 0, [ 0 ]] call BIS_fnc_param;
	_actor 		= [_this, 4, objNull, [ objNull ]] call BIS_fnc_param;
	_sentenceToPlay = "";
	_channel	= [_this, 5, "DIRECT", [ "" ]] call BIS_fnc_param;

	BIS_HubBriefing_play_spawned = [];

	_index = 0;
	{
		 ["%1%2", _prefix, _index ] call BIS_fnc_logFormat;

		 _sentenceToPlay = call compile format ["'%1%2'", _prefix, _index ];

		 BIS_HubBriefing_play_spawned set
		 [count BIS_HubBriefing_play_spawned,
		 	[_x, _sentenceToPlay, _index, _topic, _offset, _actor, _channel] spawn
			{
				private ["_t","_timekey","_index","_offset","_sentenceToPlay","_topic", "_actor", "_channel"];

				_timekey 	= _this select 0;
				_sentenceToPlay = _this select 1;
				_index 		= _this select 2;
				_topic  	= _this select 3;
				_offset 	= _this select 4;
				_actor 		= _this select 5; 
				_channel	= _this select 6;
				_t = time;

				waitUntil{time >= (_t + _timekey + _offset)};

				["%1|%2 - Playing:%3", time, _t + _timekey + _offset  ,_sentenceToPlay] call BIS_fnc_LogFormat;
				
				_actor kbTell [_actor,_topic,_sentenceToPlay, ["", {}, "", []], _channel];

				waitUntil{_actor kbWasSaid [_actor,_topic,_sentenceToPlay,60]};
			}
		];

		 _index = _index + 1;
	}
	forEach _timekeys;

	waitUntil
	{
		sleep 0.1;

		(({scriptDone _x} count BIS_HubBriefing_play_spawned) == (count BIS_HubBriefing_play_spawned));
	};
};
