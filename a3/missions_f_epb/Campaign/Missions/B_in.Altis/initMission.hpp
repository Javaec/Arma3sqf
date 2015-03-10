//Disable sound and music
0 fadeSound 0;
0 fadeMusic 0;

//Disable radio, protocol and environment
enableRadio false;
enableSentences false;
enableEnvironment false;

//Fade screen to black
["BIS_blackStart", false] call BIS_fnc_blackOut;

//Defines
#define INTRO_START_DELAY 5

//Intro entry point
missionNameSpace setVariable ["BIS_introEntry", addMissionEventHandler ["Draw3D", {
	//Initialization
	if (isNil { BIS_initialization }) then {
		//Flag
		BIS_initialization = true;
		
		//Destroy buildings
		[] call BIS_fnc_b_in_aftermath;
		
		//Quote
		BIS_quotation = ["\A3\Missions_F_EPB\video\B_in_quotation.ogv", "STR_A3_campaign_quote_30"] call BIS_fnc_quotations;
	};
	
	//Make sure it is time to start intro scene
	if (time >= INTRO_START_DELAY && scriptDone BIS_quotation) then {
		//Remove event handler
		removeMissionEventHandler ["Draw3D", missionNameSpace getVariable "BIS_introEntry"];
		
		//Start intro scene
		[] call compile preprocessFileLineNumbers "intro\intro.sqf";
	};
}]];
