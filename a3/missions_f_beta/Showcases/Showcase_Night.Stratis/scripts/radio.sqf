scriptName "Showcase_Night\scripts\radio.sqf";

//Params
private ["_radio"];
_radio = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Validate radio object
if (isNull _radio) exitWith { "radio.sqf object cannot be null" call BIS_fnc_error; };

//Sounds
private "_sounds";
_sounds = [
	"radio_track_01",
	"radio_track_02",
	"radio_track_03"
];

//Turn off action
private "_action";
_action = _radio addAction ["Turn off", "scripts\radioOff.sqf", [], 1, false, true, "", "_this distance _target < 2"];

//Loop
while { alive _radio } do {
	//Pick a random sound
	private "_sound";
	_sound = _sounds call BIS_fnc_selectRandom;
	
	//Get sample and duration of random sound
	private "_duration";
	_duration = getNumber (configfile >> "CfgSounds" >> _sound >> "duration");
	
	//Play the sample
	_radio say3D _sound;
	
	//Log
	["Ambient Radio: %1", _sound] call BIS_fnc_logFormat;
	
	//Wait for the sample to finish
	sleep _duration;
};

//Log
"Showcase_Night\scripts\radio.sqf" call BIS_fnc_log;
