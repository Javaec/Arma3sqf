/*
	0 - Log all categories
	1 - Log Uncategorized
	2 - Log unassigned
	3 - Log undefined
	4 - Log localized names
*/

#define UserActionDesc ()
_locArray = [
	"SwimUp", "STR_USRACT_SWIM_UP",
	"SwimDown", "STR_USRACT_SWIM_DOWN",
	"Adjust", "STR_USRACT_ADJUST",
	"MoveForward", "STR_USRACT_MOVE_FORWARD",
	"MoveBack", "STR_USRACT_MOVE_BACK",
	"TurnLeft", "STR_USRACT_TURN_LEFT",
	"TurnRight", "STR_USRACT_TURN_RIGHT",
	"MoveUp", "STR_USRACT_MOVE_UP",
	"MoveDown", "STR_USRACT_MOVE_DOWN",
	"MoveFastForward", "STR_USRACT_FAST_FORWARD",
	"MoveSlowForward", "STR_USRACT_SLOW_FORWARD",
	"MoveLeft", "STR_USRACT_MOVE_LEFT",
	"MoveRight", "STR_USRACT_MOVE_RIGHT",
	"EvasiveLeft", "STR_USRACT_EVASIVE_LEFT",
	"EvasiveRight", "STR_USRACT_EVASIVE_RIGHT",
	"Stand", "STR_USRACT_STAND",
	"Crouch", "STR_USRACT_CROUCH",
	"Prone", "STR_USRACT_PRONE",
	"LeanLeft", "STR_USRACT_LEAN_LEFT",
	"LeanRight", "STR_USRACT_LEAN_RIGHT",
	"LeanLeftToggle", "STR_USRACT_LEAN_LEFT_TOGGLE",
	"LeanRightToggle", "STR_USRACT_LEAN_RIGHT_TOGGLE",
	"WalkRunToggle", "STR_USRACT_WALK_RUN_TOGGLE",
	"WalkRunTemp", "STR_USRACT_WALK_RUN_TEMP",

	"ToggleWeapons", "STR_USRACT_TOGGLE_WEAPONS",
	"SwitchWeapon", "STR_USRACT_SWITCH_WEAPON",
	"Fire", "STR_USRACT_FIRE",
	"DefaultAction", "STR_USRACT_DEFAULT_ACTION",
	"ReloadMagazine", "STR_USRACT_RELOAD_MAGAZINE",
	"LockTargets", "STR_USRACT_LOCK_TARGETS",
	"LockEmptyTargets", "STR_USRACT_TARGET_EMPTY_NEXT",
	"LockTarget", "STR_USRACT_LOCK_OR_ZOOM",
	"RevealTarget", "STR_USRACT_REVEAL_TARGET",
	"TempRaiseWeapon", "STR_USRACT_TEMP_RAISE_WEAPON",
	"ToggleRaiseWeapon", "STR_USRACT_TOGGLE_RAISE_WEAPON",

	"PrevAction", "STR_USRACT_PREV_ACTION",
	"NextAction", "STR_USRACT_NEXT_ACTION",
	"Action", "STR_USRACT_ACTION",
	"ActionContext", "STR_USRACT_ACTION_CONTEXT",
	"ActionFreeLook", "STR_USRACT_ACTION_FREELOOK",

	"Headlights", "STR_USRACT_HEADLIGHTS",

	"IndicateLeft", "STR_USRACT_INDICATE_LEFT",
	"IndicateRight", "STR_USRACT_INDICATE_RIGHT",
	"IndicateHazard", "STR_USRACT_HAZARD_LIGHTS",
	"InteractVeh", "STR_USRACT_INTERACT_VEH",
	"PersItems", "STR_USRACT_PERS_ITEMS",
	"QuickEnter", "STR_USRACT_QUICK_ENTER",
	"CommanderOverride", "STR_USRACT_COMM_OVERRIDE",
	"TI_Brightness_Inc", "STR_USRACT_TI_Brightness_Inc",
	"TI_Brightness_Dec", "STR_USRACT_TI_Brightness_Dec",
	"TI_Contrast_Inc", "STR_USRACT_TI_Contrast_Inc",
	"TI_Contrast_Dec", "STR_USRACT_TI_Contrast_Dec",
	"TI_AutoContrast_Toggle", "STR_USRACT_TI_AutoContrast_Toggle",
	"Lase", "STR_USRACT_LASE",
	"NightVision", "STR_USRACT_NIGHT_VISION",
	"Binocular", "STR_USRACT_BINOCULAR",
	"Handgun", "STR_USRACT_HANDGUN",
	"Compass", "STR_USRACT_COMPASS",
	"CompassToggle", "STR_USRACT_COMPASS_TOGGLE",
	"Watch", "STR_USRACT_WATCH",
	"WatchToggle", "STR_USRACT_WATCH_TOGGLE",
	"MiniMap", "STR_USRACT_GPS",
	"MiniMapToggle", "STR_USRACT_GPS_TOGGLE",
	"ShowMap", "STR_USRACT_SHOW_MAP",
	"HideMap", "STR_USRACT_HIDE_MAP",
	"Help", "STR_USRACT_HELP",
	"TimeInc", "STR_USRACT_TIME_INC",
	"TimeDec", "STR_USRACT_TIME_DEC",

	"Optics", "STR_USRACT_OPTICS",
	"OpticsMode", "STR_USRACT_OPTICS_MODE",
	"PersonView", "STR_USRACT_PERSON_VIEW",
	"TacticalView", "STR_USRACT_TACTICAL_VIEW",
	"LiteUnitInfoToggle", "STR_USRACT_LITE_INFO_TYPE",
	"ZoomIn", "STR_USRACT_ZOOM_IN",
	"ZoomInToggle", "STR_USRACT_ZOOM_IN_TOGGLE",
	"ZoomOut", "STR_USRACT_ZOOM_OUT",
	"ZoomOutToggle", "STR_USRACT_ZOOM_OUT_TOGGLE",
	"ZoomContIn", "STR_USRACT_ZOOM_CONT_IN",
	"ZoomContOut", "STR_USRACT_ZOOM_CONT_OUT",
	"ZeroingUp", "STR_USRACT_ZEROING_UP",
	"ZeroingDown", "STR_USRACT_ZEROING_DOWN",

	"GunElevUp", "STR_USRACT_GUN_ELEV_UP",
	"GunElevDown", "STR_USRACT_GUN_ELEV_DOWN",
	"GunElevSlow", "STR_USRACT_GUN_ELEV_SLOW",
	"GunElevAuto", "STR_USRACT_GUN_ELEV_AUTO",

	"LookAround", "STR_USRACT_LOOK_ARROUND",
	"LookAroundToggle", "STR_USRACT_LOOK_ARROUND_TOGGLE",
	"LookLeftDown", "STR_USRACT_LOOK_LEFT_DOWN",
	"LookDown", "STR_USRACT_LOOK_DOWN",
	"LookRightDown", "STR_USRACT_LOOK_RIGHT_DOWN",
	"LookLeft", "STR_USRACT_LOOK_LEFT",
	"LookCenter", "STR_USRACT_LOOK_CENTER",
	"LookRight", "STR_USRACT_LOOK_RIGHT",
	"LookLeftUp", "STR_USRACT_LOOK_LEFT_UP",
	"LookUp", "STR_USRACT_LOOK_UP",
	"LookRightUp", "STR_USRACT_LOOK_RIGHT_UP",
	"LookLeftCont", "STR_USRACT_LOOK_LEFT_CONT",
	"LookRightCont", "STR_USRACT_LOOK_RIGHT_CONT",
	"LookDownCont", "STR_USRACT_LOOK_DOWN_CONT",
	"LookUpCont", "STR_USRACT_LOOK_UP_CONT",

	"LookShiftLeftCont", "STR_USRACT_LOOK_SHIFT_LEFT_CONT",
	"LookShiftRightCont", "STR_USRACT_LOOK_SHIFT_RIGHT_CONT",
	"LookShiftUpCont", "STR_USRACT_LOOK_SHIFT_UP_CONT",
	"LookShiftDownCont", "STR_USRACT_LOOK_SHIFT_DOWN_CONT",
	"LookShiftForwardCont", "STR_USRACT_LOOK_SHIFT_FORWARD_CONT",
	"LookShiftBackCont", "STR_USRACT_LOOK_SHIFT_BACK_CONT",
	"LookRollLeftCont", "STR_USRACT_LOOK_ROLL_LEFT_CONT",
	"LookRollRightCont",	"STR_USRACT_LOOK_ROLL_RIGHT_CONT",
	"LookShiftLeft", "STR_USRACT_LOOK_SHIFT_LEFT",
	"LookShiftRight", "STR_USRACT_LOOK_SHIFT_RIGHT",
	"LookShiftUp", "STR_USRACT_LOOK_SHIFT_UP",
	"LookShiftDown", "STR_USRACT_LOOK_SHIFT_DOWN",
	"LookShiftForward", "STR_USRACT_LOOK_SHIFT_FORWARD",
	"LookShiftBack", "STR_USRACT_LOOK_SHIFT_BACK",
	"LookRollLeft", "STR_USRACT_LOOK_ROLL_LEFT",
	"LookRollRight",	"STR_USRACT_LOOK_ROLL_RIGHT",
	"LookShiftCenter", "STR_USRACT_LOOK_SHIFT_CENTER",
	"FreeHeadMove", "STR_USRACT_FREE_HEAD_MOVE",

	"PrevChannel", "STR_USRACT_PREV_CHANNEL",
	"NextChannel", "STR_USRACT_NEXT_CHANNEL",
	"Chat", "STR_USRACT_CHAT",
	"VoiceOverNet", "STR_USRACT_VOICE_OVER_NET",
	"PushToTalk", "STR_USRACT_PUSH_TO_TALK",
	"PushToTalkAll", "STR_USRACT_PUSH_TO_TALK_ALL",
	"PushToTalkSide", "STR_USRACT_PUSH_TO_TALK_SIDE",
	"PushToTalkCommand", "STR_USRACT_PUSH_TO_TALK_COMMAND",
	"PushToTalkGroup", "STR_USRACT_PUSH_TO_TALK_GROUP",
	"PushToTalkVehicle", "STR_USRACT_PUSH_TO_TALK_VEHICLE",
	"PushToTalkDirect", "STR_USRACT_PUSH_TO_TALK_DIRECT",

	"NetworkStats", "STR_USRACT_NETWORK_STATS",
	"NetworkPlayers", "STR_USRACT_NETWORK_PLAYERS",
	"SelectAll", "STR_USRACT_SELECT_ALL",
	"Turbo", "STR_USRACT_TURBO",
	"VehicleTurbo", "STR_USRACT_VEHICLE_TURBO",
	"Walk", "STR_USRACT_WALK",
	"HoldBreath", "STR_USRACT_HOLD_BREATH",
	"Salute", "STR_ACTION_SALUTE",
	"SitDown", "STR_ACTION_SITDOWN",

	"Surrender", "STR_ACTION_SURRENDER",
	"GetOver", "STR_ACTION_GET_OVER",

	"AimUp", "STR_USRACT_AIM_UP",
	"AimDown", "STR_USRACT_AIM_DOWN",
	"AimLeft", "STR_USRACT_AIM_LEFT",
	"AimRight", "STR_USRACT_AIM_RIGHT",

	"AimHeadUp", "STR_USRACT_LOOK_UP",
	"AimHeadDown", "STR_USRACT_LOOK_DOWN",
	"AimHeadLeft", "STR_USRACT_LOOK_LEFT",
	"AimHeadRight", "STR_USRACT_LOOK_RIGHT",

	"IngamePause", "STR_USRACT_INGAME_PAUSE",
	"MenuSelect", "STR_USRACT_MENU_SELECT",
	"MenuBack", "STR_USRACT_MENU_BACK",
	"ForceCommandingMode", "STR_USRACT_FORCE_COMMANDING_MODE",

	"SwitchCommand", "STR_USRACT_SWITCH_COMMANDING_MENU",
	"HeliUp", "STR_USRACT_HELI_UP",
	"HeliDown", "STR_USRACT_HELI_DOWN",
	"HeliLeft", "STR_USRACT_HELI_LEFT",
	"HeliRight", "STR_USRACT_HELI_RIGHT",
	"AirBankLeft", "STR_USRACT_HELI_CYCLIC_LEFT",
	"AirBankRight", "STR_USRACT_HELI_CYCLIC_RIGHT",
	"HeliRudderLeft", "STR_USRACT_HELI_RUDDER_LEFT",
	"HeliRudderRight", "STR_USRACT_HELI_RUDDER_RIGHT",
	"HeliForward", "STR_USRACT_HELI_FORWARD",
	"HeliBack", "STR_USRACT_HELI_BACK",
	"HeliFastForward", "STR_USRACT_HELI_FAST_FORWARD",
	"AutoHover", "STR_ACTION_HOVER",
	"AutoHoverCancel", "STR_ACTION_HOVER_CANCEL",
	"HeliThrottlePos", "STR_USRACT_THRUST_ANALOGUE",
	"HeliThrottleNeg", "STR_USRACT_BRAKE_ANALOGUE",
	"HeliBrakes", "STR_USRACT_HELI_BRAKE",


	"HeliCyclicForward", "STR_USRACT_HELI_CYCLIC_FORWARD",
	"HeliCyclicBack", "STR_USRACT_HELI_CYCLIC_BACK",
	"HeliCyclicLeft", "STR_USRACT_HELI_CYCLIC_LEFT_NEW",
	"HeliCyclicRight", "STR_USRACT_HELI_CYCLIC_RIGHT_NEW",
	"HeliCollectiveRaise", "STR_USRACT_HELI_COLLECTIVE_RAISE",
	"HeliCollectiveLower", "STR_USRACT_HELI_COLLECTIVE_LOWER",
	"HeliCollectiveRaiseCont", "STR_USRACT_HELI_COLLECTIVE_RAISE_CONT",
	"HeliCollectiveLowerCont", "STR_USRACT_HELI_COLLECTIVE_LOWER_CONT",

	"HeliThrottleIncrease1", "STR_USRACT_HELI_THROTTLE_INCREASE1",
	"HeliThrottleDecrease1", "STR_USRACT_HELI_THROTTLE_DECREASE1",
	"HeliThrottleIncrease2", "STR_USRACT_HELI_THROTTLE_INCREASE2",
	"HeliThrottleDecrease2", "STR_USRACT_HELI_THROTTLE_DECREASE2",
	"HeliThrottleIncrease3", "STR_USRACT_HELI_THROTTLE_INCREASE3",
	"HeliThrottleDecrease3", "STR_USRACT_HELI_THROTTLE_DECREASE3",
	"HeliStarterToggle1", "STR_USRACT_HELI_STARTER_TOGGLE1",
	"HeliStarterToggle2", "STR_USRACT_HELI_STARTER_TOGGLE2",
	"HeliStarterToggle3", "STR_USRACT_HELI_STARTER_TOGGLE3",
	"HeliBatteriesToggle", "STR_USRACT_HELI_BATTERIES_TOGGLE",
	"HeliRotorBrakeToggle", "STR_USRACT_HELI_ROTORBRAKE_TOGGLE",
	"HeliEnginesToggle", "STR_USRACT_HELI_ENGINES_TOGGLE",
	"HeliAPUToggle", "STR_USRACT_HELI_APU_TOGGLE",
	"HeliWheelsBrake", "STR_USRACT_HELI_WHEELS_BRAKE",
	"HeliTrimLeft", "STR_USRACT_HELI_TRIM_LEFT",
	"HeliTrimRight", "STR_USRACT_HELI_TRIM_RIGHT",
	"HeliTrimForward", "STR_USRACT_HELI_TRIM_FORWARD",
	"HeliTrimBackward", "STR_USRACT_HELI_TRIM_BACKWARD",
	"HeliTrimRudderLeft", "STR_USRACT_HELI_TRIM_RUDDER_LEFT",
	"HeliTrimRudderRight", "STR_USRACT_HELI_TRIM_RUDDER_RIGHT",
	"HeliRopeAction", "STR_USRACT_HELI_ROPE_ACTION",
	
	"SubmarineUp", "STR_USRACT_SUBMARINE_UP",
	"SubmarineDown", "STR_USRACT_SUBMARINE_DOWN",
	"SubmarineLeft", "STR_USRACT_SUBMARINE_LEFT",
	"SubmarineRight", "STR_USRACT_SUBMARINE_RIGHT",
	"SubmarineForward", "STR_USRACT_SUBMARINE_FORWARD",
	"SubmarineBack", "STR_USRACT_SUBMARINE_BACK",
	"SubmarineCyclicForward", "STR_USRACT_SUBMARINE_CYCLIC_FORWARD",
	"SubmarineCyclicBack", "STR_USRACT_SUBMARINE_CYCLIC_BACK",

	"SeagullUp", "STR_USRACT_SEAGULL_UP",
	"SeagullDown", "STR_USRACT_SEAGULL_DOWN",
	"SeagullForward", "STR_USRACT_SEAGULL_FORWARD",
	"SeagullBack", "STR_USRACT_SEAGULL_BACK",
	"SeagullFastForward", "STR_USRACT_SEAGULL_FAST_FORWARD",

	"CarLeft", "STR_USRACT_CAR_LEFT",
	"CarRight", "STR_USRACT_CAR_RIGHT",
	"CarWheelLeft", "STR_USRACT_CAR_WHEEL_LEFT",
	"CarWheelRight", "STR_USRACT_CAR_WHEEL_RIGHT",
	"CarForward", "STR_USRACT_CAR_FORWARD",
	"CarBack", "STR_USRACT_CAR_BACK",
	"CarFastForward", "STR_USRACT_CAR_FAST_FORWARD",
	"CarSlowForward", "STR_USRACT_CAR_SLOW_FORWARD",

	"CarSoftBrake", "STR_USRACT_CAR_SOFT_BRAKE",
	"CarBrake", "STR_USRACT_CAR_BRAKE",
	"CarAccelerate", "STR_USRACT_CAR_ACCELERATE",
	"CarGearUp", "STR_USRACT_CAR_GEAR_UP",
	"CarGearDwn", "STR_USRACT_CAR_GEAR_DWN",
	"CarShiftFwd1", "STR_USRACT_CAR_SHIFT_FWD1",
	"CarShiftFwd2", "STR_USRACT_CAR_SHIFT_FWD2",
	"CarShiftFwd3", "STR_USRACT_CAR_SHIFT_FWD3",
	"CarShiftFwd4", "STR_USRACT_CAR_SHIFT_FWD4",
	"CarShiftFwd5", "STR_USRACT_CAR_SHIFT_FWD5",
	"CarShiftFwd6", "STR_USRACT_CAR_SHIFT_FWD6",
	"CarShiftFwd7", "STR_USRACT_CAR_SHIFT_FWD7",
	"CarShiftFwd8", "STR_USRACT_CAR_SHIFT_FWD8",
	"CarShiftRvs1", "STR_USRACT_CAR_SHIFT_RVS1",
	"CarShiftRvs2", "STR_USRACT_CAR_SHIFT_RVS2",

	"CarAimUp", "STR_USRACT_AIM_UP",
	"CarAimDown", "STR_USRACT_AIM_DOWN",
	"CarAimLeft", "STR_USRACT_AIM_LEFT",
	"CarAimRight", "STR_USRACT_AIM_RIGHT",

	"CommandLeft", "STR_USRACT_COMMAND_LEFT",
	"CommandRight", "STR_USRACT_COMMAND_RIGHT",
	"CommandForward", "STR_USRACT_COMMAND_FORWARD",
	"CommandBack", "STR_USRACT_COMMAND_BACK",
	"CommandFast", "STR_USRACT_COMMAND_FAST",
	"CommandSlow", "STR_USRACT_COMMAND_SLOW",
	"SwitchGunnerWeapon", "STR_USRACT_CHANGE_GUNNER_WEAPON",

	"VehLockTargets", "STR_USRACT_VEH_LOCK_TARGETS",
	"VehLockEmptyTargets", "STR_USRACT_TARGET_EMPTY_NEXT",
	"SwapGunner", "STR_USRACT_SWAP_GUNNER",
	"HeliManualFire", "STR_USRACT_HELI_MANUAL_FIRE",
	"TurnIn", "STR_USRACT_TURN_IN",
	"TurnOut", "STR_USRACT_TURN_OUT",

	"CancelAction", "STR_USRACT_CANCEL_ACTION",

	"CommandWatch", "STR_USRACT_COMMAND_WATCH",

	"TeamSwitch", "STR_USRACT_TEAM_SWITCH",
	"TeamSwitchPrev", "STR_USRACT_TEAM_SWITCH_PREV",
	"TeamSwitchNext", "STR_USRACT_TEAM_SWITCH_NEXT",
	"Gear", "STR_USRACT_GEAR",
	"GetOut", "STR_ACTION_GETOUT",
	"Eject", "STR_ACTION_EJECT",
	"LandGear", "STR_ACTION_GEAR_DOWN",
	"LandGearUp", "STR_ACTION_GEAR_UP",
	"FlapsDown", "STR_ACTION_FLAPS_DOWN",
	"FlapsUp", "STR_ACTION_FLAPS_UP",
	"LaunchCM", "STR_ACTION_LAUNCHCM",
	"NextCM", "STR_ACTION_NEXTCM",
	"HelicopterTrimOn", "STR_USRACT_HELICOPTERTRIMON",
	"HelicopterTrimOff", "STR_USRACT_HELICOPTERTRIMOFF",
	"Cheat1", "STR_USRACT_CHEAT_1",
	"Cheat2", "STR_USRACT_CHEAT_2",
	"BuldSwitchCamera", "STR_USRACT_BULD_SWITCH_CAMERA",
	"BuldFreeLook", "STR_USRACT_BULD_FREE_LOOK",
	"BuldSelect", "STR_USRACT_BULD_SELECT",
	"BuldResetCamera", "STR_USRACT_BULD_RESET_CAMERA",
	"BuldMagnetizePoints", "STR_USRACT_BULD_MAGNETIZE_POINTS",
	"BuldMagnetizePlanes", "STR_USRACT_BULD_MAGNETIZE_PLANES",
	"BuldMagnetizeYFixed", "STR_USRACT_BULD_MAGNETIZE_YFIXED",
	"BuldTerrainRaise1m", "STR_USRACT_BULD_TERRAIN_RAISE_1M",
	"BuldTerrainRaise10cm", "STR_USRACT_BULD_TERRAIN_RAISE_10CM",
	"BuldTerrainLower1m", "STR_USRACT_BULD_TERRAIN_LOWER_1M",
	"BuldTerrainLower10cm", "STR_USRACT_BULD_TERRAIN_LOWER_10CM",
	"BuldTerrainRaise5m", "STR_USRACT_BULD_TERRAIN_RAISE_5M",
	"BuldTerrainRaise50cm", "STR_USRACT_BULD_TERRAIN_RAISE_50CM",
	"BuldTerrainLower5m", "STR_USRACT_BULD_TERRAIN_LOWER_5M",
	"BuldTerrainLower50cm", "STR_USRACT_BULD_TERRAIN_LOWER_50CM",
	"BuldTerrainShowNode", "STR_USRACT_BULD_TERRAIN_SHOW_NODE",
	"BuldSelectionType", "STR_USRACT_BULD_SELECTION_TYPE",
	
	"BuldLeft", "STR_USRACT_BULD_LEFT",
	"BuldRight", "STR_USRACT_BULD_RIGHT",
	"BuldForward", "STR_USRACT_BULD_FORWARD",
	"BuldBack", "STR_USRACT_BULD_BACK",
	"BuldMoveLeft", "STR_USRACT_BULD_MOVE_LEFT",
	"BuldMoveRight", "STR_USRACT_BULD_MOVE_RIGHT",
	"BuldMoveForward", "STR_USRACT_BULD_MOVE_FORWARD",
	"BuldMoveBack", "STR_USRACT_BULD_MOVE_BACK",
	"BuldTurbo", "STR_USRACT_BULD_TURBO",

	"BuldUp", "STR_USRACT_BULD_UP",
	"BuldDown", "STR_USRACT_BULD_DOWN",
	"BuldLookLeft", "STR_USRACT_BULD_LOOK_LEFT",
	"BuldLookRight", "STR_USRACT_BULD_LOOK_RIGHT",
	"BuldLookUp", "STR_USRACT_BULD_LOOK_UP",
	"BuldLookDown", "STR_USRACT_BULD_LOOK_DOWN",
	"BuldZoomIn", "STR_USRACT_BULD_ZOOM_IN",
	"BuldZoomOut", "STR_USRACT_BULD_ZOOM_OUT",
	"BuldTextureInfo", "STR_USRACT_BULD_TEXTURE_INFO",
	"BuldBrushRatio", "STR_USRACT_BULD_BRUSH_RATIO",
	"BuldBrushStrength", "STR_USRACT_BULD_BRUSH_STRENGTH",
	"BuldBrushSmooth", "STR_USRACT_BULD_BRUSH_SMOOTH",
	"BuldBrushRandomize", "STR_USRACT_BULD_BRUSH_RANDOMIZE",
	"BuldBrushOuter", "STR_USRACT_BULD_BRUSH_OUTER",
	"BuldUndo", "STR_USRACT_BULD_UNDO",
	"BuldRedo", "STR_USRACT_BULD_REDO", 
	"BuldCreateObj", "STR_USRACT_BULD_CREATE_OBJ",
	"BuldDuplicateSel", "STR_USRACT_BULD_DUPLICATE_SEL",
	"BuldRemoveSel", "STR_USRACT_BULD_REMOVE_SEL",
	"BuldRotateSelX", "STR_USRACT_BULD_ROTATE_X",
	"BuldRotateSelZ", "STR_USRACT_BULD_ROTATE_Z",
	"BuldScaleSel", "STR_USRACT_BULD_SCALE",
	"BuldElevateSel", "STR_USRACT_BULD_ELEVATE",
	"Diary", "STR_USRACT_DIARY",
	"User1", "STR_USRACT_USER_1",
	"User2", "STR_USRACT_USER_2",
	"User3", "STR_USRACT_USER_3",
	"User4", "STR_USRACT_USER_4",
	"User5", "STR_USRACT_USER_5",
	"User6", "STR_USRACT_USER_6",
	"User7", "STR_USRACT_USER_7",
	"User8", "STR_USRACT_USER_8",
	"User9", "STR_USRACT_USER_9",
	"User10", "STR_USRACT_USER_10",
	"User11", "STR_USRACT_USER_11",
	"User12", "STR_USRACT_USER_12",
	"User13", "STR_USRACT_USER_13",
	"User14", "STR_USRACT_USER_14",
	"User15", "STR_USRACT_USER_15",
	"User16", "STR_USRACT_USER_16",
	"User17", "STR_USRACT_USER_17",
	"User18", "STR_USRACT_USER_18",
	"User19", "STR_USRACT_USER_19",
	"User20", "STR_USRACT_USER_20"
];

_mode = [_this,0,0,[0]] call bis_fnc_param;
_preset = [_this,1,"Arma3",[""]] call bis_fnc_param;
if !(_mode in [0,1,2,3,4]) exitwith {["Must must be one of [0,1,2], is %1",_mode] call bis_fnc_error;};

_cfg = configfile >> "CfgDefaultKeysPresets" >> _preset >> "mappings";
if !(isclass _cfg) exitwith {["Preset ""%1"" does not exist",_preset] call bis_fnc_error; ""};
startloadingscreen [""];
_cfgGroups = configfile >> "UserActionGroups";
_result = "";
_br = "
";
if (_mode < 3) then {
	for "_i" from 0 to (count _cfg - 1) do {
		_action = _cfg select _i;
		_actionName = configname _action;
		_keys = getarray _action;
		if (count _keys > 0 || _mode == 1) then {	

			_categories = [];
			for "_g" from 0 to (count _cfgGroups - 1) do {
				_category = _cfgGroups select _g;
				if (isclass _category) then {
					_group = getarray (_category >> "group");
					if ({_actionName == _x} count _group > 0) then {
						_categories set [count _categories,configname _category];
					};
				};
			};
			switch _mode do {
				case 0: {
					_result = _result + " '''" + _actionName + ":''' " + str _categories + _br;
				};
				case 1: {
					if (count _categories == 0) then {
						//[0,_actionName] call bis_fnc_log;
						_result = _result + " "  + _actionName + _br;
					};
				};
			};
		} else {
			if (_mode == 2) then {
				_result = _result + " "  + _actionName + _br;
			};
		};

		progressloadingscreen (_i / (count _cfg - 1));
	};
} else {
	for "_g" from 0 to (count _cfgGroups - 1) do {
		_category = _cfgGroups select _g;
		if (isclass _category) then {
			_categoryName = gettext (_category >> "name");
			_group = getarray (_category >> "group");
			{
				_xAction = _x;
				if (_mode == 3) then {
					_action = _cfg >> _xAction;
					if (configname _action == "") then {
						_result = _result + " "  + _xAction + _br;
					};
				} else {
					_keyId = -1;
					{
						if (_x == _xAction) exitwith {_keyId = _foreachindex;};
					} foreach _locArray;
					if (_keyId >= 0) then {
						_result = _result +
							"|-" + _br +
							"| " + _categoryName + _br +
							"| '''" + _xAction + "'''" + _br +
							"| ''" + localize (_locArray select (_keyId + 1)) + "''" + _br + _br;	
					} else {
						["%1 not found",_xAction] call bis_fnc_error;
					};
				};
			} foreach _group;
		};
	};
};

endloadingscreen;
copytoclipboard _result;
_result;