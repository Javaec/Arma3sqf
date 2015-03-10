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

_group_5 = createGroup _center_1;

_group_6 = createGroup _center_1;

_group_7 = createGroup _center_1;

_group_8 = createGroup _center_1;

_group_9 = createGroup _center_1;

_group_10 = createGroup _center_1;

_group_11 = createGroup _center_1;

_group_12 = createGroup _center_1;

_group_13 = createGroup _center_2;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_recon_TL_F", [8374.2441, 18243.695], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [8374.2441, 18243.695];
	_this setDir 76.491753;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_01_01";
	BIS_POI_SpecialForces_01_SF_01_01 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.75999999;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_01_01_DuckTape; this setPosATL [8375.29,18241.4,0]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOGL_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_Katiba_GL_ARCO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addWeapon ""Rangefinder""; this addItem ""optic_nvs"""]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_recon_TL_F", [8376.3086, 18239.564, 0.28693032], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [8376.3086, 18239.564, 0.28693032];
	_this setDir 30.128521;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_01_02";
	BIS_POI_SpecialForces_01_SF_01_02 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setPosATL [8380.65,18236.4,0]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOGL_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7];   {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_Katiba_GL_ARCO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1];   this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addWeapon ""Rangefinder""; this addItem ""optic_nvs"""]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_recon_medic_F", [8390.2129, 18252.953], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [8390.2129, 18252.953];
	_this setDir -117.0023;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_02_01";
	BIS_POI_SpecialForces_01_SF_02_01 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.74503422;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_02_01_DuckTape; this setPosATL [8387.87,18253.1,0]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; (unitBackpack this) addItemCargo [""Medikit"",1]; (unitBackpack this) addItemCargo [""FirstAidKit"",6]"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_recon_medic_F", [8387.4648, 18246.035, 0.29726231], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [8387.4648, 18246.035, 0.29726231];
	_this setDir -161.86662;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_02_02";
	BIS_POI_SpecialForces_01_SF_02_02 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_02_02_DuckTape; this setPosATL [8389.87,18248.6,0]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7];   this addWeapon ""arifle_Katiba_C_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit"";   {this addMagazine ""Chemlight_red""} forEach [0,1]; (unitBackpack this) addItemCargo [""Medikit"",1];  (unitBackpack this) addItemCargo [""FirstAidKit"",6]; "]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_recon_M_F", [8638.5918, 18247.143], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [8638.5918, 18247.143];
	_this setDir 57.736023;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_05_01";
	BIS_POI_SpecialForces_01_SF_05_01 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.78497124;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_Quad; this setPosATL [8630.06,18244,1.59569]; this setBehaviour ""Combat""; this setUnitPos ""Up""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessO_brn""; {this addMagazine ""10Rnd_762x51_Mag""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""srifle_DMR_01_DMS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addWeapon ""Rangefinder""; this addItem ""optic_nvs"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["O_recon_M_F", [8663.665, 18254.07], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [8663.665, 18254.07];
	_this setDir -108.89359;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_05_02";
	BIS_POI_SpecialForces_01_SF_05_02 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.72821867;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_Quad; this setPosATL [8672.77,18261.2,3.94514]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessO_brn""; {this addMagazine ""10Rnd_762x51_Mag""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""srifle_DMR_01_DMS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addWeapon ""Rangefinder""; this addItem ""optic_nvs"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["O_recon_exp_F", [8638.2705, 18248.385], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [8638.2705, 18248.385];
	_this setDir -112.98273;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_06_01";
	BIS_POI_SpecialForces_01_SF_06_01 = _this;
	_this setUnitAbility 0.73662633;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_06_01_DuckTape; this setPosATL [8635.52,18241.1,0.845016]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessO_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; (unitBackpack this) addItemCargo [""Toolkit"",1]; (unitBackpack this) addItemCargo [""MineDetector"",1]; (unitBackpack this) addMagazineCargo [""DemoCharge_Remote_Mag"",2]; (unitBackpack this) addMagazineCargo [""ClaymoreDirectionalMine_Remote_Mag"",4]"]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["O_recon_exp_F", [8664.0586, 18252.805, 0.17884517], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [8664.0586, 18252.805, 0.17884517];
	_this setDir -39.952385;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_06_02";
	BIS_POI_SpecialForces_01_SF_06_02 = _this;
	_this setUnitAbility 0.73242247;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setDir 320; this setPosATL [8675.7,18258.1,0.242981]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessO_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; (unitBackpack this) addItemCargo [""Toolkit"",1]; (unitBackpack this) addItemCargo [""MineDetector"",1]; (unitBackpack this) addMagazineCargo [""DemoCharge_Remote_Mag"",2]; (unitBackpack this) addMagazineCargo [""ClaymoreDirectionalMine_Remote_Mag"",4]"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["O_recon_F", [8571.8916, 18271.891, 0.56343377], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [8571.8916, 18271.891, 0.56343377];
	_this setDir 161.23779;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_03_01";
	BIS_POI_SpecialForces_01_SF_03_01 = _this;
	_this setUnitAbility 0.78917491;
	if (true) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_Offroad; this setPosATL [8563.09,18276.7,0.184875]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_snds_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]"]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_10 createUnit ["O_recon_F", [8548.8291, 18267.592], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [8548.8291, 18267.592];
	_this setDir 3.5373347;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_03_02";
	BIS_POI_SpecialForces_01_SF_03_02 = _this;
	_this setUnitAbility 0.76184976;
	if (true) then {_group_10 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_03_02_DuckTape; this setPosATL [8548.49,18264.3,0.887772]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_snds_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["O_recon_F", [8568.7842, 18268.926], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [8568.7842, 18268.926];
	_this setDir -179.49646;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_04_01";
	BIS_POI_SpecialForces_01_SF_04_01 = _this;
	_this setUnitAbility 0.7450341;
	if (true) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_Offroad; this setPosATL [8565.56,18272.6,3.46643]; this setBehaviour ""Combat""; this setUnitPos ""Up""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_snds_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_12 createUnit ["O_recon_F", [8555.3086, 18268.576], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [8555.3086, 18268.576];
	_this setDir 146.39064;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_SF_04_02";
	BIS_POI_SpecialForces_01_SF_04_02 = _this;
	_this setUnitAbility 0.75344199;
	if (true) then {_group_12 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch SF_Offroad; this setPosATL [8555.92,18269.9,0.829224]; this setBehaviour ""Combat""; this setUnitPos ""Up""; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_C_ACO_pointer_snds_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]"]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [8616.0537, 18253.668], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_SpecialForces_01_center";
	BIS_POI_SpecialForces_01_center = _this;
	_this setPos [8616.0537, 18253.668];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [8676.1426, 18252.477, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir -27.32057;
	_this setPos [8676.1426, 18252.477, -3.0517578e-005];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallet_vertical_F", [8675.3896, 18253.242, 0.037667837], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir 154.26976;
	_this setPos [8675.3896, 18253.242, 0.037667837];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallet_vertical_F", [8675.4941, 18253.064, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir 154.26976;
	_this setPos [8675.4941, 18253.064, -0.00012207031];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallet_vertical_F", [8675.6299, 18252.844, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir 154.26976;
	_this setPos [8675.6299, 18252.844, -7.6293945e-005];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [8682.3076, 18254.967, 0.00022888184], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 63.756424;
	_this setPos [8682.3076, 18254.967, 0.00022888184];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [8683.1953, 18254.807, 0.00010681152], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 65.190186;
	_this setPos [8683.1953, 18254.807, 0.00010681152];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [8752.4824, 18179.969, 0.30970436], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir 6.8934779;
	_this setPos [8752.4824, 18179.969, 0.30970436];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WorkStand_F", [8751.3682, 18174.951, 0.29088339], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -78.879349;
	_this setPos [8751.3682, 18174.951, 0.29088339];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [8755.5898, 18179.895, 0.2730822], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir -79.84127;
	_this setPos [8755.5898, 18179.895, 0.2730822];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [8752.7803, 18173.414, 0.46137133], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 31.885088;
	_this setPos [8752.7803, 18173.414, 0.46137133];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [8549.7832, 18264.453, 0.77160287], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir 71.917107;
	_this setPos [8549.7832, 18264.453, 0.77160287];
	_initCodes set [count _initCodes,[_this,"[178.638,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [8557.2559, 18274.1, 0.65406048], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir 59.972321;
	_this setPos [8557.2559, 18274.1, 0.65406048];
	_initCodes set [count _initCodes,[_this,"[178.638,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [8557.8623, 18273.092, 0.6713407], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir 135.9194;
	_this setPos [8557.8623, 18273.092, 0.6713407];
	_initCodes set [count _initCodes,[_this,"[178.638,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [8553.4688, 18270.387, 4.2330966], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir 79.899673;
	_this setPos [8553.4688, 18270.387, 4.2330966];
	_initCodes set [count _initCodes,[_this,"[182.057,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [8549.1836, 18264.377, 4.2062922], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -11.894219;
	_this setPos [8549.1836, 18264.377, 4.2062922];
	_initCodes set [count _initCodes,[_this,"[0,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [8607.2842, 18220.645, 0.65874273], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 47.43792;
	_this setPos [8607.2842, 18220.645, 0.65874273];
	_initCodes set [count _initCodes,[_this,"[184.098,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [8611.4736, 18214.766, 3.6679153], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir -31.186827;
	_this setPos [8611.4736, 18214.766, 3.6679153];
	_initCodes set [count _initCodes,[_this,"[187.61,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [8610.9434, 18215.322, 3.9279554], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -20.418711;
	_this setPos [8610.9434, 18215.322, 3.9279554];
	_initCodes set [count _initCodes,[_this,"[187.61,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [8605.3672, 18220.252, 4.0097651], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir -33.065598;
	_this setPos [8605.3672, 18220.252, 4.0097651];
	_initCodes set [count _initCodes,[_this,"[187.61,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [8606.3916, 18220.992, 4.0099936], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir -50.711777;
	_this setPos [8606.3916, 18220.992, 4.0099936];
	_initCodes set [count _initCodes,[_this,"[187.61,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_blue_F", [8602.1035, 18218.215, 4.0708914], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir 55.286816;
	_this setPos [8602.1035, 18218.215, 4.0708914];
	_initCodes set [count _initCodes,[_this,"[187.61,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [8601.2246, 18216.279, 0.55826837], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -32.772125;
	_this setPos [8601.2246, 18216.279, 0.55826837];
	_initCodes set [count _initCodes,[_this,"[184.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8688.6787, 18175.703], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setPos [8688.6787, 18175.703];
	_initCodes set [count _initCodes,[_this,"BIS_POI_SpecialForces_01_Pair_01_Random = (random 10); _null = [] spawn {sleep 1; If (BIS_POI_SpecialForces_01_Pair_01_Random < 5) Then {{deleteVehicle _x} forEach [BIS_POI_SpecialForces_01_SF_01_02,BIS_POI_SpecialForces_01_SF_02_02]} Else {{deleteVehicle _x} forEach [BIS_POI_SpecialForces_01_SF_01_01,BIS_POI_SpecialForces_01_SF_02_01]}}"]];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8689.0254, 18175.969], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setPos [8689.0254, 18175.969];
	_initCodes set [count _initCodes,[_this,"BIS_POI_SpecialForces_01_Pair_02_Random = (random 10); _null = [] spawn {sleep 1; If (BIS_POI_SpecialForces_01_Pair_02_Random < 5) Then {{deleteVehicle _x} forEach [BIS_POI_SpecialForces_01_SF_03_02,BIS_POI_SpecialForces_01_SF_04_02]} Else {{deleteVehicle _x} forEach [BIS_POI_SpecialForces_01_SF_03_01,BIS_POI_SpecialForces_01_SF_04_01]}}"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8689.4766, 18175.693], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setPos [8689.4766, 18175.693];
	_initCodes set [count _initCodes,[_this,"BIS_POI_SpecialForces_01_Pair_03_Random = (random 10); _null = [] spawn {sleep 1; If (BIS_POI_SpecialForces_01_Pair_03_Random < 5) Then {{deleteVehicle _x} forEach [BIS_POI_SpecialForces_01_SF_05_02,BIS_POI_SpecialForces_01_SF_06_02]} Else {{deleteVehicle _x} forEach [BIS_POI_SpecialForces_01_SF_05_01,BIS_POI_SpecialForces_01_SF_06_01]}}"]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_13 createUnit ["B_G_Soldier_TL_F", [8564.127, 18250.779], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [8564.127, 18250.779];
	_this setDir -121.08185;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_13 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setDamage 1} forEach (units group this); removeAllWeapons this; removeUniform this; this addVest ""V_TacVest_camo""; this addHeadgear ""H_Cap_oli_hs""; this addMagazine [""30Rnd_556x45_Stanag"",7]; this addWeapon ""arifle_TRG21_MRCO_F""; this addPrimaryWeaponItem ""optic_aco_grn""; this addPrimaryWeaponItem ""acc_flashlight""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2]; {this addMagazine ""30Rnd_556x45_Stanag_tracer_yellow""} forEach [0,1,2,3]; {this addMagazine ""MiniGrenade""} forEach [0,1]; this addUniform ""U_IG_Guerilla1_1""; {this addMagazine ""Chemlight_blue""} forEach [0,1,2]; {this addMagazine ""Chemlight_yellow""} forEach [0,1]; this addMagazine ""SmokeShellBlue""; "]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_13 createUnit ["B_G_Soldier_AR_F", [8568.1826, 18247.27], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [8568.1826, 18247.27];
	_this setDir 166.25119;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_13 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),184]; this removeMagazine ""SmokeShell""; this addPrimaryWeaponItem ""optic_arco"""]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_13 createUnit ["B_G_Soldier_GL_F", [8649.8516, 18259.541, 0.39529091], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [8649.8516, 18259.541, 0.39529091];
	_this setDir -179.28333;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_13 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),19]; this removeMagazine ""30Rnd_556x45_Stanag""; this removeMagazine ""1Rnd_HE_Grenade_shell""; this addPrimaryWeaponItem ""optic_aco"""]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_13 createUnit ["B_G_Soldier_F", [8654.9082, 18251.293, 0.31401306], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [8654.9082, 18251.293, 0.31401306];
	_this setDir 59.693401;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_13 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),22]; this removeMagazine ""MiniGrenade""; this removeMagazine ""SmokeShell""; this addBackpack ""B_FieldPack_khk""; (unitBackpack this) addMagazineCargo [""RPG32_F"",1]; (unitBackpack this) addMagazineCargo [""5Rnd_127x108_Mag"",4]; (unitBackpack this) addItemCargo [""muzzle_snds_B"",1]; (unitBackpack this) addItemCargo [""optic_yorris"",1]"]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_13 createUnit ["B_G_Soldier_F", [8570.3135, 18252.332], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [8570.3135, 18252.332];
	_this setDir -334.17902;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_13 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),12]; this addBackpack ""B_AssaultPack_rgr""; (unitBackpack this) addItemCargo [""MineDetector"",1]; (unitBackpack this) addMagazineCargo [""20Rnd_762x51_Mag"",3]; (unitBackpack this) addMagazineCargo [""ClaymoreDirectionalMine_Remote_Mag"",2]; (unitBackpack this) addItemCargo [""ItemGPS"",1]; (unitBackpack this) addMagazineCargo [""30Rnd_556x45_Stanag_Tracer_Yellow"",4]"]];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Offroad_01_F", [8565.6504, 18252.301, 0.15696268], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir -762.73334;
	_this setVehicleVarName "SF_Offroad";
	SF_Offroad = _this;
	_this setPos [8565.6504, 18252.301, 0.15696268];
	_initCodes set [count _initCodes,[_this,"this lockDriver true; this lockCargo true; this setFuel 0.355; this addMagazineCargo [""ATMine_Range_Mag"",1]; this addMagazineCargo [""30Rnd_556x45_Stanag"",7]; this addMagazineCargo [""200Rnd_65x39_cased_Box"",2]; this addMagazine [""HandGrenade"",4]; this addMagazineCargo [""Chemlight_red"",6]; this setHit [""karoserie"",0.75]; this setHit [""engine"",0.55]; this setHit [""wheel_1_1_steering"",1]; this setHit [""wheel_1_2_steering"",1]"]];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [8631.9443, 18307.207], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir -129.36726;
	_this setPos [8631.9443, 18307.207];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.435; clearItemCargo this"]];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [8576.4512, 18172.477, 0.15343295], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 25.179892;
	_this setPos [8576.4512, 18172.477, 0.15343295];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.715; clearItemCargo this; this setHit [""engine"",0.35]"]];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [8564.291, 18253.592], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setDir -472.24969;
	_this setPos [8564.291, 18253.592];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 1]"]];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [8566.2324, 18250.311], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -472.24969;
	_this setPos [8566.2324, 18250.311];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 0.6]"]];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8499.0361, 18225.4], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir 184.09627;
	_this setPos [8499.0361, 18225.4];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8573.9287, 18284.936], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setDir -29.873587;
	_this setPos [8573.9287, 18284.936];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8564.3672, 18173.738], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -27.185148;
	_this setPos [8564.3672, 18173.738];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8570.2656, 18335.389], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir 274.47275;
	_this setPos [8570.2656, 18335.389];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [8562.8467, 18174.305], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir -42.899109;
	_this setPos [8562.8467, 18174.305];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8613.9014, 18290.521], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setPos [8613.9014, 18290.521];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 0.25]"]];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8637.5479, 18365.65], [], 0, "CAN_COLLIDE"];
	_vehicle_112 = _this;
	_this setPos [8637.5479, 18365.65];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 0.25]"]];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8593.2607, 18225.484], [], 0, "CAN_COLLIDE"];
	_vehicle_118 = _this;
	_this setPos [8593.2607, 18225.484];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 0.15]"]];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [8563.3145, 18250.934], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setPos [8563.3145, 18250.934];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [8645.3701, 18245.141, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setPos [8645.3701, 18245.141, 0];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [8628.6738, 18200.371, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_126 = _this;
	_this setPos [8628.6738, 18200.371, 0];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [8494.1973, 18272.309, 0.31039035], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir -17.226833;
	_this setPos [8494.1973, 18272.309, 0.31039035];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [8499.4434, 18244.377, 0.00022888184], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setPos [8499.4434, 18244.377, 0.00022888184];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [8560.8076, 18275.479, 0.28721744], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir -99.07473;
	_this setPos [8560.8076, 18275.479, 0.28721744];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_F", [8479.7695, 18262.809, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir 72.990746;
	_this setPos [8479.7695, 18262.809, -6.1035156e-005];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [8584.3164, 18285.375, 5.0472264], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setDir 151.89619;
	_this setPos [8584.3164, 18285.375, 5.0472264];
	_initCodes set [count _initCodes,[_this,"[183.909,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [8607.2832, 18292.127, 0.61646098], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir -40.062752;
	_this setPos [8607.2832, 18292.127, 0.61646098];
	_initCodes set [count _initCodes,[_this,"[183.943,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [8611.1172, 18296.07, 4.8257093], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setDir -75.772339;
	_this setPos [8611.1172, 18296.07, 4.8257093];
	_initCodes set [count _initCodes,[_this,"[183.943,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8597.7129, 18342.195, 1.361632], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir 84.533371;
	_this setPos [8597.7129, 18342.195, 1.361632];
	_initCodes set [count _initCodes,[_this,"[177.074,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [8598.8711, 18343.889, 1.3225008], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setDir 151.00034;
	_this setPos [8598.8711, 18343.889, 1.3225008];
	_initCodes set [count _initCodes,[_this,"[177.074,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8598.5361, 18341.801, 1.2525108], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 91.007324;
	_this setPos [8598.5361, 18341.801, 1.2525108];
	_initCodes set [count _initCodes,[_this,"[177.074,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [8583.5645, 18374.244, 0.90304214], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir 54.628616;
	_this setPos [8583.5645, 18374.244, 0.90304214];
	_initCodes set [count _initCodes,[_this,"[173.481,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [8606.4648, 18421.256, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir -63.811256;
	_this setPos [8606.4648, 18421.256, -9.1552734e-005];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [8649.5264, 18363.92, 1.3379489], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setPos [8649.5264, 18363.92, 1.3379489];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HeatPack_F", [8647.1104, 18364.283, 0.17833062], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setDir -37.088615;
	_this setPos [8647.1104, 18364.283, 0.17833062];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [8666.2969, 18332.352, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setPos [8666.2969, 18332.352, 9.1552734e-005];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8647.3311, 18264.898, 0.89359099], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir 43.074097;
	_this setPos [8647.3311, 18264.898, 0.89359099];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8652.3799, 18266.389, 0.99505275], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setDir -25.431719;
	_this setPos [8652.3799, 18266.389, 0.99505275];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8651.9854, 18269.924, 1.0579067], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir 241.16072;
	_this setPos [8651.9854, 18269.924, 1.0579067];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8644.9873, 18267.359, 1.1158533], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir 61.403545;
	_this setPos [8644.9873, 18267.359, 1.1158533];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8648.5361, 18275.068, 1.480482], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir -175.69167;
	_this setPos [8648.5361, 18275.068, 1.480482];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8645.5381, 18268.035, 1.0744681], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setDir 59.224174;
	_this setPos [8645.5381, 18268.035, 1.0744681];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8647.8408, 18267.111, 1.001375], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir 35.669426;
	_this setPos [8647.8408, 18267.111, 1.001375];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8651.6094, 18266.703, 0.80418462], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setDir -41.606045;
	_this setPos [8651.6094, 18266.703, 0.80418462];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8652.3809, 18267.318, 0.87039167], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setDir -6.4797831;
	_this setPos [8652.3809, 18267.318, 0.87039167];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8650.9463, 18268.916, 1.1445367], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir -89.2229;
	_this setPos [8650.9463, 18268.916, 1.1445367];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [8648.0547, 18265.176, 0.82664496], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir 16.894794;
	_this setPos [8648.0547, 18265.176, 0.82664496];
	_initCodes set [count _initCodes,[_this,"[182.797,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [8672.4688, 18276.867, 0.55624968], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setDir -115.3264;
	_this setPos [8672.4688, 18276.867, 0.55624968];
	_initCodes set [count _initCodes,[_this,"[181.953,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [8671.3174, 18276.701, 0.60763007], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setDir -76.348946;
	_this setPos [8671.3174, 18276.701, 0.60763007];
	_initCodes set [count _initCodes,[_this,"[181.953,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [8669.0996, 18269.42, 1.0890774], [], 0, "CAN_COLLIDE"];
	_vehicle_177 = _this;
	_this setDir 55.760929;
	_this setPos [8669.0996, 18269.42, 1.0890774];
	_initCodes set [count _initCodes,[_this,"[182.826,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [8719.708, 18208.926, 0.6405589], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir -37.345425;
	_this setPos [8719.708, 18208.926, 0.6405589];
	_initCodes set [count _initCodes,[_this,"[188.016,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [8717.6621, 18212.074, 0.93059647], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setDir 45.450649;
	_this setPos [8717.6621, 18212.074, 0.93059647];
	_initCodes set [count _initCodes,[_this,"[188.016,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_blue_F", [8716.7393, 18213.199, 1.2066467], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setDir 53.509754;
	_this setPos [8716.7393, 18213.199, 1.2066467];
	_initCodes set [count _initCodes,[_this,"[188.016,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [8735.207, 18236.924, 1.385722], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setDir -47.620571;
	_this setPos [8735.207, 18236.924, 1.385722];
};

_vehicle_185 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [8763.208, 18211.316, 3.898701], [], 0, "CAN_COLLIDE"];
	_vehicle_185 = _this;
	_this setPos [8763.208, 18211.316, 3.898701];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8731.6104, 18189.215, 0.63136059], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setDir 60.665806;
	_this setPos [8731.6104, 18189.215, 0.63136059];
	_initCodes set [count _initCodes,[_this,"[189.952,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_187 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8734.5391, 18190.107, 0.59865141], [], 0, "CAN_COLLIDE"];
	_vehicle_187 = _this;
	_this setDir -38.329479;
	_this setPos [8734.5391, 18190.107, 0.59865141];
	_initCodes set [count _initCodes,[_this,"[189.952,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [8697.4609, 18201.568, 0.059823483], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir 1.1404055;
	_this setPos [8697.4609, 18201.568, 0.059823483];
};

_vehicle_193 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [8606.3936, 18234.295, 0.46015519], [], 0, "CAN_COLLIDE"];
	_vehicle_193 = _this;
	_this setDir -35.424648;
	_this setPos [8606.3936, 18234.295, 0.46015519];
	_initCodes set [count _initCodes,[_this,"[183.381,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [8605.6953, 18241.498, 1.0761911], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setDir 230.63556;
	_this setPos [8605.6953, 18241.498, 1.0761911];
	_initCodes set [count _initCodes,[_this,"[183.381,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_195 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [8600.1582, 18238.205, 0.87650013], [], 0, "CAN_COLLIDE"];
	_vehicle_195 = _this;
	_this setDir 153.56114;
	_this setPos [8600.1582, 18238.205, 0.87650013];
	_initCodes set [count _initCodes,[_this,"[183.381,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [8609.3447, 18237.748, 0.59909725], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setPos [8609.3447, 18237.748, 0.59909725];
	_initCodes set [count _initCodes,[_this,"[183.381,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_197 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [8617.9971, 18243.107, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_197 = _this;
	_this setPos [8617.9971, 18243.107, 7.6293945e-005];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [8625.5479, 18244.982, 2.0190022], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setDir 56.966751;
	_this setPos [8625.5479, 18244.982, 2.0190022];
	_initCodes set [count _initCodes,[_this,"[184.265,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_199 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [8626.9854, 18248.809, 2.4018559], [], 0, "CAN_COLLIDE"];
	_vehicle_199 = _this;
	_this setDir -26.011948;
	_this setPos [8626.9854, 18248.809, 2.4018559];
	_initCodes set [count _initCodes,[_this,"[184.265,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [8661.6025, 18240.684, 0.62182784], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setDir 63.711285;
	_this setPos [8661.6025, 18240.684, 0.62182784];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [8663.0059, 18241.488, 0.57639676], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setDir 115.27374;
	_this setPos [8663.0059, 18241.488, 0.57639676];
};

_vehicle_205 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [8560.6357, 18162.889, 0.12749998], [], 0, "CAN_COLLIDE"];
	_vehicle_205 = _this;
	_this setDir -110.61191;
	_this setPos [8560.6357, 18162.889, 0.12749998];
};

_vehicle_207 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [8549.9238, 18160.387, 0.20486304], [], 0, "CAN_COLLIDE"];
	_vehicle_207 = _this;
	_this setDir -121.34693;
	_this setPos [8549.9238, 18160.387, 0.20486304];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [8557.1025, 18165.984, 0.20281786], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setDir 34.438625;
	_this setPos [8557.1025, 18165.984, 0.20281786];
};

_vehicle_209 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [8560.3984, 18167.145, 0.13501516], [], 0, "CAN_COLLIDE"];
	_vehicle_209 = _this;
	_this setDir -62.131523;
	_this setPos [8560.3984, 18167.145, 0.13501516];
};

_vehicle_212 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [8591.667, 18160.691, 0.78079832], [], 0, "CAN_COLLIDE"];
	_vehicle_212 = _this;
	_this setDir 24.634575;
	_this setPos [8591.667, 18160.691, 0.78079832];
};

_vehicle_215 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [8366.0674, 18247.229, 0.00018310547], [], 0, "CAN_COLLIDE"];
	_vehicle_215 = _this;
	_this setPos [8366.0674, 18247.229, 0.00018310547];
};

_vehicle_216 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageWashingMachine_F", [8414.7559, 18261.371, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_216 = _this;
	_this setDir 58.871449;
	_this setPos [8414.7559, 18261.371, 7.6293945e-005];
};

_vehicle_217 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8440.3672, 18214.457, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_217 = _this;
	_this setDir 102.42746;
	_this setPos [8440.3672, 18214.457, -6.1035156e-005];
};

_vehicle_218 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8442.7471, 18207.375, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_218 = _this;
	_this setDir -30.063747;
	_this setPos [8442.7471, 18207.375, 9.1552734e-005];
};

_vehicle_219 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8674.9033, 18166.896], [], 0, "CAN_COLLIDE"];
	_vehicle_219 = _this;
	_this setVehicleVarName "SF_01_01_DuckTape";
	SF_01_01_DuckTape = _this;
	_this setPos [8674.9033, 18166.896];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8699.97,18263.4,0.571106]"]];
};

_vehicle_222 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8674.8936, 18166.215, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_222 = _this;
	_this setVehicleVarName "SF_01_02_DuckTape";
	SF_01_02_DuckTape = _this;
	_this setPos [8674.8936, 18166.215, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8765.27,18194.3,0.00146484]"]];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8678.21, 18168.311], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setVehicleVarName "SF_02_01_DuckTape";
	SF_02_01_DuckTape = _this;
	_this setPos [8678.21, 18168.311];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8376.06,18248.3,0.00140381]"]];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8678.458, 18165.771, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setVehicleVarName "SF_02_02_DuckTape";
	SF_02_02_DuckTape = _this;
	_this setPos [8678.458, 18165.771, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8388.28,18243.1,0.00141907]"]];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8681.8916, 18167.043, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setVehicleVarName "SF_03_01_DuckTape";
	SF_03_01_DuckTape = _this;
	_this setPos [8681.8916, 18167.043, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8561.02,18271.4,0.182922]"]];
};

_vehicle_230 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8682.1465, 18165.896, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_230 = _this;
	_this setVehicleVarName "SF_03_02_DuckTape";
	SF_03_02_DuckTape = _this;
	_this setPos [8682.1465, 18165.896, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8543.63,18279.1,0.00132751]"]];
};

_vehicle_232 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8685.1992, 18167.105, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_232 = _this;
	_this setVehicleVarName "SF_04_01_DuckTape";
	SF_04_01_DuckTape = _this;
	_this setPos [8685.1992, 18167.105, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8570.19,18254,0.00160217]"]];
};

_vehicle_234 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8685.5176, 18165.836, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_234 = _this;
	_this setVehicleVarName "SF_04_02_DuckTape";
	SF_04_02_DuckTape = _this;
	_this setPos [8685.5176, 18165.836, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8582.69,18216.6,0.00143433]"]];
};

_vehicle_236 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8689.7793, 18166.854, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_236 = _this;
	_this setVehicleVarName "SF_05_01_DuckTape";
	SF_05_01_DuckTape = _this;
	_this setPos [8689.7793, 18166.854, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8687.31,18264.7,0.00154114]"]];
};

_vehicle_238 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8689.9697, 18165.836], [], 0, "CAN_COLLIDE"];
	_vehicle_238 = _this;
	_this setVehicleVarName "SF_05_02_DuckTape";
	SF_05_02_DuckTape = _this;
	_this setPos [8689.9697, 18165.836];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8633.85,18245.8,1.65976]"]];
};

_vehicle_240 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8693.7871, 18167.105, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_240 = _this;
	_this setVehicleVarName "SF_06_01_DuckTape";
	SF_06_01_DuckTape = _this;
	_this setPos [8693.7871, 18167.105, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8614.45,18223,0.00152588]"]];
};

_vehicle_242 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [8694.168, 18166.279, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_242 = _this;
	_this setVehicleVarName "SF_06_02_DuckTape";
	SF_06_02_DuckTape = _this;
	_this setPos [8694.168, 18166.279, 0];
	_initCodes set [count _initCodes,[_this,"this setPosATL [8671.15,18261.7,0.430771]"]];
};

_vehicle_415 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8605.3945, 18238.414, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_415 = _this;
	_this setPos [8605.3945, 18238.414, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""Office""];"]];
};

_vehicle_417 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8628.5439, 18245.836], [], 0, "CAN_COLLIDE"];
	_vehicle_417 = _this;
	_this setPos [8628.5439, 18245.836];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_423 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8547.5488, 18268.869, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_423 = _this;
	_this setPos [8547.5488, 18268.869, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_433 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8669.6943, 18277.25, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_433 = _this;
	_this setPos [8669.6943, 18277.25, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""Infirmary""];"]];
};

_vehicle_451 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8557.082, 18270.791, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_451 = _this;
	_this setPos [8557.082, 18270.791, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_453 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8568.5771, 18276.35], [], 0, "CAN_COLLIDE"];
	_vehicle_453 = _this;
	_this setPos [8568.5771, 18276.35];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_457 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8610.5889, 18292.463, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_457 = _this;
	_this setPos [8610.5889, 18292.463, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_459 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8585.6602, 18375.689, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_459 = _this;
	_this setPos [8585.6602, 18375.689, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_465 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8602.7129, 18217.111, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_465 = _this;
	_this setPos [8602.7129, 18217.111, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_467 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8681.8252, 18224.729, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_467 = _this;
	_this setPos [8681.8252, 18224.729, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_471 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8647.6016, 18268.576, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_471 = _this;
	_this setPos [8647.6016, 18268.576, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_473 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8650.1963, 18266.322, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_473 = _this;
	_this setPos [8650.1963, 18266.322, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_475 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8719.0762, 18210.59, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_475 = _this;
	_this setPos [8719.0762, 18210.59, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_477 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8733.3682, 18192.199, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_477 = _this;
	_this setPos [8733.3682, 18192.199, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""Infirmary""];"]];
};

_vehicle_481 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8599.8105, 18342.975, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_481 = _this;
	_this setPos [8599.8105, 18342.975, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_483 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [8608.5947, 18218.084, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_483 = _this;
	_this setPos [8608.5947, 18218.084, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_492 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8377.5059, 18237.66], [], 0, "CAN_COLLIDE"];
	_vehicle_492 = _this;
	_this setDir 70.252235;
	_this setPos [8377.5059, 18237.66];
};

_vehicle_493 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8380.7188, 18234.238, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_493 = _this;
	_this setDir -200.02248;
	_this setPos [8380.7188, 18234.238, 3.0517578e-005];
};

_vehicle_495 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8387.3525, 18258.551, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_495 = _this;
	_this setDir -199.91988;
	_this setPos [8387.3525, 18258.551, -4.5776367e-005];
};

_vehicle_499 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_sand_F", [8394.9189, 18238.553, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_499 = _this;
	_this setDir -20.862614;
	_this setPos [8394.9189, 18238.553, 9.1552734e-005];
};

_vehicle_504 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_ammo_F", [8387.0186, 18241.48, 0.3174125], [], 0, "CAN_COLLIDE"];
	_vehicle_504 = _this;
	_this setDir 116.91619;
	_this setPos [8387.0186, 18241.48, 0.3174125];
	_initCodes set [count _initCodes,[_this,"this lock true; this setDamage 0.65; this setHit [""wheel_1_1_steering"",1];this setHit [""wheel_1_2_steering"",1]; this setHit [""wheel_2_1_steering"",0.75];  this setAmmoCargo 0; clearItemCargo this; clearMagazineCargo this; clearWeaponCargo this; this addItemCargo [""V_PlateCarrierIAGL_dgtl"",1]; this addItemCargo [""H_HelmetIA"",1]; this addBackpackCargo [""B_FieldPack_oli"",1]; this addMagazineCargo [""30Rnd_556x45_Stanag_Tracer_Yellow"",5]; this addWeaponCargo [""arifle_Mk20_GL_ACO_F"",1]; this addMagazineCargo [""HandGrenade"",4]; this addMagazineCargo [""1Rnd_HE_Grenade_shell"",5]; this addItemCargo [""FirstAidKit"",2]"]];
};

_vehicle_506 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8373.5215, 18241.141, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_506 = _this;
	_this setDir -110.43951;
	_this setPos [8373.5215, 18241.141, -9.1552734e-005];
};

_vehicle_509 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_sand_F", [8390.4912, 18250.947, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_509 = _this;
	_this setDir -20.822569;
	_this setPos [8390.4912, 18250.947, -1.5258789e-005];
};

_vehicle_511 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_sand_F", [8393.8154, 18247.574, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_511 = _this;
	_this setDir -111.00146;
	_this setPos [8393.8154, 18247.574, 1.5258789e-005];
};

_vehicle_514 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8376.5088, 18245.539, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_514 = _this;
	_this setDir -199.54506;
	_this setPos [8376.5088, 18245.539, 6.1035156e-005];
};

_vehicle_542 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_sand_F", [8398.5127, 18247.375], [], 0, "CAN_COLLIDE"];
	_vehicle_542 = _this;
	_this setDir -201.34206;
	_this setPos [8398.5127, 18247.375];
};

_vehicle_544 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8397.7422, 18259.139, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_544 = _this;
	_this setDir -381.08356;
	_this setPos [8397.7422, 18259.139, 3.0517578e-005];
};

_vehicle_546 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8402.4512, 18259.029, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_546 = _this;
	_this setDir -291.67682;
	_this setPos [8402.4512, 18259.029, 1.5258789e-005];
};

_vehicle_548 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [8402.4268, 18254.357, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_548 = _this;
	_this setDir -201.32668;
	_this setPos [8402.4268, 18254.357, -1.5258789e-005];
};

_vehicle_550 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarGate_F", [8392.7881, 18231.455, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_550 = _this;
	_this setDir -17.351564;
	_this setPos [8392.7881, 18231.455, 4.5776367e-005];
};

_vehicle_551 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [8381.9697, 18229.512, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_551 = _this;
	_this setDir -17.271059;
	_this setPos [8381.9697, 18229.512, -3.0517578e-005];
};

_vehicle_553 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [8394.0674, 18233.152, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_553 = _this;
	_this setDir -20.884808;
	_this setPos [8394.0674, 18233.152, 1.5258789e-005];
};

_vehicle_555 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [8554.9668, 18266.191, 0.51716924], [], 0, "CAN_COLLIDE"];
	_vehicle_555 = _this;
	_this setDir -74.412834;
	_this setPos [8554.9668, 18266.191, 0.51716924];
};

_vehicle_556 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [8559.4082, 18269.699, 0.54560566], [], 0, "CAN_COLLIDE"];
	_vehicle_556 = _this;
	_this setDir 256.71783;
	_this setPos [8559.4082, 18269.699, 0.54560566];
	_initCodes set [count _initCodes,[_this,"[178.643,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_558 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [8565.6299, 18277.592, 0.49430823], [], 0, "CAN_COLLIDE"];
	_vehicle_558 = _this;
	_this setDir 82.685326;
	_this setPos [8565.6299, 18277.592, 0.49430823];
	_initCodes set [count _initCodes,[_this,"[178.392,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_559 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [8561.8682, 18272.27, 3.5196266], [], 0, "CAN_COLLIDE"];
	_vehicle_559 = _this;
	_this setDir -33.514423;
	_this setPos [8561.8682, 18272.27, 3.5196266];
	_initCodes set [count _initCodes,[_this,"[181.902,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_561 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [8563.0166, 18269.328, 3.5963869], [], 0, "CAN_COLLIDE"];
	_vehicle_561 = _this;
	_this setDir -79.861954;
	_this setPos [8563.0166, 18269.328, 3.5963869];
	_initCodes set [count _initCodes,[_this,"[181.902,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_564 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [8562.7422, 18279.869, 0.53810948], [], 0, "CAN_COLLIDE"];
	_vehicle_564 = _this;
	_this setDir 71.489677;
	_this setPos [8562.7422, 18279.869, 0.53810948];
	_initCodes set [count _initCodes,[_this,"[178.392,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_566 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [8384.9414, 18262.045], [], 0, "CAN_COLLIDE"];
	_vehicle_566 = _this;
	_this setDir 333.40189;
	_this setPos [8384.9414, 18262.045];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_568 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [8421.9258, 18254.633, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_568 = _this;
	_this setDir 72.296173;
	_this setPos [8421.9258, 18254.633, -4.5776367e-005];
};

_vehicle_573 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [8656.0117, 18253.389, 0.15899871], [], 0, "CAN_COLLIDE"];
	_vehicle_573 = _this;
	_this setDir -97.024811;
	_this setVehicleVarName "SF_Quad";
	SF_Quad = _this;
	_this setPos [8656.0117, 18253.389, 0.15899871];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.645; clearItemCargo this; this addMagazineCargo [""30Rnd_556x45_Stanag"",6]; this addMagazineCargo [""HandGrenade"",2]; this addMagazineCargo [""SmokeShellBlue"",2]"]];
};

_vehicle_578 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [8629.6768, 18249.535, 2.015265], [], 0, "CAN_COLLIDE"];
	_vehicle_578 = _this;
	_this setDir -26.435843;
	_this setPos [8629.6768, 18249.535, 2.015265];
	_initCodes set [count _initCodes,[_this,"[184.265,""asl""] call BIS_fnc_setHeight;"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
