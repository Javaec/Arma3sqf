// Clear destination marker
["BIS_investigate", objNull] call BIS_fnc_taskSetDestination;

3 fadeSound 0;
titleCut ["", "BLACK OUT", 3];

sleep 3;

// Remove zone restriction
BIS_AO3 triggerAttachVehicle [];

clearRadio;
enableEnvironment false;

[0, 0, false, true] spawn BIS_fnc_cinemaBorder;

// Position player
BIS_lacey switchMove "HubSpectator_stand";
BIS_lacey setPos markerPos "BIS_lacey_pos1";
BIS_lacey setDir markerDir "BIS_lacey_pos1";
BIS_lacey setVelocity [0,0,0];

sleep 1;

// Move to fake entity
selectPlayer BIS_laceyFake;
vehicle BIS_lacey switchCamera "INTERNAL";
{BIS_lacey disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_lacey enableMimics false;

sleep 2;

// Ensure player has a rifle
if (primaryWeapon BIS_lacey == "") then {
	BIS_lacey addWeapon "arifle_MX_F";
	BIS_lacey selectWeapon primaryWeapon BIS_lacey;
};

// Conway's animations
BIS_lacey setPos markerPos "BIS_lacey_pos1";
BIS_lacey setDir markerDir "BIS_lacey_pos1";
BIS_lacey switchMove "Acts_Abuse_Lacey";

// Abusive animations
BIS_abuser switchMove "Acts_Abuse_abusing";
BIS_abused switchMove "Acts_Abuse_abuser";

{
	_x setPos markerPos "BIS_abusivePos";
	_x setDir markerDir "BIS_abusivePos";
	_x hideObject false;
	_x enableSimulation true;
	_x enableAI "ANIM";
} forEach [BIS_abuser, BIS_abused];

sleep 1;

BIS_lacey setPos markerPos "BIS_lacey_pos1";
BIS_lacey setDir markerDir "BIS_lacey_pos1";

// Succeed task
["BIS_investigate", "SUCCEEDED"] call BIS_fnc_missionTasks;

enableEnvironment true;
3 fadeSound 1;
titleCut ["", "BLACK IN", 3];

sleep 3;

// Initial face-to-face confrontation
"45_Aftermath_1" spawn BIS_fnc_missionConversations;

sleep 4.5;

// Prisoner pushed over
BIS_abused say3D "surrender_fall";

sleep 0.5;

// Let Akhanteros move
BIS_IHQ enableSimulation true;

// Move CSAT
BIS_shadow1 setPos markerPos "BIS_shadow1_pos";
BIS_shadow1 setDir markerDir "BIS_shadow1_pos";

// Move Adams into position
{BIS_adams disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_adams enableMimics false;
BIS_adams setPos markerPos "BIS_adams_pos1";
BIS_adams setDir markerDir "BIS_adams_pos1";

sleep 15;

// Prisoner gets back up
BIS_abused say3D "surrender_stand_up";

// Move Kerry
{BIS_truckD disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_truckD setPos markerPos "BIS_truckD_pos";
BIS_truckD setDir markerDir "BIS_truckD_pos";

sleep 14;

// Radio contact
"45_Aftermath_2" spawn BIS_fnc_missionConversations;

sleep 16;

0 fadeMusic 0.4;
playMusic "AmbientTrack01_F_EPB";

sleep 3.5;

// Being ordered to stand down
"45_Aftermath_3" spawn BIS_fnc_missionConversations;

sleep 15;

// Final snide remark
"45_Aftermath_4" spawn BIS_fnc_missionConversations;

sleep 5.5;

// Anger Rising
"d01_Hate" spawn BIS_fnc_missionConversations;

sleep 4;

titleCut ["", "BLACK OUT", 3];

sleep 3;

3 fadeSound 0;
5 fadeMusic 1;

sleep 3;

// Remove cinema borders
[1, 0, false] spawn BIS_fnc_cinemaBorder;

// Move player
BIS_lacey switchMove "HubSpectator_stand";
BIS_lacey enableSimulation false;
BIS_lacey setPos markerPos "BIS_lacey_pos2";
BIS_lacey setDir markerDir "BIS_lacey_pos2";
selectPlayer BIS_lacey;
vehicle BIS_lacey switchCamera "INTERNAL";
{BIS_lacey enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];

// Move Adams
BIS_adams setPos markerPos "BIS_adams_pos2";
BIS_adams setDir markerDir "BIS_adams_pos2";

// Delete incident scene
["BIS_incident", true] call BIS_fnc_deleteScene;

// Spawn ending scene
["BIS_ending", true] call BIS_fnc_loadScene;

sleep 1;

// Add cinema borders
[0, 0, false] spawn BIS_fnc_cinemaBorder;

sleep 1.5;

20 fadeMusic 0;

clearRadio;

// Show sometime later screen
private ["_sometimeLater"];
_sometimeLater = ["\A3\Missions_F_Bootcamp\video\BOOT_m05_sometime_later.ogv"] spawn BIS_fnc_playVideo;
if (language != "English") then {titleText [localize "STR_A3_B_in2_sometime_hours_later", "PLAIN DOWN"]};

[] spawn {
	sleep 6;
	
	// Spawn helicopter
	["BIS_heliFlyover", true] call BIS_fnc_loadScene;
};

waitUntil {scriptDone _sometimeLater};

sleep 2;

// Play animations
BIS_lacey enableSimulation true;
BIS_lacey switchMove "Acts_Ending_Lacey1";
BIS_adams switchMove "Acts_Ending_Adams1";

vehicle BIS_lacey switchCamera "INTERNAL";

enableEnvironment true;
3 fadeSound 1;
titleCut ["", "BLACK IN", 3];

sleep 2.25;

"d05_Results" spawn BIS_fnc_missionConversations;

sleep 2;

// Send plane
["BIS_planeFlyby", true] call BIS_fnc_loadScene;

sleep 13;

0 fadeMusic 0.4;
playMusic "EventTrack01_F_EPC";

sleep 7;

"d10_Ending" spawn BIS_fnc_missionConversations;

sleep 6;

5 fadeSound 0;
titleCut ["", "BLACK OUT", 5];

sleep 5;

// Create camera facing upwards
private ["_camera"];
_camera = "Camera" camCreate [10,10,10];
_camera cameraEffect ["INTERNAL", "BACK"];

_camera camPreparePos position BIS_lacey;

_camera camPrepareTarget [
	position BIS_lacey select 0,
	position BIS_lacey select 1,
	1000
];

_camera camPrepareFOV 0.5;
_camera camCommitPrepared 0;

// Clear everything
{deleteVehicle _x} forEach (allUnits + vehicles - [BIS_lacey]);

sleep 1;

0 fadeMusic 1;
clearRadio;

sleep 1;

// Epilogue
private ["_epilogue"];
_epilogue = [] spawn {
	disableSerialization;
	
	scriptName "ending.sqf: epilogue";
	
	// Create 1st line display
	private ["_layer1"];
	_layer1 = "BIS_layerEpilogue1" call BIS_fnc_rscLayer;
	_layer1 cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_display1"];
	_display1 = uiNamespace getVariable "BIS_dynamicText";
	
	// Create 2nd line display
	private ["_layer2"];
	_layer2 = "BIS_layerEpilogue2" call BIS_fnc_rscLayer;
	_layer2 cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_display2"];
	_display2 = uiNamespace getVariable "BIS_dynamicText";
	
	// Create 3rd line display
	private ["_layer3"];
	_layer3 = "BIS_layerEpilogue3" call BIS_fnc_rscLayer;
	_layer3 cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_display3"];
	_display3 = uiNamespace getVariable "BIS_dynamicText";
	
	// Setup controls
	private ["_ctrl1", "_ctrl2", "_ctrl3"];
	_ctrl1 = _display1 displayCtrl 9999;
	_ctrl2 = _display2 displayCtrl 9999;
	_ctrl3 = _display3 displayCtrl 9999;
	
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach [_ctrl1, _ctrl2, _ctrl3];
	
	// Compose strings
	private ["_string1", "_string2", "_string3"];
	_string1 = "<t align = 'center' size = '0.5'>" + (localize "STR_A3_BOOT_m05_Epilogue_1") + "</t>";
	_string2 = "<t align = 'center' size = '0.5'>" + (localize "STR_A3_BOOT_m05_Epilogue_2") + "</t>";
	_string3 = "<t align = 'center' size = '0.5'>" + (localize "STR_A3_BOOT_m05_Epilogue_3") + "</t>";
	
	// Parse strings
	private ["_parsed1", "_parsed2", "_parsed3"];
	_parsed1 = parseText _string1;
	_parsed2 = parseText _string2;
	_parsed3 = parseText _string3;
	
	// Position controls
	_ctrl1 ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.475 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	_ctrl2 ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.5 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	_ctrl3 ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.525 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	// Add text
	_ctrl1 ctrlSetStructuredText _parsed1;
	_ctrl2 ctrlSetStructuredText _parsed2;
	_ctrl3 ctrlSetStructuredText _parsed3;
	{_x ctrlCommit 0} forEach [_ctrl1, _ctrl2, _ctrl3];
	
	// Show 1st line first
	_ctrl1 ctrlSetFade 0;
	_ctrl1 ctrlCommit 5;
	
	sleep 8;
	
	// Show 2nd line next
	_ctrl2 ctrlSetFade 0;
	_ctrl2 ctrlCommit 5;
	
	sleep 8;
	
	// Show final line
	_ctrl3 ctrlSetFade 0;
	_ctrl3 ctrlCommit 5;
	
	sleep 10;
	
	// Hide all of them
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 3;
	} forEach [_ctrl1, _ctrl2, _ctrl3];
	
	waitUntil {{!(ctrlCommitted _x)} count [_ctrl1, _ctrl2, _ctrl3] == 0};
};

waitUntil {scriptDone _epilogue};

sleep 2;

// Terminate camera
_camera cameraEffect ["TERMINATE", "BACK"];
camDestroy _camera;

// Unlock achievement
setStatValue ["BCFirstDeployment", 1];

// End campaign
endMission "END1";