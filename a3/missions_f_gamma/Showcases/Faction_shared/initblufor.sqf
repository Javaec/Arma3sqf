//Initial showcase video
_titlecardfile =  "a3\missions_f_gamma\video\FACTION_BLUFOR.ogv";
_titlecardtext =  "STR_A3_SHOWCASE_FACTION_BLUFOR_TITLECARD";
_terminal = "B_UAVTerminal";

setdate [2035,7,27,17,15];


BIS_tasks =	[
				[ localize "str_a3_showcase_faction_BLUFOR_Expo_Title", 		localize "str_a3_showcase_faction_BLUFOR_Expo_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_BLUFOR_expo_CA.paa", 		position BIS_mrkExpo, 		BIS_mrkExpo ],
				[ localize "str_a3_showcase_faction_BLUFOR_Ground_Title", 		localize "str_a3_showcase_faction_BLUFOR_Ground_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_BLUFOR_ground_CA.paa", 		position BIS_mrkGround, 	BIS_mrkGround ],
				[ localize "str_a3_showcase_faction_BLUFOR_Air_Title",			localize "str_a3_showcase_faction_BLUFOR_Air_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_BLUFOR_air_CA.paa", 		position BIS_mrkAir, 		BIS_mrkAir ],
				[ localize "str_a3_showcase_faction_BLUFOR_Water_Title",		localize "str_a3_showcase_faction_BLUFOR_Water_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_BLUFOR_water_CA.paa", 		position BIS_mrkWater, 		BIS_mrkWater ],
				[ localize "str_a3_showcase_faction_BLUFOR_Autonomous_Title", 		localize "str_a3_showcase_faction_BLUFOR_Autonomous_Description", 	"\a3\Missions_F_Gamma\data\img\Faction_BLUFOR_autonomous_CA.paa", 	position BIS_mrkAutonomous, 	BIS_mrkAutonomous ],
				[ localize "str_a3_showcase_faction_BLUFOR_Weapons_Title", 		localize "str_a3_showcase_faction_BLUFOR_Weapons_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_BLUFOR_weapons_CA.paa", 		position BIS_mrkWeapons, 	BIS_mrkWeapons ],
				[ localize "str_a3_rscdisplaymain_buttonexit", 				localize "str_a3_cfgtaskdescriptions_exit",				"\a3\Missions_F_Gamma\data\img\icon_exit_big_ca.paa", 			position BIS_mrkExit, 		BIS_mrkExit ]
		];
			
_faction = "BLUFOR";					
_color = WEST call BIS_fnc_sideColor;
_estShotTarget = position BIS_mrkGround;
_estShotTextToDisplay = "STR_A3_Showcase_Showcase_Faction_BLUFOR_Summary_text";
_estShotAlt = 200;	
_estShotRadius = 200;                                                    //radius of circular movement
_estShotViewAngle = 270;													//vieving angle
_estShotCameraMovement = 1;
_estShotNATOSymbolPath = "\a3\ui_f\data\map\markers\nato\b_";
_estShotNATOSymbolsAddition = 	[
									[ _estShotNATOSymbolPath + "motor_inf.paa", 		_color, [BIS_mrkGround, 20, 90] call BIS_fnc_relPos , 1, 1, 0, "", 0], //todo: localize
									[ _estShotNATOSymbolPath + "mortar.paa",		_color, [BIS_mrkGround, 20, 0] call BIS_fnc_relPos , 1, 1, 0, "", 0], //todo: localize
									[ _estShotNATOSymbolPath + "mech_inf.paa", 		_color, [BIS_mrkGround, 20, 180] call BIS_fnc_relPos , 1, 1, 0, "", 0] //todo: localize
								]; 


{   
	_spawned = [[_x select 0,"GROUND"],_x select 1,(ceil random 3),[0,0,0],(random 50)-25,{(random 6)-3}, true] call BIS_fnc_spawnObjects;  
}  foreach	[   
				[BIS_wOrdnance,"Box_NATO_AmmoOrd_F"],   
				[BIS_wBasic,"Box_NATO_Ammo_F"],   
				[BIS_wBasicWeapons,"Box_NATO_Wps_F"],   
				[BIS_wSpecial,"Box_NATO_WpsSpecial_F"],   
				[BIS_wSupport,"Box_NATO_Support_F"]  
		];	



_this = createTrigger ["EmptyDetector", [14677.656, 16737.697]];
_this setTriggerArea [50, 50, -46.263603, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_ground1 = _this;
_trigger_1 = _this;

_this = createTrigger ["EmptyDetector", [14618.348, 16747.002]];
_this setTriggerArea [60, 25, -46.263603, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_ground2 = _this;
_trigger_3 = _this;

_this = createTrigger ["EmptyDetector", [14653.087, 16814.629]];
_this setTriggerArea [12, 20, -46.263603, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_weapons1 = _this;
_trigger_6 = _this;

_this = createTrigger ["EmptyDetector", [14621.891, 16655.096]];
_this setTriggerArea [45, 40, -46.263603, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_air1 = _this;
_trigger_9 = _this;

_this = createTrigger ["EmptyDetector", [14662.018, 16599.252]];
_this setTriggerArea [35, 25, -46.263603, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_autonomous1 = _this;
_trigger_12 = _this;

_this = createTrigger ["EmptyDetector", [15416.53, 15736.18, -6.1094761e-007]];
_this setTriggerArea [150, 150, -4.3593206, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_water1 = _this;
_trigger_14 = _this;

_this = createTrigger ["EmptyDetector", [15002.676, 16477.615]];
_this setTriggerArea [340, 35, -46.263603, true];
_this setTriggerActivation ["WEST", "PRESENT", false];
BIS_trg_restrictedarea1 = _this;
_trigger_16 = _this;


BIS_startExpo = 
{
	_xpo = execVM "expo.sqf";
};


