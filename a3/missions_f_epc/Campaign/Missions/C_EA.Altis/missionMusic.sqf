BIS_musicTrack 		= "C_EA_RadioMusic1";
BIS_musicTrackNext	= "C_EA_RadioMusic1";
BIS_musicTrackStopped	= "";

BIS_onMusicEnd =
{
	BIS_musicTrackStopped = BIS_musicTrack;

	if (BIS_musicTrackNext == "") exitWith {};

	BIS_musicTrack = BIS_musicTrackNext;
	playMusic BIS_musicTrack;

	//["[!] Stopped: %1",BIS_musicTrackStopped] call BIS_fnc_logFormat;
	//["[!] Playing: %1",BIS_musicTrackNext] call BIS_fnc_logFormat;
};

BIS_musicEH = addMusicEventHandler
[
	"MusicStop",{[] call BIS_onMusicEnd}

];

private["_volume","_fadeSpeed"];

_volume = 0.30;
_fadeSpeed = 2;

waitUntil{missionnamespace getvariable ["BIS_fnc_blackIn_fading",false]};

//music #1 - in the intro truck
if (true) then
{
	BIS_musicTrack 		= "C_EA_RadioMusic1";
	BIS_musicTrackNext	= "C_EA_RadioMusic1";

	playMusic BIS_musicTrack; _fadeSpeed fadeMusic _volume;

	sleep 5;

	_fadeSpeed fadeMusic 0; waitUntil{musicVolume == 0};

	BIS_musicTrack 		= "C_EA_RadioBroadcast1";
	BIS_musicTrackNext	= "C_EA_RadioMusic1";

	playMusic BIS_musicTrack; _fadeSpeed fadeMusic _volume;

	waitUntil{(BIS_musicTrackStopped == "C_EA_RadioBroadcast1") || (vehicle player != BIS_introCar)};

	BIS_musicTrack 		= "C_EA_RadioMusic1";
	BIS_musicTrackNext	= "C_EA_RadioMusic1";

	if (vehicle player != BIS_introCar) exitWith
	{
		_fadeSpeed fadeMusic 0;
	};

	0 fadeMusic 0;
	playMusic BIS_musicTrack;
	_fadeSpeed fadeMusic _volume;

	waitUntil{vehicle player != BIS_introCar};

	_fadeSpeed fadeMusic 0;
};

//sleep _fadeSpeed;

//silence the music
if (musicVolume > 0) then
{
	//["[!] Music was playing! Will force-fade to ZERO."] call BIS_fnc_logFormat;

	_fadeSpeed fadeMusic 0;
};

waitUntil{musicVolume == 0};

sleep 10;

if (vehicle player == player) then
{
	BIS_musicTrack 	   = "BackgroundTrack02_F_EPC";
	BIS_musicTrackNext = "BackgroundTrack02_F_EPC";

	0 fadeMusic 0;
	playMusic "BackgroundTrack02_F_EPC";
	10 fadeMusic _volume;

	waitUntil{(vehicle player != BIS_introCar) && (vehicle player != player)};

	5 fadeMusic 0;

	sleep 5;
};


//music #2 - in the car
if (true) then
{
	waitUntil{(vehicle player != BIS_introCar) && (vehicle player != player)};

	BIS_musicTrack 		= "C_EA_RadioMusic2";
	BIS_musicTrackNext	= "C_EA_RadioMusic2";

	playMusic BIS_musicTrack;

	while {true} do
	{
		waitUntil{(vehicle player != player) && (isEngineOn vehicle player)};

		//start to play music
		_fadeSpeed fadeMusic _volume;

		waitUntil{(vehicle player == player) || !(isEngineOn vehicle player)};

		//stop the music
		_fadeSpeed fadeMusic 0;
	};
};
