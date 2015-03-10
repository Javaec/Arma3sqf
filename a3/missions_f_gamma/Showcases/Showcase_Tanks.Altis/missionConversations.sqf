case "intro":
{
	sleep 3;
	["01_Intro"] call BIS_fnc_kbTell;
};

case "meeting":
{
	(crew BIS_tank2) join BIS_grpNomad;
	BIS_grpNomad addVehicle BIS_tank2;
	sleep 4;
	_null = [] spawn {
		sleep 2;
		5 fadeMusic 0;
		sleep 5;
		[["Track10_StageB_action"], -1] call BIS_fnc_music;
		1 fadeMusic 0.35;
	};
	["05_Meeting", nil, nil, BIS_player] call BIS_fnc_kbTell;
	saveGame;
	BIS_go = TRUE;
	sleep 3;
	_null = [["Vehicle", "Seats"], 15] spawn BIS_fnc_advHint;
};

case "village1":
{
	[[""], -1] call BIS_fnc_music;
	playMusic ["Track11_StageB_stealth", 86];
	sleep 1;
	["10_Village_Seized"] call BIS_fnc_kbTell;
	"Win01" call BIS_fnc_endMission;
};

case "gogogo":
{
	_tmout = random 10;
	sleep _tmout;
	["x05_KeepGoing", nil, nil, BIS_player] call BIS_fnc_kbTell;
};

case "away":
{
	["x01_WhereYouGo", nil, nil, BIS_player] call BIS_fnc_kbTell;
};