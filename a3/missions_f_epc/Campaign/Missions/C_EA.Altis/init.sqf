format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving;

//--------------------------------------------------------------------------------------------------
//
// 	TOGGLES
//
//--------------------------------------------------------------------------------------------------
#include "initGlobals.hpp"

//--------------------------------------------------------------------------------------------------
//
// 	SAFETY OVERRIDES
//
//--------------------------------------------------------------------------------------------------
if !(profileName == "warka") then
{
	BIS_debugMode = false;
};

if (BIS_debugMode) then
{
	("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];
}
else
{
	BIS_showHelpers 	  = false;
	BIS_hideObjects		  = true;
	BIS_skipQuotation	  = false;
	BIS_useLoadingScreen	  = true;

	BIS_fnc_blackOut_disabled = false;
};

//--------------------------------------------------------------------------------------------------
//
// 	START LOADING SCREEN
//
//--------------------------------------------------------------------------------------------------
["init.sqf"] call BIS_fnc_startLoadingScreen;

//--------------------------------------------------------------------------------------------------
//
// 	SPAWN COMPOSITIONS
//
//--------------------------------------------------------------------------------------------------
private["_compositions","_script"];

_compositions = ["C_EA_Airbase","C_EA_Airbase_inside","C_EA_Accident","C_EA_Checkpoint_03","C_EA_Athira"];

{
	[] call compile preprocessFileLineNumbers format["\A3\Missions_F_EPC\Campaign\Missions\C_EA.Altis\compositions\%1.sqf",_x];

	["Composition set: %1",_x] call BIS_fnc_logFormat;

	//switch back to correct player
	selectPlayer BIS_inf;

	//delete placeholder player unit
	deleteVehicle BIS_placeholderPlayer;
}
forEach _compositions;

//--------------------------------------------------------------------------------------------------
//
// 	INCLUDE CORE PARTS
//
//--------------------------------------------------------------------------------------------------
#include "initBriefing.hpp"
#include "initMission.hpp"

//--------------------------------------------------------------------------------------------------
//
// 	POSTPROCESS EFFECT
//
//--------------------------------------------------------------------------------------------------
"colorCorrections" ppEffectAdjust [1, 1.08, -0.08, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 1.0, 1.21], [0.09, 0.09, 0.09, 0.0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable true;

//--------------------------------------------------------------------------------------------------
//
// 	FSMS
//
//--------------------------------------------------------------------------------------------------
BIS_journalist execFSM "\A3\Missions_F_EPC\Campaign\Missions\C_EA.Altis\journalist.fsm";
[] execFSM "\A3\Missions_F_EPC\Campaign\Missions\C_EA.Altis\fuel.fsm";

//--------------------------------------------------------------------------------------------------
//
// 	END LOADING SCREEN
//
//--------------------------------------------------------------------------------------------------
["BIS_MissionInit",false] call BIS_fnc_blackOut;
["init.sqf"] call BIS_fnc_endLoadingScreen;

waitUntil{BIS_fnc_blackOut_completed};

//--------------------------------------------------------------------------------------------------
//
// 	INCLUDE CORE PARTS - DELAYED
//
//--------------------------------------------------------------------------------------------------
#include "initMission2.hpp"