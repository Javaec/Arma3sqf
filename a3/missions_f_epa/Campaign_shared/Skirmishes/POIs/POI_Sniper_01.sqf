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

_group_9 = createGroup _center_2;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_sniper_F", [6061.8828, 16214.324], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [6061.8828, 16214.324];
	_this setDir -285.71588;
	_this setVehicleVarName "BIS_POI_Sniper_01_Sniper_01";
	BIS_POI_Sniper_01_Sniper_01 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.79337889;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Sniper_01_Duck_Tape; this setPosATL [6050.42,16225,4.19109]; this setUnitPos ""Up""; this setBehaviour ""Combat""; removeAllWeapons this; removeGoggles this; removeVest this; removeUniform this; this addHeadgear ""H_Shemag_khk""; this addVest ""V_TacVest_khk""; {this addMagazine ""5Rnd_127x108_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""srifle_GM6_LRPS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""6Rnd_45ACP_Cylinder""; this addWeapon ""hgun_Pistol_heavy_02_F""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4];"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_sniper_F", [6205.3315, 16211.186], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [6205.3315, 16211.186];
	_this setDir -140.11198;
	_this setVehicleVarName "BIS_POI_Sniper_01_Sniper_02";
	BIS_POI_Sniper_01_Sniper_02 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.78707308;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Sniper_02_Duck_Tape; this setPosATL [6201.43,16223,4.19677]; this setUnitPos ""Up""; this setBehaviour ""Combat""; removeAllWeapons this; removeGoggles this; removeVest this; removeUniform this; this addHeadgear ""H_Shemag_khk""; this addVest ""V_TacVest_khk""; {this addMagazine ""5Rnd_127x108_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""srifle_GM6_LRPS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""6Rnd_45ACP_Cylinder""; this addWeapon ""hgun_Pistol_heavy_02_F""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4];"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_sniper_F", [6297.9507, 16260.589], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [6297.9507, 16260.589];
	_this setDir 167.36496;
	_this setVehicleVarName "BIS_POI_Sniper_01_Sniper_03";
	BIS_POI_Sniper_01_Sniper_03 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.73662627;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Sniper_03_Duck_Tape; this setPosATL [6287,16268.1,9.0442]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeGoggles this; removeVest this; removeUniform this; this addHeadgear ""H_Shemag_khk""; this addVest ""V_TacVest_khk""; {this addMagazine ""5Rnd_127x108_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""srifle_GM6_LRPS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""6Rnd_45ACP_Cylinder""; this addWeapon ""hgun_Pistol_heavy_02_F""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4];"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_sniper_F", [6365.9434, 16266.665], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [6365.9434, 16266.665];
	_this setDir -107.00611;
	_this setVehicleVarName "BIS_POI_Sniper_01_Sniper_04";
	BIS_POI_Sniper_01_Sniper_04 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.7450341;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Sniper_04_Duck_Tape; this setPosATL [6364.64,16269.6,0.060276]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeGoggles this; removeVest this; removeUniform this; this addHeadgear ""H_Shemag_khk""; this addVest ""V_TacVest_khk""; {this addMagazine ""5Rnd_127x108_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""srifle_GM6_LRPS_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addMagazine ""6Rnd_45ACP_Cylinder""; this addWeapon ""hgun_Pistol_heavy_02_F""; {this addMagazine ""6Rnd_45ACP_Cylinder""} forEach [0,1,2,3,4];"]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_spotter_F", [6063.9629, 16214.356], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [6063.9629, 16214.356];
	_this setDir -159.90347;
	_this setVehicleVarName "BIS_POI_Sniper_01_Spotter_01";
	BIS_POI_Sniper_01_Spotter_01 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.68000001;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Spotter_01_Duck_Tape; this setPosATL [6048.39,16233.1,4.19108]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeVest this; removeUniform this; this addHeadgear ""H_MilCap_rucamo""; this addVest ""V_TacVest_khk""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4]; this addWeapon ""arifle_Katiba_GL_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addBackpack ""B_Carryall_ocamo""; (unitBackpack this) addMagazineCargo [""5Rnd_127x108_Mag"",5]; (unitBackpack this) addMagazineCargo [""APERSBoundingMine_Range_Mag"",3]; (unitBackpack this) addMagazineCargo [""APERSTripMine_Wire_Mag"",2]; this addWeapon ""Rangefinder"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["O_spotter_F", [6207.6221, 16210.814], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [6207.6221, 16210.814];
	_this setDir 37.674648;
	_this setVehicleVarName "BIS_POI_Sniper_01_Spotter_02";
	BIS_POI_Sniper_01_Spotter_02 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.69668967;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Spotter_02_Duck_Tape; this setPosATL [6203.93,16220.9,4.1945]; this setUnitPos ""Middle""; this setBehaviour ""Combat""; removeAllWeapons this; removeVest this; removeUniform this; this addHeadgear ""H_MilCap_rucamo""; this addVest ""V_TacVest_khk""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4]; this addWeapon ""arifle_Katiba_GL_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addBackpack ""B_Carryall_ocamo""; (unitBackpack this) addMagazineCargo [""5Rnd_127x108_Mag"",5]; (unitBackpack this) addMagazineCargo [""APERSBoundingMine_Range_Mag"",3]; (unitBackpack this) addMagazineCargo [""APERSTripMine_Wire_Mag"",2]; this addWeapon ""Rangefinder"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["O_spotter_F", [6299.9546, 16260.567], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [6299.9546, 16260.567];
	_this setDir 69.277039;
	_this setVehicleVarName "BIS_POI_Sniper_01_Spotter_03";
	BIS_POI_Sniper_01_Spotter_03 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.68617976;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Spotter_03_Duck_Tape; this setUnitPos ""Middle""; this setBehaviour ""Combat""; this setPosATL [6288.22,16276.4,9.04326]; removeAllWeapons this; removeVest this; removeUniform this; this addHeadgear ""H_MilCap_rucamo""; this addVest ""V_TacVest_khk""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4]; this addWeapon ""arifle_Katiba_GL_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addBackpack ""B_Carryall_ocamo""; (unitBackpack this) addMagazineCargo [""5Rnd_127x108_Mag"",5]; (unitBackpack this) addMagazineCargo [""APERSBoundingMine_Range_Mag"",3]; (unitBackpack this) addMagazineCargo [""APERSTripMine_Wire_Mag"",2]; this addWeapon ""Rangefinder"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["O_spotter_F", [6368.002, 16267.719], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [6368.002, 16267.719];
	_this setDir 70.266289;
	_this setVehicleVarName "BIS_POI_Sniper_01_Spotter_04";
	BIS_POI_Sniper_01_Spotter_04 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.7429322;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this doWatch Spotter_04_Duck_Tape; this setPosATL [6366.77,16271,0.00131226]; this setBehaviour ""Combat""; this setUnitPos ""Middle""; removeAllWeapons this; removeVest this; removeUniform this; this addHeadgear ""H_MilCap_rucamo""; this addVest ""V_TacVest_khk""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4]; this addWeapon ""arifle_Katiba_GL_ACO_pointer_F""; {this addMagazine ""HandGrenade""} forEach [0,1]; this adduniform ""U_O_SpecopsUniform_ocamo""; {this addItem ""FirstAidKit""} forEach [0,1]; {this addMagazine ""Chemlight_red""} forEach [0,1]; this addBackpack ""B_Carryall_ocamo""; (unitBackpack this) addMagazineCargo [""5Rnd_127x108_Mag"",5]; (unitBackpack this) addMagazineCargo [""APERSBoundingMine_Range_Mag"",3]; (unitBackpack this) addMagazineCargo [""APERSTripMine_Wire_Mag"",2]; this addWeapon ""Rangefinder"""]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [6189.793, 16245.889], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_Sniper_01_center";
	BIS_POI_Sniper_01_center = _this;
	_this setPos [6189.793, 16245.889];
	_initCodes set [count _initCodes,[_this,"BIS_POI_Sniper_01_Random = (floor random 3.9)"]];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6002.2295, 16247.858], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setPos [6002.2295, 16247.858];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]"]];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6295.2495, 16272.351], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir 299.2847;
	_this setPos [6295.2495, 16272.351];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["B_G_Soldier_GL_F", [6089.6367, 16228.633], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [6089.6367, 16228.633];
	_this setDir 97.956497;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setDamage 1} forEach (units group this); removeAllWeapons this; removeUniform this; this addVest ""V_TacVest_blk_POLICE""; this addHeadgear ""H_Beret_blk_POLICE""; this addGoggles ""G_Squares""; this addMagazine [""30Rnd_556x45_Stanag"",14]; {this addMagazine ""1Rnd_HE_Grenade_shell""} forEach [0,1,2,3,4]; this addWeapon ""arifle_Mk20_GL_F""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4]; {this addMagazine ""30Rnd_556x45_Stanag_tracer_yellow""} forEach [0,1]; this addPrimaryWeaponItem ""optic_mrco""; this addPrimaryWeaponItem ""acc_flashlight""; this addUniform ""U_IG_Guerilla1_1""; this addMagazine ""HandGrenade""; this addMagazine ""SmokeShell""; {this addMagazine ""Chemlight_red""} forEach [0,1,2]"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["B_G_Soldier_LAT_F", [6174.9165, 16211.765], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [6174.9165, 16211.765];
	_this setDir -56.544464;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["B_G_Soldier_F", [6288.3018, 16231.41], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [6288.3018, 16231.41];
	_this setDir -63.559837;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this removeMagazine ""SmokeShell"""]];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Offroad_01_armed_F", [6180.1201, 16207.559, 0.1351341], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir 9.3572197;
	_this setPos [6180.1201, 16207.559, 0.1351341];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setVehicleAmmo 0.19; this setFuel 0.345; this setHit [""karoserie"",0.75]; this setHit [""engine"",0.55]; this setHit [""wheel_1_1_steering"",1]; this setHit [""wheel_2_1_steering"",1]"]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [5972.272, 16218.195], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setPos [5972.272, 16218.195];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]; "]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6203.9438, 16218.706], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setPos [6203.9438, 16218.706];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 0.73]"]];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6164.5854, 16306.949], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setPos [6164.5854, 16306.949];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6086.4883, 16187.903], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [6086.4883, 16187.903];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]"]];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6225.1582, 16225.724], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setPos [6225.1582, 16225.724];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 4.1]"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6193.3027, 16221.716], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setPos [6193.3027, 16221.716];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6065.8506, 16281.578], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setPos [6065.8506, 16281.578];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6164.8931, 16214.874], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir -6.3765063;
	_this setPos [6164.8931, 16214.874];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["O_Quadbike_01_F", [6187.939, 16227.658, 0.20231725], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir 23.100378;
	_this setPos [6187.939, 16227.658, 0.20231725];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.835"]];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_orange_F", [6022.5259, 16200.017, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 10.865484;
	_this setPos [6022.5259, 16200.017, -3.0517578e-005];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_orange_F", [6024.313, 16192.384, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir -24.535412;
	_this setPos [6024.313, 16192.384, -3.8146973e-005];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_orange_F", [6030.2319, 16201.043, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -88.924736;
	_this setPos [6030.2319, 16201.043, 7.6293945e-006];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [6017.8154, 16194.377, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir 49.537361;
	_this setPos [6017.8154, 16194.377, 6.8664551e-005];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [6046.6895, 16198.752, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir 89.545357;
	_this setPos [6046.6895, 16198.752, 7.6293945e-006];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6041.6548, 16230.833, 0.85411656], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir 93.37793;
	_this setPos [6041.6548, 16230.833, 0.85411656];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6041.79, 16231.993, 0.79266185], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir 88.239311;
	_this setPos [6041.79, 16231.993, 0.79266185];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [6048.1284, 16208.358, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [6048.1284, 16208.358, 3.8146973e-006];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [6051.9272, 16216.294, 0.82103992], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir 0.25540659;
	_this setPos [6051.9272, 16216.294, 0.82103992];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [6218.9409, 16230.457, 0.7881031], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 88.109528;
	_this setPos [6218.9409, 16230.457, 0.7881031];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [6206.814, 16230.245, 0.79821527], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setDir -0.1295017;
	_this setPos [6206.814, 16230.245, 0.79821527];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6042.6616, 16231.603, 0.7865482], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setPos [6042.6616, 16231.603, 0.7865482];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageWashingMachine_F", [6295.6309, 16274.041, -0.11248851], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setDir -50.287796;
	_this setPos [6295.6309, 16274.041, -0.11248851];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [6363.3208, 16268.893, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir 60.220181;
	_this setPos [6363.3208, 16268.893, -7.6293945e-006];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [6367.1973, 16271.07], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir 60.143906;
	_this setPos [6367.1973, 16271.07];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [6367.8252, 16271.645, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir 59.957447;
	_this setPos [6367.8252, 16271.645, -3.8146973e-006];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [6362.4023, 16268.324, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setDir 61.10537;
	_this setPos [6362.4023, 16268.324, -5.7220459e-005];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Coil_F", [6355.604, 16270.059, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setPos [6355.604, 16270.059, -2.6702881e-005];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Coil_F", [6342.6162, 16282.217, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setPos [6342.6162, 16282.217, -4.5776367e-005];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [6307.2178, 16242.147, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setDir -42.700138;
	_this setPos [6307.2178, 16242.147, -3.8146973e-006];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_F", [6250.3623, 16252.022, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 12.194326;
	_this setPos [6250.3623, 16252.022, 7.6293945e-006];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Van_F", [6235.6011, 16270.629, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setPos [6235.6011, 16270.629, -7.6293945e-006];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [6239.5771, 16270.556, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir -10.616133;
	_this setPos [6239.5771, 16270.556, -2.2888184e-005];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyres_F", [6242.7754, 16270.82, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setPos [6242.7754, 16270.82, 4.5776367e-005];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [6046.6401, 16222.393, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setPos [6046.6401, 16222.393, 3.8146973e-006];
	_initCodes set [count _initCodes,[_this,"BIS_Barracks_01 = nearestObject [position this, ""Building""]; {BIS_Barracks_01 setHit [_x, 0.5]} forEach [""glass_1"", ""glass_2"", ""glass_4"", ""glass_8"", ""glass_9"", ""glass_12"", ""glass_17"", ""glass_18"", ""glass_24"", ""glass_25"", ""glass_26"", ""glass_33"", ""glass_35"", ""glass_36"", ""glass_40"", ""glass_49"", ""glass_51"", ""glass_52"", ""glass_56"", ""glass_60""]; {BIS_Barracks_01 setHit [_x, 1]} forEach [""glass_3"", ""glass_5"", ""glass_7"", ""glass_11"", ""glass_15"", ""glass_16"", ""glass_21"", ""glass_23"", ""glass_27"", ""glass_28"", ""glass_31"", ""glass_34"", ""glass_37"", ""glass_39"", ""glass_42"", ""glass_44"", ""glass_45"", ""glass_49"", ""glass_57"", ""glass_58""]"]];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [6209.9854, 16223.889, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setPos [6209.9854, 16223.889, -7.6293945e-006];
	_initCodes set [count _initCodes,[_this,"BIS_Barracks_02 = nearestObject [position this, ""Building""]; {BIS_Barracks_02 setHit [_x, 0.5]} forEach [""glass_3"", ""glass_4"", ""glass_5"", ""glass_9"", ""glass_11"", ""glass_14"", ""glass_15"", ""glass_20"", ""glass_22"", ""glass_25"", ""glass_29"", ""glass_33"", ""glass_34"", ""glass_37"", ""glass_43"", ""glass_44"", ""glass_45"", ""glass_46"", ""glass_49"", ""glass_51""]; {BIS_Barracks_02 setHit [_x, 1]} forEach [""glass_1"", ""glass_2"", ""glass_6"", ""glass_12"", ""glass_18"", ""glass_21"", ""glass_23"", ""glass_24"", ""glass_27"", ""glass_28"", ""glass_30"", ""glass_31"", ""glass_32"", ""glass_38"", ""glass_40"", ""glass_41"", ""glass_42"", ""glass_50"", ""glass_53"", ""glass_55""]"]];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6046.8149, 16210.241], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setPos [6046.8149, 16210.241];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 4.1]"]];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6202.2427, 16257.271], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setPos [6202.2427, 16257.271];
	_initCodes set [count _initCodes,[_this,"_null = [] spawn {sleep 1; If (BIS_POI_Sniper_01_Random == 0) Then {{deleteVehicle _x} forEach [BIS_POI_Sniper_01_Sniper_02, BIS_POI_Sniper_01_Sniper_03, BIS_POI_Sniper_01_Sniper_04, BIS_POI_Sniper_01_Spotter_02, BIS_POI_Sniper_01_Spotter_03, BIS_POI_Sniper_01_Spotter_04]}}"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6202.9902, 16257.309], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setPos [6202.9902, 16257.309];
	_initCodes set [count _initCodes,[_this,"_null = [] spawn {sleep 1;  If (BIS_POI_Sniper_01_Random == 1) Then {{deleteVehicle _x} forEach [BIS_POI_Sniper_01_Sniper_01, BIS_POI_Sniper_01_Sniper_03, BIS_POI_Sniper_01_Sniper_04, BIS_POI_Sniper_01_Spotter_01, BIS_POI_Sniper_01_Spotter_03, BIS_POI_Sniper_01_Spotter_04]}}"]];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6203.7813, 16257.354], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setPos [6203.7813, 16257.354];
	_initCodes set [count _initCodes,[_this,"_null = []  spawn {sleep 1; If (BIS_POI_Sniper_01_Random == 2) Then {{deleteVehicle _x} forEach [BIS_POI_Sniper_01_Sniper_01, BIS_POI_Sniper_01_Sniper_02, BIS_POI_Sniper_01_Sniper_04, BIS_POI_Sniper_01_Spotter_01, BIS_POI_Sniper_01_Spotter_02, BIS_POI_Sniper_01_Spotter_04]}}"]];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6204.1182, 16257.257], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setPos [6204.1182, 16257.257];
	_initCodes set [count _initCodes,[_this,"_null = []  spawn {sleep 1; If (BIS_POI_Sniper_01_Random == 3) Then {{deleteVehicle _x} forEach [BIS_POI_Sniper_01_Sniper_01, BIS_POI_Sniper_01_Sniper_02, BIS_POI_Sniper_01_Sniper_03, BIS_POI_Sniper_01_Spotter_01, BIS_POI_Sniper_01_Spotter_02, BIS_POI_Sniper_01_Spotter_03]}}"]];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [6204.1943, 16215.545, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setPos [6204.1943, 16215.545, 3.8146973e-006];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [6202.9004, 16215.363, 0.00012969971], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setPos [6202.9004, 16215.363, 0.00012969971];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [6209.2344, 16217.151, 0.13497815], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setPos [6209.2344, 16217.151, 0.13497815];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [5972.4609, 16218.096], [], 0, "CAN_COLLIDE"];
	_vehicle_107 = _this;
	_this setDir -55.948109;
	_this setPos [5972.4609, 16218.096];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [6164.8438, 16215.117], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir 87.58136;
	_this setPos [6164.8438, 16215.117];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [6163.5171, 16214.979], [], 0, "CAN_COLLIDE"];
	_vehicle_109 = _this;
	_this setPos [6163.5171, 16214.979];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [6162.5059, 16306.355, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setDir 84.771576;
	_this setPos [6162.5059, 16306.355, 7.6293945e-006];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [6164.3584, 16306.024, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_111 = _this;
	_this setPos [6164.3584, 16306.024, -1.1444092e-005];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [6161.0977, 16304.591, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_112 = _this;
	_this setDir 179.9718;
	_this setPos [6161.0977, 16304.591, -1.1444092e-005];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo40_light_green_F", [6151.1685, 16205.813, 0.09189897], [], 0, "CAN_COLLIDE"];
	_vehicle_113 = _this;
	_this setDir 7.0450277;
	_this setPos [6151.1685, 16205.813, 0.09189897];
	_initCodes set [count _initCodes,[_this,"[43.3647,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_114 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CargoBox_V1_F", [6157.5562, 16210.003, 0.24690163], [], 0, "CAN_COLLIDE"];
	_vehicle_114 = _this;
	_this setDir 61.569431;
	_this setPos [6157.5562, 16210.003, 0.24690163];
	_initCodes set [count _initCodes,[_this,"[43.3647,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [6165.3643, 16211.557, 0.20308186], [], 0, "CAN_COLLIDE"];
	_vehicle_115 = _this;
	_this setDir -93.349266;
	_this setPos [6165.3643, 16211.557, 0.20308186];
	_initCodes set [count _initCodes,[_this,"[43.3647,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [6164.1855, 16211.407, 0.37289929], [], 0, "CAN_COLLIDE"];
	_vehicle_116 = _this;
	_this setPos [6164.1855, 16211.407, 0.37289929];
	_initCodes set [count _initCodes,[_this,"[43.3647,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_117 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [6050.7124, 16225.267, 0.83333629], [], 0, "CAN_COLLIDE"];
	_vehicle_117 = _this;
	_this setDir 89.91291;
	_this setPos [6050.7124, 16225.267, 0.83333629];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [6050.6748, 16222.634, 0.80760378], [], 0, "CAN_COLLIDE"];
	_vehicle_118 = _this;
	_this setPos [6050.6748, 16222.634, 0.80760378];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [6049.9917, 16221.112, 0.78936744], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir 4.5141125;
	_this setPos [6049.9917, 16221.112, 0.78936744];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6048.2373, 16218.36, 0.80432582], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir 74.877151;
	_this setPos [6048.2373, 16218.36, 0.80432582];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [6044.188, 16219.633, 0.74399292], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setDir 84.948952;
	_this setPos [6044.188, 16219.633, 0.74399292];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [6045.5923, 16218.082, 0.85237455], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir -89.728737;
	_this setPos [6045.5923, 16218.082, 0.85237455];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [6045.1152, 16219.802, 0.76993328], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir 52.742195;
	_this setPos [6045.1152, 16219.802, 0.76993328];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [6047.0151, 16230.616, 0.72185338], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setPos [6047.0151, 16230.616, 0.72185338];
	_initCodes set [count _initCodes,[_this,"[43.8571,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [6044.4365, 16235.113, 4.0352635], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setPos [6044.4365, 16235.113, 4.0352635];
	_initCodes set [count _initCodes,[_this,"[47.191,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [6044.6035, 16238.929, 4.0782418], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setDir -64.528076;
	_this setPos [6044.6035, 16238.929, 4.0782418];
	_initCodes set [count _initCodes,[_this,"[47.191,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [6049.4722, 16225.158, 4.1896067], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir 268.46832;
	_this setPos [6049.4722, 16225.158, 4.1896067];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_khaki_F", [6053.6035, 16223.93, 4.100883], [], 0, "CAN_COLLIDE"];
	_vehicle_134 = _this;
	_this setDir 85.990364;
	_this setPos [6053.6035, 16223.93, 4.100883];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [6053.9888, 16222.764, 4.1472964], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setPos [6053.9888, 16222.764, 4.1472964];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [6051.5239, 16219.646, 4.1556325], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir -85.841171;
	_this setPos [6051.5239, 16219.646, 4.1556325];
	_initCodes set [count _initCodes,[_this,"[47.191,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [6050.4058, 16219.453, 4.1648011], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setDir -101.0228;
	_this setPos [6050.4058, 16219.453, 4.1648011];
	_initCodes set [count _initCodes,[_this,"[47.191,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [6238.335, 16261.687, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setPos [6238.335, 16261.687, -7.6293945e-006];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [6044.5303, 16217.082, 4.0447769], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 93.999527;
	_this setPos [6044.5303, 16217.082, 4.0447769];
	_initCodes set [count _initCodes,[_this,"[47.191,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [6044.6519, 16211.656, 4.0884647], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -92.38636;
	_this setPos [6044.6519, 16211.656, 4.0884647];
	_initCodes set [count _initCodes,[_this,"[47.191,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["MapBoard_altis_F", [6197.02, 16222.793, 0.80533296], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir -127.42587;
	_this setPos [6197.02, 16222.793, 0.80533296];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [6201.1118, 16223.269, 0.85422117], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir 166.4362;
	_this setPos [6201.1118, 16223.269, 0.85422117];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [6200.9077, 16222.292, 0.99181682], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir 210.73328;
	_this setPos [6200.9077, 16222.292, 0.99181682];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [6197.4941, 16228.914, 0.81413472], [], 0, "CAN_COLLIDE"];
	_vehicle_158 = _this;
	_this setDir 63.369701;
	_this setPos [6197.4941, 16228.914, 0.81413472];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6206.8975, 16222.552, 0.79893261], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir -180.57516;
	_this setPos [6206.8975, 16222.552, 0.79893261];
	_initCodes set [count _initCodes,[_this,"[43.8594,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6207.4941, 16221.874, 0.80885518], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setDir 161.25732;
	_this setPos [6207.4941, 16221.874, 0.80885518];
	_initCodes set [count _initCodes,[_this,"[43.8594,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Money_F", [6213.5415, 16228.693, 0.8919124], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setPos [6213.5415, 16228.693, 0.8919124];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [6214.0747, 16229.907, 0.88102973], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setPos [6214.0747, 16229.907, 0.88102973];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [6218.5845, 16222.995, 0.82924086], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setDir -86.06395;
	_this setPos [6218.5845, 16222.995, 0.82924086];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [6220.3169, 16224.503, 0.77828062], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setPos [6220.3169, 16224.503, 0.77828062];
	_initCodes set [count _initCodes,[_this,"[43.8606,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6207.5483, 16221.535, 4.1139889], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setDir -91.643867;
	_this setPos [6207.5483, 16221.535, 4.1139889];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [6207.0405, 16221.072, 4.1933918], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir -98.292297;
	_this setPos [6207.0405, 16221.072, 4.1933918];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_172 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [6222.9658, 16229.039, 4.0512886], [], 0, "CAN_COLLIDE"];
	_vehicle_172 = _this;
	_this setDir -88.442856;
	_this setPos [6222.9658, 16229.039, 4.0512886];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [6222.2207, 16229.037, 4.0388694], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setDir -70.008507;
	_this setPos [6222.2207, 16229.037, 4.0388694];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [6218.4434, 16228.987, 4.2622929], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setDir -90.270088;
	_this setPos [6218.4434, 16228.987, 4.2622929];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_175 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [6218.7534, 16223.372, 4.0827909], [], 0, "CAN_COLLIDE"];
	_vehicle_175 = _this;
	_this setDir 86.165428;
	_this setPos [6218.7534, 16223.372, 4.0827909];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6214.1079, 16230.12, 4.1185431], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setDir -89.747398;
	_this setPos [6214.1079, 16230.12, 4.1185431];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [6212.3013, 16227.93, 4.1710734], [], 0, "CAN_COLLIDE"];
	_vehicle_177 = _this;
	_this setPos [6212.3013, 16227.93, 4.1710734];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6209.1763, 16229.792, 4.1242051], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setDir 179.24782;
	_this setPos [6209.1763, 16229.792, 4.1242051];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [6206.3667, 16230.086, 4.1236591], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setDir 179.14313;
	_this setPos [6206.3667, 16230.086, 4.1236591];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_180 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [6205.9292, 16229.487, 4.1657524], [], 0, "CAN_COLLIDE"];
	_vehicle_180 = _this;
	_this setDir -166.62369;
	_this setPos [6205.9292, 16229.487, 4.1657524];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [6203.6255, 16228.215, 4.2315559], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir -106.86151;
	_this setPos [6203.6255, 16228.215, 4.2315559];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [6199.0293, 16229.474, 4.3000212], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setDir -94.346252;
	_this setPos [6199.0293, 16229.474, 4.3000212];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [6197.9292, 16229.562, 4.1690125], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setPos [6197.9292, 16229.562, 4.1690125];
	_initCodes set [count _initCodes,[_this,"[47.1943,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BucketNavy_F", [6190.0166, 16231.583, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setPos [6190.0166, 16231.583, -3.0517578e-005];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [6187.2495, 16222.738, 0.13507955], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setPos [6187.2495, 16222.738, 0.13507955];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [6187.0513, 16223.738, 0.37202424], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setPos [6187.0513, 16223.738, 0.37202424];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [6060.9702, 16157.151], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setPos [6060.9702, 16157.151];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.435"]];
};

_vehicle_197 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6064.2222, 16226.458], [], 0, "CAN_COLLIDE"];
	_vehicle_197 = _this;
	_this setVehicleVarName "Sniper_01_Duck_Tape";
	Sniper_01_Duck_Tape = _this;
	_this setPos [6064.2222, 16226.458];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6105.15,16234.9,0.00143814]"]];
};

_vehicle_199 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6206.2012, 16209.006], [], 0, "CAN_COLLIDE"];
	_vehicle_199 = _this;
	_this setVehicleVarName "Sniper_02_Duck_Tape";
	Sniper_02_Duck_Tape = _this;
	_this setPos [6206.2012, 16209.006];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6179.13,16191.6,0.00143814]"]];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6298.9023, 16252.467], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setVehicleVarName "Sniper_03_Duck_Tape";
	Sniper_03_Duck_Tape = _this;
	_this setPos [6298.9023, 16252.467];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6304.33,16245.8,0.00143814]"]];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6367.9634, 16264.945], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setVehicleVarName "Sniper_04_Duck_Tape";
	Sniper_04_Duck_Tape = _this;
	_this setPos [6367.9634, 16264.945];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6311.1,16241.3,0.00143814]"]];
};

_vehicle_205 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6064.2251, 16226.04], [], 0, "CAN_COLLIDE"];
	_vehicle_205 = _this;
	_this setVehicleVarName "Spotter_01_Duck_Tape";
	Spotter_01_Duck_Tape = _this;
	_this setPos [6064.2251, 16226.04];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6043.68,16227.7,4.19077]"]];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6206.5996, 16208.952], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setVehicleVarName "Spotter_02_Duck_Tape";
	Spotter_02_Duck_Tape = _this;
	_this setPos [6206.5996, 16208.952];
	_initCodes set [count _initCodes,[_this,"this setPosASL [6210.06,16224.1,45.34]"]];
};

_vehicle_210 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6299.3491, 16252.5], [], 0, "CAN_COLLIDE"];
	_vehicle_210 = _this;
	_this setVehicleVarName "Spotter_03_Duck_Tape";
	Spotter_03_Duck_Tape = _this;
	_this setPos [6299.3491, 16252.5];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6292.28,16275.6,9.63998]"]];
};

_vehicle_212 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6368.3203, 16264.948], [], 0, "CAN_COLLIDE"];
	_vehicle_212 = _this;
	_this setVehicleVarName "Spotter_04_Duck_Tape";
	Spotter_04_Duck_Tape = _this;
	_this setPos [6368.3203, 16264.948];
	_initCodes set [count _initCodes,[_this,"this setPosATL [6393.25,16286.4,0.00119781]"]];
};

_vehicle_395 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6199.2153, 16223.278, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_395 = _this;
	_this setPos [6199.2153, 16223.278, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_405 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6216.3892, 16229.125, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_405 = _this;
	_this setPos [6216.3892, 16229.125, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_407 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6220.7524, 16222.425, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_407 = _this;
	_this setPos [6220.7524, 16222.425, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_409 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6042.9399, 16233.997], [], 0, "CAN_COLLIDE"];
	_vehicle_409 = _this;
	_this setPos [6042.9399, 16233.997];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_411 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6048.3984, 16227.744, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_411 = _this;
	_this setPos [6048.3984, 16227.744, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_413 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6048.6201, 16221.27, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_413 = _this;
	_this setPos [6048.6201, 16221.27, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_415 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6044.1377, 16215.637, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_415 = _this;
	_this setPos [6044.1377, 16215.637, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_418 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6049.23, 16215.406, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_418 = _this;
	_this setPos [6049.23, 16215.406, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_421 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [6053.21, 16227.828], [], 0, "CAN_COLLIDE"];
	_vehicle_421 = _this;
	_this setPos [6053.21, 16227.828];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_423 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [6047.7861, 16210.341], [], 0, "CAN_COLLIDE"];
	_vehicle_423 = _this;
	_this setPos [6047.7861, 16210.341];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"", ""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 0.72]"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
