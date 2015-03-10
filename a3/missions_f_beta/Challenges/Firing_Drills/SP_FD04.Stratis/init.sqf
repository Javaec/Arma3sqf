BIS_FD_Competitor enableSimulation false;

0 fadeMusic 0;
0 fadeSound 0;
3 fadeMusic 0.35;
3 fadeSound 1;

//ToDo: handle in a way that players can choose to see the intro again? Hijack pause menu?
private ["_introPlayed"];
_introPlayed = profileNamespace getVariable ["BIS_FD_FD04_introPlayed", 0];
BIS_FD_skipIntro = (if (_introPlayed < 5) then {false} else {true});

if (!BIS_FD_skipIntro) then 
{
	profileNamespace setVariable ["BIS_FD_FD04_introPlayed", _introPlayed + 1];
	saveProfileNamespace;

	BIS_handle = [0, 0, false] call BIS_fnc_cinemaBorder;
	
	BIS_wasSaid = 0;

	sleep 0.01;

	BIS_rangeOfficer switchMove "Acts_PercMwlkSlowWrflDf2";

	BIS_FD_Competitor setAmmo ["arifle_Mk20_MRCO_plain_F", 0];
	BIS_FD_Competitor removeMagazine "30Rnd_556x45_Stanag";
	BIS_FD_Competitor removeMagazine "30Rnd_556x45_Stanag";
	BIS_FD_Competitor removeMagazine "30Rnd_556x45_Stanag";
	BIS_FD_Competitor removeMagazine "30Rnd_556x45_Stanag";
	BIS_FD_Competitor removeWeapon "hgun_ACPC2_F";
	BIS_FD_Competitor removeWeapon "Binocular";

	BIS_rangeOfficer addMagazine "20Rnd_762x51_Mag";
	BIS_rangeOfficer addMagazine "20Rnd_762x51_Mag";
	BIS_rangeOfficer addWeapon "srifle_EBR_ARCO_pointer_F";

	sleep 0.1;

	private ["_handle"];

	sleep 1;

	//Desync RO and Competitor animations
	[] spawn 
	{
		sleep 0.3;
		BIS_FD_Competitor setDir -143.722;
		BIS_FD_Competitor switchMove "Acts_PercMwlkSlowWrflDf2";
		BIS_FD_Competitor enableSimulation true;
	};

	sleep 3;
	
	if (!BIS_FD_atStart) then 
	{
		_handle = ["COFGreen", "Firing_Drills", [["ROF", 0], true], "SIDE"] spawn BIS_fnc_kbTell;
		waitUntil {scriptDone _handle};
		sleep 0.5;
	};

	[
		BIS_FD_competitor,
		"BIS_FD_Briefing",
		[
			localize "STR_A3_FIRING_DRILLS_SP_FD04_TASK1_TEXT",
			localize "STR_A3_FIRING_DRILLS_SP_FD04_TASK1_TITLE",
			localize "STR_A3_FIRING_DRILLS_SP_FD04_TASK1_HUD"
		],
		nil,
		true
	] call BIS_fnc_taskCreate;

	if (!BIS_FD_atStart) then 
	{
		sleep 1;
		_handle = ["COFGreen", "Firing_Drills", [["ROF", 2], true], "SIDE"] spawn BIS_fnc_kbTell;
		waitUntil {scriptDone _handle};
	};

	if (!BIS_FD_atStart) then 
	{
		_handle = ["COFGreen", "Firing_Drills", [["ROF", 3], true], "SIDE"] spawn BIS_fnc_kbTell;
		waitUntil {scriptDone _handle};
	};

	if (!BIS_FD_atStart) then 
	{
		_handle = ["COFGreen", "Firing_Drills", [["ROF", 4], true], "SIDE"] spawn BIS_fnc_kbTell;
		waitUntil {scriptDone _handle};
	};

	if (!BIS_FD_atStart) then 
	{
		_handle = ["COFGreen", "Firing_Drills", [["ROF", 5], true], "SIDE"] spawn BIS_fnc_kbTell;
		waitUntil {scriptDone _handle};
	};

	if (!BIS_FD_atStart) then 
	{
		_handle = ["COFGreen", "Firing_Drills", [["ROF", 6], true], "SIDE"] spawn BIS_fnc_kbTell;
		BIS_wasSaid = 1; //TODO: use actual kbWasSaid?
		waitUntil {scriptDone _handle};
	};
} 
else 
{
	BIS_FD_Competitor enableSimulation true;
	
	waitUntil {!(isNil "BIS_FD_CompetitorPos")};
	BIS_FD_Competitor setPos BIS_FD_CompetitorPos;
	BIS_FD_Competitor setDir BIS_FD_CompetitorDir;	
};

waitUntil {(missionNamespace getVariable ["BIS_FD_ended", false]) || (missionNamespace getVariable ["BIS_FD_reset", false])};
if (missionNamespace getVariable ["BIS_FD_reset", false]) exitWith {sleep 1.5; BIS_rangeOfficer setPos (markerPos "BIS_rangeOfficer1"); BIS_rangeOfficer setDir (markerDir "BIS_rangeOfficer1"); BIS_rangeOfficer doWatch (markerPos "BIS_rangeOfficer1A");};

private ["_timeNow"];
_timeNow = time;
//Handle player too quickly restarting - simply skip these messages
waitUntil {((time - _timeNow) >= 5) || BIS_FD_reset};
if (BIS_FD_reset) exitWith {sleep 1.5; BIS_rangeOfficer setPos (markerPos "BIS_rangeOfficer1"); BIS_rangeOfficer setDir (markerDir "BIS_rangeOfficer1"); BIS_rangeOfficer doWatch (markerPos "BIS_rangeOfficer1A");};

_handle = ["COFGreen", "Firing_Drills", [["ROF", 24], true], "SIDE"] spawn BIS_fnc_kbTell;

_timeNow = time;
waitUntil {(scriptDone _handle) || BIS_FD_reset};
if (BIS_FD_reset) exitWith {sleep 1.5; BIS_rangeOfficer setPos (markerPos "BIS_rangeOfficer1"); BIS_rangeOfficer setDir (markerDir "BIS_rangeOfficer1"); BIS_rangeOfficer doWatch (markerPos "BIS_rangeOfficer1A");};

_handle = ["COFGreen", "Firing_Drills", [["ROF", 25], true], "SIDE"] spawn BIS_fnc_kbTell;

_timeNow = time;
waitUntil {(scriptDone _handle) || BIS_FD_reset};
if (BIS_FD_reset) exitWith {sleep 1.5; BIS_rangeOfficer setPos (markerPos "BIS_rangeOfficer1"); BIS_rangeOfficer setDir (markerDir "BIS_rangeOfficer1"); BIS_rangeOfficer doWatch (markerPos "BIS_rangeOfficer1A");};

_handle = ["COFGreen", "Firing_Drills", [["ROF", 26], true], "SIDE"] spawn BIS_fnc_kbTell;

waitUntil {(scriptDone _handle) || BIS_FD_reset};
waitUntil {(BIS_FD_Competitor distance BIS_rangeOfficer) > 50};
sleep 1.5;
BIS_rangeOfficer setPos (markerPos "BIS_rangeOfficer1");
BIS_rangeOfficer setDir (markerDir "BIS_rangeOfficer1");
BIS_rangeOfficer doWatch (markerPos "BIS_rangeOfficer1A");

true