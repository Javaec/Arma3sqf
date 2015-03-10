_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter resistance;
_center_1 = _this;

_this = createCenter east;
_center_2 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_3 = createGroup _center_1;

_group_4 = createGroup _center_2;

_group_5 = createGroup _center_1;

_group_6 = createGroup _center_1;

_group_7 = createGroup _center_1;

_group_8 = createGroup _center_1;

_group_9 = createGroup _center_2;

_group_10 = createGroup _center_2;

_group_11 = createGroup _center_1;

_group_12 = createGroup _center_1;

_group_13 = createGroup _center_1;

_group_17 = createGroup _center_2;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [13580.969, 12196.367], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_MysteriousCache_01_center";
	BIS_POI_MysteriousCache_01_center = _this;
	_this setPos [13580.969, 12196.367];
	_initCodes set [count _initCodes,[_this,"EAST setFriend [RESISTANCE, 1]; RESISTANCE setFriend [EAST, 1]"]];
};

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [12546.776, 12762.093, 4.2469454], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [12546.776, 12762.093, 4.2469454];
	_this setDir 25.631897;
	_this setUnitAbility 0.52000004;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setPosATL [12548.7,12760.7,8.88281]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [12511.41, 12739.166, 0.87804526], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [12511.41, 12739.166, 0.87804526];
	_this setUnitAbility 0.52000004;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_GL_F", [12525.811, 12796.299, 1.9055846], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [12525.811, 12796.299, 1.9055846];
	_this setDir 8.5249968;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.57687867;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this setPosATL [12527.9,12795.3,7.6517]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_diver_TL_F", [12525.66, 12744.723, 2.6453228], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [12525.66, 12744.723, 2.6453228];
	_this setDir -44.845211;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.61681557;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setPosATL [12526.3,12745.4,5.32888]; removeAllWeapons this; this addItem ""FirstAidKit""; this addMagazine ""SmokeShell""; this addMagazine ""SmokeShellGreen""; {this addMagazine ""Chemlight_green""} forEach [0,1,2,3]; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_SDAR_F"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_diver_F", [12522.245, 12747.949, 2.6759968], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [12522.245, 12747.949, 2.6759968];
	_this setDir 126.42431;
	_this setUnitAbility 0.56216508;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this setPosATL [12521.6,12749,6.88491]; removeBackpack this; removeAllWeapons this; this addItem ""FirstAidKit""; this addMagazine ""SmokeShell""; this addMagazine ""SmokeShellGreen""; {this addMagazine ""Chemlight_green""} forEach [0,1,2,3]; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_SDAR_F"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_diver_F", [12524.514, 12748.996, 2.6610212], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [12524.514, 12748.996, 2.6610212];
	_this setDir -197.78296;
	_this setUnitAbility 0.56006312;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""SIT_LOW"",""ASIS""]]; this setPosATL [12523.9,12751.5,7.18586]; removeBackpack this; removeAllWeapons this; this addItem ""FirstAidKit""; this addMagazine ""SmokeShell""; this addMagazine ""SmokeShellGreen""; {this addMagazine ""Chemlight_green""} forEach [0,1,2,3]; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_SDAR_F"""]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["O_MRAP_02_F", [12497.402, 12742.775, 0.28686935], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -61.925682;
	_this setPos [12497.402, 12742.775, 0.28686935];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.735; this lock true"]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["O_SDV_01_F", [12514.821, 12753.652, -1.1006248], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir -35.023022;
	_this setPos [12514.821, 12753.652, -1.1006248];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.705"]];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["I_Boat_Transport_01_F", [12529.717, 12759.889, -0.34881037], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir -130.29916;
	_this setPos [12529.717, 12759.889, -0.34881037];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.495"]];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [12494.269, 12753.646, 0.12055889], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -78.909355;
	_this setPos [12494.269, 12753.646, 0.12055889];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [0,0,1]"]];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Support_F", [12504.221, 12742.462, 1.1481017], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 49.445396;
	_this setPos [12504.221, 12742.462, 1.1481017];
	_initCodes set [count _initCodes,[_this,"this setPosATL [12514.9,12738.1,1.36377]; clearMagazineCargo this; clearItemCargo this; clearWeaponCargo this; this addItemCargo [""V_rebreatherIA"",4]; this addMagazineCargo [""20Rnd_556x45_UW_mag"",20]; this addWeaponCargo [""arifle_sdar_F"",2]"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_soldier_F", [14011.258, 12972.445, 4.3270173], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [14011.258, 12972.445, 4.3270173];
	_this setDir -44.067699;
	_this setUnitAbility 0.55796123;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_GL_F", [14010.219, 12979.313], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [14010.219, 12979.313];
	_this setDir -84.449112;
	_this setUnitAbility 0.53483987;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningMilitaryArea_F", [14007.089, 12977.163, 1.2397766e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir 102.31873;
	_this setPos [14007.089, 12977.163, 1.2397766e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarGate_F", [14007.61, 12980.133, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 92.363281;
	_this setPos [14007.61, 12980.133, 1.1444092e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [14012.72, 12976.238], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setPos [14012.72, 12976.238];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_soldier_F", [14212.418, 12975.108], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [14212.418, 12975.108];
	_this setUnitAbility 0.54955345;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_MysteriousCache_01_groupBlue = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_Soldier_AR_F", [14215.568, 12973.409], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [14215.568, 12973.409];
	_this setUnitAbility 0.53694177;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [14209.428, 12976.972], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setPos [14209.428, 12976.972];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [14209.832, 12976.999], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [14209.832, 12976.999];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [14122.171, 12975.658], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [14122.171, 12975.658];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [14015.682, 12982.513, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setPos [14015.682, 12982.513, 0];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["O_Boat_Armed_01_hmg_F", [14272.487, 13122.611, -0.21961826], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir 80.168121;
	_this setPos [14272.487, 13122.611, -0.21961826];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.535"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["I_Boat_Armed_01_minigun_F", [14230.203, 13107.75, -1.3614786], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir -5.2038708;
	_this setPos [14230.203, 13107.75, -1.3614786];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.625"]];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["O_MRAP_02_F", [14264.972, 13022.677, 0.29584715], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -78.801941;
	_this setPos [14264.972, 13022.677, 0.29584715];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.735; this lock true"]];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_covered_F", [14244.047, 13014.838, 0.43517399], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 101.70454;
	_this setPos [14244.047, 13014.838, 0.43517399];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this setFuel 0.685"]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_Soldier_lite_F", [14272.99, 13104.313, 1.2757407], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [14272.99, 13104.313, 1.2757407];
	_this setDir 116.60359;
	_this setUnitAbility 0.54745156;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setPosATL [14272.4,13105.2,6.67911]; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["O_Soldier_AR_F", [14274.24, 13103.361, 1.2757407], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [14274.24, 13103.361, 1.2757407];
	_this setDir -57.263618;
	_this setUnitAbility 0.56216508;
	if (true) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setPosATL [14274.1,13103.8,6.62963]; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_10 createUnit ["O_Soldier_TL_F", [14253.821, 13012.336], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [14253.821, 13012.336];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.52000004;
	if (true) then {_group_10 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_MysteriousCache_01_groupCyan = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited"""]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_10 createUnit ["O_Soldier_F", [14251.959, 13009.824], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [14251.959, 13009.824];
	_this setUnitAbility 0.54955345;
	if (false) then {_group_10 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_10 createUnit ["O_Soldier_F", [14255.865, 13009.723], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [14255.865, 13009.723];
	_this setUnitAbility 0.52222818;
	if (false) then {_group_10 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14253.567, 13014.764], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setPos [14253.567, 13014.764];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14253.948, 13014.706], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setPos [14253.948, 13014.706];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14280.313, 13016.142], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setPos [14280.313, 13016.142];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14311.257, 13014.666], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setPos [14311.257, 13014.666];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14319.324, 13035.095], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [14319.324, 13035.095];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14293.428, 13053.275], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [14293.428, 13053.275];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14265.559, 13051.33], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [14265.559, 13051.33];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [14252.445, 13035.881], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [14252.445, 13035.881];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["I_officer_F", [14339.113, 13046.873, 0.79925513], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [14339.113, 13046.873, 0.79925513];
	_this setDir -201.17683;
	_this setUnitRank "LIEUTENANT";
	_this setUnitAbility 0.65675259;
	if (true) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; removeAllWeapons this; this addItem ""FirstAidKit""; this addMagazine ""SmokeShellGreen""; this addMagazine ""SmokeShellBlue""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""hgun_PDW2000_F"""]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_12 createUnit ["I_Soldier_repair_F", [14340.146, 13043.596, 0.74555755], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [14340.146, 13043.596, 0.74555755];
	_this setDir -23.833691;
	_this setUnitAbility 0.55375731;
	if (true) then {_group_12 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; clearMagazineCargo (unitBackpack this)"]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_13 createUnit ["I_Soldier_lite_F", [14340.633, 13046.845, 3.137239], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [14340.633, 13046.845, 3.137239];
	_this setDir 56.785892;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_13 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [14285.854, 13030.549, -1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir 91.810806;
	_this setPos [14285.854, 13030.549, -1.7166138e-005];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [14274.822, 13030.54, -2.9087067e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -92.276276;
	_this setPos [14274.822, 13030.54, -2.9087067e-005];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [14317.438, 13059.577, 0.014351146], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir 91.756706;
	_this setPos [14317.438, 13059.577, 0.014351146];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [14269.971, 13063.87, 8.1062317e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir 178.38129;
	_this setPos [14269.971, 13063.87, 8.1062317e-006];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["MapBoard_altis_F", [14338.396, 13048.848, 0.71927303], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir -35.896896;
	_this setPos [14338.396, 13048.848, 0.71927303];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14339.286, 13046.075, 0.72704464], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir -181.72058;
	_this setPos [14339.286, 13046.075, 0.72704464];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0,0,-0.12]]];"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [14339.201, 13044.659, 0.81769687], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -178.81987;
	_this setPos [14339.201, 13044.659, 0.81769687];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [14340.085, 13045.091, 0.6817432], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -199.28452;
	_this setPos [14340.085, 13045.091, 0.6817432];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14342.378, 13048.485, 0.62090814], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir -99.218491;
	_this setPos [14342.378, 13048.485, 0.62090814];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [14341.41, 13048.371, 0.7054677], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir -91.132111;
	_this setPos [14341.41, 13048.371, 0.7054677];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [14341.894, 13047.686, 0.72946584], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir -103.89529;
	_this setPos [14341.894, 13047.686, 0.72946584];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [14259.021, 13011.355], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setPos [14259.021, 13011.355];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [14316.313, 13017.736, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setPos [14316.313, 13017.736, 0];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [14313.397, 13049.098, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setPos [14313.397, 13049.098, 0];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [14257.237, 13047.092, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setPos [14257.237, 13047.092, 0];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Flag_AAF_F", [14329.975, 13039.493, 5.4836273e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setPos [14329.975, 13039.493, 5.4836273e-006];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [14336.123, 13041.163, 0.67210537], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir -98.377754;
	_this setPos [14336.123, 13041.163, 0.67210537];
	_initCodes set [count _initCodes,[_this,"[4.07718,""asl""] call BIS_fnc_setHeight; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addMagazineCargo [""30Rnd_556x45_Stanag"",30]; this addMagazineCargo [""200Rnd_65x39_cased_Box"",5]; this addMagazineCargo [""1Rnd_HE_Grenade_shell"",12]; this addMagazineCargo [""HandGrenade"",10]; this addItemCargo [""FirstAidKit"",10]"]];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_WpsLaunch_F", [13582.798, 12196.487, 4.3725882], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setDir 93.651978;
	_this setVehicleVarName "BIS_POI_MysteriousCache_01_BoxLaunchers";
	BIS_POI_MysteriousCache_01_BoxLaunchers = _this;
	_this setPos [13582.798, 12196.487, 4.3725882];
	_initCodes set [count _initCodes,[_this,"clearMagazineCargo this; clearWeaponCargo this; this addWeaponCargo [""launch_I_Titan_F"",2]; this addMagazineCargo [""Titan_AA"",8]"]];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["I_supplyCrate_F", [13581.332, 12194.346, 3.3941026], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 2.6348226;
	_this setVehicleVarName "BIS_POI_MysteriousCache_01_BoxSupply";
	BIS_POI_MysteriousCache_01_BoxSupply = _this;
	_this setPos [13581.332, 12194.346, 3.3941026];
	_initCodes set [count _initCodes,[_this,"[18.8361,""asl""] call BIS_fnc_setHeight; this allowDamage false; clearBackpackCargo this; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; this addItemCargo [""V_RebreatherB"",2]; this addItemCargo [""muzzle_snds_M"",4]; this addItemCargo [""muzzle_snds_H_MG"",2]; this addItemCargo [""muzzle_snds_B"",2]; this addItemCargo [""NVGoggles"",4]; this addItemCargo [""Rangefinder"",2]; this addItemCargo [""ItemGPS"",2]; this addItemCargo [""optic_TWS"",2]; this addItemCargo [""optic_Nightstalker"",2]; this addItemCargo [""MineDetector"",2]; this addBackpackCargo [""B_Carryall_oli"",2]"]];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [13580.262, 12200.631], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir 21.348396;
	_this setPos [13580.262, 12200.631];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSMine""]; this setPos [(getPos this select 0), (getPos this select 1), 0.42]"]];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_Pink_F", [13583.033, 12192.474], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setDir -68.586075;
	_this setPos [13583.033, 12192.474];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_mine"",""APERSTripMine""]; this setPos [(getPos this select 0), (getPos this select 1), -0.1]"]];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [13582.865, 12196.424, 3.2272847], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setDir 22.525732;
	_this setPos [13582.865, 12196.424, 3.2272847];
	_initCodes set [count _initCodes,[_this,"[18.8361,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [13579.446, 12194.59, 3.4295838], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir -64.730171;
	_this setPos [13579.446, 12194.59, 3.4295838];
	_initCodes set [count _initCodes,[_this,"[18.8361,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_94 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [13583.197, 12195.74, 0.32924598], [], 0, "CAN_COLLIDE"];
	_vehicle_94 = _this;
	_this setDir -66.360245;
	_this setPos [13583.197, 12195.74, 0.32924598];
	_initCodes set [count _initCodes,[_this,"[15.967,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.1,0,0]]];"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [13582.732, 12195.906, 0.34494293], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -66.18261;
	_this setPos [13582.732, 12195.906, 0.34494293];
	_initCodes set [count _initCodes,[_this,"[15.967,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_WpsSpecial_F", [13580.387, 12198.624, 3.2529514], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setDir 46.783985;
	_this setVehicleVarName "BIS_POI_MysteriousCache_01_BoxSpec";
	BIS_POI_MysteriousCache_01_BoxSpec = _this;
	_this setPos [13580.387, 12198.624, 3.2529514];
	_initCodes set [count _initCodes,[_this,"[18.8361,""asl""] call BIS_fnc_setHeight; clearItemCargo this; clearMagazineCargo this; clearWeaponCargo this; this addWeaponCargo [""srifle_EBR_DMS_F"",2]; this addWeaponCargo [""srifle_GM6_LRPS_F"",2]; this addMagazineCargo [""20Rnd_762x51_Mag"",36]; this addMagazineCargo [""5Rnd_127x108_Mag"",24]; this addMagazineCargo [""20Rnd_556x45_UW_mag"",40]; this addWeaponCargo [""arifle_sdar_F"",2]"]];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13575.209, 12196.744, 3.6594667], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setDir -247.71983;
	_this setPos [13575.209, 12196.744, 3.6594667];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_F", [13574.677, 12191.696, 0.087773241], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setDir -58.081554;
	_this setPos [13574.677, 12191.696, 0.087773241];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [13573.944, 12190.364, 8.2969666e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setDir -62.437511;
	_this setPos [13573.944, 12190.364, 8.2969666e-005];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_F", [13573.182, 12188.677, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setDir -71.803986;
	_this setPos [13573.182, 12188.677, 2.0980835e-005];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [13413.165, 11894.743, -7.2479248e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_107 = _this;
	_this setPos [13413.165, 11894.743, -7.2479248e-005];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [13417.116, 11893.801, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir 35.72702;
	_this setPos [13417.116, 11893.801, -4.7683716e-005];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkull_F", [13414.777, 11894.224, 7.5340271e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_109 = _this;
	_this setPos [13414.777, 11894.224, 7.5340271e-005];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_17 createUnit ["O_Soldier_GL_F", [13341.634, 13288.724], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [13341.634, 13288.724];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.57267487;
	if (true) then {_group_17 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_MysteriousCache_01_groupGreen = group this; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeYellow_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_17 createUnit ["O_Soldier_F", [13336.465, 13281.837], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [13336.465, 13281.837];
	_this setUnitAbility 0.55585933;
	if (false) then {_group_17 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_17 createUnit ["O_Soldier_lite_F", [13347.739, 13283.182, 0], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [13347.739, 13283.182, 0];
	_this setUnitAbility 0.54745156;
	if (false) then {_group_17 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addHeadgear ""H_Bandanna_cbr""; this unlinkItem ""NVGoggles_opfor""; this removeItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13338.36, 13290.229, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_113 = _this;
	_this setPos [13338.36, 13290.229, 0];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13338.658, 13290.657, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_115 = _this;
	_this setPos [13338.658, 13290.657, 0];
};

_vehicle_117 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13149.474, 13361.603], [], 0, "CAN_COLLIDE"];
	_vehicle_117 = _this;
	_this setPos [13149.474, 13361.603];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12817.823, 13438.731, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setPos [12817.823, 13438.731, 0];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12546.714, 13219.296, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setPos [12546.714, 13219.296, 0];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12179.888, 13194.172, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setPos [12179.888, 13194.172, 0];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12014.759, 13015.865], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setPos [12014.759, 13015.865];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [11814.527, 12733.481], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setPos [11814.527, 12733.481];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [11735.024, 12466.559], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setPos [11735.024, 12466.559];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [11954.165, 12375.451, -2.3841858e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setPos [11954.165, 12375.451, -2.3841858e-007];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12465.071, 12745.466], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setPos [12465.071, 12745.466];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12452.214, 12918.283], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setPos [12452.214, 12918.283];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12523.758, 12995.821, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setPos [12523.758, 12995.821, 0];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12633.142, 13062.431, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setPos [12633.142, 13062.431, 0];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12701.856, 13104.501, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setPos [12701.856, 13104.501, 0];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12792.308, 13131.848, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setPos [12792.308, 13131.848, 0];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12839.285, 13206.173, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setPos [12839.285, 13206.173, 0];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12913.611, 13242.631, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setPos [12913.611, 13242.631, 0];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13007.341, 13234.636], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setPos [13007.341, 13234.636];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13087.968, 13237.28], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setPos [13087.968, 13237.28];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13160.422, 13243.332, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setPos [13160.422, 13243.332, 0];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13238.252, 13244.736, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setPos [13238.252, 13244.736, 0];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [13304.162, 13258.058, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setPos [13304.162, 13258.058, 0];
};

_vehicle_199 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [13363.322, 13399.049, 1.4305115e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_199 = _this;
	_this setPos [13363.322, 13399.049, 1.4305115e-005];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [13359.252, 13391.646, 0.63854665], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setDir 160.08682;
	_this setPos [13359.252, 13391.646, 0.63854665];
	_initCodes set [count _initCodes,[_this,"[7.67179,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [13353.254, 13388.585, 0.44804221], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setDir 61.253632;
	_this setPos [13353.254, 13388.585, 0.44804221];
	_initCodes set [count _initCodes,[_this,"[7.67179,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_202 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [13352.639, 13386.351, 0.27816191], [], 0, "CAN_COLLIDE"];
	_vehicle_202 = _this;
	_this setDir -29.02331;
	_this setPos [13352.639, 13386.351, 0.27816191];
	_initCodes set [count _initCodes,[_this,"[7.67179,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [13353.901, 13387.266, 0.59127134], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setDir 143.6656;
	_this setPos [13353.901, 13387.266, 0.59127134];
	_initCodes set [count _initCodes,[_this,"[7.67179,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_204 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [13038.882, 13251.694, 4.0156507], [], 0, "CAN_COLLIDE"];
	_vehicle_204 = _this;
	_this setPos [13038.882, 13251.694, 4.0156507];
};

_vehicle_206 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [13046.7, 13255.8, 0.00025224686], [], 0, "CAN_COLLIDE"];
	_vehicle_206 = _this;
	_this setDir 14.766599;
	_this setPos [13046.7, 13255.8, 0.00025224686];
};

_vehicle_207 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [13039.163, 13255.28, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_207 = _this;
	_this setDir 13.3935;
	_this setPos [13039.163, 13255.28, -4.196167e-005];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [13047.78, 13257.583, -4.4822693e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setDir 91.597458;
	_this setPos [13047.78, 13257.583, -4.4822693e-005];
};

_vehicle_209 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [13030.168, 13257.248, 0.15434445], [], 0, "CAN_COLLIDE"];
	_vehicle_209 = _this;
	_this setDir 14.025416;
	_this setPos [13030.168, 13257.248, 0.15434445];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.525; this setHit [""karoserie"",0.60]; clearItemCargo this"]];
};

_vehicle_211 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [13049.166, 13255.776, -0.00024366379], [], 0, "CAN_COLLIDE"];
	_vehicle_211 = _this;
	_this setDir -10.099714;
	_this setPos [13049.166, 13255.776, -0.00024366379];
};

_vehicle_212 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [13074.735, 13204.524, -0.00015354156], [], 0, "CAN_COLLIDE"];
	_vehicle_212 = _this;
	_this setDir -171.91805;
	_this setPos [13074.735, 13204.524, -0.00015354156];
};

_vehicle_213 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [13071.277, 13204.283, -0.00032162666], [], 0, "CAN_COLLIDE"];
	_vehicle_213 = _this;
	_this setDir -188.0535;
	_this setPos [13071.277, 13204.283, -0.00032162666];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [13073.08, 13204.078, -0.00023937225], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setPos [13073.08, 13204.078, -0.00023937225];
};

_vehicle_215 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [13086.904, 13195.767, 0.12040769], [], 0, "CAN_COLLIDE"];
	_vehicle_215 = _this;
	_this setDir -60.330273;
	_this setPos [13086.904, 13195.767, 0.12040769];
};

_vehicle_216 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkull_F", [13085.963, 13196.241, 0.00012516975], [], 0, "CAN_COLLIDE"];
	_vehicle_216 = _this;
	_this setDir 14.28322;
	_this setPos [13085.963, 13196.241, 0.00012516975];
};

_vehicle_217 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [12779.355, 13145.791, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_217 = _this;
	_this setDir -125.8347;
	_this setPos [12779.355, 13145.791, -7.6293945e-006];
};

_vehicle_218 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [12780.553, 13144.897], [], 0, "CAN_COLLIDE"];
	_vehicle_218 = _this;
	_this setDir -175.74054;
	_this setPos [12780.553, 13144.897];
};

_vehicle_219 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [12783.569, 13144.584, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_219 = _this;
	_this setDir 139.65063;
	_this setPos [12783.569, 13144.584, 5.7220459e-006];
};

_vehicle_221 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FirePlace_F", [12780.93, 13146.717, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_221 = _this;
	_this setPos [12780.93, 13146.717, -2.6702881e-005];
};

_vehicle_222 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [12778.922, 13146.645, 9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_222 = _this;
	_this setDir 10.141912;
	_this setPos [12778.922, 13146.645, 9.5367432e-007];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Money_F", [12764.629, 13158.093, 7.7095327], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setPos [12764.629, 13158.093, 7.7095327];
};

_vehicle_225 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [12765.235, 13157.18, 7.4290209], [], 0, "CAN_COLLIDE"];
	_vehicle_225 = _this;
	_this setDir -94.766708;
	_this setPos [12765.235, 13157.18, 7.4290209];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [12560.593, 13014.31, -5.8174133e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setDir 70.691719;
	_this setPos [12560.593, 13014.31, -5.8174133e-005];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [12560.549, 13030.279, 0.31505138], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setDir 91.071602;
	_this setPos [12560.549, 13030.279, 0.31505138];
};

_vehicle_229 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [12573.063, 13022.368, 5.7542458], [], 0, "CAN_COLLIDE"];
	_vehicle_229 = _this;
	_this setDir -34.59071;
	_this setPos [12573.063, 13022.368, 5.7542458];
};

_vehicle_230 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [12257.272, 12534.853, 0.16154853], [], 0, "CAN_COLLIDE"];
	_vehicle_230 = _this;
	_this setDir 130.91714;
	_this setPos [12257.272, 12534.853, 0.16154853];
	_initCodes set [count _initCodes,[_this,"[13.4201,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_232 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [12253.414, 12527.053, 0.47654966], [], 0, "CAN_COLLIDE"];
	_vehicle_232 = _this;
	_this setDir 45.927261;
	_this setPos [12253.414, 12527.053, 0.47654966];
	_initCodes set [count _initCodes,[_this,"[13.4201,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_233 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [12252.68, 12530.269, 0.34946769], [], 0, "CAN_COLLIDE"];
	_vehicle_233 = _this;
	_this setDir -48.597836;
	_this setPos [12252.68, 12530.269, 0.34946769];
	_initCodes set [count _initCodes,[_this,"[13.4201,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_234 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [12227.445, 12501.199, -0.0001001358], [], 0, "CAN_COLLIDE"];
	_vehicle_234 = _this;
	_this setPos [12227.445, 12501.199, -0.0001001358];
};

_vehicle_235 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [12250.758, 12523.231, -7.9154968e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_235 = _this;
	_this setDir 23.120438;
	_this setPos [12250.758, 12523.231, -7.9154968e-005];
};

_vehicle_236 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [12024.375, 12334.939, 0.42532477], [], 0, "CAN_COLLIDE"];
	_vehicle_236 = _this;
	_this setDir 124.065;
	_this setPos [12024.375, 12334.939, 0.42532477];
	_initCodes set [count _initCodes,[_this,"[11.6652,""asl""] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.1,-0.25,0]]];"]];
};

_vehicle_239 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [12025.173, 12334.288, 0.37686634], [], 0, "CAN_COLLIDE"];
	_vehicle_239 = _this;
	_this setDir 125.02328;
	_this setPos [12025.173, 12334.288, 0.37686634];
	_initCodes set [count _initCodes,[_this,"[11.6652,""asl""] call BIS_fnc_setHeight; "]];
};

_vehicle_240 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [12026.961, 12330.464, 0.36992431], [], 0, "CAN_COLLIDE"];
	_vehicle_240 = _this;
	_this setDir 37.3526;
	_this setPos [12026.961, 12330.464, 0.36992431];
	_initCodes set [count _initCodes,[_this,"[11.6652,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_241 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [12022.221, 12328.519, 0.2139294], [], 0, "CAN_COLLIDE"];
	_vehicle_241 = _this;
	_this setDir -28.506556;
	_this setPos [12022.221, 12328.519, 0.2139294];
	_initCodes set [count _initCodes,[_this,"[11.6652,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_242 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [12031.829, 12326.842, 7.4386597e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_242 = _this;
	_this setPos [12031.829, 12326.842, 7.4386597e-005];
};

_vehicle_284 = objNull;
if (true) then
{
	_this = createVehicle ["Land_UWreck_FishingBoat_F", [12181.883, 12268.98, -1.799805], [], 0, "CAN_COLLIDE"];
	_vehicle_284 = _this;
	_this setDir -58.593674;
	_this setPos [12181.883, 12268.98, -1.799805];
};

_vehicle_285 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [13859.236, 13434.687, -0.0001502037], [], 0, "CAN_COLLIDE"];
	_vehicle_285 = _this;
	_this setPos [13859.236, 13434.687, -0.0001502037];
};

_vehicle_286 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BuoyBig_F", [13813.026, 13429.722, -0.44166914], [], 0, "CAN_COLLIDE"];
	_vehicle_286 = _this;
	_this setPos [13813.026, 13429.722, -0.44166914];
};

_vehicle_287 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [13852.571, 13418.688, 3.5762787e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_287 = _this;
	_this setPos [13852.571, 13418.688, 3.5762787e-005];
};

_vehicle_290 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [13858.228, 13426.618, -0.00021505356], [], 0, "CAN_COLLIDE"];
	_vehicle_290 = _this;
	_this setPos [13858.228, 13426.618, -0.00021505356];
};

_vehicle_291 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FishingGear_02_F", [13860.709, 13412.176, -0.13506053], [], 0, "CAN_COLLIDE"];
	_vehicle_291 = _this;
	_this setPos [13860.709, 13412.176, -0.13506053];
};

_vehicle_292 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [13848.862, 13411.851, -4.8398972e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_292 = _this;
	_this setPos [13848.862, 13411.851, -4.8398972e-005];
};

_vehicle_293 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [13847.78, 13412.337, 0.00014162064], [], 0, "CAN_COLLIDE"];
	_vehicle_293 = _this;
	_this setDir -165.91447;
	_this setPos [13847.78, 13412.337, 0.00014162064];
};

_vehicle_294 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [13850.253, 13411.165, -0.00020170212], [], 0, "CAN_COLLIDE"];
	_vehicle_294 = _this;
	_this setDir -146.0636;
	_this setPos [13850.253, 13411.165, -0.00020170212];
};

_vehicle_295 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Plane_Transport_01_F", [14191.159, 13504.766, -3.4753895], [], 0, "CAN_COLLIDE"];
	_vehicle_295 = _this;
	_this setPos [14191.159, 13504.766, -3.4753895];
};

_vehicle_297 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Green_F", [12266.918, 12499.813, -4.7683716e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_297 = _this;
	_this setPos [12266.918, 12499.813, -4.7683716e-007];
};

_vehicle_299 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [13581.713, 12197.943], [], 0, "CAN_COLLIDE"];
	_vehicle_299 = _this;
	_this setPos [13581.713, 12197.943];
	_initCodes set [count _initCodes,[_this," this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_301 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [12256.444, 12533.017], [], 0, "CAN_COLLIDE"];
	_vehicle_301 = _this;
	_this setPos [12256.444, 12533.017];
	_initCodes set [count _initCodes,[_this," this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_305 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [14342.871, 13049.552, 2.3841858e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_305 = _this;
	_this setPos [14342.871, 13049.552, 2.3841858e-007];
	_initCodes set [count _initCodes,[_this," this setVariable [""BIS_HubSection"",""Office""];"]];
};

_vehicle_306 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [12025.153, 12333.033], [], 0, "CAN_COLLIDE"];
	_vehicle_306 = _this;
	_this setPos [12025.153, 12333.033];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_308 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [12254.312, 12529.102, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_308 = _this;
	_this setPos [12254.312, 12529.102, 0];
	_initCodes set [count _initCodes,[_this," this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_311 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [13357.32, 13389.491], [], 0, "CAN_COLLIDE"];
	_vehicle_311 = _this;
	_this setPos [13357.32, 13389.491];
	_initCodes set [count _initCodes,[_this," this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_314 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [14339.371, 13043.725], [], 0, "CAN_COLLIDE"];
	_vehicle_314 = _this;
	_this setPos [14339.371, 13043.725];
	_initCodes set [count _initCodes,[_this," this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
