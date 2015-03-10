
/*******************************************************************************
 *
 *	version: 		1.0
 *	name:			Add evidence
 *	description:	add an evidnce value to global campaign variable 	
 *	author:			Chose
 *	paramater:		evidence variable name (defined in init.sqf of campaign
 					mission C1) or simply number (scalar)
 *	return value:	none 	
 * 
 ******************************************************************************/     

//validity checks
if (isNil "BIS_evidenceGathered") exitWith {debugLog "Error: addEvidence.sqf :: BIS_evidenceGathered undefined!!!"};
if (isNil "BIS_evidencesPresent") exitWith {debugLog "Error: addEvidence.sqf :: BIS_evidencesPresent undefined!!!"};
if (typeName _this != "SCALAR") exitWith {textLogFormat ["Error: addEvidence.sqf :: Parsed variable is %1 must be SCALAR!!!", _this]};
if (isNil "BIS_evidenceGathered") exitWith {debugLog "Error: addEvidence.sqf :: BIS_evidenceGathered undefined!!!"};
if (isNil "RE") exitWith {debugLog "Error: addEvidence.sqf :: MPF not initialized!!!"};
if (isNil "BIS_missionScope") exitWith {debugLog "Error: addEvidence.sqf :: BIS_missionScope not created!!!"};
if (typeName (BIS_missionScope getVariable "objEvidence") != "TASK") exitWith {debugLog "Error: addEvidence.sqf :: Task ''objEvidence'' not registered in BIS_missionScope!!!"};

private ["_evidenceValue"];
_evidenceValue = _this;

if (isNil "BIS_evidencesGatheredHere") then {BIS_evidencesGatheredHere = 0}; //pieces of evidence gathered in this particular mission

BIS_evidencesGatheredHere = BIS_evidencesGatheredHere + 1;

//add the value of this evidence to overall evidence value for the whole campaign
BIS_evidenceGathered = BIS_evidenceGathered + _evidenceValue; saveVar "BIS_evidenceGathered";

if (BIS_evidencesGatheredHere > BIS_evidencesPresent) then {debugLog "Warning: addEvidence.sqf :: Evidence found value is higher than maximum evidence value set for the mission!!!"};

//informative hint
_nic = [objNull, objNull, rHINT, format [localize "evidenceFound", BIS_evidencesGatheredHere, BIS_evidencesPresent]] call RE;

//update task entry
_nic = [objNull, objNull, rSETSIMPLETASKDESCRIPTION, "objEvidence", [format [localize "init.sqf_8" + "<br/><br/>" + localize "evidenceFound", BIS_evidencesGatheredHere, BIS_evidencesPresent], localize "init.sqf_9_0", ""]] call RE;
if (BIS_evidencesGatheredHere >= BIS_evidencesPresent) then {_nic = [objNull, objNull, rSETTASKSTATE, "objEvidence", "Succeeded"] call RE};