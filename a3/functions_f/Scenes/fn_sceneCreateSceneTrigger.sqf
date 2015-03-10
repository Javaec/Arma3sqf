
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:
 *	description:	create trigger for scene which can interrupt scene with name passed during creating the trigger
 *	author:		zozo
 *	parameters:	described bellow	
 *	 
 ******************************************************************************/  
private["_sceneName", "_side", "_timeout", "_DETECTIONAREA", "_initPos"];

_sceneName 	= _this select 0;				//name of scene to associate with - string
_side		= _this select 1;				//for which side create trigger - which presence then interrupt the scene - side 
_timeout	= _this select 2;				//timeout of interrupt - int
_DETECTIONAREA	= _this select 3;				//size of the trigger - int
_initPos	= _this select 4;				//where to create the trigger - coordinates
_deleteIt	= _this select 5;				//if set, then trigger will be destroyed		


if(isNil("_deleteIt")) then 
{
	if(isNil("_sceneName")) then {DEBUGLOG "sceneCreateTrigger.sqf: ERROR - _sceneName required";};
	if(isNil("_timeout")) then {_timeout = 4;};
	if(isNil("_side")) then {_side = EAST;};
	if(isNil("_DETECTIONAREA")) then {_DETECTIONAREA = 60;};
	if(isNil("_initPos")) then {DEBUGLOG "sceneCreateTrigger.sqf: ERROR - position required";};
	
	
	
	//CREATE DETECTOR OF SCENE INTERRUPT (if participants are disturbed - enemy or something else)
	call compile format	[
				  "
					BIS_SceneIntDetector%1 = createTrigger[""EmptyDetector"", %5];
					BIS_SceneIntDetector%1 setTriggerArea[%4, %4, 0, false];
					BIS_SceneIntDetector%1 setTriggerActivation[""%2"",""PRESENT"",true];
					BIS_SceneIntDetector%1 setTriggerTimeout [%3 - %3 ,%3  + (%3 /2),%3 , true ];
					BIS_SceneIntDetector%1 setTriggerStatements
					[
						""this"", 
						""
							DEBUGLOG """"INTERRUPTING THE SCENE"""";
							BIS_scenesController setFSMVariable [""""sceneToStop"""", """"%1""""];
						"",
						""""
					];
					textLogFormat[""sceneCreateTrigger.sqf: Creating trigger for scene: %1 on position %5"", ""%1"", %5];
	
				   "
					,_sceneName, _side, _timeout, _DETECTIONAREA, _initPos
				]; 
}
else
{
	textLogFormat["sceneCreateTrigger.sqf: Deleting trigger BIS_SceneIntDetector%1", _sceneName_];
	call compile format ["deleteVehicle BIS_SceneIntDetector%1", _sceneName];
};