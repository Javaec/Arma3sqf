sleep 1;

// Display credits
private ["_credits"];
_credits = [] spawn {
	disableSerialization;
	
	scriptName "intro.sqf: credits";
	
	// Create BI display
	private ["_layerBI"];
	_layerBI = "BIS_layerBI" call BIS_fnc_rscLayer;
	_layerBI cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_displayBI"];
	_displayBI = uiNamespace getVariable "BIS_dynamicText";
	
	// Create Presents display
	private ["_layerPresents"];
	_layerPresents = "BIS_layerPresents" call BIS_fnc_rscLayer;
	_layerPresents cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_displayPresents"];
	_displayPresents = uiNamespace getVariable "BIS_dynamicText";
	
	// Setup controls
	private ["_ctrlBI", "_ctrlPresents"];
	_ctrlBI = _displayBI displayCtrl 9999;
	_ctrlPresents = _displayPresents displayCtrl 9999;
	
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach [_ctrlBI, _ctrlPresents];
	
	// Compose strings
	private ["_stringBI", "_stringPresents"];
	_stringBI = "<t align = 'center' size = '1.25' font = 'PuristaBold'>" + (toUpper (localize "STR_A3_Bohemia_Interactive")) + "</t>";
	_stringPresents = "<t align = 'center' size = '0.75'>" + (toUpper (localize "STR_MAINTITLES_02")) + "</t>";
	
	// Parse strings
	private ["_parsedBI", "_parsedPresents"];
	_parsedBI = parseText _stringBI;
	_parsedPresents = parseText _stringPresents;
	
	// Position controls
	_ctrlBI ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.475 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	_ctrlPresents ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.525 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	// Add text
	_ctrlBI ctrlSetStructuredText _parsedBI;
	_ctrlPresents ctrlSetStructuredText _parsedPresents;
	{_x ctrlCommit 0} forEach [_ctrlBI, _ctrlPresents];
	
	// Show BI first
	_ctrlBI ctrlSetFade 0;
	_ctrlBI ctrlCommit 3;
	
	sleep 0.75;
	
	// Show Presents next
	_ctrlPresents ctrlSetFade 0;
	_ctrlPresents ctrlCommit 3;
	
	sleep 5.25;
	
	// Hide text
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 3;
	} forEach [_ctrlBI, _ctrlPresents];
	
	sleep 3;
};

0 fadeMusic 1;
playMusic "LeadTrack01_F_Bootcamp";

sleep 3;

playSound ["vr_goggles", true];

sleep 3;

"01_Start" spawn BIS_fnc_missionConversations;

waitUntil {scriptDone _credits};

10 fadeMusic 0.4;

titleRsc ["RscStatic", "PLAIN"];
playSound ["RscDisplayCurator_visionMode", true];
enableEnvironment true;

private ["_video"];
_video = ["A3\Missions_F_Bootcamp\video\VR_BOOT.ogv"] spawn BIS_fnc_playVideo;

sleep 2;

"05_Turn_On" spawn BIS_fnc_missionConversations;

sleep 9;

["#(argb,8,8,3)color(0,0,0,1)", [safeZoneX, safeZoneY, safeZoneW, safeZoneH], [5,5], 1, 1] spawn BIS_fnc_textTiles;

sleep 1;

titleRsc ["RscStatic", "PLAIN"];

sleep 1;

30 fadeMusic 0.01;

("BIS_blackIn" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
//playSound "border_in";
playSound "Topic_Done";

// Display logo
private ["_logo"];
_logo = [] spawn {
	disableSerialization;
	
	scriptName "intro.sqf: logo";
	
	// Create A3 display
	private ["_layerA3"];
	_layerA3 = "BIS_layerA3" call BIS_fnc_rscLayer;
	_layerA3 cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_displayA3"];
	_displayA3 = uiNamespace getVariable "BIS_dynamicText";
	
	// Create Bootcamp display
	private ["_layerBoot"];
	_layerBoot = "BIS_layerBoot" call BIS_fnc_rscLayer;
	_layerBoot cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_displayBoot"];
	_displayBoot = uiNamespace getVariable "BIS_dynamicText";
	
	// Setup controls
	private ["_ctrlA3", "_ctrlBoot"];
	_ctrlA3 = _displayA3 displayCtrl 9999;
	_ctrlBoot = _displayBoot displayCtrl 9999;
	
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach [_ctrlA3, _ctrlBoot];
	
	// Compose strings
	private ["_stringA3", "_stringBoot"];
	_stringA3 = "<t align = 'center' size = '1.5' font = 'PuristaBold'>" + (toUpper (localize "STR_A3_CfgMods_A30")) + "</t>";
	_stringBoot = "<t align = 'center' size = '1.043' font = 'PuristaBold'>" + (toUpper (localize "STR_A3_BootcampName")) + "</t>";
	
	// Parse strings
	private ["_parsedA3", "_parsedBoot"];
	_parsedA3 = parseText _stringA3;
	_parsedBoot = parseText _stringBoot;
	
	// Position controls
	_ctrlA3 ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.33 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	_ctrlBoot ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.378 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	
	// Add text
	_ctrlA3 ctrlSetStructuredText _parsedA3;
	_ctrlBoot ctrlSetStructuredText _parsedBoot;
	{_x ctrlCommit 0} forEach [_ctrlA3, _ctrlBoot];
	
	// Show A3 first
	_ctrlA3 ctrlSetFade 0;
	_ctrlA3 ctrlCommit 1;
	
	sleep 1.75;
	
	// Show Bootcamp next
	_ctrlBoot ctrlSetFade 0;
	_ctrlBoot ctrlCommit 2;
	
	waitUntil {BIS_hideLogo};
	
	// Hide text
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach [_ctrlA3, _ctrlBoot];
};

sleep 0.5;

"d01_Reveal" call BIS_fnc_missionConversations;

// Hide logo
BIS_hideLogo = true;

// Move Adams
private ["_script"];
_script = [BIS_adamsFake, markerPos "BIS_adams_pos1"] spawn BIS_moveObject;

sleep 0.5;

private ["_conv"];
_conv = "10_Surprised" spawn BIS_fnc_missionConversations;

waitUntil {scriptDone _script};

sleep 0.5;

// Spawn selector
BIS_startSelector = [markerPos "BIS_move1"] call BIS_fnc_VRSpawnSelector;
BIS_startSelector call BIS_fnc_VRSpawnEffect;
["BIS_startMarker", "CREATE", markerPos "BIS_move1"] call BIS_markerControl;

waitUntil {scriptDone _conv};

sleep 1;

"15_Move" call BIS_fnc_missionConversations;

// Deactivate marker
["BIS_firstMarker", "DEACTIVATE"] call BIS_markerControl;
playSound "Topic_Trigger";

// Give player his weapon
BIS_lacey addWeapon "arifle_MX_Black_F";
BIS_lacey selectWeapon primaryWeapon BIS_lacey;

// Give player control again
selectPlayer BIS_lacey;
deleteVehicle BIS_laceyFake;
vehicle BIS_lacey switchCamera "INTERNAL";
{BIS_lacey enableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
BIS_lacey playMoveNow "AmovPercMstpSnonWnonDnon";

[1, 1, false] spawn BIS_fnc_cinemaBorder;

// Show meta data
cutRsc ["RscVRMeta", "PLAIN"];

// Register that the intro ended
BIS_introEnded = true;