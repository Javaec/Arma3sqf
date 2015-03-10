_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter east;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_3 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_recon_TL_F", [5770.5083, 16725.762], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [5770.5083, 16725.762];
	_this setDir -229.34052;
	_this setVehicleVarName "BIS_POI_UAV_01_SF_01";
	BIS_POI_UAV_01_SF_01 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.70089352;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; removeAllWeapons this; removeUniform this; removeVest this; this addVest ""V_HarnessOGL_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; {this addMagazine ""30Rnd_65x39_caseless_green_mag_tracer""} forEach [0,1]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3]; this addWeapon ""arifle_Katiba_GL_ARCO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""6Rnd_45ACP_Cylinder""; this addWeapon ""hgun_Pistol_heavy_02_F""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4]; this addWeapon ""Rangefinder"""]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_soldier_UAV_F", [5773.9131, 16727.977], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [5773.9131, 16727.977];
	_this setDir -186.16068;
	_this setVehicleVarName "BIS_POI_UAV_01_SF_02";
	BIS_POI_UAV_01_SF_02 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.71140325;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; removeAllWeapons this; removeBackpack this; removeHeadgear this; removeGoggles this; removeUniform this; removeVest this; this addGoggles ""G_Tactical_Black""; this addHeadgear ""H_HelmetSpecO_ocamo""; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_pointer_IR""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_Rook40_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2,3,4]"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_recon_F", [5790.7524, 16710.135], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [5790.7524, 16710.135];
	_this setVehicleVarName "BIS_POI_UAV_01_SF_03";
	BIS_POI_UAV_01_SF_03 = _this;
	_this setUnitAbility 0.69668955;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_UAV_01_groupBlue = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; removeAllWeapons this; removeGoggles this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_Rook40_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2]"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_recon_F", [5794.0547, 16706.66], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [5794.0547, 16706.66];
	_this setVehicleVarName "BIS_POI_UAV_01_SF_04";
	BIS_POI_UAV_01_SF_04 = _this;
	_this setUnitAbility 0.68828166;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeGoggles this; removeUniform this; removeVest this; this addVest ""V_HarnessOSpec_brn""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5,6,7]; this addWeapon ""arifle_Katiba_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; {this addMagazine ""SmokeShell""} forEach [0,1]; this addUniform ""U_O_SpecopsUniform_ocamo""; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""16Rnd_9x21_Mag""; this addWeapon ""hgun_Rook40_F""; {this addMagazine ""16Rnd_9x21_Mag""} forEach [0,1,2]"]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [5772.2183, 16725.389, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_UAV_01_center";
	BIS_POI_UAV_01_center = _this;
	_this setPos [5772.2183, 16725.389, 0];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [5768.8696, 16721.914, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 192.07124;
	_this setPos [5768.8696, 16721.914, 0.0001373291];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [5775.6138, 16720.67, -0.00022888184], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir 46.697487;
	_this setPos [5775.6138, 16720.67, -0.00022888184];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenLog_F", [5776.1841, 16726.377, -0.0002822876], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [5776.1841, 16726.377, -0.0002822876];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [5774.1743, 16723.939, -0.00038909912], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [5774.1743, 16723.939, -0.00038909912];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [5770.6045, 16723.287, -0.00024414063], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 21.43199;
	_this setPos [5770.6045, 16723.287, -0.00024414063];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Rusty_F", [5774.4585, 16723.873, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setPos [5774.4585, 16723.873, -0.0001373291];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SurvivalRadio_F", [5770.689, 16722.92, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 85.528183;
	_this setPos [5770.689, 16722.92, -0.0001373291];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [5776.437, 16722.271, -0.00015258789], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 21.43199;
	_this setPos [5776.437, 16722.271, -0.00015258789];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [5774.25, 16723.619, -8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 23.029543;
	_this setPos [5774.25, 16723.619, -8.392334e-005];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5790.21, 16711.918], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setPos [5790.21, 16711.918];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5790.5601, 16711.924], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setPos [5790.5601, 16711.924];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5795.2642, 16751.24], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [5795.2642, 16751.24];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5747.2622, 16756.996], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setPos [5747.2622, 16756.996];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5726.8149, 16715.338], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [5726.8149, 16715.338];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [5757.2202, 16686.871], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setPos [5757.2202, 16686.871];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [5749.7202, 16817.424, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setPos [5749.7202, 16817.424, -4.5776367e-005];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [5746, 16822.223, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -88.162758;
	_this setPos [5746, 16822.223, -3.8146973e-005];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [5741.4033, 16816.893, 0.46676242], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir -88.235641;
	_this setPos [5741.4033, 16816.893, 0.46676242];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [0,-1,-0.5]"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [5739.8589, 16818.721, 0.4534137], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir -63.207153;
	_this setPos [5739.8589, 16818.721, 0.4534137];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [5836.9087, 16772.391, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [5836.9087, 16772.391, -1.5258789e-005];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [5841.7617, 16769.551, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setPos [5841.7617, 16769.551, -4.5776367e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [5840.4092, 16770.084, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setPos [5840.4092, 16770.084, 6.8664551e-005];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [5840.4199, 16770.111, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setPos [5840.4199, 16770.111, 6.8664551e-005];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [5842.9497, 16769.947, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir -95.444756;
	_this setPos [5842.9497, 16769.947, -7.6293945e-005];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TinContainer_F", [5845.998, 16775.203, 1.1329353], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir 37.585373;
	_this setPos [5845.998, 16775.203, 1.1329353];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
