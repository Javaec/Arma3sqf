//[ "HIT HIT HIT missionname: %1", missionname ] call BIS_fnc_LogFormat;
//Initial showcase video
_titlecardfile =  "a3\missions_f_gamma\video\FACTION_OPFOR.ogv";
_titlecardtext =  "STR_A3_SHOWCASE_FACTION_OPFOR_TITLECARD";
_terminal = "O_UAVTerminal";

setdate [2035,7,27,16,10];

BIS_tasks =	[
				[ localize "str_a3_showcase_faction_OPFOR_Expo_Title", 			localize "str_a3_showcase_faction_OPFOR_Expo_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_OPFOR_expo_CA.paa", 		position BIS_mrkExpo, 		BIS_mrkExpo ],
				[ localize "str_a3_showcase_faction_OPFOR_Ground_Title",		localize "str_a3_showcase_faction_OPFOR_Ground_Description",		"\a3\Missions_F_Gamma\data\img\Faction_OPFOR_ground_CA.paa", 		position BIS_mrkGround, 	BIS_mrkGround ],
				[ localize "str_a3_showcase_faction_OPFOR_Air_Title", 			localize "str_a3_showcase_faction_OPFOR_Air_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_OPFOR_air_CA.paa", 		position BIS_mrkAir, 		BIS_mrkAir ],
				[ localize "str_a3_showcase_faction_OPFOR_Water_Title", 		localize "str_a3_showcase_faction_OPFOR_Water_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_OPFOR_water_CA.paa", 		position BIS_mrkWater, 		BIS_mrkWater ],
				[ localize "str_a3_showcase_faction_OPFOR_Autonomous_Title", 		localize "str_a3_showcase_faction_OPFOR_Autonomous_Description", 	"\a3\Missions_F_Gamma\data\img\Faction_OPFOR_autonomous_CA.paa", 	position BIS_mrkAutonomous, 	BIS_mrkAutonomous ],
				[ localize "str_a3_showcase_faction_OPFOR_Weapons_Title", 		localize "str_a3_showcase_faction_OPFOR_Weapons_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_OPFOR_weapons_CA.paa", 		position BIS_mrkWeapons, 	BIS_mrkWeapons ],
				[ localize "str_a3_rscdisplaymain_buttonexit", 				localize "str_a3_cfgtaskdescriptions_exit",				"\a3\Missions_F_Gamma\data\img\icon_exit_big_ca.paa", 			position BIS_mrkExit, 		BIS_mrkExit ] 
			];
_faction = "OPFOR";
_color = EAST call BIS_fnc_sideColor;
_estShotTarget = position BIS_mrkGround;
_estShotTextToDisplay = "STR_A3_Showcase_Showcase_Faction_OPFOR_Summary_text";
_estShotAlt = 200;
_estShotRadius = 200;                                                    //radius of circular movement
_estShotViewAngle = 90;													//vieving angle
_estShotCameraMovement = 1;
_estShotNATOSymbolPath = "\a3\ui_f\data\map\markers\nato\o_";
_estShotNATOSymbolsAddition = 	[
									[ _estShotNATOSymbolPath + "motor_inf.paa", 	_color, [BIS_mrkGround, 20, 0] call BIS_fnc_relPos , 1, 1, 0, "", 0], //todo: localize
									[ _estShotNATOSymbolPath + "mortar.paa",		_color, [BIS_mrkGround, 40, 0] call BIS_fnc_relPos , 1, 1, 0, "", 0] //todo: localize
								];
								
								
{   
	_spawned = [[_x select 0,"GROUND"],_x select 1,(ceil random 3),[0,0,0],(random 50)-25,{(random 6)-3}, true] call BIS_fnc_spawnObjects;  
}  foreach	[   
				[BIS_wOrdnance,"Box_EAST_AmmoOrd_F"],   
				[BIS_wBasic,"Box_EAST_Ammo_F"],   
				[BIS_wBasicWeapons,"Box_EAST_Wps_F"],   
				[BIS_wSpecial,"Box_EAST_WpsSpecial_F"],   
				[BIS_wSupport,"Box_EAST_Support_F"]  
			];	
								

_this = createTrigger ["EmptyDetector", [20798.982, 7233.9717]];
_this setTriggerArea [50, 50, -33.916985, true];
_this setTriggerActivation ["EAST", "PRESENT", false];
BIS_trg_ground1 = _this;
_trigger_0 = _this;

_this = createTrigger ["EmptyDetector", [20939.33, 7364.1846]];
_this setTriggerArea [15, 25, 140.31383, true];
_this setTriggerActivation ["EAST", "PRESENT", false];
BIS_trg_weapons1 = _this;
_trigger_2 = _this;

_this = createTrigger ["EmptyDetector", [20934.836, 7234.5024]];
_this setTriggerArea [80, 30, 30.962849, true];
_this setTriggerActivation ["EAST", "PRESENT", false];
BIS_trg_air1 = _this;
_trigger_4 = _this;

_this = createTrigger ["EmptyDetector", [21083.564, 7074.8643]];
_this setTriggerArea [50, 50, -168.45465, true];
_this setTriggerActivation ["EAST", "PRESENT", false];
BIS_trg_autonomous1 = _this;
_trigger_6 = _this;

_this = createTrigger ["EmptyDetector", [21862.799, 5977.4922, 5.9604645e-007]];
_this setTriggerArea [80, 80, -54.790211, true];
_this setTriggerActivation ["EAST", "PRESENT", false];
BIS_trg_water1 = _this;
_trigger_8 = _this;

_this = createTrigger ["EmptyDetector", [21099.68, 7382.5659]];
_this setTriggerArea [150, 30, -77.099617, true];
_this setTriggerActivation ["EAST", "PRESENT", false];
BIS_trg_restrictedarea1 = _this;
_trigger_10 = _this;

BIS_startExpo = 
{
	"EXPO is STARTING" call BIS_fnc_Log;
	_xpo = execVM "expo.sqf";
};