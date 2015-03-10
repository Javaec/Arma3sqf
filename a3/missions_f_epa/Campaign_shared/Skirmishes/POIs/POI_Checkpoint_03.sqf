_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter east;
_center_1 = _this;

_this = createCenter west;
_center_2 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_4 = createGroup _center_1;

_group_6 = createGroup _center_1;

_group_7 = createGroup _center_1;

_group_9 = createGroup _center_1;

_group_10 = createGroup _center_1;

_group_11 = createGroup _center_2;

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_Soldier_SL_F", [7273.1577, 17846.951], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [7273.1577, 17846.951];
	_this setDir 242.73055;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.52000004;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setSkill 0.5; this setUnitPos ""Middle"""]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_AR_F", [7311.2153, 17806.959], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [7311.2153, 17806.959];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_Checkpoint_03_groupBlue = group this; this setSkill 0.35; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_Soldier_GL_F", [7245.8374, 17823.207, 2.856818], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [7245.8374, 17823.207, 2.856818];
	_this setDir 180.86307;
	_this setUnitAbility 0.51802433;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setBehaviour ""Safe""; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeYellow_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_LAT_F", [7313.0171, 17804.707], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [7313.0171, 17804.707];
	_this setUnitAbility 0.50961655;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removeItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["O_Soldier_AR_F", [7287.1646, 17853.449, 2.8219516], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [7287.1646, 17853.449, 2.8219516];
	_this setDir -5.0167723;
	_this setUnitAbility 0.54324758;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setBehaviour ""Safe""; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_medic_F", [7270.9688, 17845.736], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [7270.9688, 17845.736];
	_this setDir 64.750473;
	_this setUnitAbility 0.51171845;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_MilCap_ocamo""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_F", [7309.5664, 17804.561], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [7309.5664, 17804.561];
	_this setUnitAbility 0.53904361;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removeItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_engineer_F", [7277.5938, 17827.6], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [7277.5938, 17827.6];
	_this setDir 157.17886;
	_this setUnitAbility 0.51802433;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_Booniehat_khk""; this unlinkItem ""NVGoggles_opfor""; removeBackpack this; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight""; this addBackpack ""B_FieldPack_ocamo""; (unitBackpack this) addItemCargo [""Toolkit"",1]; (unitBackpack this) addItemCargo [""MineDetector"",1]; "]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_F", [7278.6963, 17825.502], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [7278.6963, 17825.502];
	_this setDir -21.90308;
	_this setUnitAbility 0.54745138;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Middle""; this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["O_Soldier_F", [7265.7163, 17839.443], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [7265.7163, 17839.443];
	_this setDir -102.46331;
	_this setUnitAbility 0.49910671;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this setBehaviour ""Safe""; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["O_Soldier_F", [7262.7275, 17857.387], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [7262.7275, 17857.387];
	_this setUnitAbility 0.53063589;
	if (true) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInGunner BIS_POI_Checkpoint_03_HMG02; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_10 createUnit ["O_Soldier_F", [7264.0146, 17819.268], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [7264.0146, 17819.268];
	_this setDir 183.91133;
	_this setUnitAbility 0.51592225;
	if (true) then {_group_10 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Metal_wire; this moveInGunner BIS_POI_Checkpoint_03_HMG01; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7271.6426, 17821.188, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -0.51624417;
	_this setPos [7271.6426, 17821.188, 1.5258789e-005];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7280.332, 17821.482, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir -0.51624417;
	_this setPos [7280.332, 17821.482, 3.0517578e-005];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7288.8994, 17821.811, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir -0.51624417;
	_this setPos [7288.8994, 17821.811, -1.5258789e-005];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7291.9502, 17827.133, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -89.928474;
	_this setPos [7291.9502, 17827.133, 3.0517578e-005];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7291.6396, 17835.6, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -89.928474;
	_this setPos [7291.6396, 17835.6, -3.0517578e-005];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7291.3457, 17844.068, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -89.928474;
	_this setPos [7291.3457, 17844.068, 1.5258789e-005];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7290.8726, 17852.586], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir -89.928474;
	_this setPos [7290.8726, 17852.586];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7270.375, 17857.109], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -0.51624417;
	_this setPos [7270.375, 17857.109];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7278.8008, 17857.379, -0.050613403], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -0.51624417;
	_this setPos [7278.8008, 17857.379, -0.050613403];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7287.2725, 17857.613, -0.046813965], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -0.51624417;
	_this setPos [7287.2725, 17857.613, -0.046813965];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7266.21, 17824.293, 0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 89.775307;
	_this setPos [7266.21, 17824.293, 0.00012207031];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7265.1826, 17853.648, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir 89.775307;
	_this setPos [7265.1826, 17853.648, 4.5776367e-005];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7265.5254, 17845.066, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setDir 89.775307;
	_this setPos [7265.5254, 17845.066, 1.5258789e-005];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [7269.4302, 17829.559, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir -0.51624417;
	_this setPos [7269.4302, 17829.559, 3.0517578e-005];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [7267.4639, 17841.635], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setPos [7267.4639, 17841.635];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [7273.0942, 17841.67, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setPos [7273.0942, 17841.67, 1.5258789e-005];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [7278.9941, 17841.508, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir -91.55159;
	_this setPos [7278.9941, 17841.508, -4.5776367e-005];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Tower_F", [7246.314, 17824.68, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setPos [7246.314, 17824.68, -3.0517578e-005];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Tower_F", [7286.8447, 17851.635, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir -181.61386;
	_this setPos [7286.8447, 17851.635, 1.5258789e-005];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [7285.0015, 17841.719, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setPos [7285.0015, 17841.719, 1.5258789e-005];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [7288.5244, 17845.479], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setDir 90.239113;
	_this setPos [7288.5244, 17845.479];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [7288.541, 17843.813, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir 90.059593;
	_this setPos [7288.541, 17843.813, 1.5258789e-005];
};

_vehicle_88 = objNull;
if (true) then
{
	_this = createVehicle ["O_MRAP_02_F", [7284.3525, 17829.828, 0.19905598], [], 0, "CAN_COLLIDE"];
	_vehicle_88 = _this;
	_this setDir -51.319729;
	_this setPos [7284.3525, 17829.828, 0.19905598];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addItemCargo [""FirstAidKit"",2]; this setFuel 0.645"]];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [7268.6182, 17824.746, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setDir 252.7955;
	_this setPos [7268.6182, 17824.746, 3.0517578e-005];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [7268.248, 17827.154, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setDir 275.54074;
	_this setPos [7268.248, 17827.154, 6.1035156e-005];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [7269.2144, 17827.205, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir 222.20421;
	_this setPos [7269.2144, 17827.205, 0.0001373291];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [7268.3438, 17826.098, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir 313.05563;
	_this setPos [7268.3438, 17826.098, 4.5776367e-005];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalBarrel_F", [7269.1875, 17825.561, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setDir 205.82544;
	_this setPos [7269.1875, 17825.561, 1.5258789e-005];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [7270.4194, 17827.252, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setDir 129.55557;
	_this setPos [7270.4194, 17827.252, -1.5258789e-005];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Portable_generator_F", [7272.7627, 17824.664], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setDir -230.03992;
	_this setPos [7272.7627, 17824.664];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PaperBox_closed_F", [7270.4766, 17823.457, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_102 = _this;
	_this setDir 1.2701963;
	_this setPos [7270.4766, 17823.457, 9.1552734e-005];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7264.2402, 17816.68, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setDir 0.56847793;
	_this setPos [7264.2402, 17816.68, -3.0517578e-005];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7267.1846, 17816.701, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setDir 0.56847793;
	_this setPos [7267.1846, 17816.701, 3.0517578e-005];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7268.4077, 17818.348, 0.00015258789], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir -92.184959;
	_this setPos [7268.4077, 17818.348, 0.00015258789];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7262.8291, 17818.416, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_111 = _this;
	_this setDir -92.184959;
	_this setPos [7262.8291, 17818.416, 7.6293945e-005];
};

_vehicle_117 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7265.4473, 17861.057, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_117 = _this;
	_this setDir -183.14011;
	_this setPos [7265.4473, 17861.057, 1.5258789e-005];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7262.543, 17860.889, 0.0085296631], [], 0, "CAN_COLLIDE"];
	_vehicle_118 = _this;
	_this setDir -183.14011;
	_this setPos [7262.543, 17860.889, 0.0085296631];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7261.4346, 17859.189, -0.011779785], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir -275.8938;
	_this setPos [7261.4346, 17859.189, -0.011779785];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7266.9805, 17859.445, -0.041976929], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setDir -275.8938;
	_this setPos [7266.9805, 17859.445, -0.041976929];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["O_HMG_01_high_F", [7265.3877, 17818.141], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir 179.2121;
	_this setVehicleVarName "BIS_POI_Checkpoint_03_HMG01";
	BIS_POI_Checkpoint_03_HMG01 = _this;
	_this setPos [7265.3877, 17818.141];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["O_GMG_01_high_F", [7264.1494, 17859.635], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setVehicleVarName "BIS_POI_Checkpoint_03_HMG02";
	BIS_POI_Checkpoint_03_HMG02 = _this;
	_this setPos [7264.1494, 17859.635];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_F", [7254.4683, 17819.361, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setPos [7254.4683, 17819.361, 3.0517578e-005];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_F", [7258.6875, 17819.313, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_132 = _this;
	_this setPos [7258.6875, 17819.313, -1.5258789e-005];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_F", [7252.3604, 17857.477], [], 0, "CAN_COLLIDE"];
	_vehicle_134 = _this;
	_this setDir -16.445246;
	_this setPos [7252.3604, 17857.477];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_F", [7256.1797, 17858.496], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setDir -13.481779;
	_this setPos [7256.1797, 17858.496];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [7289.6465, 17840.355], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir 204.02257;
	_this setPos [7289.6465, 17840.355];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [7286.8433, 17834.92, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setPos [7286.8433, 17834.92, 6.1035156e-005];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["O_supplyCrate_F", [7268.2959, 17843.684, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 48.478252;
	_this setPos [7268.2959, 17843.684, -3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addWeaponCargo [""arifle_Katiba_F"",2]; this addMagazineCargo [""30Rnd_65x39_caseless_green"",30]; this addMagazineCargo [""150Rnd_762x51_Box"",5]; this addMagazineCargo [""1Rnd_HE_Grenade_shell"",20]; this addMagazineCargo [""HandGrenade"",20]; this addMagazineCargo [""SmokeShell"",20]; this addMagazineCargo [""UGL_FlareWhite_F"",20]; this addItemCargo [""Toolkit"",1]; this addItemCargo [""Medikit"",1]; this addItemCargo [""FirstAidKit"",12]"]];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7271.3467, 17853.688, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setPos [7271.3467, 17853.688, -4.5776367e-005];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7272.2363, 17853.684, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setPos [7272.2363, 17853.684, 3.0517578e-005];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7274.0088, 17853.496, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setPos [7274.0088, 17853.496, -1.5258789e-005];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7275.022, 17853.574, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setPos [7275.022, 17853.574, -4.5776367e-005];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7276.8325, 17850.951, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setDir 87.364372;
	_this setPos [7276.8325, 17850.951, 6.1035156e-005];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [7276.8125, 17850.113, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir 105.6638;
	_this setPos [7276.8125, 17850.113, -3.0517578e-005];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [7275.9116, 17850.479, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir 91.792366;
	_this setPos [7275.9116, 17850.479, 6.1035156e-005];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [7274.6465, 17852.902, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir 1.0822085;
	_this setPos [7274.6465, 17852.902, -6.1035156e-005];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [7271.7979, 17853.037, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setDir 0.92671436;
	_this setPos [7271.7979, 17853.037, 1.5258789e-005];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["MapBoard_altis_F", [7268.5146, 17848.988, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir -130.95871;
	_this setPos [7268.5146, 17848.988, 4.5776367e-005];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["CamoNet_OPFOR_open_F", [7272.5239, 17851.701, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setPos [7272.5239, 17851.701, 3.0517578e-005];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [7282.8076, 17855.73], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setDir 29.734604;
	_this setPos [7282.8076, 17855.73];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [7286.7246, 17839.832], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setDir 29.397978;
	_this setPos [7286.7246, 17839.832];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [7264.2114, 17839.529, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir 88.12558;
	_this setPos [7264.2114, 17839.529, -1.5258789e-005];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [7266.4194, 17838.33, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setPos [7266.4194, 17838.33, 3.0517578e-005];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [7275.0645, 17835.078], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setVehicleVarName "BIS_POI_Checkpoint_03_Center";
	BIS_POI_Checkpoint_03_Center = _this;
	_this setPos [7275.0645, 17835.078];
};

_vehicle_172 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7310.8574, 17811.746], [], 0, "CAN_COLLIDE"];
	_vehicle_172 = _this;
	_this setPos [7310.8574, 17811.746];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7310.4004, 17811.756], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setPos [7310.4004, 17811.756];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7311.3013, 17874.807], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setPos [7311.3013, 17874.807];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7227.3877, 17875.932], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setPos [7227.3877, 17875.932];
};

_vehicle_180 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [7227.2002, 17807.941], [], 0, "CAN_COLLIDE"];
	_vehicle_180 = _this;
	_this setPos [7227.2002, 17807.941];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7256.5161, 17817.039], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setPos [7256.5161, 17817.039];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7253.1338, 17860.359, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setPos [7253.1338, 17860.359, 0];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7268.2412, 17834.197, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setPos [7268.2412, 17834.197, 0];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["O_Quadbike_01_F", [7286.3638, 17837.033], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setDir -86.280998;
	_this setPos [7286.3638, 17837.033];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.825"]];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7273.4917, 17503.045, -0.089544825], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir -81.328377;
	_this setPos [7273.4917, 17503.045, -0.089544825];
};

_vehicle_190 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7266.7939, 17534.215], [], 0, "CAN_COLLIDE"];
	_vehicle_190 = _this;
	_this setDir -98.134987;
	_this setPos [7266.7939, 17534.215];
};

_vehicle_192 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7256.7593, 17574.227, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_192 = _this;
	_this setDir -181.43831;
	_this setPos [7256.7593, 17574.227, 4.5776367e-005];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7218.5806, 17561.857, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setDir -214.66368;
	_this setPos [7218.5806, 17561.857, -4.5776367e-005];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7203.125, 17542.484, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setDir -265.79297;
	_this setPos [7203.125, 17542.484, -1.5258789e-005];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7208.3975, 17519.615, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setDir 61.331509;
	_this setPos [7208.3975, 17519.615, -4.5776367e-005];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7223.6938, 17500.762, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setDir 55.355492;
	_this setPos [7223.6938, 17500.762, -4.5776367e-005];
};

_vehicle_202 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [7244.5889, 17488.459, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_202 = _this;
	_this setDir -20.442705;
	_this setPos [7244.5889, 17488.459, -6.1035156e-005];
};

_vehicle_204 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7238.1099, 17503.162], [], 0, "CAN_COLLIDE"];
	_vehicle_204 = _this;
	_this setPos [7238.1099, 17503.162];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_206 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7253.0122, 17506.215, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_206 = _this;
	_this setPos [7253.0122, 17506.215, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7258.6641, 17519.162, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setPos [7258.6641, 17519.162, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_210 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7259.1836, 17528.314], [], 0, "CAN_COLLIDE"];
	_vehicle_210 = _this;
	_this setPos [7259.1836, 17528.314];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_212 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7258.8481, 17546.238, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_212 = _this;
	_this setPos [7258.8481, 17546.238, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7250.8252, 17560.371, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setPos [7250.8252, 17560.371, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_216 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7239.8838, 17565.568, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_216 = _this;
	_this setPos [7239.8838, 17565.568, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_218 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7229.126, 17558.455, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_218 = _this;
	_this setPos [7229.126, 17558.455, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_220 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7244.2603, 17549.158, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_220 = _this;
	_this setPos [7244.2603, 17549.158, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_222 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7221.623, 17538.541], [], 0, "CAN_COLLIDE"];
	_vehicle_222 = _this;
	_this setPos [7221.623, 17538.541];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7228.3052, 17547.334, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setPos [7228.3052, 17547.334, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7211.7119, 17547.881, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setPos [7211.7119, 17547.881, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7249.8438, 17535.395], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setPos [7249.8438, 17535.395];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_230 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7226.3906, 17527.277, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_230 = _this;
	_this setPos [7226.3906, 17527.277, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_232 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7225.0234, 17515.24, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_232 = _this;
	_this setPos [7225.0234, 17515.24, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_vehicle_234 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [7242.0728, 17519.619, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_234 = _this;
	_this setPos [7242.0728, 17519.619, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""];"]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_G_Soldier_F", [7236.0654, 17534.896], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [7236.0654, 17534.896];
	_this setDir -78.054359;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setDamage 1} forEach (units group this); this removeMagazines ""Chemlight_blue""; this setAmmo [(primaryWeapon this),14]; this removeMagazines ""30Rnd_556x45_Stanag""; this removeItem ""FirstAidKit""; this removeMagazine ""SmokeShell""; this addItem ""ItemGPS""; this addWeapon ""Binocular""; {this addMagazine ""20Rnd_762x51_Mag""} forEach [0,1,2]; this addMagazine ""ClaymoreDirectionalMine_Remote_Mag"""]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_G_Soldier_LAT_F", [7242.4751, 17524.467], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [7242.4751, 17524.467];
	_this setDir -118.37509;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),23]; this removeMagazines ""30Rnd_556x45_Stanag""; this removeMagazines ""RPG32_F""; (unitBackpack this) addMagazineCargo [""ATMine_Range_Mag"",1]"]];
};

_vehicle_236 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [7239.8232, 17537.596], [], 0, "CAN_COLLIDE"];
	_vehicle_236 = _this;
	_this setPos [7239.8232, 17537.596];
};

_vehicle_237 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MetalWire_F", [7266.6577, 17780.998, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_237 = _this;
	_this setVehicleVarName "Metal_wire";
	Metal_wire = _this;
	_this setPos [7266.6577, 17780.998, 0];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
