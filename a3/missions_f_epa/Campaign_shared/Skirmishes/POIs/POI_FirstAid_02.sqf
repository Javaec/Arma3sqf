_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter resistance;
_center_3 = _this;

_group_0 = createGroup _center_0;

_group_2 = createGroup _center_3;

_group_3 = createGroup _center_3;

_group_4 = createGroup _center_3;

_group_5 = createGroup _center_0;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [3065.8931, 18474.771, 0.3178165], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -16.244326;
	_this setPos [3065.8931, 18474.771, 0.3178165];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [3054.2048, 18490.891, 1.1647784], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setPos [3054.2048, 18490.891, 1.1647784];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [3051.7937, 18493.285, 1.0334569], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 37.183567;
	_this setPos [3051.7937, 18493.285, 1.0334569];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [3049.687, 18490.572, 1.3081815], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -51.126984;
	_this setPos [3049.687, 18490.572, 1.3081815];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelTrash_F", [3042.0371, 18500.566, 0.93683976], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [3042.0371, 18500.566, 0.93683976];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelSand_F", [3042.8794, 18500.359, 0.91843694], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [3042.8794, 18500.359, 0.91843694];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [3048.0247, 18495.938, 1.0470114], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [3048.0247, 18495.938, 1.0470114];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V3_F", [3043.5403, 18488.342, 5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 78.735954;
	_this setPos [3043.5403, 18488.342, 5.7220459e-005];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [3041.4766, 18489.463, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir 44.102005;
	_this setPos [3041.4766, 18489.463, 3.8146973e-006];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [3027.5442, 18506.939, 0.44524136], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setPos [3027.5442, 18506.939, 0.44524136];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [3030.5056, 18504.494, 0.34105775], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir -73.057487;
	_this setPos [3030.5056, 18504.494, 0.34105775];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [2962.4917, 18516.129, 0.35546795], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -329.59622;
	_this setPos [2962.4917, 18516.129, 0.35546795];
	_initCodes set [count _initCodes,[_this,"[28.7569,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [2961.3667, 18517.002, 0.39751574], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setPos [2961.3667, 18517.002, 0.39751574];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [2969.7705, 18517.703, 0.41685987], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -148.42603;
	_this setPos [2969.7705, 18517.703, 0.41685987];
	_initCodes set [count _initCodes,[_this,"[28.7501,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [2968.3396, 18517.334, 0.39213941], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir -237.1489;
	_this setPos [2968.3396, 18517.334, 0.39213941];
	_initCodes set [count _initCodes,[_this,"[28.7501,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [2969.1653, 18516.922, 0.38224688], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setPos [2969.1653, 18516.922, 0.38224688];
	_initCodes set [count _initCodes,[_this,"[28.7547,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [2973.324, 18518.014, 0.0054526227], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir 120.94921;
	_this setPos [2973.324, 18518.014, 0.0054526227];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [2953.4546, 18530.807, 1.0501952], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -151.20451;
	_this setPos [2953.4546, 18530.807, 1.0501952];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [2950.8088, 18531.846, 1.6407323], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -223.16119;
	_this setPos [2950.8088, 18531.846, 1.6407323];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [2948.5623, 18528.781, 0.95978004], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir -239.68489;
	_this setPos [2948.5623, 18528.781, 0.95978004];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2951.2939, 18531.32, 1.5222259], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir 125.79974;
	_this setPos [2951.2939, 18531.32, 1.5222259];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2949.374, 18528.396, 0.77313375], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir 117.85073;
	_this setPos [2949.374, 18528.396, 0.77313375];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2953.2732, 18530.266, 0.77836907], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir -154.55412;
	_this setPos [2953.2732, 18530.266, 0.77836907];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2953.3218, 18528.574, 0.55424595], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir 91.468765;
	_this setPos [2953.3218, 18528.574, 0.55424595];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [2950.7861, 18529.678, 2.1004734], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setPos [2950.7861, 18529.678, 2.1004734];
	_initCodes set [count _initCodes,[_this,"[27.6312,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2957.936, 18519.041, 0.28535044], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir -147.05316;
	_this setPos [2957.936, 18519.041, 0.28535044];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2956.5198, 18519.99, 0.43712065], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -147.05316;
	_this setPos [2956.5198, 18519.99, 0.43712065];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2955.8582, 18520.402, 0.45634311], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir -147.05316;
	_this setPos [2955.8582, 18520.402, 0.45634311];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2959.6492, 18520.1, 0.27477124], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setDir -240.58797;
	_this setPos [2959.6492, 18520.1, 0.27477124];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [2960.0493, 18520.785, 0.26338902], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setDir -234.04573;
	_this setPos [2960.0493, 18520.785, 0.26338902];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [2957.6279, 18519.541, 3.8100665], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir 121.43719;
	_this setPos [2957.6279, 18519.541, 3.8100665];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [2958.657, 18519.111, 3.7360435], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setDir 116.87779;
	_this setPos [2958.657, 18519.111, 3.7360435];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [2955.9888, 18520.113, 3.9531527], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir -69.774971;
	_this setPos [2955.9888, 18520.113, 3.9531527];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [2956.9067, 18520.701, 3.8815913], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -45.930637;
	_this setVehicleLock "UNLOCKED";
	_this setPos [2956.9067, 18520.701, 3.8815913];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_green_F", [2962.8518, 18529.969, 3.80322], [], 0, "CAN_COLLIDE"];
	_vehicle_107 = _this;
	_this setDir -57.901638;
	_this setPos [2962.8518, 18529.969, 3.80322];
	_initCodes set [count _initCodes,[_this,"[31.8584,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [2959.3982, 18531.789, 4.489871], [], 0, "CAN_COLLIDE"];
	_vehicle_109 = _this;
	_this setDir 120.29893;
	_this setPos [2959.3982, 18531.789, 4.489871];
	_initCodes set [count _initCodes,[_this,"[31.8584,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [3050.1711, 18491.4, 1.3109897], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setPos [3050.1711, 18491.4, 1.3109897];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [3053.2239, 18490.176, 1.2758951], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir 36.25185;
	_this setPos [3053.2239, 18490.176, 1.2758951];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [3045.521, 18497.334, 1.3046801], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir 48.160683;
	_this setPos [3045.521, 18497.334, 1.3046801];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [3044.1973, 18493.666, 1.3759638], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setDir 23.938787;
	_this setPos [3044.1973, 18493.666, 1.3759638];
	_initCodes set [count _initCodes,[_this,"[33.8843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3027.6218, 18494.098, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_126 = _this;
	_this setPos [3027.6218, 18494.098, -7.6293945e-005];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [3029.7676, 18498.092, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setPos [3029.7676, 18498.092, 0];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Van_F", [2997.7173, 18510.793, 0.00015258789], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir -61.234676;
	_this setPos [2997.7173, 18510.793, 0.00015258789];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [3322.8865, 18130.467], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [3322.8865, 18130.467];
	_this setUnitAbility 0.50751448;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_TL_F", [3007.2378, 18499.439], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [3007.2378, 18499.439];
	_this setDir 116.90273;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.50961655;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this setSkill 0.45"]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [3009.5112, 18497.746], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [3009.5112, 18497.746];
	_this setDir -68.815369;
	_this setUnitAbility 0.47598529;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Middle""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_GL_F", [3328.573, 18137.863], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [3328.573, 18137.863];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.50331068;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_FirstAid_02_groupBlue = group this; this setSkill 0.35; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_24 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_lite_F", [3331.1394, 18130.189], [], 0, "CAN_COLLIDE"];
	_unit_24 = _this;
	_this setPos [3331.1394, 18130.189];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [2939.0735, 17898.918], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [2939.0735, 17898.918];
	_this setDir -245.02637;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.49910671;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_lite_F", [2935.3474, 17897.867], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [2935.3474, 17897.867];
	_this setDir -185.52974;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_HelmetIA_net""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [2958.6938, 18526.664], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setVehicleVarName "BIS_POI_FirstAid_02_center";
	BIS_POI_FirstAid_02_center = _this;
	_this setPos [2958.6938, 18526.664];
};

_vehicle_276 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [3177.9109, 18325.766, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_276 = _this;
	_this setDir -87.128654;
	_this setPos [3177.9109, 18325.766, -2.2888184e-005];
};

_vehicle_277 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3182.6541, 18320.342, 4.9591064e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_277 = _this;
	_this setPos [3182.6541, 18320.342, 4.9591064e-005];
};

_vehicle_278 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [3180.7483, 18323.57, -6.6757202e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_278 = _this;
	_this setPos [3180.7483, 18323.57, -6.6757202e-005];
};

_vehicle_279 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [3183.2253, 18315.963, 0.020472219], [], 0, "CAN_COLLIDE"];
	_vehicle_279 = _this;
	_this setDir -41.981552;
	_this setPos [3183.2253, 18315.963, 0.020472219];
};

_vehicle_281 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [3129.1709, 18422.264, 0.667633], [], 0, "CAN_COLLIDE"];
	_vehicle_281 = _this;
	_this setDir 58.224407;
	_this setPos [3129.1709, 18422.264, 0.667633];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [1,0.5,1]"]];
};

_vehicle_282 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [3131.7073, 18423.004, 0.69392717], [], 0, "CAN_COLLIDE"];
	_vehicle_282 = _this;
	_this setPos [3131.7073, 18423.004, 0.69392717];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [-0.25,0.75,1]"]];
};

_vehicle_310 = objNull;
if (true) then
{
	_this = createVehicle ["I_Quadbike_01_F", [3004.7419, 18501.023], [], 0, "CAN_COLLIDE"];
	_vehicle_310 = _this;
	_this setDir -214.94759;
	_this setPos [3004.7419, 18501.023];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.615"]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_AR_F", [3339.896, 18130.898], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [3339.896, 18130.898];
	_this setUnitAbility 0.47808737;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_vehicle_336 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3007.3662, 18502.004], [], 0, "CAN_COLLIDE"];
	_vehicle_336 = _this;
	_this setPos [3007.3662, 18502.004];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_p_fugitive_F", [2957.8647, 18527.795, 7.7849913], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [2957.8647, 18527.795, 7.7849913];
	_this setDir 394.37656;
	_this setVehicleVarName "BIS_POI_FirstAid_02_Fugitive_01";
	BIS_POI_FirstAid_02_Fugitive_01 = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Down""; this setPosASL [2955.27,18522.4,31.8628]; removeUniform this; this addUniform ""U_IG_Guerilla3_1""; this addMagazine [""6Rnd_45ACP_Cylinder"",2]; this addWeapon ""hgun_Pistol_heavy_02_Yorris_F""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4]; this addBackpack ""B_FieldPack_khk""; (unitBackpack this) addItemCargo [""FirstAidKit"",3]; (unitBackpack this) addItemCargo [""Medikit"",1]; (unitBackpack this) addMagazineCargo [""SmokeShellBlue"",2]; (unitBackpack this) addMagazineCargo [""Chemlight_blue"",5]; (unitBackpack this) addMagazineCargo [""APERSTripMine_Wire_Mag"",1]; _null = [] spawn {sleep 1; removeHeadgear BIS_POI_FirstAid_02_Fugitive_01; removeGoggles BIS_POI_FirstAid_02_Fugitive_01; BIS_POI_FirstAid_02_Fugitive_01 addGoggles ""G_Lowprofile""; BIS_POI_FirstAid_02_Fugitive_01 addHeadgear ""H_Shemag_tan""; BIS_POI_FirstAid_02_Fugitive_01 setDamage 1}"]];
};

_vehicle_363 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [2962.531, 18531.215, 0.51063496], [], 0, "CAN_COLLIDE"];
	_vehicle_363 = _this;
	_this setDir -62.185799;
	_this setPos [2962.531, 18531.215, 0.51063496];
};

_vehicle_364 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [2958.4026, 18531.189, 1.3215462], [], 0, "CAN_COLLIDE"];
	_vehicle_364 = _this;
	_this setDir -59.70163;
	_this setPos [2958.4026, 18531.189, 1.3215462];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_365 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [2951.6506, 18524.043, 0.73534161], [], 0, "CAN_COLLIDE"];
	_vehicle_365 = _this;
	_this setPos [2951.6506, 18524.043, 0.73534161];
	_initCodes set [count _initCodes,[_this,"[28.2611,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_396 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3325.4365, 18142.146], [], 0, "CAN_COLLIDE"];
	_vehicle_396 = _this;
	_this setPos [3325.4365, 18142.146];
};

_vehicle_400 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3204.8066, 18392.242], [], 0, "CAN_COLLIDE"];
	_vehicle_400 = _this;
	_this setPos [3204.8066, 18392.242];
};

_vehicle_429 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3325.665, 18141.959], [], 0, "CAN_COLLIDE"];
	_vehicle_429 = _this;
	_this setPos [3325.665, 18141.959];
};

_vehicle_432 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3217.1709, 18631.236], [], 0, "CAN_COLLIDE"];
	_vehicle_432 = _this;
	_this setPos [3217.1709, 18631.236];
};

_vehicle_434 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3244.4902, 18733.943], [], 0, "CAN_COLLIDE"];
	_vehicle_434 = _this;
	_this setPos [3244.4902, 18733.943];
};

_vehicle_442 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3352.448, 18832.215, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_442 = _this;
	_this setPos [3352.448, 18832.215, 1.5258789e-005];
};

_vehicle_444 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3445.6887, 18695.609], [], 0, "CAN_COLLIDE"];
	_vehicle_444 = _this;
	_this setPos [3445.6887, 18695.609];
};

_vehicle_446 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3434.9673, 18625.838], [], 0, "CAN_COLLIDE"];
	_vehicle_446 = _this;
	_this setPos [3434.9673, 18625.838];
};

_vehicle_452 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3447.1877, 18545.107], [], 0, "CAN_COLLIDE"];
	_vehicle_452 = _this;
	_this setPos [3447.1877, 18545.107];
};

_vehicle_454 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3429.5947, 18474.518], [], 0, "CAN_COLLIDE"];
	_vehicle_454 = _this;
	_this setPos [3429.5947, 18474.518];
};

_vehicle_456 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3405.7209, 18400.561], [], 0, "CAN_COLLIDE"];
	_vehicle_456 = _this;
	_this setPos [3405.7209, 18400.561];
};

_vehicle_458 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3367.2336, 18305.281], [], 0, "CAN_COLLIDE"];
	_vehicle_458 = _this;
	_this setPos [3367.2336, 18305.281];
};

_vehicle_460 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3348.9158, 18214.322, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_460 = _this;
	_this setPos [3348.9158, 18214.322, 3.8146973e-006];
};

_vehicle_463 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3217.0251, 18506.242, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_463 = _this;
	_this setPos [3217.0251, 18506.242, 0];
};

_vehicle_466 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3258.2715, 18191.873, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_466 = _this;
	_this setPos [3258.2715, 18191.873, 0];
};

_vehicle_468 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3216.5518, 18282.232], [], 0, "CAN_COLLIDE"];
	_vehicle_468 = _this;
	_this setPos [3216.5518, 18282.232];
};

_vehicle_471 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3421.3237, 18771.176], [], 0, "CAN_COLLIDE"];
	_vehicle_471 = _this;
	_this setPos [3421.3237, 18771.176];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [2966.0046, 18516.938], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setPos [2966.0046, 18516.938];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_481 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [3045.8862, 18493.693], [], 0, "CAN_COLLIDE"];
	_vehicle_481 = _this;
	_this setPos [3045.8862, 18493.693];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_483 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [3051.1577, 18490.484], [], 0, "CAN_COLLIDE"];
	_vehicle_483 = _this;
	_this setPos [3051.1577, 18490.484];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_508 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [2963.7114, 18527.209, 3.6359367], [], 0, "CAN_COLLIDE"];
	_vehicle_508 = _this;
	_this setDir 32.103916;
	_this setPos [2963.7114, 18527.209, 3.6359367];
	_initCodes set [count _initCodes,[_this,"[31.8584,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_512 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [2965.2566, 18520.563, 0.39323112], [], 0, "CAN_COLLIDE"];
	_vehicle_512 = _this;
	_this setDir -149.02023;
	_this setPos [2965.2566, 18520.563, 0.39323112];
	_initCodes set [count _initCodes,[_this,"[28.7569,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_514 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [2966.9648, 18517.475, 0.3150036], [], 0, "CAN_COLLIDE"];
	_vehicle_514 = _this;
	_this setDir -57.297821;
	_this setPos [2966.9648, 18517.475, 0.3150036];
	_initCodes set [count _initCodes,[_this,"[28.7569,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_516 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [2966.238, 18517.93, 0.40882927], [], 0, "CAN_COLLIDE"];
	_vehicle_516 = _this;
	_this setDir -52.245377;
	_this setPos [2966.238, 18517.93, 0.40882927];
	_initCodes set [count _initCodes,[_this,"[28.7547,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_518 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [2965.0349, 18520.09, 0.40543985], [], 0, "CAN_COLLIDE"];
	_vehicle_518 = _this;
	_this setDir -139.76767;
	_this setPos [2965.0349, 18520.09, 0.40543985];
	_initCodes set [count _initCodes,[_this,"[28.7547,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_521 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [2966.4675, 18519.631, 0.41818446], [], 0, "CAN_COLLIDE"];
	_vehicle_521 = _this;
	_this setPos [2966.4675, 18519.631, 0.41818446];
	_initCodes set [count _initCodes,[_this,"[28.7547,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_523 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [2962.8955, 18516.938, 0.43258259], [], 0, "CAN_COLLIDE"];
	_vehicle_523 = _this;
	_this setDir 7.2791858;
	_this setPos [2962.8955, 18516.938, 0.43258259];
	_initCodes set [count _initCodes,[_this,"[28.7547,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_525 = objNull;
if (true) then
{
	_this = createVehicle ["MapBoard_altis_F", [2962.324, 18519.262, 0.42757806], [], 0, "CAN_COLLIDE"];
	_vehicle_525 = _this;
	_this setDir -43.795654;
	_this setPos [2962.324, 18519.262, 0.42757806];
	_initCodes set [count _initCodes,[_this,"[28.7547,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_529 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [2958.5732, 18532.271, 4.7176075], [], 0, "CAN_COLLIDE"];
	_vehicle_529 = _this;
	_this setDir -240.08513;
	_this setPos [2958.5732, 18532.271, 4.7176075];
	_initCodes set [count _initCodes,[_this,"[31.8584,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_530 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [2959.4604, 18533.268, 4.8636332], [], 0, "CAN_COLLIDE"];
	_vehicle_530 = _this;
	_this setPos [2959.4604, 18533.268, 4.8636332];
	_initCodes set [count _initCodes,[_this,"[31.8584,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_532 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [2964.9465, 18528.17, 3.6640975], [], 0, "CAN_COLLIDE"];
	_vehicle_532 = _this;
	_this setDir -58.021927;
	_this setPos [2964.9465, 18528.17, 3.6640975];
	_initCodes set [count _initCodes,[_this,"[31.8584,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_538 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [2953.095, 18523.219, 4.1223297], [], 0, "CAN_COLLIDE"];
	_vehicle_538 = _this;
	_this setDir 211.9753;
	_this setPos [2953.095, 18523.219, 4.1223297];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_541 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [2952.6934, 18522.305, 4.2138643], [], 0, "CAN_COLLIDE"];
	_vehicle_541 = _this;
	_this setDir -138.57327;
	_this setPos [2952.6934, 18522.305, 4.2138643];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_544 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [2953.4316, 18524.424, 4.1682878], [], 0, "CAN_COLLIDE"];
	_vehicle_544 = _this;
	_this setDir -4.6259375;
	_this setPos [2953.4316, 18524.424, 4.1682878];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_546 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [2953.8772, 18522.484, 4.4764113], [], 0, "CAN_COLLIDE"];
	_vehicle_546 = _this;
	_this setPos [2953.8772, 18522.484, 4.4764113];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_547 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [2959.0042, 18521.447, 3.8262272], [], 0, "CAN_COLLIDE"];
	_vehicle_547 = _this;
	_this setDir -147.85005;
	_this setPos [2959.0042, 18521.447, 3.8262272];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_549 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [2958.521, 18520.33, 3.7524903], [], 0, "CAN_COLLIDE"];
	_vehicle_549 = _this;
	_this setPos [2958.521, 18520.33, 3.7524903];
	_initCodes set [count _initCodes,[_this,"[31.863,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_551 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [2961.925, 18530.004], [], 0, "CAN_COLLIDE"];
	_vehicle_551 = _this;
	_this setPos [2961.925, 18530.004];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_553 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [2957.8757, 18521.846], [], 0, "CAN_COLLIDE"];
	_vehicle_553 = _this;
	_this setPos [2957.8757, 18521.846];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_555 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [2955.083, 18525.334], [], 0, "CAN_COLLIDE"];
	_vehicle_555 = _this;
	_this setPos [2955.083, 18525.334];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_557 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Antibiotic_F", [2972.5293, 18526.465], [], 0, "CAN_COLLIDE"];
	_vehicle_557 = _this;
	_this setPos [2972.5293, 18526.465];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2959.79,18525.4,31.8606]"]];
};

_vehicle_562 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [2973.9004, 18526.354], [], 0, "CAN_COLLIDE"];
	_vehicle_562 = _this;
	_this setPos [2973.9004, 18526.354];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2954.26,18523.5,31.8633]"]];
};

_vehicle_566 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [2975.8279, 18526.375], [], 0, "CAN_COLLIDE"];
	_vehicle_566 = _this;
	_this setPos [2975.8279, 18526.375];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.98,18524.4,31.861]"]];
};

_vehicle_570 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WaterPurificationTablets_F", [2977.7998, 18526.371], [], 0, "CAN_COLLIDE"];
	_vehicle_570 = _this;
	_this setPos [2977.7998, 18526.371];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2961.09,18531.7,31.8599]"]];
};

_vehicle_577 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [2978.7979, 18523.24], [], 0, "CAN_COLLIDE"];
	_vehicle_577 = _this;
	_this setPos [2978.7979, 18523.24];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2957.93,18523.9,31.8615]"]];
};

_vehicle_578 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanOpener_F", [2979.7405, 18523.346], [], 0, "CAN_COLLIDE"];
	_vehicle_578 = _this;
	_this setPos [2979.7405, 18523.346];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.02,18524.1,31.8614]"]];
};

_vehicle_581 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [2981.0676, 18523.211], [], 0, "CAN_COLLIDE"];
	_vehicle_581 = _this;
	_this setPos [2981.0676, 18523.211];
	_initCodes set [count _initCodes,[_this,"this setDir 125; this setPosASL [2960.01,18522.9,31.8605]"]];
};

_vehicle_587 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_F", [2982.2207, 18523.191, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_587 = _this;
	_this setPos [2982.2207, 18523.191, 0];
	_initCodes set [count _initCodes,[_this,"this setDir 35; this setPosASL [2960.35,18524.9,31.8884]"]];
};

_vehicle_588 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [2977.8235, 18523.359], [], 0, "CAN_COLLIDE"];
	_vehicle_588 = _this;
	_this setPos [2977.8235, 18523.359];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.06,18523.8,31.8614]"]];
};

_vehicle_589 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Matches_F", [2980.2317, 18520.744, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_589 = _this;
	_this setPos [2980.2317, 18520.744, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.83,18524.8,31.861]"]];
};

_vehicle_590 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GasCooker_F", [2981.4534, 18520.676], [], 0, "CAN_COLLIDE"];
	_vehicle_590 = _this;
	_this setPos [2981.4534, 18520.676];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2959.39,18525.1,31.8608]"]];
};

_vehicle_592 = objNull;
if (true) then
{
	_this = createVehicle ["Land_File1_F", [2980.1636, 18518.953, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_592 = _this;
	_this setPos [2980.1636, 18518.953, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.67,18531.1,31.8611]"]];
};

_vehicle_593 = objNull;
if (true) then
{
	_this = createVehicle ["Land_File1_F", [2981.1409, 18518.918, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_593 = _this;
	_this setPos [2981.1409, 18518.918, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2964.12,18528.4,31.8585]"]];
};

_vehicle_594 = objNull;
if (true) then
{
	_this = createVehicle ["Land_File1_F", [2982.0486, 18519.023, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_594 = _this;
	_this setPos [2982.0486, 18519.023, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.76,18520.7,31.8611]"]];
};

_vehicle_595 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FilePhotos_F", [2983.3054, 18518.953, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_595 = _this;
	_this setPos [2983.3054, 18518.953, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2959.53,18532.8,31.8607]"]];
};

_vehicle_596 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [2978.7324, 18518.848], [], 0, "CAN_COLLIDE"];
	_vehicle_596 = _this;
	_this setPos [2978.7324, 18518.848];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2961.15,18524.9,28.4399]"]];
};

_vehicle_597 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FMradio_F", [2985.3306, 18519.094], [], 0, "CAN_COLLIDE"];
	_vehicle_597 = _this;
	_this setPos [2985.3306, 18519.094];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2961.18,18522.3,31.8599]"]];
};

_vehicle_598 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Notepad_F", [2986.6221, 18518.848], [], 0, "CAN_COLLIDE"];
	_vehicle_598 = _this;
	_this setPos [2986.6221, 18518.848];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2953.85,18523.7,31.8635]"]];
};

_vehicle_599 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Notepad_F", [2987.7739, 18518.848], [], 0, "CAN_COLLIDE"];
	_vehicle_599 = _this;
	_this setPos [2987.7739, 18518.848];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2959.81,18531.6,31.8606]"]];
};

_vehicle_600 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V2_F", [2978.8372, 18517.066, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_600 = _this;
	_this setPos [2978.8372, 18517.066, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.6,18523.2,31.8611]"]];
};

_vehicle_602 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V2_F", [2979.5002, 18517.066], [], 0, "CAN_COLLIDE"];
	_vehicle_602 = _this;
	_this setPos [2979.5002, 18517.066];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.4,18523.3,31.8612]"]];
};

_vehicle_618 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [2957.6892, 18521.471, 0.39829391], [], 0, "CAN_COLLIDE"];
	_vehicle_618 = _this;
	_this setDir -147.67047;
	_this setPos [2957.6892, 18521.471, 0.39829391];
	_initCodes set [count _initCodes,[_this,"[28.4396,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_622 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PencilBlue_F", [2980.5825, 18517.033, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_622 = _this;
	_this setPos [2980.5825, 18517.033, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.58,18520.8,31.8612]"]];
};

_vehicle_627 = objNull;
if (true) then
{
	_this = createVehicle ["Land_File1_F", [2981.9092, 18516.822, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_627 = _this;
	_this setPos [2981.9092, 18516.822, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2958.61,18523.2,28.4411]"]];
};

_vehicle_631 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PenBlack_F", [2981.0901, 18516.982], [], 0, "CAN_COLLIDE"];
	_vehicle_631 = _this;
	_this setPos [2981.0901, 18516.982];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2959.3,18531.1,31.8608]"]];
};

_vehicle_632 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FilePhotos_F", [2983.3269, 18516.842, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_632 = _this;
	_this setPos [2983.3269, 18516.842, 0];
	_initCodes set [count _initCodes,[_this,"this setDir (random 360); this setPosASL [2957.61,18522.7,28.4416]"]];
};

_group_8 = createGroup _center_0;

_unit_36 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_p_fugitive_F", [2957.0781, 18525.568], [], 0, "CAN_COLLIDE"];
	_unit_36 = _this;
	_this setPos [2957.0781, 18525.568];
	_this setDir -318.54282;
	_this setVehicleVarName "BIS_POI_FirstAid_02_Fugitive_02";
	BIS_POI_FirstAid_02_Fugitive_02 = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setPosASL [2958.62,18527.3,31.8611]; removeUniform this; this addVest ""V_TacVest_blk_POLICE""; this addMagazine [""30Rnd_9x21_Mag"",18]; this addWeapon ""SMG_02_ACO_F""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; {this addMagazine ""SmokeShellGreen""} forEach [0,1]; {this addMagazine ""MiniGrenade""} forEach [0,1]; this addUniform ""U_IG_Guerilla2_3""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_green""} forEach [0,1,2]; _null = [] spawn {sleep 0.1; BIS_POI_FirstAid_02_Fugitive_02 switchMove ""KIA_gunner_static_low01""; sleep 1; BIS_POI_FirstAid_02_Fugitive_02 addHeadgear ""H_Cap_oli_hs""; removeGoggles BIS_POI_FirstAid_02_Fugitive_02; BIS_POI_FirstAid_02_Fugitive_02 setDir 230; BIS_POI_FirstAid_02_Fugitive_02 setDamage 1}"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
