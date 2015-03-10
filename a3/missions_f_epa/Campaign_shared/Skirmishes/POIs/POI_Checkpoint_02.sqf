_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter resistance;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_4 = createGroup _center_1;

_group_5 = createGroup _center_1;

_group_6 = createGroup _center_1;

_group_7 = createGroup _center_1;

_group_8 = createGroup _center_1;

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_TL_F", [4333.4111, 16542.889, 0.0011222181], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [4333.4111, 16542.889, 0.0011222181];
	_this setDir 81.211914;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.54955345;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setSkill 0.45; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_GL_F", [4286.1021, 16601.344], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [4286.1021, 16601.344];
	_this setDir -70.562363;
	_this setUnitAbility 0.50120878;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_M_F", [4337.1162, 16556.936, 4.1814175], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [4337.1162, 16556.936, 4.1814175];
	_this setDir 172.28297;
	_this setUnitAbility 0.53273779;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.45; this setUnitPos ""Middle""; this setVariable [""BIS_ambientAnim"",[""KNEEL"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [4292.2012, 16521.453], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [4292.2012, 16521.453];
	_this setDir 155.64551;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.57898062;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_Checkpoint_02_groupBlue = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_soldier_F", [4289.1992, 16600.908], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [4289.1992, 16600.908];
	_this setDir -3.7530797;
	_this setUnitAbility 0.47388339;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this moveInGunner BIS_POI_Checkpoint_02_GMG; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [4291.5088, 16601.107, 0.84977794], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [4291.5088, 16601.107, 0.84977794];
	_this setDir 34.320091;
	_this setUnitAbility 0.51171845;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Middle""; this setPosATL [4291.37,16599.6,0.00141311]; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [4285.7344, 16602.621, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -10.635051;
	_this setPos [4285.7344, 16602.621, 2.8610229e-006];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [4291.1484, 16603.412, -1.9550323e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -7.3189726;
	_this setPos [4291.1484, 16603.412, -1.9550323e-005];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [4284.7202, 16600.748, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir -100.80939;
	_this setPos [4284.7202, 16600.748, 4.7683716e-005];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [4285.2544, 16597.865, 1.4305115e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir -100.80939;
	_this setPos [4285.2544, 16597.865, 1.4305115e-006];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [4292.6187, 16601.943, 1.3828278e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -97.493332;
	_this setPos [4292.6187, 16601.943, 1.3828278e-005];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [4292.9854, 16599.023, -0.063252687], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -97.493332;
	_this setPos [4292.9854, 16599.023, -0.063252687];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_transport_F", [4325.7773, 16549.479, 0.33950457], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir -58.12178;
	_this setPos [4325.7773, 16549.479, 0.33950457];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.545"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V3_F", [4348.8101, 16560.426, -0.00011825562], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -59.099087;
	_this setPos [4348.8101, 16560.426, -0.00011825562];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [4352.1011, 16561.338, -0.00010204315], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -98.85173;
	_this setPos [4352.1011, 16561.338, -0.00010204315];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [4350.854, 16558.506, -1.6212463e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir 74.170204;
	_this setPos [4350.854, 16558.506, -1.6212463e-005];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [4351.6792, 16556.375, 3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [4351.6792, 16556.375, 3.6239624e-005];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelSand_F", [4350.2363, 16556.018, -0.00011444092], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [4350.2363, 16556.018, -0.00011444092];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelWater_grey_F", [4350.6846, 16555.41, 6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setPos [4350.6846, 16555.41, 6.2942505e-005];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [4322.6284, 16520.623, 0.059742086], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 130.64856;
	_this setPos [4322.6284, 16520.623, 0.059742086];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [4326.8706, 16685.863, -0.00016784668], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir -127.13947;
	_this setPos [4326.8706, 16685.863, -0.00016784668];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [4325.0273, 16688.076, -0.00014972687], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir -126.90232;
	_this setPos [4325.0273, 16688.076, -0.00014972687];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [4325.6201, 16686.355, 1.6212463e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setPos [4325.6201, 16686.355, 1.6212463e-005];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [4316.5894, 16699.084, 0.57884008], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setDir -220.62521;
	_this setPos [4316.5894, 16699.084, 0.57884008];
	_initCodes set [count _initCodes,[_this,"[14.5188,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [4315.625, 16698.096, 0.58395606], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setPos [4315.625, 16698.096, 0.58395606];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [4314.8965, 16695.41, 0.45681629], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir 45.259533;
	_this setPos [4314.8965, 16695.41, 0.45681629];
	_initCodes set [count _initCodes,[_this,"[14.5188,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4317.1704, 16697.867, 0.61699128], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir 93.128342;
	_this setPos [4317.1704, 16697.867, 0.61699128];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [4315.7061, 16690.365, 0.54498148], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir -48.384815;
	_this setPos [4315.7061, 16690.365, 0.54498148];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [4316.2217, 16692.328, 0.38084298], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir -49.113392;
	_this setPos [4316.2217, 16692.328, 0.38084298];
	_initCodes set [count _initCodes,[_this,"[14.5188,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [4396.1689, 16599.051, -6.7710876e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setPos [4396.1689, 16599.051, -6.7710876e-005];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [4413.957, 16596.084, 0.22896816], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setDir -48.530212;
	_this setPos [4413.957, 16596.084, 0.22896816];
	_initCodes set [count _initCodes,[_this,"[13.7017,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [4414.3013, 16603.404, 0.22688919], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir 41.761696;
	_this setPos [4414.3013, 16603.404, 0.22688919];
	_initCodes set [count _initCodes,[_this,"[13.7017,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [4416.0835, 16602.051, 0.45695129], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setDir -151.08711;
	_this setPos [4416.0835, 16602.051, 0.45695129];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_blue_F", [4411.2935, 16597.645, 0.41260552], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir 109.73648;
	_this setPos [4411.2935, 16597.645, 0.41260552];
	_initCodes set [count _initCodes,[_this,"[13.7017,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [4408.6338, 16599.033, 0.38692448], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir 47.070038;
	_this setPos [4408.6338, 16599.033, 0.38692448];
	_initCodes set [count _initCodes,[_this,"[13.7017,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_BMP2_F", [4248.5981, 16517.098, -0.53379637], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -82.286423;
	_this setPos [4248.5981, 16517.098, -0.53379637];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [4314.2368, 16570.816], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setVehicleVarName "BIS_POI_Checkpoint_02_center";
	BIS_POI_Checkpoint_02_center = _this;
	_this setPos [4314.2368, 16570.816];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4288.0811, 16598.746], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setPos [4288.0811, 16598.746];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4325.6982, 16553.316], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setPos [4325.6982, 16553.316];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_Soldier_AR_F", [4290.4316, 16522.492], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [4290.4316, 16522.492];
	_this setDir 153.79091;
	_this setUnitAbility 0.54955333;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["I_GMG_01_high_F", [4288.8486, 16602.533], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -11.613047;
	_this setVehicleVarName "BIS_POI_Checkpoint_02_GMG";
	BIS_POI_Checkpoint_02_GMG = _this;
	_this setPos [4288.8486, 16602.533];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [4334.5483, 16540.125, -0.014258612], [], 0, "CAN_COLLIDE"];
	_vehicle_96 = _this;
	_this setDir -30.944569;
	_this setPos [4334.5483, 16540.125, -0.014258612];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addMagazineCargo [""30Rnd_556x45_Stanag"",20]; this addMagazineCargo [""200Rnd_65x39_cased_Box"",5]; this addMagazineCargo [""HandGrenade"",10]; this addMagazineCargo [""1Rnd_HE_Grenade_shell"",10]; this addMagazineCargo [""SmokeShell"",12]; this addMagazineCargo [""Chemlight_green"",21]; this addMagazineCargo [""APERSMine_Range_Mag"",13]"]];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4292.1392, 16519.561], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setPos [4292.1392, 16519.561];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4292.4609, 16519.596], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setPos [4292.4609, 16519.596];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4330.9087, 16501.986], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setPos [4330.9087, 16501.986];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4369.4878, 16560.441, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setPos [4369.4878, 16560.441, 0];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4341.4932, 16587.553], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setPos [4341.4932, 16587.553];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4291.9868, 16583.137], [], 0, "CAN_COLLIDE"];
	_vehicle_107 = _this;
	_this setPos [4291.9868, 16583.137];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [4288.3716, 16603.674, -5.4836273e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_113 = _this;
	_this setDir 168.29395;
	_this setPos [4288.3716, 16603.674, -5.4836273e-006];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4334.9556, 16543.227, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setPos [4334.9556, 16543.227, 2.8610229e-006];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [4333.0059, 16540.527, 0.067083165], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir 24.764061;
	_this setPos [4333.0059, 16540.527, 0.067083165];
	_initCodes set [count _initCodes,[_this,"[0] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.2,-0.25,-0.07]]];"]];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4333.9028, 16541.541, -1.001358e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setDir 72.609879;
	_this setPos [4333.9028, 16541.541, -1.001358e-005];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [4335.8472, 16542.311], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [4335.8472, 16542.311];
	_this setDir -73.446472;
	_this setUnitAbility 0.51592225;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
