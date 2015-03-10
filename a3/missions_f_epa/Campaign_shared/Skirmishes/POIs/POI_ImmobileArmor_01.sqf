_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter resistance;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_4 = createGroup _center_1;

_group_6 = createGroup _center_1;

_group_8 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_crew_F", [7380.9175, 17154.361], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [7380.9175, 17154.361];
	_this setDir 4.0484414;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Crew_01";
	BIS_POI_ImmobileArmor_01_Crew_01 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.5; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_indep""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_crew_F", [7377.6685, 17152.221], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [7377.6685, 17152.221];
	_this setDir 61.496792;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Crew_02";
	BIS_POI_ImmobileArmor_01_Crew_02 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; removeHeadgear this; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F"""]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_crew_F", [7379.4023, 17151.498], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [7379.4023, 17151.498];
	_this setDir 21.630943;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Crew_03";
	BIS_POI_ImmobileArmor_01_Crew_03 = _this;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; removeHeadgear this; this addHeadgear ""H_Booniehat_dgtl""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F"""]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_repair_F", [7398.624, 17173.908], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [7398.624, 17173.908];
	_this setDir -220.77774;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.55165535;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; clearMagazineCargo (unitBackpack this); (unitBackpack this) addItemCargo [""MineDetector"",1]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; removeHeadgear this; this addHeadgear ""H_MilCap_dgtl"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_repair_F", [7400.5981, 17173.111], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [7400.5981, 17173.111];
	_this setDir -77.549095;
	_this setUnitAbility 0.52000004;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_Booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight""; removeBackpack this"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_GL_F", [7443.7861, 17175.578], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [7443.7861, 17175.578];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.52000004;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.45; BIS_POI_ImmobileArmor_01_groupBlue = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_AR_F", [7444.7085, 17174.725], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [7444.7085, 17174.725];
	_this setUnitAbility 0.47375733;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [7369.6187, 17180.939], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [7369.6187, 17180.939];
	_this setDir -72.19294;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInGunner BIS_POI_ImmobileArmor_01_Strider; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_soldier_F", [7420.1079, 17153.553], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [7420.1079, 17153.553];
	_this setDir 134.95146;
	_this setUnitAbility 0.55796123;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["I_APC_Wheeled_03_cannon_F", [7388.605, 17172.119, 0.17903472], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -63.494324;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Gorgon";
	BIS_POI_ImmobileArmor_01_Gorgon = _this;
	_this setPos [7388.605, 17172.119, 0.17903472];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.425; this setDamage 0.80"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_hmg_F", [7368.7188, 17180.178], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -62.397869;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Strider";
	BIS_POI_ImmobileArmor_01_Strider = _this;
	_this setPos [7368.7188, 17180.178];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_box_F", [7403.8042, 17164.627, 0.39165547], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -59.504353;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Zamak";
	BIS_POI_ImmobileArmor_01_Zamak = _this;
	_this setPos [7403.8042, 17164.627, 0.39165547];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.805; this setRepairCargo 0"]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Portable_generator_F", [7399.0264, 17172.092, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_Generator";
	BIS_POI_ImmobileArmor_01_Generator = _this;
	_this setPos [7399.0264, 17172.092, 0];
	_initCodes set [count _initCodes,[_this,"{BIS_POI_ImmobileArmor_01_Gorgon setHit [_x, 1]} forEach [""wheel_1_1_steering"", ""wheel_1_2_steering"", ""wheel_2_1_steering"", ""wheel_2_2_steering"", ""wheel_2_3_steering""]"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [7393.2417, 17169.922], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_01_center";
	BIS_POI_ImmobileArmor_01_center = _this;
	_this setPos [7393.2417, 17169.922];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_medic_F", [7380.9395, 17156.258], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [7380.9395, 17156.258];
	_this setDir 173.89989;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; clearItemCargo (unitBackpack this); (unitBackpack this) addItemCargo [""Medikit"",1]; (unitBackpack this) addItemCargo [""FirstAidKit"",7]"]];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7443.4771, 17178.982], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [7443.4771, 17178.982];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7443.9063, 17178.961], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [7443.9063, 17178.961];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7362.042, 17209.313], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setPos [7362.042, 17209.313];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7332.5737, 17157.006], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setPos [7332.5737, 17157.006];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7411.5483, 17121.939, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setPos [7411.5483, 17121.939, 0];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7414.3413, 17153.117, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setPos [7414.3413, 17153.117, -3.0517578e-005];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7378.791, 17154.848, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setPos [7378.791, 17154.848, -3.0517578e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [7383.7017, 17148.711, -0.06785699], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -63.182747;
	_this setPos [7383.7017, 17148.711, -0.06785699];
	_initCodes set [count _initCodes,[_this,"[0] call BIS_fnc_setHeight;"]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [7382.3188, 17149.791, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -126.96218;
	_this setPos [7382.3188, 17149.791, -3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"[0] call BIS_fnc_setHeight;"]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [7384.311, 17150.104], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -75.786308;
	_this setPos [7384.311, 17150.104];
	_initCodes set [count _initCodes,[_this,"[0] call BIS_fnc_setHeight;"]];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [7364.4971, 17164.383, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir -61.346283;
	_this setPos [7364.4971, 17164.383, -1.5258789e-005];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [7365.5244, 17168.41], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -61.817783;
	_this setPos [7365.5244, 17168.41];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [7365.4194, 17166.211, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [7365.4194, 17166.211, -1.5258789e-005];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [7363.418, 17163.174, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setPos [7363.418, 17163.174, 0];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [7362.9512, 17153.605, 0.36480016], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 27.25997;
	_this setPos [7362.9512, 17153.605, 0.36480016];
	_initCodes set [count _initCodes,[_this,"[158.018,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [7369.5347, 17155.807, 0.32702345], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir 115.85649;
	_this setPos [7369.5347, 17155.807, 0.32702345];
	_initCodes set [count _initCodes,[_this,"[158.018,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [7380.0996, 17143.85, 0.62942243], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -72.421898;
	_this setPos [7380.0996, 17143.85, 0.62942243];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_fire_F", [7380.793, 17143.857, 0.60002178], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir 89.681923;
	_this setPos [7380.793, 17143.857, 0.60002178];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7371.8589, 17151.689, 0.6747002], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir 64.671013;
	_this setPos [7371.8589, 17151.689, 0.6747002];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7371.146, 17148.424, 0.70683205], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setDir -34.088341;
	_this setPos [7371.146, 17148.424, 0.70683205];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7373.8516, 17149.15, 0.71159559], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir 185.74437;
	_this setPos [7373.8516, 17149.15, 0.71159559];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [7372.333, 17149.703, 0.60723186], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setPos [7372.333, 17149.703, 0.60723186];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [7378.0864, 17149.51, 0.65350103], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setPos [7378.0864, 17149.51, 0.65350103];
	_initCodes set [count _initCodes,[_this,"[158.379,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [7415.2871, 17171.248, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir 23.335625;
	_this setPos [7415.2871, 17171.248, 3.0517578e-005];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_UAZ_F", [7408.1929, 17179.961, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir 18.996218;
	_this setPos [7408.1929, 17179.961, -1.5258789e-005];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [7388.2603, 17172.533], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setPos [7388.2603, 17172.533];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 2]"]];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7392.3921, 17172.1, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setPos [7392.3921, 17172.1, 0];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [7391.6631, 17176.928], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [7391.6631, 17176.928];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 0.4]"]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [7393.27, 17176.348], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [7393.27, 17176.348];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 0.92]"]];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [7391.895, 17177.063], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir -60.425076;
	_this setPos [7391.895, 17177.063];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [7366.582, 17154.227, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setPos [7366.582, 17154.227, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [7382.9888, 17148.229], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setPos [7382.9888, 17148.229];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
