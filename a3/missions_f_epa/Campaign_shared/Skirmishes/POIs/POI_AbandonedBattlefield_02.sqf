_initCodes = [];

_this = createCenter civilian;
_center_4 = _this;

_this = createCenter west;
_center_3 = _this;

_this = createCenter resistance;
_center_2 = _this;

_group_2 = createGroup _center_2;

_group_3 = createGroup _center_3;

_group_4 = createGroup _center_2;

_group_5 = createGroup _center_2;

_group_6 = createGroup _center_4;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Offroad_01_F", [5759.6201, 20083.379], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir 108.05273;
	_this setPos [5759.6201, 20083.379];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setHit [""karoserie"",0.45]; this setFuel 0.365"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_gmg_F", [5873.6675, 20080.723, 0.14709033], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -24.467583;
	_this setPos [5873.6675, 20080.723, 0.14709033];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setDamage 0.8"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_SL_F", [5865.7036, 20077.211], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [5865.7036, 20077.211];
	_this setDir -88.216629;
	_this setUnitRank "LIEUTENANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),22]; {_x setDamage 1} forEach (units group this)"]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_AR_F", [5856.4341, 20106.959], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [5856.4341, 20106.959];
	_this setDir -120.60852;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),173]; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_GL_F", [5856.5981, 20096.574, 2.8822002], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [5856.5981, 20096.574, 2.8822002];
	_this setDir -98.329803;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),11]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""1Rnd_HE_Grenade_shell""; this removeMagazine ""1Rnd_HE_Grenade_shell""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_LAT_F", [5878.4443, 20083.26], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [5878.4443, 20083.26];
	_this setDir -85.708862;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),15]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeItem ""FirstAidKit"""]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_AAR_F", [5844.1294, 20102.91], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [5844.1294, 20102.91];
	_this setDir -307.83588;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),7]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""SmokeShell""; this removeWeapon ""Rangefinder"""]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [5857.7446, 20102.67, 0.32433906], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [5857.7446, 20102.67, 0.32433906];
	_this setDir -148.51195;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),23]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeItem ""FirstAidKit""; this removeMagazine ""HandGrenade"""]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [5838.9634, 20111.939], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [5838.9634, 20111.939];
	_this setDir -111.15015;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),10]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""HandGrenade"""]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [5866.395, 20063.434, 0.094014838], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [5866.395, 20063.434, 0.094014838];
	_this setDir -65.987167;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),27]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""HandGrenade""; this removeMagazine ""30Rnd_556x45_Stanag"""]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_G_Soldier_GL_F", [5806.4468, 20106.383], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [5806.4468, 20106.383];
	_this setDir 28.380676;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),13]; this removeMagazine ""1Rnd_HE_Grenade_shell""; this removeMagazine ""1Rnd_HE_Grenade_shell""; {_x setDamage 1} forEach (units group this); {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeBlue_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3]"]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_G_Soldier_AR_F", [5820.9971, 20116.02], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [5820.9971, 20116.02];
	_this setDir 86.425568;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),83]; "]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_G_Soldier_F", [5784.5386, 20079.002], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [5784.5386, 20079.002];
	_this setDir 73.231857;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),3]; this removeMagazine ""SmokeShell""; this removeItem ""FirstAidKit"""]];
};

_unit_24 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_G_Soldier_F", [5854.8662, 20100.32, 0.26503649], [], 0, "CAN_COLLIDE"];
	_unit_24 = _this;
	_this setPos [5854.8662, 20100.32, 0.26503649];
	_this setDir 50.036175;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),15]; this removeMagazine ""30Rnd_556x45_Stanag"""]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_M_F", [5950.728, 20019.609], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [5950.728, 20019.609];
	_this setDir -66.084587;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.47178149;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_02_groupCyan = group this; this setSkill 0.45; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_medic_F", [5955.0903, 20010.273], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [5955.0903, 20010.273];
	_this setDir -66.084587;
	_this setUnitAbility 0.39808726;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [5958.5229, 20015.916], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [5958.5229, 20015.916];
	_this setDir -66.084587;
	_this setUnitAbility 0.4024173;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unassignItem ""NVGoggles_indep""; this removeItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_28 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [5961.6089, 20021.975], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [5961.6089, 20021.975];
	_this setDir -66.084587;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_Soldier_TL_F", [5965.7852, 19851.977], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [5965.7852, 19851.977];
	_this setDir 0.31741756;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.49700505;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_02_groupBlue = group this; this setSkill 0.45; "]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_Soldier_AR_F", [5959.3638, 19846.281], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [5959.3638, 19846.281];
	_this setDir 0.31741756;
	_this setUnitAbility 0.45496601;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unassignItem ""NVGoggles_indep""; this removeItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [5965.2275, 19843.787], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [5965.2275, 19843.787];
	_this setDir 0.31741756;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unassignItem ""NVGoggles_indep""; this removeItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_Soldier_GL_F", [5971.5269, 19844.439], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [5971.5269, 19844.439];
	_this setDir 0.31741756;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unassignItem ""NVGoggles_indep""; this removeItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5966.0483, 19861.029], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setPos [5966.0483, 19861.029];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5790.3833, 19931.68], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setPos [5790.3833, 19931.68];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [5848.0845, 20096.463], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [5848.0845, 20096.463];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [5867.376, 20078.859, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setPos [5867.376, 20078.859, 0];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [5833.4063, 20085.705], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_02_center";
	BIS_POI_AbandonedBattlefield_02_center = _this;
	_this setPos [5833.4063, 20085.705];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5942.0371, 20023.656], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setPos [5942.0371, 20023.656];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5938.1831, 20106.99], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setPos [5938.1831, 20106.99];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5832.7861, 20141.883], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [5832.7861, 20141.883];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5798.7529, 20070.961], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [5798.7529, 20070.961];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5855.1978, 20049.152], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [5855.1978, 20049.152];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [5856.4946, 20098.875, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir 107.22816;
	_this setPos [5856.4946, 20098.875, 0];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [5855.5806, 20102.984, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 11.684698;
	_this setPos [5855.5806, 20102.984, 0];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [5857.8071, 20104.42, 3.3494356], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir 108.11552;
	_this setPos [5857.8071, 20104.42, 3.3494356];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [5859.2017, 20102.334, 3.0916293], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir 167.04135;
	_this setPos [5859.2017, 20102.334, 3.0916293];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5665.6738, 20286.777], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setPos [5665.6738, 20286.777];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5814.0571, 20396.076], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setPos [5814.0571, 20396.076];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5979.4277, 20338.68], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [5979.4277, 20338.68];
};

_vehicle_66 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6043.9033, 20093.029], [], 0, "CAN_COLLIDE"];
	_vehicle_66 = _this;
	_this setPos [6043.9033, 20093.029];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5941.3081, 20023.652], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setPos [5941.3081, 20023.652];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5619.7363, 20019.906], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setPos [5619.7363, 20019.906];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6056.354, 20235.441], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setPos [6056.354, 20235.441];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5966.6479, 19860.879], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setPos [5966.6479, 19860.879];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Green_F", [5874.2173, 20079.654], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setPos [5874.2173, 20079.654];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 1.7]"]];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5560.8535, 20174.258], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setPos [5560.8535, 20174.258];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6005.8418, 19955.523, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setPos [6005.8418, 19955.523, 0];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [5856.7446, 20102.297], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setPos [5856.7446, 20102.297];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
