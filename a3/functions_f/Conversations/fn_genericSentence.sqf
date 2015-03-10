/*
	Author: Karel Moricky

	Description:
	Play generic sentence with probablity set by bis_genericSentenceMode variable (0.5 = 50%, 1 = 100%)

	Parameter(s):
	_this select 0: STRING - sentence name
	_this select 1 (Optional): OBJECT or CODE - speaker (when code, speaker is it's returned value)
	_this select 2 (Optional): NUMBER - delay from previous generic sentence: When negative, sentence is played always.
	_this select 3 (Optional): BOOL - true to allow repeating same sentence

	Returns:
	BOOL - true if sentence was played
*/

//--- No radio channel - terminate (client) or initialize (server)
if (isnil "bis_genericSentenceChannel") exitwith {
	//["Radio channel 'BIS_genericSentenceChannel' not found"] call bis_fnc_error;
	false
};
//if (isnil "bis_genericSentenceChannel" && isserver) then {[] call bis_fnc_genericSentenceInit};

//--- Variable does not exist
if (isnil "bis_genericSentenceMode") then {bis_genericSentenceMode = -1;};
if (isnil "bis_genericSentenceLast") then {bis_genericSentenceLast = "";};
if (isnil "bis_genericSentenceTime") then {bis_genericSentenceTime = -999;};
if (isnil "bis_genericSentenceSpeaker") then {bis_genericSentenceSpeaker = objnull;};

//--- Play only when not disabled
//if (bis_genericSentenceMode > 0) then {

	//--- Check random chance of playing
	private ["_sentence"];
	_sentence = [_this,0,"",[""]] call bis_fnc_param;
	if (_sentence != "") then {

		//--- Force sentence if negative delay is set
		private ["_delay","_sentenceMode"];
		_delay = [_this,2,5,[0]] call bis_fnc_param;
		_sentenceMode = if (_delay < 0) then {1} else {bis_genericSentenceMode};

		if (
			random 1 < _sentenceMode //--- Random based on global value
			&&
			(time - bis_genericSentenceTime) > _delay //--- Time passed since last generic sentence was played
		) then {
			private ["_canRepeat"];
			_canRepeat = [_this,3,false,[false]] call bis_fnc_param;

			//--- Do not repeat previous sentence
			if (_sentence != bis_genericSentenceLast || _canRepeat) then {
				private ["_speaker"];

				//--- Get speaker
				_speaker = [_this,1,bis_genericSentenceSpeaker,[objnull,{}]] call bis_fnc_param;
				if (typename _speaker == typename {}) then {
					_speaker = [call _speaker,0,objnull,[objnull]] call bis_fnc_paramIn;
				};
				if (isnull _speaker) then {
					if (count crew vehicle player > 1) then {
						//--- Default speaker - copilot
						_speaker = crew vehicle player select 1;
					};
				};

				if (!isnull _speaker) then {

					//--- Play the sentence (only when no conversation is undergoing)
					if (
						({_x call bis_fnc_kbCanSpeak} count [player,_speaker]) == 2
					) then {
						bis_genericSentenceChannel radioChannelAdd [player,_speaker];
						_speaker customradio [bis_genericSentenceChannel,_sentence];
						bis_genericSentenceLast = _sentence;
						bis_genericSentenceTime = time;
						["%1 says '%2'",_speaker,_sentence] call bis_fnc_logFormat;
						true
					} else {
						false
					};
				} else {
					//["Incorrect or no speaker given for '%1'",_sentence] call bis_fnc_error;
					false
				};
			} else {
				false
			};
		} else {
			false
		};
	} else {
		//--- Reset
		bis_genericSentenceLast = _sentence;
		//bis_genericSentenceTime = -999;
		false
	};
//};