//terminate all queued conversations
BIS_canChat = false;

if (count BIS_convQueue > 0) then
{
	["Following conversations are in queue: %1",BIS_convQueue] call BIS_fnc_logFormat;

	BIS_convSkip =+ BIS_convQueue;
};

waitUntil{count BIS_convQueue == 0};

private["_car"];

_car = vehicle player;

waitUntil
{
	//move player and journalist out of the car
	if ((vehicle player != player) && (speed vehicle player < 0.01)) then
	{
		moveOut player;
		moveOut BIS_journalist;
	};

	{vehicle _x != _x} count [BIS_inf,BIS_journalist] == 0
};

_car lock true;

setAccTime 1;
"50_AtDestination" spawn  BIS_fnc_missionConversations;

sleep 10;

// Play music, detect when it finishes
0 fadeMusic 0;
5 fadeMusic 0.05;
playMusic "BackgroundTrack03_F_EPC";

BIS_onMusicEnd =
{
	removeMusicEventHandler ["MusicStop", BIS_musicEH];

	BIS_musicStopped = true;
};


sleep 3;

3 fadeSound 0;
titleCut ["", "BLACK OUT", 3];

sleep 3;

[0, 0, false, true] spawn BIS_fnc_cinemaBorder;

clearRadio;

// Set-up Kerry
BIS_inf switchMove "";

sleep 0.01;

BIS_inf enableSimulation false;
BIS_inf setPos getPos BIS_infPos;
BIS_inf setDir getDir BIS_infPos;
BIS_inf switchMove "Acts_welcomeOnHUB04_PlayerWalk_1";

BIS_inf addMagazines ["30Rnd_9x21_Mag",4];
BIS_inf addWeapon "SMG_02_F";
BIS_inf selectWeapon "SMG_02_F";

private ["_animEH"];
_animEH = BIS_inf addEventHandler ["AnimDone", {(_this select 0) playMoveNow (_this select 1)}];
BIS_inf setVariable ["BIS_animEH", _animEH];

// Set-up journalist
{BIS_journalist disableAI _x} forEach ["ANIM","AUTOTARGET","MOVE","TARGET"];
BIS_journalist enableSimulation false;
BIS_journalist setPos getPos BIS_journalistPos;
BIS_journalist setDir getDir BIS_journalistPos;
BIS_journalist switchMove "Acts_A_M04_briefing";

// Set-up Nikos
BIS_nikos enableSimulation false;
BIS_nikos setPos getPos BIS_nikosPos;
BIS_nikos setDir getDir BIS_nikosPos;

BIS_nikos removeEventHandler ["AnimDone", BIS_nikos getVariable "BIS_animEH"];
BIS_nikos switchMove "Acts_B_M03_briefing";

if (!(isNil "BIS_cutsceneCar")) then {
	if (canMove BIS_cutsceneCar && BIS_cutsceneCar distance BIS_nikos < 100) then {
		// Set-up car if it was used
		BIS_cutsceneCar allowDamage false;
		BIS_cutsceneCar setDamage 0;
		BIS_cutsceneCar setPos getPos BIS_cutsceneCarPos;
		BIS_cutsceneCar setDir getDir BIS_cutsceneCarPos;
	};
};

sleep 1;

3 fadeSound 1;
titleCut ["", "BLACK IN", 3];

// Play character animations
{_x enableSimulation true} forEach [BIS_inf, BIS_journalist, BIS_nikos];

// Stop journalist after some time
[] spawn {
	scriptName "meetingNikos.sqf: journalist animation control";
	sleep 10;
	BIS_journalist enableSimulation false;
};

sleep 0.5;

if (missionNamespace getVariable ["BIS_artilleryUsed", false]) then
{

	_kb = "57_MeetingNikos_FIANotFriends" spawn BIS_fnc_missionConversations;
}
else
{
	_kb = "55_MeetingNikos_FIAFriends" spawn BIS_fnc_missionConversations;
};

sleep 7.5;

// Walk away
BIS_inf removeEventHandler ["AnimDone", BIS_inf getVariable "BIS_animEH"];
BIS_inf playMoveNow "Acts_welcomeOnHUB04_PlayerWalk_2";

sleep 3;

2 fadeMusic 0.2;

sleep 3;

_kb = "60_RTB" spawn BIS_fnc_missionConversations;