private[ "_temp", "_maxspeakers" ];

BIS_lastSentence = 0;
BIS_cnt = 0;
BIS_attendantDisabled = true;
BIS_maxspeakers = 10;
BIS_speakers = [];
BIS_playingSentence = false;


BIS_enumerateSpeakers = 
{
	_prefix = [_this, 0, "", [""]] call BIS_fnc_param;
	BIS_speakers = [];	
	for "_speakernr" from 1 to BIS_maxspeakers do 
	{
		//["_%1%2", _prefix, _speakernr ] call BIS_fnc_logFormat;
		if( !isNil ( compile format ["%1%2", _prefix, _speakernr ] )) then
		{
			BIS_speakers = BIS_speakers + [ call compile format ["%1%2", _prefix, _speakernr ]];
			
		}
	};
};

BIS_playRandom = 
{
	private [ "_randomSentence", "_sentences", "_randnr" ];
	_sentences = [_this, 0, [], [[]]] call BIS_fnc_param;
	_randnr = (floor random (count _sentences));
	//["_randnr:%1 | BIS_lastSentence:%2", _randnr, BIS_lastSentence ] call BIS_fnc_LogFormat;                 
	while {BIS_lastSentence == _randnr} do
	{
		//["CHOOSING ANOTHER _randomSentence:%1 | BIS_lastSentence:%2", _randnr, BIS_lastSentence ] call BIS_fnc_LogFormat;
		_randnr = (floor random (count _sentences));
		Sleep 0.01;
	};
	_randomSentence = _sentences select _randnr;
	BIS_lastSentence = _randnr; 
	BIS_playingSequence = true;
	[ _randomSentence select 0, _randomSentence select 1] call BIS_playSentence;
	BIS_playingSequence = false;
	   	
};

BIS_playSequentially = 
{
	private[ "_sentences", "_speakers", "_cnt" ];
	_cnt = BIS_cnt;
	BIS_playingSequence = true;
	_sentences = [_this, 0, [], [["sentencex"]]] call BIS_fnc_param;
	{
		//waituntil { [_x select 0, _x select 1] call BIS_playSentence && if (_cnt != BIS_cnt) exitWith {true}; };
		waituntil { [_x select 0, _x select 1] call BIS_playSentence };
		if (_cnt != BIS_cnt) exitwith {true};		
	}  forEach _sentences;
	BIS_playingSequence = false;
};

BIS_playSentence = 
{
	private[ "_sentence", "_speakers", "_delay", "_latency", "_cnt" ];
	_sentence = [_this, 0, "", [""]] call BIS_fnc_param;
	_delay = [_this, 1, 1, [1]] call BIS_fnc_param;
	_latency = 0.12;
	                                           
	_cnt = BIS_cnt;
	{
		_x say3D _sentence;
		//["Delay is %1", _delay ] call BIS_fnc_LogFormat;
		//["Loudspeaker %1 is playing sentence %2", _x, _sentence ] call BIS_fnc_LogFormat;                 
		if( _cnt != BIS_cnt ) then exit;
		Sleep _latency;
	}  forEach BIS_speakers;
	titleText [localize format ["str_a3_%1", _sentence], "plain down"];
	Sleep _delay;
	true
};

BIS_play = 
{
	private[ "_speakers", "_prefix", "_sentences", "_random", "_currentlyplayed" ];
	
	_prefix = [_this, 0, "", [""]] call BIS_fnc_param;
	_sentences = [_this, 1, [], [[]] ] call BIS_fnc_param;       
	_random = [_this, 2, false, [false]] call BIS_fnc_param;   
	if( !isNil "_currentlyplayed" ) then {terminate _currentlyplayed;  ["terminating:%1", time ] call BIS_fnc_LogFormat;};
	[ _prefix ] call BIS_enumerateSpeakers;
	//["Speakers:%1", BIS_speakers ] call BIS_fnc_LogFormat;
	if( !_random ) then 
	{
		_currentlyplayed = [ _sentences ] spawn BIS_playSequentially;
		 //["_currentlyplayed:%1", _currentlyplayed ] call BIS_fnc_LogFormat;                 
	}
	else
	{
		[ _sentences ] spawn BIS_playRandom;
	};
	                 
};

switch ( missionname ) do
{
	case "Faction_BLUFOR_3D";
	case "Faction_BLUFOR":
	{
		#include "sentences_blufor.hpp";	
	}; 	
	case "Faction_OPFOR_3D";
	case "Faction_OPFOR":
	{
		#include "sentences_opfor.hpp";
	}; 	
	case "Faction_INDEPENDENT_3D";
	case "Faction_INDEPENDENT":
	{
		#include "sentences_independent.hpp";
	};
};

BIS_enumerateTriggers = 
{
	private [ "_triggers", "_i", "_currentTrigger", "_prefix" ];
	_prefix = [_this, 0, "", [""]] call BIS_fnc_param;   
	_triggers = [];
	for "_i" from 1 to 20 do 
	{
		if( !isnil {call compile format ["%1%2", _prefix, _i]} ) then
		{
			_triggers = _triggers + [ call compile format ["%1%2", _prefix, _i] ];
		};
	};
	_triggers
};

Sleep 2;
BIS_playingSequence = true;
[
	"BIS_loudspeaker_ground", 
	BIS_sentences_welcome
] call BIS_play;


WaitUntil {!BIS_playingSequence};
BIS_attendantDisabled = false;



_x = [] spawn
{
	_distanceToPoint = 15;
	//_waitBetweenNextSequence = 30;
	_waitBetweenNextSequence = 28;
	_timeOfLastSaidSentenceForAir = 0;
	_sets = 
	[
		["BIS_trg_air", _distanceToPoint, 0, "BIS_loudspeaker_air", BIS_sentences_air ], 
		["BIS_trg_ground", _distanceToPoint, 0, "BIS_loudspeaker_ground", BIS_sentences_ground ],
		["BIS_trg_weapons", _distanceToPoint, 0, "BIS_loudspeaker_weapons", BIS_sentences_weapons ],
		["BIS_trg_autonomous", _distanceToPoint, 0, "BIS_loudspeaker_autonomous", BIS_sentences_autonomous ],
		["BIS_trg_water", _distanceToPoint, 0, "BIS_loudspeaker_water", BIS_sentences_water ]
	];
	
	
	//["spawned:%1", time ] call BIS_fnc_LogFormat;      	           
	_triggers = [];
	while {true} do 
	{
		 
		_counter = 0;
		{		             

			_marker = _x select 0;
			_distance = _x select 1;
			_timeOfLastSaidSentenceForPoint = _x select 2;
			_prefix = _x select 3;
			_sentences = _x select 4;
			_triggers = [ _marker ] call BIS_enumerateTriggers;
						                      
	  		if( (({vehicle player in list _x} count _triggers > 0) && ((( time - _timeOfLastSaidSentenceForPoint ) > _waitBetweenNextSequence ) || _timeOfLastSaidSentenceForPoint == 0 )) && !BIS_attendantDisabled ) then
			{
				if (!BIS_playingSequence) then
				{
					[
						_prefix, 
						_sentences,
						true
					] call BIS_play;
					BIS_cnt = BIS_cnt + 1;
					[_sets, [_counter, 2], time] call BIS_fnc_setNestedElement;
				};
			};
			//["TIME:%1 _timeOfLastSaidSentenceForPoint:%3 is %2", time, (_x select 2), _marker] call BIS_fnc_LogFormat;
			_counter = _counter + 1;
		} forEach _sets;
	Sleep 2;
	};
};

_restrictedarea = [] spawn
{ 
	private[ "_triggers", "_prefix" ];
	_prefix = "BIS_trg_restrictedarea";
	_triggers = [ _prefix ] call BIS_enumerateTriggers;
	 //["Triggers:%1", _triggers ] call BIS_fnc_LogFormat;                 
	while {true} do
	{
		if ({count list _x > 0} count _triggers > 0) then  
		//if ({vehicle player in list _x} count _triggers > 0) then
		{
			//["Player in restricted area:%1", _triggers ] call BIS_fnc_LogFormat;                 
			BIS_cnt = BIS_cnt + 1;
			BIS_attendantDisabled = true;
			[
					"BIS_loudspeaker_restrictedarea", 
					BIS_sentences_safetyregs,
					true
			] call BIS_play;
			Sleep 5;	
		}
		else { BIS_attendantDisabled = false; };
		Sleep 2;	
	};
};

