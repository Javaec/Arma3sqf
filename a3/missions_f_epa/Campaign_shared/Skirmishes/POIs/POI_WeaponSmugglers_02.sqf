_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter east;
_center_1 = _this;

_this = createCenter resistance;
_center_2 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_5 = createGroup _center_2;

_group_6 = createGroup _center_2;

_group_7 = createGroup _center_2;

_group_8 = createGroup _center_2;

_group_9 = createGroup _center_2;

_group_10 = createGroup _center_2;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_TL_F", [6070.0645, 10753.117, 3.2951601], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [6070.0645, 10753.117, 3.2951601];
	_this setDir -129.58365;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_01";
	BIS_POI_WeaponSmugglers_02_Smuggler_01 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.74713618;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this unlinkItem ""NVGoggles_opfor""; this removeItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; this addGoggles ""G_Shades_Red""; this addVest ""V_Rangemaster_belt""; this addHeadgear ""H_Cap_grn_BI""; this setBehaviour ""Safe""; this setUnitPos ""Up""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4,5]; this addWeapon ""hgun_Pistol_heavy_02_Yorris_F""; this forceAddUniform ""U_IG_Guerilla3_1""; this addItem ""FirstAidKit""; this addItem ""FirstAidKit""; this addMagazine ""SmokeShellGreen""; this addMagazine ""SmokeShellRed"""]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_GL_F", [6067.353, 10753.3, 3.3319733], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [6067.353, 10753.3, 3.3319733];
	_this setDir 293.30176;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_02";
	BIS_POI_WeaponSmugglers_02_Smuggler_02 = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_opfor""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_TacVest_oli""; this addHeadgear ""H_Cap_blk_ION""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3]; this addWeapon ""arifle_Katiba_GL_F""; this addPrimaryWeaponItem ""optic_mrco""; {this addMagazine ""HandGrenade""} forEach [0,1]; this forceAddUniform ""U_IG_Guerilla2_3""; this addItem ""FirstAidKit""; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_P07_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2]"]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_AR_F", [6090.8589, 10701.337], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [6090.8589, 10701.337];
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_04";
	BIS_POI_WeaponSmugglers_02_Smuggler_04 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.73872828;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_WeaponSmugglers_02_groupCyan = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_opfor""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_Chestrig_blk""; this addHeadgear ""H_Bandanna_gry""; this addMagazine ""150Rnd_762x51_Box""; this addWeapon ""LMG_Zafir_F""; {this addMagazine ""150Rnd_762x51_Box""} forEach [0,1]; this addPrimaryWeaponItem ""optic_hamr""; {this addMagazine ""HandGrenade""} forEach [0,1]; this addMagazine ""SmokeShell""; this addMagazine ""SmokeShellYellow""; this forceAddUniform ""U_IG_Guerilla2_1""; this addItem ""FirstAidKit""; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_Rook40_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2]"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_F", [6091.9805, 10699.857], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [6091.9805, 10699.857];
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_05";
	BIS_POI_WeaponSmugglers_02_Smuggler_05 = _this;
	_this setUnitAbility 0.69458753;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addGoggles ""G_Squares_Tinted""; this addVest ""V_BandollierB_oli""; this addHeadgear ""H_Cap_headphones""; {this addMagazine ""30Rnd_65x39_caseless_mag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_MX_Black_F""; this addPrimaryWeaponItem ""optic_aco""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""Chemlight_green""} forEach [0,1]; this forceAddUniform ""U_IG_Guerilla1_1""; this addItem ""FirstAidKit""; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2]"]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_Soldier_M_F", [6084.1284, 10728.436], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [6084.1284, 10728.436];
	_this setDir 184.4343;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_06";
	BIS_POI_WeaponSmugglers_02_Smuggler_06 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.64624286;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_Chestrig_khk""; this addHeadgear ""H_Cap_oli""; {this addMagazine ""20Rnd_762x51_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""srifle_EBR_DMS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this addMagazine ""SmokeShell""; this addMagazine ""SmokeShellRed""; this forceAddUniform ""U_IG_leader""; this addItem ""FirstAidKit""; this addMagazine ""11Rnd_45ACP_Mag""; this addWeapon ""hgun_Pistol_heavy_01_F""; {this addMagazine ""11Rnd_45ACP_Mag""} forEach [0,1,2]; this addWeapon ""Binocular"""]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [6066.9966, 10741.489], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [6066.9966, 10741.489];
	_this setDir 135.77252;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_07";
	BIS_POI_WeaponSmugglers_02_Smuggler_07 = _this;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_Chestrig_oli""; this addHeadgear ""H_Shemag_olive""; {this addMagazine ""30Rnd_45ACP_Mag_SMG_01""} forEach [0,1,2,3,4,5];  this addWeapon ""SMG_01_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""Chemlight_blue""} forEach [0,1]; this forceAddUniform ""U_IG_Guerilla1_1""; this addItem ""FirstAidKit""; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_Rook40_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2]"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [6085.2593, 10724.316], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [6085.2593, 10724.316];
	_this setDir -44.475597;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_08";
	BIS_POI_WeaponSmugglers_02_Smuggler_08 = _this;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addGoggles ""G_Lowprofile""; this addVest ""V_PlateCarrier2_rgr""; this addHeadgear ""H_Watchcap_blk""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""HandGrenade""} forEach [0,1,2,3]; this addMagazine ""SmokeShellBlue""; this forceAddUniform ""U_IG_Guerilla2_1""; this addItem ""FirstAidKit""; this addMagazine ""11Rnd_45ACP_Mag""; this addWeapon ""hgun_Pistol_heavy_01_snds_F""; {this addMagazine ""11Rnd_45ACP_Mag""} forEach [0,1,2]"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [6088.7231, 10735.441], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [6088.7231, 10735.441];
	_this setDir -161.75247;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_09";
	BIS_POI_WeaponSmugglers_02_Smuggler_09 = _this;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_PlateCarrierIA1_dgtl""; this addHeadgear ""H_MilCap_gry""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Mk20C_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""Chemlight_blue""} forEach [0,1,2,3]; this forceAddUniform ""U_IG_Guerilla1_1""; this addItem ""FirstAidKit""; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2]"]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [6077.4014, 10735.493], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_center";
	BIS_POI_WeaponSmugglers_02_center = _this;
	_this setPos [6077.4014, 10735.493];
	_initCodes set [count _initCodes,[_this,"EAST setFriend [RESISTANCE, 1]; RESISTANCE setFriend [EAST, 1]; "]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [6059.2949, 10751.229, 0.32354203], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 10.450347;
	_this setPos [6059.2949, 10751.229, 0.32354203];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.765; this setHit [""karoserie"",0.30]; this setHit [""engine"",0.25]"]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_soldier_F", [6069.3569, 10751.658, 0.47059846], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [6069.3569, 10751.658, 0.47059846];
	_this setDir 157.41524;
	_this setVehicleVarName "BIS_POI_WeaponSmugglers_02_Smuggler_03";
	BIS_POI_WeaponSmugglers_02_Smuggler_03 = _this;
	_this setUnitAbility 0.59789819;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeVest this; removeUniform this; removeGoggles this; this addVest ""V_PlateCarrierIA2_dgtl""; this addHeadgear ""H_Shemag_khk""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Mk20_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""HandGrenade""} forEach [0,1]; this addMagazine ""SmokeShell""; this addMagazine ""Chemlight_blue""; this forceAddUniform ""U_IG_leader""; this addItem ""FirstAidKit""; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2]"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["I_supplyCrate_F", [6088.7471, 10742, 0.65074831], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir 82.54287;
	_this setPos [6088.7471, 10742, 0.65074831];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; this allowDamage false; clearBackpackCargo this; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addItemCargo [""V_PlateCarrier1_blk"",4]; this addItemCargo [""MineDetector"",2]; this addItemCargo [""acc_pointer_IR"",4]; this addBackpackCargo [""B_FieldPack_blk"",2]; this addBackpackCargo [""B_Carryall_oli"",2]; this addItemCargo [""optic_NVS"",2]; this addItemCargo [""optic_TWS"",2]; this addItemCargo [""NVGoggles"",4]"]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_AmmoOrd_F", [6096.0752, 10737.824, 0.49278641], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [6096.0752, 10737.824, 0.49278641];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; clearMagazineCargo this; this addMagazineCargo [""APERSBoundingMine_Range_Mag"",15]; this addMagazineCargo [""ClaymoreDirectionalMine_Remote_Mag"",12]; this addMagazineCargo [""SLAMDirectionalMine_Wire_Mag"",10]; this addMagazineCargo [""SatchelCharge_Remote_Mag"",6]; this addMagazineCargo [""ATMine_Range_Mag"",6]"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_WpsSpecial_F", [6082.8818, 10741.015, 0.50491768], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir 13.274363;
	_this setPos [6082.8818, 10741.015, 0.50491768];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addWeaponCargo [""srifle_GM6_LRPS_F"",1]; this addMagazineCargo [""5Rnd_127x108_Mag"",30]; this addMagazineCargo [""5Rnd_127x108_APDS_Mag"",12]; this addMagazineCargo [""7Rnd_408_Mag"",24]; this addWeaponCargo [""srifle_LRR_LRPS_F"",1]; this addItemCargo [""muzzle_snds_M"",2]; this addItemCargo [""muzzle_snds_H"",2]; this addItemCargo [""muzzle_snds_B"",2]; this addWeaponCargo [""Rangefinder"",2]"]];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6080.6353, 10744.816, 0.56380367], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -57.066929;
	_this setPos [6080.6353, 10744.816, 0.56380367];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [6074.2583, 10750.209, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 30.968954;
	_this setPos [6074.2583, 10750.209, -2.2888184e-005];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Campfire_burning_F", [6083.5625, 10725.648, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setPos [6083.5625, 10725.648, -1.9073486e-006];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [6070.9458, 10745.709, -0.018222351], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setPos [6070.9458, 10745.709, -0.018222351];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6071.5889, 10751.794, 3.4255161], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -59.868237;
	_this setPos [6071.5889, 10751.794, 3.4255161];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6068.7173, 10750.09, 3.3245182], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir 32.349339;
	_this setPos [6068.7173, 10750.09, 3.3245182];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6071.1929, 10752.487, 3.5194509], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -62.027168;
	_this setPos [6071.1929, 10752.487, 3.5194509];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6069.3286, 10750.48, 3.4355338], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir 35.334621;
	_this setPos [6069.3286, 10750.48, 3.4355338];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6068.582, 10750.947, 3.4367206], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 33.099144;
	_this setPos [6068.582, 10750.947, 3.4367206];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [6066.9014, 10755.597, 3.2370327], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir 30.447369;
	_this setPos [6066.9014, 10755.597, 3.2370327];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_khaki_F", [6069.8115, 10754.669, 3.2598863], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -58.71199;
	_this setPos [6069.8115, 10754.669, 3.2598863];
	_initCodes set [count _initCodes,[_this,"[29.9115,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [6069.0308, 10755.294, 0.4428525], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir 120.06998;
	_this setPos [6069.0308, 10755.294, 0.4428525];
	_initCodes set [count _initCodes,[_this,"[27.0378,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [6071.2075, 10751.002, 0.42172387], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir 31.438709;
	_this setPos [6071.2075, 10751.002, 0.42172387];
	_initCodes set [count _initCodes,[_this,"[27.0378,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [6071.6318, 10751.673, 0.43739483], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setDir 29.298643;
	_this setPos [6071.6318, 10751.673, 0.43739483];
	_initCodes set [count _initCodes,[_this,"[27.0378,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Box_NATO_Ammo_F", [6085.2441, 10739.55, 0.46293885], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir -128.63387;
	_this setPos [6085.2441, 10739.55, 0.46293885];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; clearWeaponCargo this; clearMagazineCargo this; clearItemCargo this; this addItemCargo [""optic_hamr"",2]; this addItemCargo [""optic_aco"",4]; this addMagazineCargo [""30Rnd_65x39_caseless_mag"",40]; this addMagazineCargo [""30Rnd_65x39_caseless_mag_Tracer"",10]; this addMagazineCargo [""100Rnd_65x39_caseless_mag"",15]; this addMagazineCargo [""100Rnd_65x39_caseless_mag_tracer"",5]; this addMagazineCargo [""11Rnd_45ACP_Mag"",20]; this addMagazineCargo [""1Rnd_HE_Grenade_shell"",20]"]];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [6082.8618, 10745.344, 0.50052446], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setDir -151.29636;
	_this setPos [6082.8618, 10745.344, 0.50052446];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [6083.9893, 10739.823, 0.44659424], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setPos [6083.9893, 10739.823, 0.44659424];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [6095.4473, 10736.341, 0.2016512], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir 32.920914;
	_this setPos [6095.4473, 10736.341, 0.2016512];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [6095.6758, 10736.702, 0.17298515], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir 32.476036;
	_this setPos [6095.6758, 10736.702, 0.17298515];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkull_F", [6095.1362, 10738.908, 0.10671815], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setDir 88.56279;
	_this setPos [6095.1362, 10738.908, 0.10671815];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6085.3516, 10723.091, 0.14920534], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir 144.57121;
	_this setPos [6085.3516, 10723.091, 0.14920534];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6086.5352, 10724.686, 6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir 101.30224;
	_this setPos [6086.5352, 10724.686, 6.2942505e-005];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6082.2427, 10727.518, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir -49.989216;
	_this setPos [6082.2427, 10727.518, -7.6293945e-006];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_F", [6063.3008, 10742.314, 0.27174005], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -142.99239;
	_this setPos [6063.3008, 10742.314, 0.27174005];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_F", [6062.2212, 10743.023, 0.38139483], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir -149.12056;
	_this setPos [6062.2212, 10743.023, 0.38139483];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_F", [6064.7368, 10741.343, 0.32095963], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir -151.9718;
	_this setPos [6064.7368, 10741.343, 0.32095963];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [6063.5107, 10745.207, 0.34091166], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setDir -58.154686;
	_this setPos [6063.5107, 10745.207, 0.34091166];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [6064.4033, 10746.361, 0.44782391], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir -58.316372;
	_this setPos [6064.4033, 10746.361, 0.44782391];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_F", [6065.2559, 10747.563, 0.34255558], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -57.978764;
	_this setPos [6065.2559, 10747.563, 0.34255558];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pillow_F", [6064.0337, 10741.839, 0.24485743], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -61.18964;
	_this setPos [6064.0337, 10741.839, 0.24485743];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pillow_grey_F", [6063.5645, 10744.301, 0.3412689], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir 20.389641;
	_this setPos [6063.5645, 10744.301, 0.3412689];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [6065.4741, 10743.702, 0.24067055], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [6065.4741, 10743.702, 0.24067055];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [6066.5288, 10742.825, 0.18000567], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir 19.890182;
	_this setPos [6066.5288, 10742.825, 0.18000567];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [6067.1245, 10743.848, 0.36625603], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setPos [6067.1245, 10743.848, 0.36625603];
};

_vehicle_66 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [6067.2051, 10743.888, 0.47249436], [], 0, "CAN_COLLIDE"];
	_vehicle_66 = _this;
	_this setPos [6067.2051, 10743.888, 0.47249436];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [6067.1758, 10744.305, 0.38145259], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setPos [6067.1758, 10744.305, 0.38145259];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [6064.584, 10747.273, 0.51511532], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setPos [6064.584, 10747.273, 0.51511532];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [6063.562, 10743.88, 0.48499179], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setPos [6063.562, 10743.88, 0.48499179];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [6067.2505, 10744.337, 0.63964045], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir 10.678879;
	_this setPos [6067.2505, 10744.337, 0.63964045];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [6067.4106, 10744.466, 0.53270096], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setDir 50.765457;
	_this setPos [6067.4106, 10744.466, 0.53270096];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RiceBox_F", [6066.9097, 10743.622, 0.46869969], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setPos [6066.9097, 10743.622, 0.46869969];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RiceBox_F", [6066.1064, 10742.628, 0.59815353], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir -66.396545;
	_this setPos [6066.1064, 10742.628, 0.59815353];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_VitaminBottle_F", [6064.1763, 10745.71, 0.40545386], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setPos [6064.1763, 10745.71, 0.40545386];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [6064.418, 10743.7, 0.27940679], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir -59.280083;
	_this setPos [6064.418, 10743.7, 0.27940679];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [6064.2598, 10743.803, 0.40482262], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir -37.834927;
	_this setPos [6064.2598, 10743.803, 0.40482262];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7238.2822, 11041.06, -0.022549434], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setDir -259.31781;
	_this setPos [7238.2822, 11041.06, -0.022549434];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7242.8384, 11041.35, -0.11526776], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -346.44162;
	_this setPos [7242.8384, 11041.35, -0.11526776];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7240.0361, 11042.022, -0.092938744], [], 0, "CAN_COLLIDE"];
	_vehicle_96 = _this;
	_this setDir -346.44162;
	_this setPos [7240.0361, 11042.022, -0.092938744];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7241.4575, 11035.669, 1.0967255e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir -346.44162;
	_this setPos [7241.4575, 11035.669, 1.0967255e-005];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7238.6309, 11036.298, -0.087162867], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setDir -346.44162;
	_this setPos [7238.6309, 11036.298, -0.087162867];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7237.7627, 11038.234, 0.00014019012], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir -258.1564;
	_this setPos [7237.7627, 11038.234, 0.00014019012];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7243.3486, 11036.538, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setDir -256.2977;
	_this setPos [7243.3486, 11036.538, 1.1444092e-005];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["I_Quadbike_01_F", [7249.1445, 11039.65, 0.23099412], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setDir 172.88858;
	_this setPos [7249.1445, 11039.65, 0.23099412];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.825"]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [7239.8901, 11037.921], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [7239.8901, 11037.921];
	_this setDir -106.51858;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.55585921;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_Soldier_GL_F", [7247.7227, 11057.313, 4.3146195], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [7247.7227, 11057.313, 4.3146195];
	_this setDir -35.163235;
	_this setUnitAbility 0.53904378;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_10 createUnit ["I_Soldier_AR_F", [7241.8848, 11036.878], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [7241.8848, 11036.878];
	_this setDir 104.08332;
	_this setUnitAbility 0.55585933;
	if (true) then {_group_10 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["I_Soldier_lite_F", [7224.7661, 11022.863], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [7224.7661, 11022.863];
	_this setDir 105.54967;
	_this setUnitAbility 0.51171863;
	if (true) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_WeaponSmugglers_02_groupBlue = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7223.2642, 11022.886], [], 0, "CAN_COLLIDE"];
	_vehicle_132 = _this;
	_this setPos [7223.2642, 11022.886];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7297.6177, 11005.839], [], 0, "CAN_COLLIDE"];
	_vehicle_134 = _this;
	_this setPos [7297.6177, 11005.839];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7238.0234, 11070.348], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setPos [7238.0234, 11070.348];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7312.7856, 11056.825], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setPos [7312.7856, 11056.825];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7240.6597, 11040.42], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setDir -168.37959;
	_this setPos [7240.6597, 11040.42];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7241.4697, 11040.024], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir -139.60062;
	_this setPos [7241.4697, 11040.024];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [7244.5229, 11041.579], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 188.79715;
	_this setPos [7244.5229, 11041.579];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [7242.4272, 11040.749], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -225.1105;
	_this setPos [7242.4272, 11040.749];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [7241.1938, 11040.866, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir -165.19206;
	_this setPos [7241.1938, 11040.866, 3.8146973e-005];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.2,0.25,0]]];"]];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7226.4692, 11022.29], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setPos [7226.4692, 11022.29];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7226.3799, 11023.127, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setPos [7226.3799, 11023.127, 0];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7260.7139, 11011.976], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setPos [7260.7139, 11011.976];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7296.1792, 11005.94, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setPos [7296.1792, 11005.94, 0];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7278.0156, 11072.201], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setPos [7278.0156, 11072.201];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7233.5967, 11073.591], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setPos [7233.5967, 11073.591];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [7243.6812, 11042.013, 0.033427544], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setDir -29.86237;
	_this setPos [7243.6812, 11042.013, 0.033427544];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_CarDismantled_F", [7133.9121, 11042.417, -1.8596649e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir 107.60155;
	_this setPos [7133.9121, 11042.417, -1.8596649e-005];
};

_vehicle_189 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [7156.5229, 11041.859, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_189 = _this;
	_this setDir -181.82703;
	_this setPos [7156.5229, 11041.859, -5.3405762e-005];
};

_vehicle_191 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [6892.7446, 11140.95, 0.24624883], [], 0, "CAN_COLLIDE"];
	_vehicle_191 = _this;
	_this setDir 55.386299;
	_this setPos [6892.7446, 11140.95, 0.24624883];
};

_vehicle_195 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [6917.6431, 11091.524, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_195 = _this;
	_this setDir -174.67465;
	_this setPos [6917.6431, 11091.524, 5.7220459e-006];
};

_vehicle_197 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_brick_red_F", [6893.3862, 11091.586, 0.29127225], [], 0, "CAN_COLLIDE"];
	_vehicle_197 = _this;
	_this setDir 9.9234791;
	_this setPos [6893.3862, 11091.586, 0.29127225];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CargoBox_V1_F", [6901.4653, 11095.615, 0.20830934], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setDir -51.062325;
	_this setPos [6901.4653, 11095.615, 0.20830934];
};

_vehicle_199 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CargoBox_V1_F", [6898.1851, 11096.815, 0.40567449], [], 0, "CAN_COLLIDE"];
	_vehicle_199 = _this;
	_this setDir 15.244253;
	_this setPos [6898.1851, 11096.815, 0.40567449];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Van_F", [6903.6191, 11090.233, 0.68780094], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setDir -71.803688;
	_this setPos [6903.6191, 11090.233, 0.68780094];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [6840.6128, 11201.021, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setPos [6840.6128, 11201.021, -3.8146973e-006];
};

_vehicle_202 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [6828.7607, 11081.124, 3.7387397], [], 0, "CAN_COLLIDE"];
	_vehicle_202 = _this;
	_this setPos [6828.7607, 11081.124, 3.7387397];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_F", [6832.0225, 11083.988, 3.7741594], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setDir -275.67776;
	_this setPos [6832.0225, 11083.988, 3.7741594];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_204 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [6832.0137, 11082.131, 3.7779636], [], 0, "CAN_COLLIDE"];
	_vehicle_204 = _this;
	_this setDir -261.58432;
	_this setPos [6832.0137, 11082.131, 3.7779636];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_205 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pillow_grey_F", [6831.8462, 11084.613, 3.6982281], [], 0, "CAN_COLLIDE"];
	_vehicle_205 = _this;
	_this setDir 18.742016;
	_this setPos [6831.8462, 11084.613, 3.6982281];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_206 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [6832.1045, 11083.085, 3.765882], [], 0, "CAN_COLLIDE"];
	_vehicle_206 = _this;
	_this setDir 30.918713;
	_this setPos [6832.1045, 11083.085, 3.765882];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_207 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RiceBox_F", [6832.1313, 11082.762, 3.7775269], [], 0, "CAN_COLLIDE"];
	_vehicle_207 = _this;
	_this setDir 108.76611;
	_this setPos [6832.1313, 11082.762, 3.7775269];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_F", [6828.0708, 11085.641, 3.6041169], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setDir -10.551557;
	_this setPos [6828.0708, 11085.641, 3.6041169];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_209 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [6826.8721, 11085.373, 3.6346896], [], 0, "CAN_COLLIDE"];
	_vehicle_209 = _this;
	_this setPos [6826.8721, 11085.373, 3.6346896];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_210 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [6827.2808, 11085.367, 3.6300182], [], 0, "CAN_COLLIDE"];
	_vehicle_210 = _this;
	_this setDir 29.553404;
	_this setPos [6827.2808, 11085.367, 3.6300182];
};

_vehicle_211 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PowderedMilk_F", [6827.1816, 11085.093, 3.6493254], [], 0, "CAN_COLLIDE"];
	_vehicle_211 = _this;
	_this setDir 42.67971;
	_this setPos [6827.1816, 11085.093, 3.6493254];
	_initCodes set [count _initCodes,[_this,"[16.5353,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_212 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [6447.7021, 11001.853, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_212 = _this;
	_this setPos [6447.7021, 11001.853, 7.6293945e-006];
};

_vehicle_213 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [6440.2334, 11000.701, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_213 = _this;
	_this setDir 107.51731;
	_this setPos [6440.2334, 11000.701, -4.196167e-005];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [6439.8623, 10998.565, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setDir 90.583755;
	_this setPos [6439.8623, 10998.565, 3.8146973e-005];
};

_vehicle_215 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [6440.3677, 10999.551, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_215 = _this;
	_this setPos [6440.3677, 10999.551, -2.2888184e-005];
};

_vehicle_219 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [6111.7998, 10569.569, 0.73634493], [], 0, "CAN_COLLIDE"];
	_vehicle_219 = _this;
	_this setDir -177.40355;
	_this setPos [6111.7998, 10569.569, 0.73634493];
	_initCodes set [count _initCodes,[_this,"[16.8636,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_220 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [6108.9072, 10565.854, 3.2230177], [], 0, "CAN_COLLIDE"];
	_vehicle_220 = _this;
	_this setDir 92.391296;
	_this setPos [6108.9072, 10565.854, 3.2230177];
	_initCodes set [count _initCodes,[_this,"[19.7313,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_221 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [6108.7061, 10567.123, 3.4269116], [], 0, "CAN_COLLIDE"];
	_vehicle_221 = _this;
	_this setPos [6108.7061, 10567.123, 3.4269116];
	_initCodes set [count _initCodes,[_this,"[19.7313,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_222 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_blue_F", [6111.6714, 10568.456, 3.4950228], [], 0, "CAN_COLLIDE"];
	_vehicle_222 = _this;
	_this setPos [6111.6714, 10568.456, 3.4950228];
	_initCodes set [count _initCodes,[_this,"[19.7313,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_223 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [6107.1436, 10572.816, 3.762121], [], 0, "CAN_COLLIDE"];
	_vehicle_223 = _this;
	_this setDir -45.814991;
	_this setPos [6107.1436, 10572.816, 3.762121];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [6123.5703, 10564.327, 0.18819636], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setDir 96.253372;
	_this setPos [6123.5703, 10564.327, 0.18819636];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.245; this setHit [""karoserie"",0.35]; this setHit [""engine"",0.65]"]];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [6123.7427, 10568.363, 0.00014305115], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setDir -74.844246;
	_this setPos [6123.7427, 10568.363, 0.00014305115];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_F", [6103.9385, 10506.253, 0.00011062622], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setDir 41.921246;
	_this setPos [6103.9385, 10506.253, 0.00011062622];
};

_vehicle_229 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_F", [6105.2495, 10504.89, 0.037539922], [], 0, "CAN_COLLIDE"];
	_vehicle_229 = _this;
	_this setDir 66.31028;
	_this setPos [6105.2495, 10504.89, 0.037539922];
};

_vehicle_232 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car2_F", [5841.3237, 10516.889, 8.4877014e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_232 = _this;
	_this setDir -60.835667;
	_this setPos [5841.3237, 10516.889, 8.4877014e-005];
};

_vehicle_233 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [5900.5537, 10893.995, 0.88097966], [], 0, "CAN_COLLIDE"];
	_vehicle_233 = _this;
	_this setDir -134.16364;
	_this setPos [5900.5537, 10893.995, 0.88097966];
};

_vehicle_234 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [5900.1421, 10888.529, 1.0683637], [], 0, "CAN_COLLIDE"];
	_vehicle_234 = _this;
	_this setDir -64.443283;
	_this setPos [5900.1421, 10888.529, 1.0683637];
};

_vehicle_235 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_F", [5900.4995, 10892.625, 0.85446674], [], 0, "CAN_COLLIDE"];
	_vehicle_235 = _this;
	_this setDir -196.0715;
	_this setPos [5900.4995, 10892.625, 0.85446674];
};

_vehicle_236 = objNull;
if (true) then
{
	_this = createVehicle ["Campfire_burning_F", [6099.3057, 10502.923, 2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_236 = _this;
	_this setPos [6099.3057, 10502.923, 2.6702881e-005];
};

_vehicle_237 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_F", [6098.0591, 10506.532, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_237 = _this;
	_this setDir -87.234108;
	_this setPos [6098.0591, 10506.532, -7.6293945e-006];
};

_vehicle_238 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_F", [6097.7222, 10505.421, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_238 = _this;
	_this setDir -32.190533;
	_this setPos [6097.7222, 10505.421, 1.9073486e-005];
};

_vehicle_239 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Matches_F", [6097.9873, 10505.218, 4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_239 = _this;
	_this setDir 8.3553095;
	_this setPos [6097.9873, 10505.218, 4.196167e-005];
};

_vehicle_240 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [5907.2759, 10899.402, 1.0321491], [], 0, "CAN_COLLIDE"];
	_vehicle_240 = _this;
	_this setDir -80.746635;
	_this setPos [5907.2759, 10899.402, 1.0321491];
};

_vehicle_241 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FishingGear_02_F", [5833.7026, 10510.092, -1.2397766e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_241 = _this;
	_this setPos [5833.7026, 10510.092, -1.2397766e-005];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [5823.2554, 10509.054, -1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setDir 36.818298;
	_this setPos [5823.2554, 10509.054, -1.9073486e-005];
};

_vehicle_276 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [6090.5693, 10703.244], [], 0, "CAN_COLLIDE"];
	_vehicle_276 = _this;
	_this setPos [6090.5693, 10703.244];
};

_vehicle_278 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [6091.188, 10703.271], [], 0, "CAN_COLLIDE"];
	_vehicle_278 = _this;
	_this setPos [6091.188, 10703.271];
};

_vehicle_280 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [6108.0547, 10739.616], [], 0, "CAN_COLLIDE"];
	_vehicle_280 = _this;
	_this setPos [6108.0547, 10739.616];
};

_vehicle_282 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [6067.0278, 10767.513], [], 0, "CAN_COLLIDE"];
	_vehicle_282 = _this;
	_this setPos [6067.0278, 10767.513];
};

_vehicle_284 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [6046.6069, 10732.23], [], 0, "CAN_COLLIDE"];
	_vehicle_284 = _this;
	_this setPos [6046.6069, 10732.23];
};

_vehicle_286 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [6062.0142, 10708.069], [], 0, "CAN_COLLIDE"];
	_vehicle_286 = _this;
	_this setPos [6062.0142, 10708.069];
};

_vehicle_338 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6081.5957, 10745.675], [], 0, "CAN_COLLIDE"];
	_vehicle_338 = _this;
	_this setPos [6081.5957, 10745.675];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_365 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6876.0605, 10946.997, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_365 = _this;
	_this setPos [6876.0605, 10946.997, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_366 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6814.7954, 10903.187, 0.00010001659], [], 0, "CAN_COLLIDE"];
	_vehicle_366 = _this;
	_this setDir 72.38755;
	_this setPos [6814.7954, 10903.187, 0.00010001659];
};

_vehicle_368 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6815.0674, 10916.854, -9.894371e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_368 = _this;
	_this setDir 109.73766;
	_this setPos [6815.0674, 10916.854, -9.894371e-005];
};

_vehicle_370 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6838.7119, 10929.373, -0.00019216537], [], 0, "CAN_COLLIDE"];
	_vehicle_370 = _this;
	_this setDir 158.88492;
	_this setPos [6838.7119, 10929.373, -0.00019216537];
};

_vehicle_372 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6861.0381, 10943.612, 2.0503998e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_372 = _this;
	_this setDir 152.82607;
	_this setPos [6861.0381, 10943.612, 2.0503998e-005];
};

_vehicle_374 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6877.4604, 10951.17, 0.00010824203], [], 0, "CAN_COLLIDE"];
	_vehicle_374 = _this;
	_this setDir 172.18102;
	_this setPos [6877.4604, 10951.17, 0.00010824203];
};

_vehicle_376 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6896.4824, 10954.908, -0.00024151802], [], 0, "CAN_COLLIDE"];
	_vehicle_376 = _this;
	_this setPos [6896.4824, 10954.908, -0.00024151802];
};

_vehicle_377 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6911.8159, 10955.648, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_377 = _this;
	_this setPos [6911.8159, 10955.648, 5.7220459e-006];
};

_vehicle_378 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6935.9932, 10956.24, 2.5749207e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_378 = _this;
	_this setPos [6935.9932, 10956.24, 2.5749207e-005];
};

_vehicle_379 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6959.5522, 10959.121, -6.4373016e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_379 = _this;
	_this setPos [6959.5522, 10959.121, -6.4373016e-005];
};

_vehicle_380 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_Mines_F", [6968.8691, 10948.918, 4.8279762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_380 = _this;
	_this setDir 279.32056;
	_this setPos [6968.8691, 10948.918, 4.8279762e-005];
};

_vehicle_382 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6819.1641, 10908.38, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_382 = _this;
	_this setPos [6819.1641, 10908.38, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_384 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6822.8477, 10914.861], [], 0, "CAN_COLLIDE"];
	_vehicle_384 = _this;
	_this setPos [6822.8477, 10914.861];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_386 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6835.2241, 10914.569, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_386 = _this;
	_this setPos [6835.2241, 10914.569, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_388 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6829.625, 10922.379, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_388 = _this;
	_this setPos [6829.625, 10922.379, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_390 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6844.2119, 10923.261, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_390 = _this;
	_this setPos [6844.2119, 10923.261, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_392 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6847.0112, 10914.864, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_392 = _this;
	_this setPos [6847.0112, 10914.864, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_394 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6849.8105, 10928.567, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_394 = _this;
	_this setPos [6849.8105, 10928.567, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_396 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6857.1782, 10931.219, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_396 = _this;
	_this setPos [6857.1782, 10931.219, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_398 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6857.9146, 10920.314, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_398 = _this;
	_this setPos [6857.9146, 10920.314, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_400 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6866.019, 10940.209, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_400 = _this;
	_this setPos [6866.019, 10940.209, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_402 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6871.6177, 10930.336], [], 0, "CAN_COLLIDE"];
	_vehicle_402 = _this;
	_this setPos [6871.6177, 10930.336];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_404 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6885.7627, 10936.23, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_404 = _this;
	_this setPos [6885.7627, 10936.23, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_406 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6884.1416, 10942.271, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_406 = _this;
	_this setPos [6884.1416, 10942.271, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_408 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6894.4556, 10949.196, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_408 = _this;
	_this setPos [6894.4556, 10949.196, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_410 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6895.7817, 10940.061, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_410 = _this;
	_this setPos [6895.7817, 10940.061, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_412 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6909.3369, 10944.04, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_412 = _this;
	_this setPos [6909.3369, 10944.04, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_414 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6919.3564, 10952.145, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_414 = _this;
	_this setPos [6919.3564, 10952.145, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_416 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6925.25, 10952.732, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_416 = _this;
	_this setPos [6925.25, 10952.732, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_418 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6922.0083, 10943.302, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_418 = _this;
	_this setPos [6922.0083, 10943.302, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_420 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6936.0054, 10944.335, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_420 = _this;
	_this setPos [6936.0054, 10944.335, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_422 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6937.1841, 10950.375, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_422 = _this;
	_this setPos [6937.1841, 10950.375, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_424 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6950.0029, 10954.06, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_424 = _this;
	_this setPos [6950.0029, 10954.06, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_426 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6954.8652, 10946.545, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_426 = _this;
	_this setPos [6954.8652, 10946.545, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.03]"]];
};

_vehicle_428 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FMradio_F", [6068.1128, 10741.687, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_428 = _this;
	_this setPos [6068.1128, 10741.687, 9.1552734e-005];
};

_vehicle_429 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Rusty_F", [6068.2915, 10741.477, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_429 = _this;
	_this setDir 7.4092641;
	_this setPos [6068.2915, 10741.477, -1.1444092e-005];
};

_vehicle_430 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [6086.8096, 10738.79, 0.40524122], [], 0, "CAN_COLLIDE"];
	_vehicle_430 = _this;
	_this setDir -245.4509;
	_this setPos [6086.8096, 10738.79, 0.40524122];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_SurfaceObject"",""POI_SmugglerWeapons_WoodenTable""];"]];
};

_vehicle_431 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [6086.917, 10743.37, 0.36668471], [], 0, "CAN_COLLIDE"];
	_vehicle_431 = _this;
	_this setDir -62.942017;
	_this setPos [6086.917, 10743.37, 0.36668471];
	_initCodes set [count _initCodes,[_this,"[27.3536,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_SurfaceObject"",""POI_SmugglerWeapons_WoodenTableSmall""];"]];
};

_vehicle_433 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6069.1025, 10748.188], [], 0, "CAN_COLLIDE"];
	_vehicle_433 = _this;
	_this setPos [6069.1025, 10748.188];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""Infirmary""];"]];
};

_vehicle_435 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6109.9473, 10568.617, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_435 = _this;
	_this setPos [6109.9473, 10568.617, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["I_soldier_F", [7224.3936, 11024.764], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [7224.3936, 11024.764];
	_this setDir 97.977097;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_442 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [7243.5078, 11038.663, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_442 = _this;
	_this setPos [7243.5078, 11038.663, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_443 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6089.3398, 10726.231], [], 0, "CAN_COLLIDE"];
	_vehicle_443 = _this;
	_this setDir -58.632118;
	_this setPos [6089.3398, 10726.231];
};

_vehicle_444 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [6090.0459, 10728.34, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_444 = _this;
	_this setDir -85.874428;
	_this setPos [6090.0459, 10728.34, -7.6293945e-006];
};

_vehicle_446 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6088.3916, 10726.227, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_446 = _this;
	_this setDir 298.38083;
	_this setPos [6088.3916, 10726.227, -3.8146973e-006];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
