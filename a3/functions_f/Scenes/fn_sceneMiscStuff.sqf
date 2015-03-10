
/*********************************************************************
	Version:	1.0
	Name:		sceneMiscStuff
	DESCRIPTION:	Does the basic minor stuff for scene - cinema borders, map is denied etc.  
	PARAMETERS:	1) _cameraPositions - [[cameraTarget],[cameraPos]] - Coordinates. If BIS_debugScene is true then external camera is activated
			2) _skipInitBlackout - BOOL - if true, initial blackout is skipped
			3) _skipFinalBlackout - BOOL - if true, final blackout is skipped
			4) _noUseCheckTheWeapons - BOOL - if true, checking of weapon before scene is skipped
			5) _noUseLoadingScreen - BOOL - if true, loadingscreen is bypassed
			6) __excludedObjectsForIntruderDetector - ARRAY of objects - objects will be excluded from intruder detector
	RETURNED VALUE:	
**********************************************************************/
private["_cameraTarget", "_cameraPos", "_sceneScopeGroup", "_skipInitBlackout", "_skipFinalBlackout", "_noUseLoadingScreen", "_disableSavingDuringScene"];
private["_excludedObjectsForIntruderDetector"];
//_viewDistanceBeforeScene = viewDistance;
//setViewDistance 400;
/*
_disableSavingDuringScene = true;						//default: saving during scene is 
if((count _this) > 5) then	
{
	_disableSavingDuringScene = _this select 5;
};
*/

_nic = [objNull, objNull, rFADEMUSIC, 3, 0, objNull] spawn RE;		//if music is playing then stop it smoothly

clearRadio;
enableSentences false;
MAX_PRELOADTIME = 6;
_t = time;
textLogFormat ["MiscStuff: Waiting for camera preload but max %1 seconds", MAX_PRELOADTIME];
waitUntil{(time > _t + MAX_PRELOADTIME) || (preloadCamera getpos player)};
_cameraTarget = [0,0,0];
_cameraPos = [0,0,0];
_skipInitBlackout = false;
_sceneScopeGroup = createGroup sideLogic; 
"Logic" createUnit [[1000,10,0], _sceneScopeGroup, "BIS_sceneLogic = this"];
DEBUGLOG "MiscStuff: Waiting for logic has been created";
if(isNull _sceneScopeGroup) then
{
	DEBUGLOG "sceneMiscStuff ERROR: cannot create new group! Trying create logic in BIS_W_F_GroupLogic";
	"Logic" createUnit [[1000,10,0], BIS_WF_GroupLogic, "BIS_sceneLogic = this"];
	
	if(isNil"BIS_sceneLogic") then
	{
		DEBUGLOG "sceneMiscStuff ERROR: cannot create even in BIS_W_F_GroupLogic - SKIPPING SCENE";
		BIS_scenesController setFSMVariable ["sceneToStop", BIS_scenesController getFSMVariable "currentrunningscene"];
	};
};
WaitUntil{!isNil"BIS_sceneLogic"};
DEBUGLOG "MiscStuff: Logic has been created!";
publicVariable "BIS_sceneLogic";
BIS_sceneLogic setVariable ["_skipInitialBlackout", false];
BIS_sceneLogic setVariable ["_skipFinalBlackout", false];
BIS_sceneLogic setVariable ["_noUseCheckTheWeapons", false];
BIS_sceneLogic setVariable ["_noUseLoadingScreen", false];
BIS_sceneLogic setVariable ["_endDone", false];
BIS_sceneLogic setVariable ["_excludedObjectsForIntruderDetectorLogic", []];

if((count _this) > 0) then	
{
	_cameraTarget =	(_this select 0) select 0;
	_cameraPos = (_this select 0) select 1;
};
if((count _this) > 1) then
{
	_skipInitBlackout = _this select 1; 
	if(!isnil "_skipInitBlackout") then
	{
		BIS_sceneLogic setVariable ["_skipInitialBlackout", _skipInitBlackout];
	};
};
if((count _this) > 2) then
{
	_skipFinalBlackout = _this select 2; 
	if(!isnil "_skipFinalBlackout") then
	{
		DEBUGLOG "sceneMiscStuff: _skipFinalBlackout";
		BIS_sceneLogic setVariable ["_skipFinalBlackout", _skipFinalBlackout];
	};
};
if(((count _this) > 3)) then
{
	
	_noUseCheckTheWeapons = _this select 3; 
	if(!isNil "_noUseCheckTheWeapons") then
	{
		DEBUGLOG "sceneMiscStuff: _skipWeaponCheck";
		BIS_sceneLogic setVariable ["_noUseCheckTheWeapons", _noUseCheckTheWeapons];
	};
};
if(((count _this) > 4)) then
{
	_noUseLoadingScreen = _this select 4;
	if(!isNil "_noUseLoadingScreen") then
	{	
		DEBUGLOG "sceneMiscStuff: skipping loading screen";
		BIS_sceneLogic setVariable ["_noUseLoadingScreen", _noUseLoadingScreen];
	};
};

if(((count _this) > 5)) then
{
	 
	_excludedObjectsForIntruderDetector = _this select 5;
	if(!isNil "_excludedObjectsForIntruderDetector") then
	{
		DEBUGLOG "sceneMiscStuff: excluded objects for intruder detector passed";
		BIS_sceneLogic setVariable ["_excludedObjectsForIntruderDetectorLogic", _excludedObjectsForIntruderDetector];
	};
};

if(((count (units group player))< 4)) then
{
	BIS_sceneLogic setVariable ["_noUseCheckTheWeapons", true];
};


if(!(BIS_sceneLogic getVariable "_noUseCheckTheWeapons")) then
{
	//_x = [] call BIS_fnc_sceneCheckWeapons;
};
_blackinTime = 1.5;
[(_this select 0), _cameraTarget, _cameraPos, _blackinTime]spawn
{
	
	DEBUGLOG "sceneMiscStuff: Running";
	private["_state", "_blackinTime", "_cameraTarget", "_cameraPos"];
	_cameraTarget = _this select 1;
	_cameraPos = _this select 2;
	_state = _this select 0;
	_blackinTime = _this select 3;
	//_viewDistanceBeforeScene = _this select 4;
	BIS_WF_DisableTitles = true;		//switch off the warfare blackouts

	if(BIS_debugScene) then
	{
		//CAMERA
		_camera = "camera" camCreate (position player);
		_camera cameraEffect ["internal","front"];
		_camera camPrepareTarget _cameraTarget;
		_camera camPreparePos _cameraPos;
		_camera camPrepareFOV 0.700;  
		_camera camCommitPrepared 0;  
		_camera camCommand "Manual on";
		waitUntil{camCommitted _camera};
		BIS_sceneLogic setVariable ["_doTheBlackIN", false];
		//_nic = [objNull, objNull, rFADESOUND, 0, 0.0, objNull] spawn RE;
	};

	if(!BIS_debugScene) then
	{
		
		if(!(BIS_sceneLogic getVariable "_skipInitialBlackout")) then
		{
			DEBUGLOG "sceneMiscStuff: Initial BLACK OUT activated";
			_nic = [objNull, objNull, rTITLECUT, "", "BLACK OUT", _blackinTime] call RE;
			Sleep _blackinTime*2;
		}else
		{
			DEBUGLOG "sceneMiscStuff: Initial BLACK OUT skipped";
		};
		if(!(BIS_sceneLogic getVariable "_noUseLoadingScreen")) then
		{
			StartLoadingScreen["","RscDisplayLoadMission"];
			//startLoadingScreen[""];
		};
				
		//showMap FALSE;
		showWatch FALSE;		
		showCompass FALSE;
		showGPS FALSE;
		showHUD false;
		//TIME ACCEL DENIED
		_xHandleAccTime = []spawn
		{
			
			BIS_sceneLogic setVariable ["_accTimeControl", true];
			while{(BIS_sceneLogic getVariable "_accTimeControl")} do
			{
				if(accTime != 1.0) then {setAccTime 1.0;};
				Sleep 0.001;				 				
			};
		};	
		_xHandle3rdCamera = []spawn
		{
			
			BIS_sceneLogic setVariable ["_deny3rdCamera", true];
			while{(BIS_sceneLogic getVariable "_deny3rdCamera")} do
			{
				player switchCamera "INTERNAL";
				Sleep 0.001;				 				
			};
			
		};	
				
		DEBUGLOG "sceneMiscStuff: Waiting for BLACK IN";
		BIS_sceneLogic setVariable ["_doTheBlackIN", false];
		WaitUntil{(BIS_sceneLogic getVariable "_doTheBlackIN")};
		//_nic = [objNull, objNull, rFADESOUND, 0, 1.0, objNull] spawn RE;
		enableRadio true;
		DEBUGLOG "sceneMiscStuff: BLACK IN activated";
		BIS_sceneLogic setVariable ["_doTheBlackIN", false]; 
		
		//_ret=createDialog "RscCinemaBorder";
		endLoadingScreen;
		Sleep _blackinTime*3;
		_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", _blackinTime*3] call RE;
		Sleep _blackinTime*3;
		//disableUserInput true;
	};

	_xHandle = []spawn
	{
		//activate the intruder detection
		_x = [nil, nil, (BIS_sceneLogic getVariable "_excludedObjectsForIntruderDetectorLogic")] call BIS_fnc_sceneIntruderDetector
	};		
	WaitUntil{!(isNil "BIS_sceneIntruderDetectorLogic")};
	WaitUntil{!(isNil {BIS_sceneIntruderDetectorLogic getVariable "_detectInProgress"})};
	WaitUntil{BIS_sceneIntruderDetectorLogic getVariable "_detectInProgress"};
	if(!isnil "BIS_scenesController") then
	{
		BIS_sceneState = true;
		PublicVariable "BIS_sceneState";
	}
	else
	{
		if(BIS_debugModules) then {DEBUGLOG "sceneMiscStuff: Scene is not possible to skip - BIS_scenesController is not running"};
	};
		
	DEBUGLOG "sceneMiscStuff: Waiting for END OF SCENE";
	BIS_sceneLogic setVariable ["_doTheEndOfScene", false];
	WaitUntil{(BIS_sceneLogic getVariable "_doTheEndOfScene")};
	DEBUGLOG "sceneMiscStuff: END OF SCENE activated";
	BIS_sceneIntruderDetectorLogic setVariable ["_detectInProgress", false];	//intruder checking is disabled
	BIS_sceneState = false;
	enableRadio false;
	//SCENE ENDS
	if(!BIS_debugScene) then
	{
		if(!(BIS_sceneLogic getVariable "_skipFinalBlackout")) then
		{
			_nic = [objNull, objNull, rTITLECUT, "", "BLACK OUT", _blackinTime/2] call RE;
			//_nic = [objNull, objNull, rFADESOUND, 0, 0.0, objNull] spawn RE;
			//Sleep _blackinTime;
			_t = time;
			WaitUntil{time > _t + 2};
			BIS_sceneLogic setVariable ["_endDone", true];
			DEBUGLOG "WHITE OUT2";
			if(!(BIS_sceneLogic getVariable "_noUseLoadingScreen")) then
			{
				StartLoadingScreen["","RscDisplayLoadMission"];
				//startLoadingScreen[""];
			};
			DEBUGLOG "sceneMiscStuff: Waiting for final BLACK IN";
			WaitUntil{(BIS_sceneLogic getVariable "_doTheBlackIN")};
			BIS_sceneLogic setVariable ["_doTheBlackIN", false]; 
		}
		else
		{
			DEBUGLOG "sceneMiscStuff: Final BLACK IN skipped";
		};
		
		closeDialog 0;
		//disableUserInput true;
		//TIME ACCEL GRANTED
		BIS_sceneLogic setVariable ["_accTimeControl", FALSE];
		BIS_sceneLogic setVariable ["_deny3rdCamera", FALSE];
		//showMap TRUE;
		showWatch TRUE;
		showCompass TRUE;
		showGPS TRUE;
		showHUD true;
		if(!(BIS_sceneLogic getVariable "_noUseCheckTheWeapons")) then
		{
			//_x = ["getTheWeaponsBack"] call BIS_fnc_sceneCheckWeapons;	
		};
	};
	//setViewDistance _viewDistanceBeforeScene;
	endLoadingScreen;
	if(!(BIS_sceneLogic getVariable "_skipFinalBlackout")) then
	{
		DEBUGLOG "sceneMiscStuff: Final BLACK IN activated";
		_nic = [objNull, objNull, rTITLECUT, "", "BLACK IN", _blackinTime*7] call RE;
		//_nic = [objNull, objNull, rFADESOUND, 0, 1.0, objNull] spawn RE;
		enableRadio true;
		Sleep _blackinTime*3;
	}
	else
	{
		DEBUGLOG "sceneMiscStuff: Final BLACK OUT skipped";
	};
	
	BIS_WF_DisableTitles = nil;		//switch on the warfare blackouts
	deleteVehicle BIS_sceneLogic;
	BIS_sceneLogic = nil;
	publicVariable "BIS_sceneLogic";
	clearRadio;
	enableSentences true;
	PublicVariable "BIS_sceneState";
	DEBUGLOG "sceneMiscStuff: END";
};

WaitUntil{!isnil"BIS_sceneLogic"};
WaitUntil{!(BIS_sceneLogic getVariable "_doTheBlackIN")};
//Sleep _blackinTime;