_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter east;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_4 = createGroup _center_1;

_group_5 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_crew_F", [10812.93, 18976.105], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [10812.93, 18976.105];
	_this setDir 361.99744;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_Crew_01";
	BIS_POI_ImmobileArmor_02_Crew_01 = _this;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.55165535;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_opfor""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_crew_F", [10814.37, 18980.316], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [10814.37, 18980.316];
	_this setDir 195.47354;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_Crew_02";
	BIS_POI_ImmobileArmor_02_Crew_02 = _this;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.50751448;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_Bandanna_cbr""; this unlinkItem ""NVGoggles_opfor""; this removeWeapon (handgunWeapon this); this removeMagazines ""16Rnd_9x21_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F"""]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["O_crew_F", [10811.93, 18980.244], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [10811.93, 18980.244];
	_this setDir 171.13947;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_Crew_03";
	BIS_POI_ImmobileArmor_02_Crew_03 = _this;
	_this setUnitAbility 0.52222806;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this unlinkItem ""NVGoggles_opfor""; removeHeadgear this; this addGoggles ""G_Sport_Blackyellow"""]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_soldier_repair_F", [10831, 18963.277], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [10831, 18963.277];
	_this setDir 274.91107;
	_this setUnitAbility 0.51802421;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; clearMagazineCargo (unitBackpack this); this unlinkItem ""NVGoggles_opfor""; ; this removeWeapon (handgunWeapon this); this removeMagazines ""16Rnd_9x21_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_soldier_repair_F", [10829.105, 18963.301], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [10829.105, 18963.301];
	_this setDir 89.823563;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.55796123;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; removeBackpack this; removeHeadgear this; this addHeadgear ""H_Cap_brn_SPECOPS"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_F", [10814.262, 18998.24], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [10814.262, 18998.24];
	_this setDir -37.984013;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInGunner BIS_POI_ImmobileArmor_02_Ifrit; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_Soldier_GL_F", [10827.926, 18936.686], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [10827.926, 18936.686];
	_this setDir 176.73476;
	_this setTargetAge "ACTUAL";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setBehaviour ""Safe""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeYellow_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_AR_F", [10846.758, 18911.115], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [10846.758, 18911.115];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_ImmobileArmor_02_groupBlue = group this; this setSkill 0.35; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_F", [10844.364, 18908.887], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [10844.364, 18908.887];
	_this setUnitAbility 0.54534954;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["O_Soldier_lite_F", [10849.54, 18909.227], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [10849.54, 18909.227];
	_this setUnitAbility 0.54114568;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; removeHeadgear this; this addHeadgear ""H_Bandanna_cbr""; this unlinkItem ""NVGoggles_opfor""; this removeWeapon (handgunWeapon this); this removeMagazines ""16Rnd_9x21_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["O_MRAP_02_gmg_F", [10816.365, 19000.332, 0.30534992], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -53.437912;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_Ifrit";
	BIS_POI_ImmobileArmor_02_Ifrit = _this;
	_this setPos [10816.365, 19000.332, 0.30534992];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.635"]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["O_Truck_02_box_F", [10827.81, 18949.523, 0.33419135], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir -733.9342;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_Zamak";
	BIS_POI_ImmobileArmor_02_Zamak = _this;
	_this setPos [10827.81, 18949.523, 0.33419135];
	_initCodes set [count _initCodes,[_this,"this setRepairCargo 0; this setFuel 0.435; clearItemCargo this; this addItemCargo [""Toolkit"",1]"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [10846.594, 18914.209, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setPos [10846.594, 18914.209, -5.3405762e-005];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [10847.029, 18914.211, -0.00012969971], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [10847.029, 18914.211, -0.00012969971];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [10851.046, 18966.391, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [10851.046, 18966.391, -7.6293945e-005];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [10834.026, 19015.748], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [10834.026, 19015.748];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [10773.829, 18962.477], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [10773.829, 18962.477];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [10768.539, 18912.514], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [10768.539, 18912.514];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [10825.152, 18970.975], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_center";
	BIS_POI_ImmobileArmor_02_center = _this;
	_this setPos [10825.152, 18970.975];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [10819.496, 18978.299], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setPos [10819.496, 18978.299];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [10829.383, 18966.83], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setPos [10829.383, 18966.83];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [10824.747, 18942.934], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setPos [10824.747, 18942.934];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [11006.597, 19033.744, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir -12.652617;
	_this setPos [11006.597, 19033.744, -0.0001373291];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_F", [10993.831, 19031.9, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir -54.064709;
	_this setPos [10993.831, 19031.9, -7.6293945e-005];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_grey_F", [10991.834, 19056.281, 0.24196638], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -105.86964;
	_this setPos [10991.834, 19056.281, 0.24196638];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CargoBox_V1_F", [10999.054, 19049.842, 0.42761517], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 26.867157;
	_this setPos [10999.054, 19049.842, 0.42761517];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CargoBox_V1_F", [10997.192, 19047.877, 0.15035856], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir 73.505325;
	_this setPos [10997.192, 19047.877, 0.15035856];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [10942.137, 18946.896, 0.22463071], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -61.210758;
	_this setPos [10942.137, 18946.896, 0.22463071];
	_initCodes set [count _initCodes,[_this,"this setHit [""karoserie"",0.55]; this setHit [""engine"",0.70]; this setFuel 0.435; clearItemCargo this"]];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [10946.624, 18942.447, 0.21761118], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir -55.639465;
	_this setPos [10946.624, 18942.447, 0.21761118];
	_initCodes set [count _initCodes,[_this,"[90.211,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [10945.236, 18942.033, 0.15187381], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 33.913528;
	_this setPos [10945.236, 18942.033, 0.15187381];
	_initCodes set [count _initCodes,[_this,"[90.211,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10958.47, 18949.02, 0.14109895], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -143.76759;
	_this setPos [10958.47, 18949.02, 0.14109895];
	_initCodes set [count _initCodes,[_this,"[90.5091,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [10947.963, 18948.416, 0.42383641], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -55.029293;
	_this setPos [10947.963, 18948.416, 0.42383641];
	_initCodes set [count _initCodes,[_this,"[90.5091,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [10948.434, 18948.152, 0.46664134], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir -148.39709;
	_this setPos [10948.434, 18948.152, 0.46664134];
	_initCodes set [count _initCodes,[_this,"[90.5091,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [10939.121, 18952.283], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setPos [10939.121, 18952.283];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Green_F", [10825.433, 18967.461], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setPos [10825.433, 18967.461];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 1.5]"]];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["O_APC_Wheeled_02_rcws_F", [10826.809, 18970.588], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir 22.758947;
	_this setVehicleVarName "BIS_POI_ImmobileArmor_02_Marid";
	BIS_POI_ImmobileArmor_02_Marid = _this;
	_this setPos [10826.809, 18970.588];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.735"]];
};

_vehicle_246 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10947.139, 18945.471, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_246 = _this;
	_this setPos [10947.139, 18945.471, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_248 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10950.431, 18949.297], [], 0, "CAN_COLLIDE"];
	_vehicle_248 = _this;
	_this setPos [10950.431, 18949.297];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_250 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10956.948, 18949.881, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_250 = _this;
	_this setPos [10956.948, 18949.881, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
