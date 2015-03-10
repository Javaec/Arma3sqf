//Enable radio, protocol and environment
enableRadio false;
enableSentences false;
enableEnvironment false;

//Fade screen
["BIS_blackStart", false] call BIS_fnc_blackOut;

//Enable sound and music
0 fadeSound 0.00;
0 fadeMusic 0.00;
0 fadeRadio 0.00;
0 fadeSpeech 0.00;

//Cinema borders
[0, 0, false, false] call BIS_fnc_cinemaBorder;

//Do not allow units to flee
{
	_x allowFleeing 0;
} forEach allGroups;

// Start ambient combat sounds (ToDo: change to function when possible)
[] execVM "\A3\Missions_F_EPA\Campaign_shared\Functions\AmbientLife\fn_camp_ambientCombatSounds.sqf";
