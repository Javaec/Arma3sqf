if !(isNil "BIS_MissionInitExecuted") exitWith {}; BIS_MissionInitExecuted = true;


if (isNil "BIS_fnc_blackIn_fading") then {BIS_fnc_blackIn_fading = false};
if (isNil "BIS_fnc_blackIn_completed") then {BIS_fnc_blackIn_completed = false};
if (isNil "BIS_fnc_blackOut_fading") then {BIS_fnc_blackOut_fading = false};
if (isNil "BIS_fnc_blackOut_completed") then {BIS_fnc_blackOut_completed = false};

/*--------------------------------------------------------------------------------------------------

 	IDENTITIES

--------------------------------------------------------------------------------------------------*/
(group BIS_BHQ) setGroupId [localize "STR_A3_Group_Crossroads"];
(group BIS_inf) setGroupId [localize "str_a3_cfgidentities_kerry0"];
(group BIS_armory) setGroupId [name BIS_armory];

/*--------------------------------------------------------------------------------------------------

 	WHITEBOARDS

--------------------------------------------------------------------------------------------------*/
BIS_boardAltis setObjectTexture [0, "\A3\Missions_F_EPC\data\img\whiteboards\MapBoard_Altis_C_in1_CO.paa"];
BIS_boardStratis setObjectTexture [0, "\A3\Missions_F_EPC\data\img\whiteboards\MapBoard_Stratis_C_in1_CO.paa"];

/*--------------------------------------------------------------------------------------------------

 	MUSIC #1

--------------------------------------------------------------------------------------------------*/
[] spawn
{
	waitUntil{time > 0};

	waitUntil{BIS_fnc_blackIn_fading};

	0 fadeMusic 0.25;
	playMusic "LeadTrack01_F_EPC";
};

/*--------------------------------------------------------------------------------------------------

 	LOUDSPEAKERS & MUSIC #2

--------------------------------------------------------------------------------------------------*/
[] spawn
{
	waitUntil {!isNil "BIS_fnc_quotations_playing"};
	waitUntil {BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
	waitUntil {!BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};

	//unpause ambient units
	(missionNamespace getVariable ["BIS_air1", objNull]) enableSimulation true;
	(missionNamespace getVariable ["BIS_air2", objNull]) enableSimulation true;
	(missionNamespace getVariable ["BIS_heli", objNull]) enableSimulation true;
	(missionNamespace getVariable ["BIS_armor", objNull]) enableSimulation true;
	(missionNamespace getVariable ["BIS_apc", objNull]) enableSimulation true;

	waitUntil{missionNamespace getVariable ["BIS_ModHubIntro_finished",false]};

	sleep 2;

	[] execVM "loudspeakers.sqf";

	waitUntil{missionNamespace getVariable ["BIS_HubBriefing_finished",false]};

	2 fadeMusic 0; waitUntil{musicVolume == 0}; sleep 5;
	playMusic "BackgroundTrack01_F_EPC";
	2 fadeMusic 0.25;
};

/*--------------------------------------------------------------------------------------------------

 	HUB COMPONENTS

--------------------------------------------------------------------------------------------------*/
#include "\a3\Missions_F_EPA\Campaign_shared\Hubs\initMission.sqf"