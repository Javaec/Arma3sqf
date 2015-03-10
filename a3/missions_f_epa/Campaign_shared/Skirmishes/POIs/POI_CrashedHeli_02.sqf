_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter east;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_5 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_helipilot_F", [8029.0078, 20036.779], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [8029.0078, 20036.779];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInGunner BIS_POI_CrashedHeli_02_Kajman; {_x setDamage 1} forEach (units group this)"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_TL_F", [8118.0869, 19394.221], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [8118.0869, 19394.221];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.53273797;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedHeli_02_groupCyan = group this; this setSkill 0.45; "]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_GL_F", [8452.002, 20186.291], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [8452.002, 20186.291];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.54114574;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedHeli_02_groupBlue = group this; this setSkill 0.40; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeYellow_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["O_Heli_Attack_02_F", [8029.4731, 20029.953], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -56.665886;
	_this setVehicleVarName "BIS_POI_CrashedHeli_02_Kajman";
	BIS_POI_CrashedHeli_02_Kajman = _this;
	_this setPos [8029.4731, 20029.953];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setVehicleAmmo 0; this setFuel 0; this setDamage 0.8"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_helipilot_F", [8023.7983, 20027.604], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [8023.7983, 20027.604];
	_this setDir -101.87427;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor"""]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_SL_F", [8030.8159, 20036.084], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [8030.8159, 20036.084];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo [BIS_POI_CrashedHeli_02_Kajman,2]"]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_soldier_M_F", [8028.6338, 20033.432], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [8028.6338, 20033.432];
	_this setDir -12.673099;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor"""]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_A_F", [8028.2793, 20024.063], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [8028.2793, 20024.063];
	_this setDir 132.90065;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_F", [8033.0898, 20036.131], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [8033.0898, 20036.131];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo [BIS_POI_CrashedHeli_02_Kajman,5]"]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_F", [8035.9224, 20036.084], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [8035.9224, 20036.084];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo [BIS_POI_CrashedHeli_02_Kajman,7]"]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_AR_F", [8035.7026, 20030.693], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [8035.7026, 20030.693];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_medic_F", [8112.2461, 19390.129], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [8112.2461, 19390.129];
	_this setUnitAbility 0.5033105;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unassignItem ""NVGoggles_opfor""; this removeItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_F", [8116.9736, 19389.514], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [8116.9736, 19389.514];
	_this setUnitAbility 0.50120878;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unassignItem ""NVGoggles_opfor""; this removeItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_lite_F", [8121.7026, 19389.924], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [8121.7026, 19389.924];
	_this setUnitAbility 0.45286393;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; removeHeadgear this; this addHeadgear ""H_Bandanna_cbr""; this unassignItem ""NVGoggles_opfor""; this removeItem ""NVGoggles_opfor""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_AR_F", [8446.585, 20183.816], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [8446.585, 20183.816];
	_this setUnitAbility 0.48649496;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_F", [8448.9492, 20180.617], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [8448.9492, 20180.617];
	_this setUnitAbility 0.53063589;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_F", [8453.7803, 20183.115], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [8453.7803, 20183.115];
	_this setUnitAbility 0.45076203;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [8029.436, 20032.15], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setVehicleVarName "BIS_POI_CrashedHeli_02_center";
	BIS_POI_CrashedHeli_02_center = _this;
	_this setPos [8029.436, 20032.15];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [8326.7324, 20294.129], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setPos [8326.7324, 20294.129];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [8061.5078, 20380.588], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setPos [8061.5078, 20380.588];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7845.688, 20206.799], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setPos [7845.688, 20206.799];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7934.3633, 19937.828], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [7934.3633, 19937.828];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [8170.0195, 19886.795], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setPos [8170.0195, 19886.795];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [8338.8965, 19968.809], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [8338.8965, 19968.809];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [8433.8047, 20188.324], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setPos [8433.8047, 20188.324];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [8433.0723, 20188.193], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setPos [8433.0723, 20188.193];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [8117.6978, 19397.779], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setPos [8117.6978, 19397.779];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [8118.1475, 19397.777], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setPos [8118.1475, 19397.777];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [7890.4312, 19435.961], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setPos [7890.4312, 19435.961];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [7752.249, 19683.203], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setPos [7752.249, 19683.203];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [7878.1279, 19872.828], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setPos [7878.1279, 19872.828];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [8325.3203, 19663.91], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setPos [8325.3203, 19663.91];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [8272.1934, 19517.484], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [8272.1934, 19517.484];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [8143.9736, 19817.439], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setPos [8143.9736, 19817.439];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Blue_F", [8029.5352, 20030.086], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setPos [8029.5352, 20030.086];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 1]"]];
};

_vehicle_66 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [8032.3306, 20032.775], [], 0, "CAN_COLLIDE"];
	_vehicle_66 = _this;
	_this setPos [8032.3306, 20032.775];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [8033.1685, 20027.611, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setPos [8033.1685, 20027.611, 0];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [8026.9199, 20026.529, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setPos [8026.9199, 20026.529, 0];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [8037.2256, 20031.463], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setPos [8037.2256, 20031.463];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [8036.6626, 20031.809, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir 11.261602;
	_this setPos [8036.6626, 20031.809, 2.2888184e-005];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [8036.834, 20031.979], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setPos [8036.834, 20031.979];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [8036.5088, 20032.102, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setDir -13.476525;
	_this setPos [8036.5088, 20032.102, -3.0517578e-005];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
