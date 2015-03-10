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

_group_7 = createGroup _center_1;

_group_8 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_pilot_F", [3599.2898, 11564.237, 0.81663758], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [3599.2898, 11564.237, 0.81663758];
	_this setDir -57.680367;
	_this setVehicleVarName "BIS_POI_Pilots_01_Pilot_01";
	BIS_POI_Pilots_01_Pilot_01 = _this;
	_this setUnitRank "CAPTAIN";
	_this setUnitAbility 0.55375737;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""LEAN"",""ASIS""]]; removeAllWeapons this; removeHeadgear this; this addGoggles ""G_Aviator""; this addHeadgear ""H_Beret_grn""; removeBackpack this; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3]; this addWeapon ""hgun_PDW2000_F""; this addMagazine ""SmokeShellRed""; this addMagazine ""SmokeShellOrange"""]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_pilot_F", [3598.3728, 11566.752, 0.82737899], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [3598.3728, 11566.752, 0.82737899];
	_this setDir 157.52632;
	_this setVehicleVarName "BIS_POI_Pilots_01_Pilot_02";
	BIS_POI_Pilots_01_Pilot_02 = _this;
	_this setUnitRank "LIEUTENANT";
	_this setUnitAbility 0.55165535;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; removeAllWeapons this; removeHeadgear this; this addHeadgear ""H_Booniehat_dgtl""; removeBackpack this; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3]; this addWeapon ""hgun_PDW2000_F""; this addMagazine ""SmokeShellRed""; this addMagazine ""SmokeShellOrange"""]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_pilot_F", [3596.6587, 11564.522, 0.85173005], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [3596.6587, 11564.522, 0.85173005];
	_this setDir 74.532555;
	_this setVehicleVarName "BIS_POI_Pilots_01_Pilot_03";
	BIS_POI_Pilots_01_Pilot_03 = _this;
	_this setUnitRank "LIEUTENANT";
	_this setUnitAbility 0.55165535;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; removeAllWeapons this; removeHeadgear this; this addHeadgear ""H_MilCap_dgtl""; removeBackpack this; this addItem ""FirstAidKit""; {this addMagazine ""Chemlight_red""} forEach [0,1]; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3]; this addWeapon ""hgun_PDW2000_F""; this addMagazine ""SmokeShellRed""; this addMagazine ""SmokeShellOrange"""]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [3620.8833, 11565.434], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [3620.8833, 11565.434];
	_this setDir 116.44592;
	_this setUnitAbility 0.55585915;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [3585.3179, 11553.111], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [3585.3179, 11553.111];
	_this setDir -141.82787;
	_this setUnitAbility 0.53904366;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_lite_F", [3615.1421, 11588.178], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [3615.1421, 11588.178];
	_this setDir 30.975018;
	_this setUnitAbility 0.528534;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Middle""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_GL_F", [3589.0178, 11550.756], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [3589.0178, 11550.756];
	_this setDir -142.14192;
	_this setUnitAbility 0.55375731;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""LEAN"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_TL_F", [3695.8367, 11413.224], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [3695.8367, 11413.224];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.54312146;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_Pilots_01_groupCyan = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited"""]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_soldier_F", [3694.061, 11412.176], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [3694.061, 11412.176];
	_this setUnitAbility 0.52012622;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_soldier_F", [3697.4165, 11412.338], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [3697.4165, 11412.338];
	_this setUnitAbility 0.50961643;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_Soldier_AR_F", [3811.833, 11680.562], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [3811.833, 11680.562];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.53694177;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_Pilots_01_groupPink = group this; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited"""]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [3809.7102, 11676.58], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [3809.7102, 11676.58];
	_this setUnitAbility 0.53483987;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_Soldier_lite_F", [3812.7822, 11677.108], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [3812.7822, 11677.108];
	_this setUnitAbility 0.54955351;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_Soldier_GL_F", [3355.7776, 11723.787], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [3355.7776, 11723.787];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.55585927;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_Pilots_01_groupGreen = group this; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_soldier_F", [3354.0378, 11720.893], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [3354.0378, 11720.893];
	_this setUnitAbility 0.55585933;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_soldier_F", [3357.3457, 11720.346], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [3357.3457, 11720.346];
	_this setUnitAbility 0.56006312;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [3604.7456, 11570.901], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_Pilots_01_center";
	BIS_POI_Pilots_01_center = _this;
	_this setPos [3604.7456, 11570.901];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [3811.9558, 11683.866], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setPos [3811.9558, 11683.866];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [3812.439, 11683.795], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setPos [3812.439, 11683.795];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3695.7104, 11415.106], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setPos [3695.7104, 11415.106];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3696.0942, 11415.105], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setPos [3696.0942, 11415.105];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [3355.938, 11728.653], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setPos [3355.938, 11728.653];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [3356.2666, 11728.499], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setPos [3356.2666, 11728.499];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["I_Quadbike_01_F", [3622.1409, 11571.261, 0.24903443], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -116.63089;
	_this setPos [3622.1409, 11571.261, 0.24903443];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.905"]];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_covered_F", [3641.428, 11561.581, 0.2025], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir -132.56369;
	_this setPos [3641.428, 11561.581, 0.2025];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; clearMagazineCargo this; clearWeaponCargo this; this setFuel 0.725"]];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3626.2549, 11567.911, -1.2397766e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setPos [3626.2549, 11567.911, -1.2397766e-005];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V3_F", [3616.7104, 11588.836, -6.9141388e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setPos [3616.7104, 11588.836, -6.9141388e-005];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Rusty_F", [3616.4561, 11588.85, -2.1457672e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setPos [3616.4561, 11588.85, -2.1457672e-005];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [3614.6328, 11589.068, -5.7697296e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -90.084641;
	_this setPos [3614.6328, 11589.068, -5.7697296e-005];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SurvivalRadio_F", [3616.5647, 11588.438, -6.0081482e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -59.652927;
	_this setPos [3616.5647, 11588.438, -6.0081482e-005];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3614.4106, 11590.477, -3.3378601e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [3614.4106, 11590.477, -3.3378601e-006];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Land_VitaminBottle_F", [3614.7764, 11589.311, -6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setPos [3614.7764, 11589.311, -6.4849854e-005];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3602.4001, 11563.158, 0.84238547], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir -44.871651;
	_this setPos [3602.4001, 11563.158, 0.84238547];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3604.3481, 11565.142, 0.76669031], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir -47.566174;
	_this setPos [3604.3481, 11565.142, 0.76669031];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3600.3213, 11561.018, 0.91698414], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir -45.410961;
	_this setPos [3600.3213, 11561.018, 0.91698414];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3593.2466, 11563.885, 0.83016801], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setDir 44.463512;
	_this setPos [3593.2466, 11563.885, 0.83016801];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.1,-0.25,-0.02]]];"]];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3597.2239, 11559.096, 0.87197119], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setDir 42.5924;
	_this setPos [3597.2239, 11559.096, 0.87197119];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3601.5491, 11567.199, 0.75714797], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir 133.80635;
	_this setPos [3601.5491, 11567.199, 0.75714797];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3598.7856, 11570.887, 0.71007383], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setDir 133.51213;
	_this setPos [3598.7856, 11570.887, 0.71007383];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3601.165, 11573.21, 0.73431998], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir 133.51213;
	_this setPos [3601.165, 11573.21, 0.73431998];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3596.7969, 11568.868, 0.78870457], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir 133.51213;
	_this setPos [3596.7969, 11568.868, 0.78870457];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3603.4868, 11569.947, 0.75787723], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 43.979225;
	_this setPos [3603.4868, 11569.947, 0.75787723];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3603.2952, 11575.278, 0.74335694], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir 132.9398;
	_this setPos [3603.2952, 11575.278, 0.74335694];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3609.0564, 11569.75, 0.69130856], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setDir -46.606567;
	_this setPos [3609.0564, 11569.75, 0.69130856];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3606.9558, 11567.8, 0.69689441], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setDir -44.584366;
	_this setPos [3606.9558, 11567.8, 0.69689441];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3600.9285, 11567.793, 0.78964251], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setDir -46.251534;
	_this setPos [3600.9285, 11567.793, 0.78964251];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3594.8096, 11566.665, 0.79549527], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir 134.65767;
	_this setPos [3594.8096, 11566.665, 0.79549527];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_98 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3600.2498, 11566.466, 0.75680757], [], 0, "CAN_COLLIDE"];
	_vehicle_98 = _this;
	_this setDir 224.23917;
	_this setPos [3600.2498, 11566.466, 0.75680757];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3593.9541, 11564.561, 0.8771733], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setDir 46.455559;
	_this setPos [3593.9541, 11564.561, 0.8771733];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3601.6689, 11563.308, 0.80652398], [], 0, "CAN_COLLIDE"];
	_vehicle_102 = _this;
	_this setDir -40.716816;
	_this setPos [3601.6689, 11563.308, 0.80652398];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3601.6965, 11566.434, 0.85332245], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setDir 128.09567;
	_this setPos [3601.6965, 11566.434, 0.85332245];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3600.0994, 11567.744, 0.78374875], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setDir -57.213287;
	_this setPos [3600.0994, 11567.744, 0.78374875];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3600.1572, 11561.896, 0.87373275], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir -32.207813;
	_this setPos [3600.1572, 11561.896, 0.87373275];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3597.6985, 11559.686, 0.89765447], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setDir 33.106632;
	_this setPos [3597.6985, 11559.686, 0.89765447];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3595.4429, 11565.567, 0.88261032], [], 0, "CAN_COLLIDE"];
	_vehicle_112 = _this;
	_this setDir 138.93097;
	_this setPos [3595.4429, 11565.567, 0.88261032];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3595.6743, 11566.699, 0.85750365], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir 134.0443;
	_this setPos [3595.6743, 11566.699, 0.85750365];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3608.0266, 11570.097, 0.67178035], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setDir -40.980537;
	_this setPos [3608.0266, 11570.097, 0.67178035];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3602.3391, 11567.064, 0.78778851], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir 139.24036;
	_this setPos [3602.3391, 11567.064, 0.78778851];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3599.9587, 11565.491, 0.89854789], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir -155.04451;
	_this setPos [3599.9587, 11565.491, 0.89854789];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3599.4341, 11566.293, 0.81273413], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setDir -125.40916;
	_this setPos [3599.4341, 11566.293, 0.81273413];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_126 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3599.4521, 11561.313, 0.81847054], [], 0, "CAN_COLLIDE"];
	_vehicle_126 = _this;
	_this setDir -40.306309;
	_this setPos [3599.4521, 11561.313, 0.81847054];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3607.0259, 11568.528, 0.7363891], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setDir -44.910099;
	_this setPos [3607.0259, 11568.528, 0.7363891];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3597.1589, 11567.912, 0.83025885], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setDir -20.602774;
	_this setPos [3597.1589, 11567.912, 0.83025885];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3604.3376, 11570.106, 0.76728225], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setDir 39.056381;
	_this setPos [3604.3376, 11570.106, 0.76728225];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3604.0667, 11566.507, 0.87316602], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setDir -29.710066;
	_this setPos [3604.0667, 11566.507, 0.87316602];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3606.0137, 11568.272, 0.84145403], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setDir -47.213688;
	_this setPos [3606.0137, 11568.272, 0.84145403];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3597.6296, 11568.615, 0.78020447], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setDir -60.066196;
	_this setPos [3597.6296, 11568.615, 0.78020447];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3599.0303, 11570.029, 0.77420509], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setDir 142.0074;
	_this setPos [3599.0303, 11570.029, 0.77420509];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3601.2805, 11572.483, 0.74820745], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setDir -228.08408;
	_this setPos [3601.2805, 11572.483, 0.74820745];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3601.8398, 11573.27, 0.58902657], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir 130.29517;
	_this setPos [3601.8398, 11573.27, 0.58902657];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3606.8047, 11573.542, 0.72667575], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir 222.50266;
	_this setPos [3606.8047, 11573.542, 0.72667575];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.1,-0.25,-0.02]]];"]];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [3540.272, 11575.235], [], 0, "CAN_COLLIDE"];
	_vehicle_177 = _this;
	_this setPos [3540.272, 11575.235];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [3662.8469, 11435.675], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setPos [3662.8469, 11435.675];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [3835.2566, 11769.376], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setPos [3835.2566, 11769.376];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [3760.7659, 11972.334], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setPos [3760.7659, 11972.334];
};

_vehicle_192 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3665.6089, 11452.86], [], 0, "CAN_COLLIDE"];
	_vehicle_192 = _this;
	_this setPos [3665.6089, 11452.86];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3773.0137, 11469.429], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setPos [3773.0137, 11469.429];
};

_vehicle_204 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_01_police_F", [3627.5662, 10874.696, -0.97367513], [], 0, "CAN_COLLIDE"];
	_vehicle_204 = _this;
	_this setDir 76.563492;
	_this setPos [3627.5662, 10874.696, -0.97367513];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.615"]];
};

_vehicle_206 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3589.4231, 11549.548], [], 0, "CAN_COLLIDE"];
	_vehicle_206 = _this;
	_this setPos [3589.4231, 11549.548];
};

_vehicle_215 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [3595.7241, 11559.749, 0.93841583], [], 0, "CAN_COLLIDE"];
	_vehicle_215 = _this;
	_this setPos [3595.7241, 11559.749, 0.93841583];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_217 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [3606.8496, 11573.338, 0.69898909], [], 0, "CAN_COLLIDE"];
	_vehicle_217 = _this;
	_this setPos [3606.8496, 11573.338, 0.69898909];
	_initCodes set [count _initCodes,[_this,"[5.52614,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [3618.7146, 11559.783, 1.3828278e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setDir -45.292072;
	_this setPos [3618.7146, 11559.783, 1.3828278e-005];
};

_vehicle_227 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [3614.3247, 11572.685, -0.022532446], [], 0, "CAN_COLLIDE"];
	_vehicle_227 = _this;
	_this setDir 134.99422;
	_this setPos [3614.3247, 11572.685, -0.022532446];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [3615.5149, 11573.644, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setPos [3615.5149, 11573.644, 1.335144e-005];
};

_vehicle_229 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [3616.3208, 11574.236, 7.0095062e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_229 = _this;
	_this setPos [3616.3208, 11574.236, 7.0095062e-005];
};

_vehicle_234 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3597.3235, 11562.383, 0.94254816], [], 0, "CAN_COLLIDE"];
	_vehicle_234 = _this;
	_this setDir 3.0809138;
	_this setPos [3597.3235, 11562.383, 0.94254816];
};

_vehicle_236 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3600.2129, 11564.598, 1.1469947], [], 0, "CAN_COLLIDE"];
	_vehicle_236 = _this;
	_this setDir 24.210833;
	_this setPos [3600.2129, 11564.598, 1.1469947];
};

_vehicle_238 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3597.6572, 11566.408, 0.90322948], [], 0, "CAN_COLLIDE"];
	_vehicle_238 = _this;
	_this setDir 67.342438;
	_this setPos [3597.6572, 11566.408, 0.90322948];
};

_vehicle_242 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3614.6426, 11585.963, 0.64966571], [], 0, "CAN_COLLIDE"];
	_vehicle_242 = _this;
	_this setDir -133.53226;
	_this setPos [3614.6426, 11585.963, 0.64966571];
	_initCodes set [count _initCodes,[_this,"[5.80326,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3616.1777, 11584.694, 0.64157635], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setDir -160.48759;
	_this setPos [3616.1777, 11584.694, 0.64157635];
	_initCodes set [count _initCodes,[_this,"[5.80326,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_246 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [3613.9885, 11585.527, 0.67865121], [], 0, "CAN_COLLIDE"];
	_vehicle_246 = _this;
	_this setDir -95.778145;
	_this setPos [3613.9885, 11585.527, 0.67865121];
	_initCodes set [count _initCodes,[_this,"[5.80326,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_248 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [3615.2495, 11584.112, 0.68654293], [], 0, "CAN_COLLIDE"];
	_vehicle_248 = _this;
	_this setDir -210.73302;
	_this setPos [3615.2495, 11584.112, 0.68654293];
	_initCodes set [count _initCodes,[_this,"[5.80326,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_252 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3616.2073, 11582.339, 4.2272053], [], 0, "CAN_COLLIDE"];
	_vehicle_252 = _this;
	_this setDir -42.943977;
	_this setPos [3616.2073, 11582.339, 4.2272053];
	_initCodes set [count _initCodes,[_this,"[9.22153,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_253 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3615.4341, 11582.608, 4.2365775], [], 0, "CAN_COLLIDE"];
	_vehicle_253 = _this;
	_this setDir -38.243725;
	_this setPos [3615.4341, 11582.608, 4.2365775];
	_initCodes set [count _initCodes,[_this,"[9.22153,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_254 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [3606.5381, 11578.193, 4.2993293], [], 0, "CAN_COLLIDE"];
	_vehicle_254 = _this;
	_this setDir 135.26201;
	_this setPos [3606.5381, 11578.193, 4.2993293];
	_initCodes set [count _initCodes,[_this,"[9.22153,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_255 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [3606.9753, 11577.558, 4.4483175], [], 0, "CAN_COLLIDE"];
	_vehicle_255 = _this;
	_this setDir 146.22328;
	_this setPos [3606.9753, 11577.558, 4.4483175];
	_initCodes set [count _initCodes,[_this,"[9.22153,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_256 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [3689.5461, 11642.792, -0.14951284], [], 0, "CAN_COLLIDE"];
	_vehicle_256 = _this;
	_this setPos [3689.5461, 11642.792, -0.14951284];
};

_vehicle_257 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3689.8208, 11641.433, 0.00015068054], [], 0, "CAN_COLLIDE"];
	_vehicle_257 = _this;
	_this setPos [3689.8208, 11641.433, 0.00015068054];
};

_vehicle_258 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [3712.1177, 11602.591, -0.086824164], [], 0, "CAN_COLLIDE"];
	_vehicle_258 = _this;
	_this setDir 27.407471;
	_this setPos [3712.1177, 11602.591, -0.086824164];
};

_vehicle_259 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageWashingMachine_F", [3708.6523, 11609.164, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_259 = _this;
	_this setDir -105.59374;
	_this setPos [3708.6523, 11609.164, -1.9073486e-006];
};

_vehicle_260 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_CarDismantled_F", [3706.0159, 11604.108], [], 0, "CAN_COLLIDE"];
	_vehicle_260 = _this;
	_this setDir -55.757191;
	_this setPos [3706.0159, 11604.108];
};

_vehicle_261 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [3671.5815, 11560.09, 6.3419342e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_261 = _this;
	_this setDir -210.80118;
	_this setPos [3671.5815, 11560.09, 6.3419342e-005];
};

_vehicle_262 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyres_F", [3649.2173, 11540.817, -0.08930587], [], 0, "CAN_COLLIDE"];
	_vehicle_262 = _this;
	_this setDir 32.547722;
	_this setPos [3649.2173, 11540.817, -0.08930587];
};

_vehicle_263 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3650.9834, 11539.772, 3.3378601e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_263 = _this;
	_this setPos [3650.9834, 11539.772, 3.3378601e-006];
};

_vehicle_264 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [3640.4727, 11590.891, -0.14709972], [], 0, "CAN_COLLIDE"];
	_vehicle_264 = _this;
	_this setPos [3640.4727, 11590.891, -0.14709972];
};

_vehicle_265 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [3641.4641, 11589.336, 2.5272369e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_265 = _this;
	_this setDir -69.090286;
	_this setPos [3641.4641, 11589.336, 2.5272369e-005];
};

_vehicle_266 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3639.551, 11589.815, -2.4318695e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_266 = _this;
	_this setPos [3639.551, 11589.815, -2.4318695e-005];
};

_vehicle_267 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_UAZ_F", [3561.0986, 11601.271, 0.15350647], [], 0, "CAN_COLLIDE"];
	_vehicle_267 = _this;
	_this setDir -49.919872;
	_this setPos [3561.0986, 11601.271, 0.15350647];
};

_vehicle_268 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [3704.812, 11517.505, -0.34694329], [], 0, "CAN_COLLIDE"];
	_vehicle_268 = _this;
	_this setDir 37.110268;
	_this setPos [3704.812, 11517.505, -0.34694329];
};

_vehicle_269 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [3788.5598, 11601.521, -9.059906e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_269 = _this;
	_this setDir -154.40012;
	_this setPos [3788.5598, 11601.521, -9.059906e-005];
};

_vehicle_270 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Van_F", [3711.7102, 11454.833, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_270 = _this;
	_this setDir -68.697777;
	_this setPos [3711.7102, 11454.833, -2.6702881e-005];
};

_vehicle_271 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [3797.4124, 11415.567, -3.9100647e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_271 = _this;
	_this setDir -79.452675;
	_this setPos [3797.4124, 11415.567, -3.9100647e-005];
};

_vehicle_272 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [3714.593, 11469.269, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_272 = _this;
	_this setDir -13.176247;
	_this setPos [3714.593, 11469.269, -3.6239624e-005];
};

_vehicle_273 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [3645.8213, 11489.406, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_273 = _this;
	_this setDir -35.072834;
	_this setPos [3645.8213, 11489.406, -9.5367432e-007];
};

_vehicle_274 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [3640.646, 11493.398, 2.1457672e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_274 = _this;
	_this setDir 22.533278;
	_this setPos [3640.646, 11493.398, 2.1457672e-006];
};

_vehicle_275 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FishingGear_02_F", [3649.0784, 11493.47, -9.5106661e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_275 = _this;
	_this setDir 38.700108;
	_this setPos [3649.0784, 11493.47, -9.5106661e-006];
};

_vehicle_276 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V2_F", [3581.6809, 11534.272, -7.9154968e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_276 = _this;
	_this setPos [3581.6809, 11534.272, -7.9154968e-005];
};

_vehicle_278 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V2_F", [3580.229, 11535.844, -0.00010752678], [], 0, "CAN_COLLIDE"];
	_vehicle_278 = _this;
	_this setPos [3580.229, 11535.844, -0.00010752678];
};

_vehicle_280 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3577.9031, 11535.641, -7.6055527e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_280 = _this;
	_this setDir -13.07873;
	_this setPos [3577.9031, 11535.641, -7.6055527e-005];
};

_vehicle_282 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3580.095, 11532.995, -1.502037e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_282 = _this;
	_this setDir -13.07873;
	_this setPos [3580.095, 11532.995, -1.502037e-005];
};

_vehicle_284 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3583.6394, 11530.249, -0.00021862984], [], 0, "CAN_COLLIDE"];
	_vehicle_284 = _this;
	_this setDir -69.681282;
	_this setPos [3583.6394, 11530.249, -0.00021862984];
};

_vehicle_286 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3586.4026, 11527.68, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_286 = _this;
	_this setDir 20.599901;
	_this setPos [3586.4026, 11527.68, -0.0001373291];
};

_vehicle_288 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [3585.5225, 11529.715, -3.0994415e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_288 = _this;
	_this setDir -13.07873;
	_this setPos [3585.5225, 11529.715, -3.0994415e-005];
};

_vehicle_290 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V1_F", [3584.384, 11528.907, -3.7908554e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_290 = _this;
	_this setPos [3584.384, 11528.907, -3.7908554e-005];
};

_vehicle_291 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [3583.7312, 11530.875, 7.8678131e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_291 = _this;
	_this setPos [3583.7312, 11530.875, 7.8678131e-006];
};

_vehicle_292 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3583.0642, 11533.089, -7.9393387e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_292 = _this;
	_this setDir 45.221767;
	_this setPos [3583.0642, 11533.089, -7.9393387e-005];
};

_vehicle_293 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [3583.7959, 11533.716, 7.1525574e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_293 = _this;
	_this setDir 42.285877;
	_this setPos [3583.7959, 11533.716, 7.1525574e-007];
};

_vehicle_294 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [3579.1472, 11536.759, 5.4836273e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_294 = _this;
	_this setDir -25.408524;
	_this setPos [3579.1472, 11536.759, 5.4836273e-006];
};

_vehicle_295 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [3612.9595, 11570.771, -3.3378601e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_295 = _this;
	_this setDir 138.03442;
	_this setPos [3612.9595, 11570.771, -3.3378601e-006];
};

_vehicle_335 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3736.4651, 11661.751], [], 0, "CAN_COLLIDE"];
	_vehicle_335 = _this;
	_this setPos [3736.4651, 11661.751];
};

_vehicle_337 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3663.1816, 11763.216], [], 0, "CAN_COLLIDE"];
	_vehicle_337 = _this;
	_this setPos [3663.1816, 11763.216];
};

_vehicle_339 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3497.1191, 11645.716], [], 0, "CAN_COLLIDE"];
	_vehicle_339 = _this;
	_this setPos [3497.1191, 11645.716];
};

_vehicle_341 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3612.0688, 11504.998], [], 0, "CAN_COLLIDE"];
	_vehicle_341 = _this;
	_this setPos [3612.0688, 11504.998];
};

_vehicle_344 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [3723.6218, 11347.068, -1.1920929e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_344 = _this;
	_this setPos [3723.6218, 11347.068, -1.1920929e-007];
};

_vehicle_346 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [3771.4673, 11235.084, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_346 = _this;
	_this setPos [3771.4673, 11235.084, 0];
};

_vehicle_349 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [3879.6926, 11987.628, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_349 = _this;
	_this setPos [3879.6926, 11987.628, 3.8146973e-006];
};

_vehicle_351 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [4238.9365, 12013.719, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_351 = _this;
	_this setPos [4238.9365, 12013.719, 0];
};

_vehicle_353 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [4268.1699, 11890.17, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_353 = _this;
	_this setPos [4268.1699, 11890.17, 0];
};

_vehicle_355 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [4163.2153, 11802.545, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_355 = _this;
	_this setPos [4163.2153, 11802.545, 3.8146973e-006];
};

_vehicle_357 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [4018.0791, 11710.846, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_357 = _this;
	_this setPos [4018.0791, 11710.846, 0];
};

_vehicle_359 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Pink_F", [3891.1177, 11681.154, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_359 = _this;
	_this setPos [3891.1177, 11681.154, 0];
};

_vehicle_362 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3758.9795, 11565.981], [], 0, "CAN_COLLIDE"];
	_vehicle_362 = _this;
	_this setPos [3758.9795, 11565.981];
};

_vehicle_364 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3568.1958, 11711.376], [], 0, "CAN_COLLIDE"];
	_vehicle_364 = _this;
	_this setPos [3568.1958, 11711.376];
};

_vehicle_366 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3550.6775, 11565.256, -2.3841858e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_366 = _this;
	_this setPos [3550.6775, 11565.256, -2.3841858e-007];
};

_vehicle_368 = objNull;
if (true) then
{
	_this = createVehicle ["C_Rubberboat", [3600.0935, 10874.538, -0.56154114], [], 0, "CAN_COLLIDE"];
	_vehicle_368 = _this;
	_this setDir 125.04742;
	_this setPos [3600.0935, 10874.538, -0.56154114];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.465"]];
};

_vehicle_369 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [3619.4978, 10857.618, 0.09636382], [], 0, "CAN_COLLIDE"];
	_vehicle_369 = _this;
	_this setPos [3619.4978, 10857.618, 0.09636382];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.315; this setHit [""engine"",0.35]; clearItemCargo this; this addWeaponCargo [""hgun_Pistol_heavy_01_F"",1]; this addMagazineCargo [""11Rnd_45ACP_Mag"",6]; this addItemCargo [""FirstAidKit"",2]; this addMagazineCargo [""Chemlight_blue"",12]"]];
};

_vehicle_370 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3615.3733, 10857.312, 2.6226044e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_370 = _this;
	_this setPos [3615.3733, 10857.312, 2.6226044e-005];
};

_vehicle_384 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [3591.5334, 11562.312], [], 0, "CAN_COLLIDE"];
	_vehicle_384 = _this;
	_this setPos [3591.5334, 11562.312];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_386 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [3609.8538, 11574.378], [], 0, "CAN_COLLIDE"];
	_vehicle_386 = _this;
	_this setPos [3609.8538, 11574.378];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
