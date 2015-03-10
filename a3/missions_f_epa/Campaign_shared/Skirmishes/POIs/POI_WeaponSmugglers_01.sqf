_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter resistance;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_4 = createGroup _center_1;

_group_5 = createGroup _center_1;

_group_6 = createGroup _center_1;

_group_7 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_TL_F", [7561.3633, 18356.77], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [7561.3633, 18356.77];
	_this setDir -162.10013;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_01";
	BIS_POI_WeaponSmugglers_01_Smuggler_01 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.56216496;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this setPosATL [7559.44,18355.3,3.27968]; this setUnitPos ""Up""; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_BandollierB_khk""; this addHeadgear ""H_Cap_blk""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_TRG21_F""; this addPrimaryWeaponItem ""optic_aco_grn""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""HandGrenade""} forEach [0,1]; this forceAddUniform ""U_IG_Guerilla3_1""; this addItem ""FirstAidKit""; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2]"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_lite_F", [7547.561, 18361.457], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [7547.561, 18361.457];
	_this setDir 60.718788;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_06";
	BIS_POI_WeaponSmugglers_01_Smuggler_06 = _this;
	_this setUnitAbility 0.45286405;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addGoggles ""G_Spectacles""; this addHeadgear ""H_Hat_grey""; this addVest ""V_Rangemaster_belt""; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_Rook40_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this forceAddUniform ""U_IG_Guerilla2_2"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_lite_F", [7549.2056, 18364.703], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [7549.2056, 18364.703];
	_this setDir -196.30576;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_07";
	BIS_POI_WeaponSmugglers_01_Smuggler_07 = _this;
	_this setUnitAbility 0.47388363;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addGoggles ""G_Shades_Green""; this addHeadgear ""H_Beret_blk""; this addVest ""V_BandollierB_blk""; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2,3,4]; this forceAddUniform ""U_IG_Guerilla2_1"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [7561.2759, 18354.457], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [7561.2759, 18354.457];
	_this setDir -42.301281;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_02";
	BIS_POI_WeaponSmugglers_01_Smuggler_02 = _this;
	_this setUnitAbility 0.49910671;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setPosATL [7557.17,18359.1,3.1507]; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addGoggles ""G_Lowprofile""; this addHeadgear ""H_Cap_blk""; this addVest ""V_Chestrig_blk""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this forceAddUniform ""U_C_Poloshirt_tricolour""; this addItem ""FirstAidKit"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_soldier_F", [7560.1387, 18351.281, 0.26638564], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [7560.1387, 18351.281, 0.26638564];
	_this setDir 176.33562;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_03";
	BIS_POI_WeaponSmugglers_01_Smuggler_03 = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addHeadgear ""H_Bandanna_surfer""; this addVest ""V_BandollierB_cbr""; {this addMagazine ""30Rnd_45ACP_Mag_SMG_01""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_01_F""; this forceAddUniform ""U_C_Poloshirt_redwhite""; this addItem ""FirstAidKit"""]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [7590.124, 18344.232], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [7590.124, 18344.232];
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_04";
	BIS_POI_WeaponSmugglers_01_Smuggler_04 = _this;
	_this setUnitAbility 0.48649502;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_WeaponSmugglers_01_groupBlue = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addHeadgear ""H_Cap_blk_CMMG""; this addVest ""V_TacVest_blk""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_Katiba_C_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""Chemlight_blue""} forEach [0,1,2,3]; this forceAddUniform ""U_IG_Guerilla2_3""; this addItem ""FirstAidKit"""]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [7592.9053, 18342.369], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [7592.9053, 18342.369];
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Smuggler_05";
	BIS_POI_WeaponSmugglers_01_Smuggler_05 = _this;
	_this setUnitAbility 0.46337378;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addGoggles ""G_Aviator""; this addHeadgear ""H_Hat_grey""; this addVest ""V_BandollierB_oli""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""hgun_PDW2000_F""; this forceAddUniform ""U_C_Poloshirt_burgundy""; this addItem ""FirstAidKit"""]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [7535.4858, 18349.217], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_center";
	BIS_POI_WeaponSmugglers_01_center = _this;
	_this setPos [7535.4858, 18349.217];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [7539.311, 18357.135, 0.13624297], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir -22.707239;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_01_Offroad";
	BIS_POI_WeaponSmugglers_01_Offroad = _this;
	_this setPos [7539.311, 18357.135, 0.13624297];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.745"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [7525.7417, 18340.943, -0.094944134], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -241.65932;
	_this setPos [7525.7417, 18340.943, -0.094944134];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [7530.0366, 18342.828, 0.00025939941], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir -75.364433;
	_this setPos [7530.0366, 18342.828, 0.00025939941];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [7531.8003, 18344.137, 0.0002746582], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [7531.8003, 18344.137, 0.0002746582];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [7525.501, 18345.527, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir -127.85667;
	_this setPos [7525.501, 18345.527, -3.0517578e-005];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Campfire_burning_F", [7549.1177, 18362.676, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [7549.1177, 18362.676, 3.0517578e-005];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [7547.8062, 18370.162, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 114.17753;
	_this setPos [7547.8062, 18370.162, 1.5258789e-005];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [7547.1606, 18367.469, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir 102.47047;
	_this setPos [7547.1606, 18367.469, -1.5258789e-005];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [7547.8535, 18368.688, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir 18.305857;
	_this setPos [7547.8535, 18368.688, 1.5258789e-005];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [7551.5527, 18361.273, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 127.24847;
	_this setPos [7551.5527, 18361.273, 4.5776367e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [7549.9512, 18360.117, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 162.6293;
	_this setPos [7549.9512, 18360.117, 6.1035156e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [7553.3042, 18354.869, 0.50360638], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -35.795933;
	_this setPos [7553.3042, 18354.869, 0.50360638];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [7550.2856, 18349.961, 0.58503538], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 123.00056;
	_this setPos [7550.2856, 18349.961, 0.58503538];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight; this allowDamage false; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addMagazineCargo [""16Rnd_9x21_Mag"",40]; this addMagazineCargo [""6Rnd_45ACP_Cylinder"",24]; this addMagazineCargo [""30Rnd_9x21_Mag"",36]; this addMagazineCargo [""30Rnd_45ACP_Mag_SMG_01"",30]; this addMagazineCargo [""30Rnd_556x45_Stanag"",30]; this addMagazineCargo [""30Rnd_65x39_caseless_green"",24]; this addMagazineCargo [""200Rnd_65x39_cased_Box"",6]; this addMagazineCargo [""20Rnd_762x51_Mag"",12]"]];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Wps_F", [7553.2217, 18355.146, 1.4021586], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir 24.561644;
	_this setPos [7553.2217, 18355.146, 1.4021586];
	_initCodes set [count _initCodes,[_this,"this allowDamage false; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addWeaponCargo [""hgun_Rook40_F"",6]; this addWeaponCargo [""hgun_Pistol_heavy_02_F"",2]; this addWeaponCargo [""SMG_02_F"",4]; this addWeaponCargo [""hgun_PDW2000_F"",4]; this addWeaponCargo [""SMG_01_F"",2]; this addWeaponCargo [""arifle_TRG21_F"",4]; this addWeaponCargo [""srifle_EBR_F"",1]"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenBox_F", [7550.9907, 18354.623, 0.36009607], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir -32.478786;
	_this setPos [7550.9907, 18354.623, 0.36009607];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [7510.644, 18320.717, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir 1.6955922;
	_this setPos [7510.644, 18320.717, -7.6293945e-005];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Campfire_F", [7507.1079, 18320.104, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setDir -17.515856;
	_this setPos [7507.1079, 18320.104, 3.0517578e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7507.8696, 18318.02, 0.00010681152], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 154.05885;
	_this setPos [7507.8696, 18318.02, 0.00010681152];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [7542.396, 18366.889, 0.49848273], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setPos [7542.396, 18366.889, 0.49848273];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BucketNavy_F", [7542.0532, 18367.484, 0.35213706], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -130.37622;
	_this setPos [7542.0532, 18367.484, 0.35213706];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BucketNavy_F", [7541.7231, 18366.342, 0.39664295], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setDir 76.188606;
	_this setPos [7541.7231, 18366.342, 0.39664295];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [7540.6138, 18367, 0.33846307], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir -90.362656;
	_this setPos [7540.6138, 18367, 0.33846307];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Hammer_F", [7541.5278, 18366.902, 0.43076435], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -40.180508;
	_this setPos [7541.5278, 18366.902, 0.43076435];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallet_F", [7540.2783, 18368.424, 0.31927979], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -50.422455;
	_this setPos [7540.2783, 18368.424, 0.31927979];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7562.0068, 18354.877, 0.54975623], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir 153.58922;
	_this setPos [7562.0068, 18354.877, 0.54975623];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [7556.0215, 18350.318, 0.15953431], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir 56.028858;
	_this setPos [7556.0215, 18350.318, 0.15953431];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7561.5444, 18352.191, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir 19.496773;
	_this setPos [7561.5444, 18352.191, 1.5258789e-005];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["I_supplyCrate_F", [7554.5483, 18352.477, 0.6038304], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir 84.882866;
	_this setPos [7554.5483, 18352.477, 0.6038304];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;  this allowDamage false; clearBackpackCargo this; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addItemCargo [""FirstAidKit"",12]; this addItemCargo [""muzzle_snds_L"",4]; this addItemCargo [""muzzle_snds_acp"",2]; this addItemCargo [""optic_Aco_smg"",4]; this addItemCargo [""optic_Aco"",4]; this addItemCargo [""optic_Hamr"",2]; this addItemCargo [""acc_flashlight"",6]; this addItemCargo [""V_TacVest_blk_POLICE"",3]; this addItemCargo [""H_Beret_blk_POLICE"",3]; this addItemCargo [""Binocular"",2]; this addMagazineCargo [""ClaymoreDirectionalMine_Remote_Mag"",6]; this addItemCargo [""APERSMine_Range_Mag"",20]; this addBackpackCargo [""B_FieldPack_blk"",2]; this addItemCargo [""Chemlight_blue"",30]"]];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7590.3433, 18346.48], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setPos [7590.3433, 18346.48];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7590.7285, 18346.512], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setPos [7590.7285, 18346.512];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7549.5303, 18385.375], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setPos [7549.5303, 18385.375];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7453.5972, 18328.861], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setPos [7453.5972, 18328.861];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7528.6641, 18275.691], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setPos [7528.6641, 18275.691];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7560.396, 18315.381], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setPos [7560.396, 18315.381];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [7558.4014, 18348.818], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setPos [7558.4014, 18348.818];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7503.2817, 18358.125], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setPos [7503.2817, 18358.125];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7487.1733, 18290.506], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setPos [7487.1733, 18290.506];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [7558.7925, 18356.277], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setPos [7558.7925, 18356.277];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [7551.7949, 18350.734, 0.4286316], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir 58.833385;
	_this setPos [7551.7949, 18350.734, 0.4286316];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.1,-0.25,-0.1]]];"]];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [7551.5586, 18353.303, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setPos [7551.5586, 18353.303, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [7560.5488, 18359.199, 0.44902566], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir 143.614;
	_this setPos [7560.5488, 18359.199, 0.44902566];
	_initCodes set [count _initCodes,[_this,"[132.684,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [7557.9385, 18358.488, 0.33359295], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setDir 54.186516;
	_this setPos [7557.9385, 18358.488, 0.33359295];
	_initCodes set [count _initCodes,[_this,"[132.684,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [7561.6724, 18355.014, 3.361074], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setDir -34.259666;
	_this setPos [7561.6724, 18355.014, 3.361074];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [7560.9595, 18355.32, 3.2756264], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setDir -28.270973;
	_this setPos [7560.9595, 18355.32, 3.2756264];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["MapBoard_altis_F", [7559.3354, 18353.314, 3.2786624], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir 180.59549;
	_this setPos [7559.3354, 18353.314, 3.2786624];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [7560.1655, 18358.668, 3.2861757], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir -36.041149;
	_this setPos [7560.1655, 18358.668, 3.2861757];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [7560.8569, 18357.043, 3.3716583], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setPos [7560.8569, 18357.043, 3.3716583];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
