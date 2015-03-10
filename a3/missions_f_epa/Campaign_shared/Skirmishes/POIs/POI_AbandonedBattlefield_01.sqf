_initCodes = [];

_this = createCenter civilian;
_center_4 = _this;

_this = createCenter west;
_center_1 = _this;

_this = createCenter resistance;
_center_3 = _this;

_group_0 = createGroup _center_1;

_group_6 = createGroup _center_3;

_group_7 = createGroup _center_3;

_group_8 = createGroup _center_3;

_group_9 = createGroup _center_4;

_unit_20 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["B_G_Soldier_F", [2929.6187, 20003.85], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [2929.6187, 20003.85];
	_this setDir -150.75282;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),14]; this removeMagazine ""SmokeShell""; this removeMagazine ""1Rnd_HE_Grenade_shell""; {_x setDamage 1} forEach (units group this)"]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["B_G_Soldier_LAT_F", [2887.0632, 19968.041], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [2887.0632, 19968.041];
	_this setDir -145.91704;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),4]; this removeItem ""FirstAidKit"""]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["B_G_Soldier_lite_F", [2872.3091, 20037.752], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [2872.3091, 20037.752];
	_this setDir -154.36391;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),17]"]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_TL_F", [2937.9233, 19710.803], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [2937.9233, 19710.803];
	_this setDir -8.2506485;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.54955351;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_01_groupCyan = group this; this setSkill 0.45"]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_lite_F", [2936.0464, 19707.98], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [2936.0464, 19707.98];
	_this setDir -8.2506485;
	_this setUnitAbility 0.49490303;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_AR_F", [2940.0459, 19708.229], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [2940.0459, 19708.229];
	_this setDir -8.2506485;
	_this setUnitAbility 0.45706785;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_28 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_Soldier_GL_F", [3391.1509, 19774.455], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [3391.1509, 19774.455];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_01_groupBlue = group this; this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_medic_F", [3389.1082, 19772.041], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [3389.1082, 19772.041];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [3392.7295, 19772.182], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [3392.7295, 19772.182];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_Soldier_TL_F", [2857.8564, 19897.051, 0], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [2857.8564, 19897.051, 0];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),7]; this removeItem ""FirstAidKit""; this removeMagazine ""SmokeShell""; {_x setDamage 1} forEach (units group this)"]];
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_Soldier_GL_F", [2810.5051, 19923.967], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [2810.5051, 19923.967];
	_this setDir 41.307755;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),15]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""1Rnd_HE_Grenade_shell""; this removeMagazine ""1Rnd_HE_Grenade_shell""; this removeItem ""FirstAidKit""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3]"]];
};

_unit_36 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_soldier_F", [2850.0491, 19980.672], [], 0, "CAN_COLLIDE"];
	_unit_36 = _this;
	_this setPos [2850.0491, 19980.672];
	_this setDir -82.823822;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),15]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""HandGrenade""; this removeMagazine ""SmokeShell"""]];
};

_unit_37 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_soldier_F", [2858.6589, 20032.535], [], 0, "CAN_COLLIDE"];
	_unit_37 = _this;
	_this setPos [2858.6589, 20032.535];
	_this setDir 64.248283;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),11]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""HandGrenade""; this removeMagazine ""MiniGrenade"""]];
};

_unit_38 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_soldier_F", [2888.8306, 19954.721], [], 0, "CAN_COLLIDE"];
	_unit_38 = _this;
	_this setPos [2888.8306, 19954.721];
	_this setDir -65.619179;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),8]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazines ""MiniGrenade"""]];
};

_unit_39 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_Soldier_AR_F", [2917.3262, 20031.521], [], 0, "CAN_COLLIDE"];
	_unit_39 = _this;
	_this setPos [2917.3262, 20031.521];
	_this setDir 76.707451;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),115]; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_F", [3529.2185, 19967.408, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -83.867195;
	_this setPos [3529.2185, 19967.408, 0.0001373291];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [3535.1782, 19999.23, 0.39937219], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -143.45615;
	_this setPos [3535.1782, 19999.23, 0.39937219];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [3534.6726, 19998.539, 0.40873745], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir -136.18796;
	_this setPos [3534.6726, 19998.539, 0.40873745];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [3531.6636, 20001.105, 0.405], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -72.766548;
	_this setPos [3531.6636, 20001.105, 0.405];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3525.563, 19997.973, 1.3473594], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir 98.822838;
	_this setPos [3525.563, 19997.973, 1.3473594];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3523.2136, 19994.93], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setPos [3523.2136, 19994.93];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [3540.4431, 20008.441, 0.29443654], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 33.778233;
	_this setPos [3540.4431, 20008.441, 0.29443654];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [3538.2756, 20006.514, 0.67008841], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -91.896721;
	_this setPos [3538.2756, 20006.514, 0.67008841];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [3544.7456, 20015.572, 0.8689903], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -61.665344;
	_this setPos [3544.7456, 20015.572, 0.8689903];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [3545.1982, 20018.391, 0.96253449], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir 86.190735;
	_this setPos [3545.1982, 20018.391, 0.96253449];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [3545.1318, 20017.084, 0.9205783], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setPos [3545.1318, 20017.084, 0.9205783];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_F", [3507.2402, 19975.402, 0.75359476], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 33.474758;
	_this setPos [3507.2402, 19975.402, 0.75359476];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [3524.3457, 19998.17, 0.5387367], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setPos [3524.3457, 19998.17, 0.5387367];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3391.4346, 19785.117], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [3391.4346, 19785.117];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3526.2949, 19980.02, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setPos [3526.2949, 19980.02, 0];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3239.48, 19805.797], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [3239.48, 19805.797];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3085.438, 19869.451], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setPos [3085.438, 19869.451];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3054.2112, 20041.393], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setPos [3054.2112, 20041.393];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [2923.8069, 20201.85], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setPos [2923.8069, 20201.85];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [2993.2759, 20353.795], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setPos [2993.2759, 20353.795];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3189.7322, 20326.992], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setPos [3189.7322, 20326.992];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3393.5564, 20181.58], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [3393.5564, 20181.58];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [2857.9697, 19898.949, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [2857.9697, 19898.949, 0];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [2867.5994, 20035.535, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [2867.5994, 20035.535, 0];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [2874.3496, 19975.684], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_01_center";
	BIS_POI_AbandonedBattlefield_01_center = _this;
	_this setPos [2874.3496, 19975.684];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2935.4297, 19718.215], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir -8.2506485;
	_this setPos [2935.4297, 19718.215];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2793.0627, 19744.287, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setPos [2793.0627, 19744.287, -1.9073486e-006];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2952.2441, 19836.781, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setPos [2952.2441, 19836.781, 0];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3058.1211, 19973.508, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setPos [3058.1211, 19973.508, 0];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2950.8425, 20079.383, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setPos [2950.8425, 20079.383, 0];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2759.5088, 19997.693], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setPos [2759.5088, 19997.693];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2753.1794, 19845.096, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setPos [2753.1794, 19845.096, -1.9073486e-006];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [2935.8311, 19718.23], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -8.2506485;
	_this setPos [2935.8311, 19718.23];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3391.8916, 19785.086], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setPos [3391.8916, 19785.086];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
