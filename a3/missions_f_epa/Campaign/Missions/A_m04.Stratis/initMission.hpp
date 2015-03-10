//Disable radio, protocol and environment
enableRadio false;
enableSentences false;
enableEnvironment false;

//Disable sound and music
0 fadeSound 0.00;
0 fadeMusic 0.00;
0 fadeRadio 0.00;
0 fadeSpeech 0.00;

//Black screen
//["BIS_blackStart", false] call BIS_fnc_blackOut;
cuttext ["", "BLACK FADED", 999];

// Music
playMusic "AmbientTrack04_F";

// Play quotation
private "_quotation";
_quotation = ["\A3\Missions_F_EPA\video\A_m04_quotation.ogv", "STR_A3_Campaign_Quote_7"] call BIS_fnc_quotations;
waitUntil { scriptDone _quotation };

//Screen fades in
//["BIS_blackStart", true] call BIS_fnc_blackIn;
cuttext ["", "BLACK IN", 5];

//Disable radio, protocol and environment
enableRadio true;
enableSentences true;
enableEnvironment true;

//Disable sound and music
5 fadeSound 1.00;
5 fadeMusic 0.30;
5 fadeRadio 1.00;
5 fadeSpeech 1.00;

//Orbat
"BIS_alphaORBAT" call BIS_fnc_camp_createAlphaORBAT;

//Assign flash light and turn it on
player action ["GunLightOn", player];

sleep 2;

//Thunder
private ["_position", "_height", "_distance", "_direction"];
_position 	= position player;
_height		= 50;
_distance	= 350;
_direction	= getDir player + ([random -30, random 30] call BIS_fnc_selectRandom);

//Set thunder height
_position set [2, _height];

//Create thunder
[_position, _distance, _direction] spawn BIS_fnc_camp_thunder;
