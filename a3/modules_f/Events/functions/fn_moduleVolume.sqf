private ["_logic","_units","_activated","_delay","_music","_sound","_radio","_speech"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_delay = _logic getvariable ["Delay",-1];
	_music = _logic getvariable ["Music",-1];
	_sound = _logic getvariable ["Sound",-1];
	_radio = _logic getvariable ["Radio",-1];
	_speech = _logic getvariable ["Speech",-1];

	switch (_music) do
	{
		case -1: {};
		default {
					_delay fadeMusic _music;
				};
	};

	switch (_sound) do
	{
		case -1: {};
		default {
					_delay fadeSound _sound;
				};
	};

	switch (_radio) do
	{
		case -1: {};
		default {
					_delay fadeMusic _radio;
				};
	};

	switch (_speech) do
	{
		case -1: {};
		default {
					_delay fadeSpeech  _speech;
				};
	};
};

true