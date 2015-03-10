private [ "_whiteboards", "_whiteboardtexture", "_whiteboardtexturepath", "_faction", "_color" ];
private [ "_estShotTarget","_estShotTextToDisplay","_estShotAlt","_estShotRadius","_estShotViewAngle","_estShotCameraMovement", "_estShotNATOSymbolPath", "_estShotNATOSymbols", "_estShotNATOSymbolsAddition" ];
private [ "_titlecardfile", "_titlecardtext", "_expo", "_conv", "_terminal" ];

_classes = [ "Ground", "Air", "Water", "Autonomous", "Weapons", "Expo" ];
_whiteboardtexturepath = "\a3\Missions_F_Gamma\data\img\whiteboards\";
_faction = "no faction";
_estShotTarget = [0,0,0];
_estShotNATOSymbolPath = "\a3\ui_f\data\map\markers\nato\o_";

switch ( missionname ) do
{
	case "Faction_BLUFOR_3D";
	case "Faction_BLUFOR":
	{
		#include "initblufor.sqf";	
	}; 	
	case "Faction_OPFOR_3D";
	case "Faction_OPFOR":
	{
		#include "initopfor.sqf";
	}; 	
	case "Faction_INDEPENDENT_3D";
	case "Faction_INDEPENDENT":
	{
		#include "initindependent.sqf";
	};

}; 

//titlecard video
[ _titlecardfile, _titlecardtext ] spawn BIS_fnc_titlecard;


{
	_x call BIS_fnc_missionTasks;	
}  foreach [ "BIS_Explore" ];


BIS_player addItem _terminal;
BIS_player assignItem _terminal;

//_spawned = [ [BIS_UAVTable, "TOP"], "Land_UAV_Control_Terminal_F" ,1,[0.0,0.0,0.00],(random 10),nil, false] call BIS_fnc_spawnObjects;
_spawned = [ [BIS_UAVTable, "TOP"], "Land_Laptop_unfolded_F" ,1,[0.0,0.0,0.00],(random 10),nil, false] call BIS_fnc_spawnObjects;
_spawned = [ [BIS_UAVTable2, "TOP"], "B_UAV_01_F" ,1,[0.0,0.0,0.0],(random 10),nil, false] call BIS_fnc_spawnObjects;
_spawned = [ [BIS_mainTable01, "TOP"], "Land_Laptop_F" ,1,[0.0,0.0,0.0],(random 10),nil, false] call BIS_fnc_spawnObjects;
_spawned = [ [BIS_mainTable02, "TOP"], "Land_Laptop_unfolded_F" ,1,[0.0,0.0,0.0],(random 10),nil, false] call BIS_fnc_spawnObjects;
_spawned = [ [BIS_mainTable02, "TOP"], "Land_Can_V2_F" ,1,[0.4,-0.0,0.0],(random 10),nil, false] call BIS_fnc_spawnObjects;
//_spawned = [ [BIS_AirTable1, "TOP"], "Land_File1_F" ,1,[0.4,-0.0,0.03],(random 10)] call BIS_fnc_spawnObjects;


{ [ _x ] call BIS_QuickMove_addAction } foreach [BIS_whiteboardGround, BIS_whiteboardAir, BIS_whiteboardWater, BIS_whiteboardAutonomous, BIS_whiteboardWeapons, BIS_whiteboardExpo];



player setpos getpos BIS_mrkGround;
player setdir getdir BIS_mrkGround;

{
	if ((count units group _x) > 1) then
	{
		_group = createGroup (side _x);
		[_x] join _group;
	};
}
forEach allUnits;



_ret = [ "Init", [allunits - [player]] ] call BIS_fnc_moduleFriendlyFire;

{
	//[ "BIS_whiteboard%1 setObjectTexture [0, ""%2whiteboard_faction_%3_%1_CO""] ", _x, _whiteboardtexturepath, _faction] call BIS_fnc_LogFormat;
	call compile format [ "BIS_whiteboard%1 setObjectTexture [0, ""%2whiteboard_faction_%3_%1_CO""] ", _x, _whiteboardtexturepath, _faction];
	
} foreach  _classes;

{ hideObject _x } forEach allMissionObjects "Helper_Base_F";

{
	{ _x enableSimulation false } foreach (allMissionObjects _x);
} forEach [ "Land_CampingTable_F", "Land_CampingTable_small_F", "Land_CampingChair_V1_F", "Land_CampingChair_V2_F" ];


//create marker for the restricted area
BIS_mrkRestrictedArea = createMarker [ "", position BIS_trg_restrictedarea1 ]; 
BIS_mrkRestrictedArea setMarkerShape "RECTANGLE"; 
BIS_mrkRestrictedArea setMarkerBrush "Horizontal"; 
BIS_mrkRestrictedArea setMarkerSize [triggerArea BIS_trg_restrictedarea1 select 0, triggerArea BIS_trg_restrictedarea1 select 1];
BIS_mrkRestrictedArea setMarkerDir (triggerArea BIS_trg_restrictedarea1 select 2); 
BIS_mrkRestrictedArea setMarkerColor "ColorRed";
BIS_mrkRestrictedArea setMarkerAlpha 0.4;

//trigger for exitting the showcase
BIS_SF_trgExit=createTrigger["EmptyDetector", position BIS_mrkExit];  
BIS_SF_trgExit setTriggerArea[10,10,0,false];  
BIS_SF_trgExit setTriggerActivation[ "VEHICLE","PRESENT",true];
BIS_SF_trgExit triggerAttachVehicle [player];
BIS_SF_trgExit setTriggerStatements ["this", "call BIS_exitShowcase", ""]; 


waitUntil {!(isNil "BIS_fnc_titlecard_finished")};

BIS_exitShowcase =
{
	 _calledfrom = [_this, 0, 0, [0]] call BIS_fnc_param;    
	if(_calledfrom == 1) then
	{
		titleCut ["", "BLACK FADED", 10e10];
		 ["_calledfrom:%1", _calledfrom ] call BIS_fnc_LogFormat;
		 BIS_SF_trgExit setTriggerStatements ["this", "", ""];	//deactivate exit trigger otherwise it will happen twice                 
	}
	else
	{
		titleCut ["", "BLACK OUT", 2];
		["_calledfromelse:%1", _calledfrom ] call BIS_fnc_LogFormat;
	};
	[] spawn
	{
		Sleep 2;
		"" call BIS_fnc_endMission;
		player setpos position BIS_mrkExit;
		player setdir getdir BIS_mrkExit;
		player switchMove "Acts_PercMwlkSlowWrflDf2"; 
		titleCut ["", "BLACK IN", 2];
	};	
};
			   
/*
"Logic" createUnit [position player, Group player, "BIS_Expo = this"];
private ["_rand"];
_rand = floor random 3;
xx = ["01_B_ExpoWelcome", "Faction_BLUFOR", [["EXB",_rand],["EXB",_rand]], "SIDE", { sleep 1 }] spawn BIS_fnc_kbTell;
*/


//Establishing Shot
_color set [3, 0.33];
_estShotNATOSymbols = 	[
							//Objects/positions/groups to display icons over
							//Syntax: [[icon, color, target, size X, size Y, angle, text, shadow]]
							[ _estShotNATOSymbolPath + "armor.paa", 			_color, getpos BIS_mrkGround, 1, 1, 0, "", 0], //todo: localize
							[ _estShotNATOSymbolPath + "inf.paa", 				_color, getpos BIS_mrkWeapons, 1, 1, 0, "", 0], //todo: localize
							[ _estShotNATOSymbolPath + "air.paa", 				_color, getpos BIS_mrkAir, 1, 1, 0, "", 0], //todo: localize
							[ _estShotNATOSymbolPath + "naval.paa",	 			_color, getpos BIS_mrkWater, 1, 1, 0, "", 0], //todo: localize
							[ _estShotNATOSymbolPath + "uav.paa", 				_color, getpos BIS_mrkAutonomous, 1, 1, 0, "", 0] //todo: localize
						];


[
	_estShotTarget,											//target
	localize _estShotTextToDisplay,						        //texttodisplay
	_estShotAlt,                                                    //altitude               	
	_estShotRadius,                                                    //radius of circular movement
	_estShotViewAngle,													//vieving angle
	_estShotCameraMovement,														//Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
	_estShotNATOSymbols + _estShotNATOSymbolsAddition
] spawn BIS_fnc_establishingShot;

player switchmove "amovpercmstpslowwrfldnon";

waitUntil { !isNil { BIS_missionStarted } };

titleCut ["", "BLACK FADED", 10e10];
_cam = "camera" camCreate (position player);
_cam cameraEffect ["INTERNAL", "BACK"];
_cam camPreparePos getpos player; 
_cam camPrepareDir getdir player;
_cam camCommitPrepared 0;
_cam camPreload 3; 
waitUntil {camPreloaded _cam};
_cam cameraEffect ["TERMINATE", "BACK"];
camDestroy _cam; 
titleCut ["", "BLACK IN", 3];





_conv = execVM "\a3\Missions_F_Gamma\Showcases\Faction_shared\conversations.sqf";
"Starting expo" call BIS_fnc_Log;
call BIS_startExpo;
