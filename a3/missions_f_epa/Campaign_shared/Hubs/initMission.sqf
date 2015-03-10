scriptName "initMission.sqf";

waitUntil{BIS_fnc_camp_onMissionInit_completed};

//--------------------------------------------------------------------------------------------------
// SYSTEM
//--------------------------------------------------------------------------------------------------
format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving;
disableSerialization;

//--------------------------------------------------------------------------------------------------
// DEVELOPER TOGGLES
//--------------------------------------------------------------------------------------------------

//debug
BIS_debugMode 		    	= false;
BIS_showHelpers 	    	= false;
BIS_skipQuotation	    	= true;
BIS_skipHubIntro	    	= true;
BIS_skipBriefingCutscene    	= true;
BIS_hideObjects		    	= true;
BIS_phaseObjects	    	= true;
BIS_useLoadingScreen	    	= true;
BIS_useZoneRestriction		= true;

//function overrides
BIS_fnc_blackOut_disabled 	= false;
BIS_fnc_camp_loadMissionIntel_dateBriefing = [];

BIS_scriptNull		    	= [] spawn {};
BIS_pathCampaign 	    	= "\a3\Missions_F_EPA\Campaign_shared";

//module specific
BIS_HubIntro_finished       	= false;
BIS_HubIntro_regUnits 		= [];
BIS_FullStart_regUnits		= [];
BIS_IntroBriefing_completed 	= false;
BIS_IntroBriefing_running   	= false;
BIS_Anims_completed		= false;
BIS_Skirmish_disabled       	= false;
BIS_HubBriefing_executed	= false;
BIS_HubBriefing_gameOver 	= false;
BIS_ZR_gameOver			= false;

//--------------------------------------------------------------------------------------------------
// DEVELOPER TOGGLES
//--------------------------------------------------------------------------------------------------
BIS_ffDetected 	= false;		//true = friendly fire detected

//--------------------------------------------------------------------------------------------------
// INIT GLOBAL VARIABLES
//--------------------------------------------------------------------------------------------------
BIS_isCampaign	= [] call BIS_fnc_isCampaign;
BIS_is3dEditor	= !(isNull findDisplay 128);

BIS_selectedMission 	= "";		//classname of the selected -to be launched- mission

//--------------------------------------------------------------------------------------------------
// DEBUG
//--------------------------------------------------------------------------------------------------
if !(profileName == "warka") then
{
	BIS_DebugMode = false;
};

if (BIS_is3dEditor) then
{
	if (time == 0) then
	{
		BIS_fnc_blackOut_disabled = true;
	}
	else
	{
		BIS_fnc_blackOut_disabled = false;
	};
};

if (BIS_DebugMode) then
{
	("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];
}
else
{
	BIS_ShowHelpers 	  = false;
	BIS_HideObjects		  = true;
	BIS_SkipQuotation	  = false;
	BIS_SkipHubIntro 	  = false;
	BIS_skipBriefingCutscene  = false;
	BIS_PhaseObjects	  = true;
	BIS_useLoadingScreen	  = true;
	BIS_useZoneRestriction	  = true;

	BIS_Skirmish_disabled  	  = false;
	BIS_HubIntro_finished     = false;

	BIS_fnc_blackOut_disabled = false;
};

/*--------------------------------------------------------------------------------------------------

	START LOADING SCREEN

--------------------------------------------------------------------------------------------------*/
if (BIS_useLoadingScreen) then
{
	["hub_missionInit"] call BIS_fnc_startLoadingScreen;
};

/*--------------------------------------------------------------------------------------------------

	MISSION COMPONENTS: BEFORE SIMULATION STARTS

--------------------------------------------------------------------------------------------------*/
BIS_HubComponents = [];

waitUntil{!(isNil "BIS_PER_phase")};

private["_components","_script","_fn_execComponent","_counter"];

_counter = -1;

_fn_execComponent =
{
	{
		_counter = _counter + 1;

		["[ ] Executed component @%2 sec: %1",_x,(floor(time*100))/100] call BIS_fnc_logFormat;

		_script = [] execVM BIS_pathCampaign + format["\Hubs\init%1.sqf",_x];

		waitUntil{scriptDone _script};

		BIS_HubComponents set [count BIS_HubComponents,_x];
	}
	forEach _this;
};

if (missionName != "C_in1") then
{
	_components = ["Cheats","Phasing","AiInteraction","Objects","AmbientObjects","Armory","FullStart","HubIntro","Anims","IntroBriefing","ScTriggers","Conversations","Diary","Player","Ai","FF","3d","Markers","AmbientSounds","QuickStart","Skirmish","HubBriefing","DayTime","AmbientConversations","ZoneRestriction"];
}
else
{
	_components = ["Cheats","Phasing","AiInteraction","Objects","AmbientObjects","Armory","HubIntro","Anims","ScTriggers","Conversations","Diary","Player","Ai","FF","3d","Markers","AmbientSounds","HubBriefing","DayTime","AmbientConversations","ZoneRestriction"];
};


_components call _fn_execComponent;

["[ ] All pre-sim components loaded!"] call BIS_fnc_logFormat;

/*--------------------------------------------------------------------------------------------------

	END LOADING SCREEN

--------------------------------------------------------------------------------------------------*/
if (BIS_useLoadingScreen) then
{
	["hub_missionInit"] call BIS_fnc_endLoadingScreen;

	if (BIS_is3dEditor) then
	{
		["bis_fnc_preload"] call BIS_fnc_endLoadingScreen;
		["bis_fnc_initRespawn"] call BIS_fnc_endLoadingScreen;
	};
};

/*--------------------------------------------------------------------------------------------------

	MISSION COMPONENTS: AFTER SIMULATION STARTS

--------------------------------------------------------------------------------------------------*/
waitUntil{time > 0};

if (missionName != "C_in1") then
{
	_components = ["Objects2","3d2","QuickStart2","HubIntro2","Markers2","IntroBriefing2"];
}
else
{
	_components = ["Objects2","3d2","AmbientConversations2","HubIntro2","Markers2","IntroBriefing2"];
};

_components call _fn_execComponent;

["[ ] All post-sim components loaded!"] call BIS_fnc_logFormat;

/*--------------------------------------------------------------------------------------------------

	MISSION COMPONENTS: AFTER DEBRIEFING FINISHES

--------------------------------------------------------------------------------------------------*/
waitUntil{BIS_IntroBriefing_completed};

if (missionName != "C_in1") then
{
	_components = ["IntroBriefing3","Anims3","FullStart3","Skirmish3","AmbientConversations3"];
}
else
{
	_components = ["Anims3","SimpleStart3"];
};

_components call _fn_execComponent;

["[ ] All post-debriefing components loaded!"] call BIS_fnc_logFormat;