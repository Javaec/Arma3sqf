_initCodes = [];

_this = createCenter civilian;
_center_1 = _this;

_this = createCenter resistance;
_center_0 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_0;

_group_2 = createGroup _center_0;

_group_3 = createGroup _center_0;

_group_8 = createGroup _center_1;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_Soldier_TL_F", [6876.1665, 22174.869], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [6876.1665, 22174.869];
	_this setDir -9.4303741;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.44420397;
	if (true) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up"""]];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6860.2744, 22169.777, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -5.658463;
	_this setPos [6860.2744, 22169.777, 1.5258789e-005];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [6856.9033, 22169.408, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir -6.9941311;
	_this setPos [6856.9033, 22169.408, -3.0517578e-005];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6856.8901, 22170.691, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir -96.054344;
	_this setPos [6856.8901, 22170.691, 6.1035156e-005];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6856.2148, 22176.297, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setDir -96.198532;
	_this setPos [6856.2148, 22176.297, 7.6293945e-005];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6858.7466, 22182.406, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir -5.658463;
	_this setPos [6858.7466, 22182.406, -6.1035156e-005];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [6855.3755, 22182.037, -0.067993164], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setDir -6.9941311;
	_this setPos [6855.3755, 22182.037, -0.067993164];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6878.6875, 22184.451, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setDir -184.75673;
	_this setPos [6878.6875, 22184.451, -1.5258789e-005];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [6882.0786, 22184.768, -0.088882446], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setDir -186.09241;
	_this setPos [6882.0786, 22184.768, -0.088882446];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6882.0601, 22183.482, -0.082687378], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir -275.15259;
	_this setPos [6882.0601, 22183.482, -0.082687378];
};

_vehicle_94 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6882.5283, 22177.863, -0.16204755], [], 0, "CAN_COLLIDE"];
	_vehicle_94 = _this;
	_this setDir -275.15259;
	_this setPos [6882.5283, 22177.863, -0.16204755];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [6880.0244, 22171.801, -0.060794339], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -184.75673;
	_this setPos [6880.0244, 22171.801, -0.060794339];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [6883.3979, 22172.121, -0.034291804], [], 0, "CAN_COLLIDE"];
	_vehicle_96 = _this;
	_this setDir -186.09241;
	_this setPos [6883.3979, 22172.121, -0.034291804];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_transport_F", [6880.6958, 22154.938, 0.20051931], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setDir 15.24063;
	_this setPos [6880.6958, 22154.938, 0.20051931];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.615"]];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [6857.9292, 22180.762, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_126 = _this;
	_this setDir -96.376297;
	_this setPos [6857.9292, 22180.762, -3.0517578e-005];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [6877.855, 22174.117], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir -370.99857;
	_this setPos [6877.855, 22174.117];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [6878.7324, 22174.258, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setDir -364.08292;
	_this setPos [6878.7324, 22174.258, 3.0517578e-005];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [6858.8359, 22171.332, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setDir -123.5243;
	_this setPos [6858.8359, 22171.332, 1.5258789e-005];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6878.4165, 22173.654, -0.069522075], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -8.4912806;
	_this setPos [6878.4165, 22173.654, -0.069522075];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [6880.0796, 22168.02, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setDir -6.5318351;
	_this setPos [6880.0796, 22168.02, 4.5776367e-005];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [6880.2852, 22167.723, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir -61.886715;
	_this setPos [6880.2852, 22167.723, 1.5258789e-005];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [6862.5986, 22171.713, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setDir -220.72198;
	_this setPos [6862.5986, 22171.713, -3.0517578e-005];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [6862.6016, 22171.809, 0.021808654], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir -312.27826;
	_this setPos [6862.6016, 22171.809, 0.021808654];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Portable_generator_F", [6858.916, 22172.836, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_158 = _this;
	_this setDir -163.25125;
	_this setPos [6858.916, 22172.836, 3.0517578e-005];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [6860.4326, 22171.016, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setPos [6860.4326, 22171.016, 7.6293945e-005];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [6880.71, 22169.24, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setDir 111.16195;
	_this setPos [6880.71, 22169.24, -0.00012207031];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [6862.3877, 22176.523, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setPos [6862.3877, 22176.523, 6.1035156e-005];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [6879.8843, 22179.828, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setDir -5.4457259;
	_this setPos [6879.8843, 22179.828, 6.1035156e-005];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [6880.1279, 22176.293, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir -6.8439999;
	_this setPos [6880.1279, 22176.293, -3.0517578e-005];
};

_vehicle_172 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [6876.8364, 22182.227, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_172 = _this;
	_this setDir -93.103256;
	_this setPos [6876.8364, 22182.227, -4.5776367e-005];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [6875.8052, 22172.762, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setDir -99.210968;
	_this setPos [6875.8052, 22172.762, -1.5258789e-005];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; this addMagazineCargo [""30Rnd_556x45_Stanag"",20]; this addMagazineCargo [""200Rnd_65x39_cased_Box"",5]; this addMagazineCargo [""HandGrenade"",10]; this addMagazineCargo [""1Rnd_HE_Grenade_shell"",10]; this addMagazineCargo [""SmokeShell"",10]; this addMagazineCargo [""Chemlight_green"",20]"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [6849.4063, 22191.705], [], 0, "FORM"];
	_unit_2 = _this;
	_this setPos [6849.4063, 22191.705];
	_this setDir 81.87162;
	_this setUnitAbility 0.5010826;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_Checkpoint_01_groupBlue = group this; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; (group this) setSpeedMode ""LIMITED""; (group this) setBehaviour ""SAFE"";"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [6877.4922, 22169.309], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [6877.4922, 22169.309];
	_this setDir -211.28088;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [6862.3018, 22184.994], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [6862.3018, 22184.994];
	_this setDir -7.8552485;
	_this setUnitAbility 0.45496601;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this setUnitPos ""Up""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]];"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [6850.353, 22193.209], [], 0, "FORM"];
	_unit_9 = _this;
	_this setPos [6850.353, 22193.209];
	_this setDir -217.10892;
	_this setUnitAbility 0.46127182;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"";"]];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [6862.585, 22180.07, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_177 = _this;
	_this setPos [6862.585, 22180.07, -9.1552734e-005];
};

_vehicle_180 = objNull;
if (true) then
{
	_this = createVehicle ["CamoNet_INDP_open_F", [6878.7695, 22178.162], [], 0, "CAN_COLLIDE"];
	_vehicle_180 = _this;
	_this setDir -94.91423;
	_this setPos [6878.7695, 22178.162];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [6861.8062, 22186.703, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir -4.0275321;
	_this setPos [6861.8062, 22186.703, -1.5258789e-005];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [6860.5703, 22184.969, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setDir 86.045456;
	_this setPos [6860.5703, 22184.969, 1.5258789e-005];
};

_vehicle_187 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [6877.228, 22167.898], [], 0, "CAN_COLLIDE"];
	_vehicle_187 = _this;
	_this setDir -4.0275321;
	_this setPos [6877.228, 22167.898];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [6878.8311, 22169.318, 0.04750061], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir 86.045456;
	_this setPos [6878.8311, 22169.318, 0.04750061];
};

_vehicle_191 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6890.8579, 22167.043, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_191 = _this;
	_this setPos [6890.8579, 22167.043, -4.5776367e-005];
};

_vehicle_199 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6886.8789, 22190.281, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_199 = _this;
	_this setPos [6886.8789, 22190.281, -9.1552734e-005];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6851.2368, 22191.469, -0.00068664551], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setPos [6851.2368, 22191.469, -0.00068664551];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6856.6074, 22160.426, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setPos [6856.6074, 22160.426, 3.0517578e-005];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [6851.6416, 22191.387, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setPos [6851.6416, 22191.387, 4.5776367e-005];
};

_vehicle_213 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [6878.0762, 22160.83, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_213 = _this;
	_this setPos [6878.0762, 22160.83, -1.5258789e-005];
};

_vehicle_217 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [6862.2197, 22191.811], [], 0, "CAN_COLLIDE"];
	_vehicle_217 = _this;
	_this setPos [6862.2197, 22191.811];
};

_vehicle_218 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [6869.1431, 22177.088, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_218 = _this;
	_this setVehicleVarName "BIS_POI_Checkpoint_01_center";
	BIS_POI_Checkpoint_01_center = _this;
	_this setPos [6869.1431, 22177.088, 0.0001373291];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_engineer_F", [6861.2998, 22177.455], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [6861.2998, 22177.455];
	_this setDir 115.51453;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; removeBackpack this; this addBackpack ""B_Fieldpack_oli""; (unitBackpack this) addItemCargo [""Toolkit"",1]; (unitBackpack this) addItemCargo [""MineDetector"",1]; "]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_Soldier_GL_F", [6875.2715, 22177.65], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [6875.2715, 22177.65];
	_this setDir 156.02007;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Middle""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
