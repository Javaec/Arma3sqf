setdate [2035,8,8,1,30];
//setdate [2035,8,8,14,30];

//Initial showcase video
_titlecardfile =  "a3\missions_f_gamma\video\FACTION_INDEPENDENT.ogv";
_titlecardtext =  "STR_A3_SHOWCASE_FACTION_INDEPENDENT_TITLECARD";

_terminal = "I_UAVTerminal";

BIS_tasks =	[
				[ localize "str_a3_showcase_faction_INDEPENDENT_Expo_Title", 		localize "str_a3_showcase_faction_INDEPENDENT_Expo_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_INDEPENDENT_expo_CA.paa", 		position BIS_mrkExpo, 		BIS_mrkExpo ],
				[ localize "str_a3_showcase_faction_INDEPENDENT_Ground_Title", 		localize "str_a3_showcase_faction_INDEPENDENT_Ground_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_INDEPENDENT_ground_CA.paa", 		position BIS_mrkGround, 	BIS_mrkGround ],
				[ localize "str_a3_showcase_faction_INDEPENDENT_Air_Title", 		localize "str_a3_showcase_faction_INDEPENDENT_Air_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_INDEPENDENT_air_CA.paa", 		position BIS_mrkAir, 		BIS_mrkAir ],
				[ localize "str_a3_showcase_faction_INDEPENDENT_Water_Title", 		localize "str_a3_showcase_faction_INDEPENDENT_Water_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_INDEPENDENT_water_CA.paa", 		position BIS_mrkWater, 		BIS_mrkWater ],
				[ localize "str_a3_showcase_faction_INDEPENDENT_Autonomous_Title", 	localize "str_a3_showcase_faction_INDEPENDENT_Autonomous_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_INDEPENDENT_autonomous_CA.paa", 		position BIS_mrkAutonomous, BIS_mrkAutonomous ],
				[ localize "str_a3_showcase_faction_INDEPENDENT_Weapons_Title", 	localize "str_a3_showcase_faction_INDEPENDENT_Weapons_Description", 		"\a3\Missions_F_Gamma\data\img\Faction_INDEPENDENT_weapons_CA.paa", 		position BIS_mrkWeapons, 	BIS_mrkWeapons ],
				[ localize "str_a3_rscdisplaymain_buttonexit", 				localize "str_a3_cfgtaskdescriptions_exit",					"\a3\Missions_F_Gamma\data\img\icon_exit_big_ca.paa", 				position BIS_mrkExit, 		BIS_mrkExit ] 

			];
_faction = "INDEPENDENT";
_color = RESISTANCE call BIS_fnc_sideColor;
_estShotTarget = position BIS_mrkGround;
_estShotTextToDisplay = "STR_A3_Showcase_Showcase_Faction_INDEPENDENT_Summary_text";
_estShotAlt = 200;
_estShotRadius = 200;                                                    //radius of circular movement
_estShotViewAngle = 90;													//vieving angle
_estShotCameraMovement = 1;
_estShotNATOSymbolPath = "\a3\ui_f\data\map\markers\nato\n_";
_estShotNATOSymbolsAddition = 	[
									[ _estShotNATOSymbolPath + "plane.paa", 	_color, [BIS_mrkAir, 20, 180] call BIS_fnc_relPos , 1, 1, 0, "", 0] //todo: localize
								];

//Enlighten runway
private["_initpos", "_space", "_angle", "_amount", "_alllights", "_Xi", "_Yi", "_Xn", "_Yn", "_newpos", "_x" ];
BIS_mrkRunwayLight setdir 213.6;
_initpos = getpos BIS_mrkRunwayLight;
_space = 35; //in meters
_angle = getdir BIS_mrkRunwayLight;
_amount = 20;
_alllights = [];  

_Xi = _initpos select 0;
_Yi = _initpos select 1;

for "_i" from 1 to _amount do
{  
	
	_Xn = _Xi + (_space*_i * sin _angle);
	_Yn = _Yi + (_space*_i * cos _angle);
	
	_newpos = [_Xn, _Yn, 0.3];
	
	_x = "Chemlight_green" createVehicle _newpos;
	_alllights = _alllights + [_x];
				
  	//["_alllights:%1", _alllights ] call BIS_fnc_LogFormat;
 
};


{   
	_spawned = [[_x select 0,"GROUND"],_x select 1,(ceil random 3),[0,0,0],(random 50)-25,{(random 6)-3}, true] call BIS_fnc_spawnObjects;  
}  foreach	[   
				[BIS_wOrdnance,"Box_IND_AmmoOrd_F"],   
				[BIS_wBasic,"Box_IND_Ammo_F"],   
				[BIS_wBasicWeapons,"Box_IND_Wps_F"],   
				[BIS_wSpecial,"Box_IND_WpsSpecial_F"],   
				[BIS_wSupport,"Box_IND_Support_F"]  
			];	



//Enlighten hangar and others
private[ "_light", "_lightpos" ];

{
	_lightpos = _x;
	_light = "#lightpoint" createVehicleLocal getpos _lightpos;
	_light setLightAmbient [0/255, 15/255, 15/255];   
	_light setLightColor [255/255, 215/255, 80/255];
	_light setLightBrightness 1.0;
	_light attachTo [_lightpos, [0,0,0]];
	
} foreach [BIS_mrkLight01, BIS_mrkLight02, BIS_mrkLight03, BIS_mrkLight04 ]; 


//create triggers  
_this = createTrigger ["EmptyDetector", [11604.835, 12008.911]];
_this setTriggerArea [25, 40, 210.79068, true];
_this setTriggerActivation ["GUER", "PRESENT", false];
BIS_trg_ground1 = _this;
_trigger_0 = _this;

_this = createTrigger ["EmptyDetector", [11567.009, 11943.555]];
_this setTriggerArea [35, 40, 120.40315, true];
_this setTriggerActivation ["GUER", "PRESENT", false];
BIS_trg_air1 = _this;
_trigger_2 = _this;

_this = createTrigger ["EmptyDetector", [11722.413, 11907.249]];
_this setTriggerArea [25, 30, 211.78891, true];
_this setTriggerActivation ["GUER", "PRESENT", false];
BIS_trg_autonomous1 = _this;
_trigger_4 = _this;

_this = createTrigger ["EmptyDetector", [11722.557, 11851.771]];
_this setTriggerArea [20, 16, 210.79068, true];
_this setTriggerActivation ["GUER", "PRESENT", false];
BIS_trg_weapons1 = _this;
_trigger_6 = _this;

_this = createTrigger ["EmptyDetector", [11892.912, 11728.277]];
_this setTriggerArea [50, 40, 210.79068, true];
_this setTriggerActivation ["GUER", "PRESENT", false];
BIS_trg_water1 = _this;
_trigger_8 = _this;

_this = createTrigger ["EmptyDetector", [11523.108, 11689.003]];
_this setTriggerArea [340, 20, 303.45135, true];
_this setTriggerActivation ["GUER", "PRESENT", false];
BIS_trg_restrictedarea1 = _this;
_trigger_11 = _this;


BIS_startExpo = 
{
	_expofsm = [] execFSM "expo.fsm";
};

