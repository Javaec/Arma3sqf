activateAddons [
];

if !(isNull findDisplay 128) then {[] call (uinamespace getvariable 'bis_fnc_recompile');};
_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["B_Boat_Armed_01_minigun_F", [4268.9609, 2484.5928, -0.90498853], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -170.78059;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_04_Speedboat";
	BIS_POI_AbandonedBattlefield_04_Speedboat = _this;
	_this setPos [4268.9609, 2484.5928, -0.90498853];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [0,0,1]; this setVehicleAmmo 0.124; this lockDriver true"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_dirt_F", [4306.2632, 2658.0376, -0.10716806], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -34.319832;
	_this setPos [4306.2632, 2658.0376, -0.10716806];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_F", [4267.3511, 2662.6099, -1.6212463e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir -52.371548;
	_this setPos [4267.3511, 2662.6099, -1.6212463e-005];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Gloves_F", [4267.7607, 2662.582, 0.00010156631], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [4267.7607, 2662.582, 0.00010156631];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Saw_F", [4267.5459, 2662.2271, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -46.428635;
	_this setPos [4267.5459, 2662.2271, -3.8146973e-005];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [4266.8174, 2656.6335, 3.9339066e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -160.14822;
	_this setPos [4266.8174, 2656.6335, 3.9339066e-005];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [4266.5796, 2660.2676, -7.8678131e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setPos [4266.5796, 2660.2676, -7.8678131e-006];
};

_this = createCenter resistance;
_center_1 = _this;

_group_2 = createGroup _center_1;

_unit_2 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_TL_F", [4276.3965, 2661.4871], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [4276.3965, 2661.4871];
	_this setDir -98.639587;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.566369;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_grpAAF_coast_01 =group this; {_x unlinkItem ""NVGoggles_indep""} forEach (units group this); {_x removePrimaryWeaponItem ""acc_pointer_ir""} forEach (units group this); this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up"""]];
};

_group_3 = createGroup _center_1;

_unit_4 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_AR_F", [4262.5762, 2704.3093, 6.9291331e-005], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [4262.5762, 2704.3093, 6.9291331e-005];
	_this setDir 51.829475;
	_this setUnitAbility 0.53904361;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_grpAAF_coast_02 = group this; {_x unlinkItem ""NVGoggles_indep""} forEach (units group this); {_x removePrimaryWeaponItem ""acc_pointer_ir""} forEach (units group this); this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up"""]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_GL_F", [4254.6724, 2729.0044], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [4254.6724, 2729.0044];
	_this setDir -42.158054;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.53063589;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Up""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [4303.6113, 2653.1367, 0.060624354], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [4303.6113, 2653.1367, 0.060624354];
	_this setDir 148.39467;
	_this setUnitAbility 0.53273797;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this setUnitPos ""Up""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [4274.7129, 2661.804], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [4274.7129, 2661.804];
	_this setDir 87.018211;
	_this setUnitAbility 0.51802433;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Middle""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_lite_F", [4276.8848, 2656.7192], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [4276.8848, 2656.7192];
	_this setDir -195.15729;
	_this setUnitAbility 0.53273779;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setPosATL [4284.23,2631.19,3.0019]; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; removeAllWeapons this; removeHeadgear this; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_F""; {this addMagazine ""SmokeShell""} forEach [0,1]; this addHeadgear ""H_Booniehat_dgtl""; this setUnitPos ""Middle"""]];
};

_group_4 = createGroup _center_1;

_unit_9 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_SL_F", [4280.27, 2700.0525], [], 0, "NONE"];
	_unit_9 = _this;
	_this setPos [4280.27, 2700.0525];
	_this setDir 174.37517;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),13]; this removeMagazines ""HandGrenade""; this removeMagazine ""SmokeShell""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01""}"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_M_F", [4265.5005, 2694.2847, -0.040608063], [], 0, "NONE"];
	_unit_11 = _this;
	_this setPos [4265.5005, 2694.2847, -0.040608063];
	_this setDir 150.43953;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),2]; this removeMagazines ""HandGrenade""; this removeMagazine ""SmokeShell""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_commander_sdv""}; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [4267.5654, 2715.4116], [], 0, "NONE"];
	_unit_12 = _this;
	_this setPos [4267.5654, 2715.4116];
	_this setDir 185.20189;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),15]; this removeMagazines ""HandGrenade""; this removeMagazine ""SmokeShell""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck02""}; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [4268.7988, 2686.2], [], 0, "NONE"];
	_unit_13 = _this;
	_this setPos [4268.7988, 2686.2];
	_this setDir 166.51042;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),1]; this removeMagazines ""HandGrenade""; this removeMagazine ""SmokeShell""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDleft""}; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_this = createCenter west;
_center_2 = _this;

_group_5 = createGroup _center_2;

_unit_16 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["B_Soldier_TL_F", [4287.2896, 2678.5967], [], 0, "NONE"];
	_unit_16 = _this;
	_this setPos [4287.2896, 2678.5967];
	_this setDir -83.852432;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles""; this setAmmo [(primaryWeapon this),2]; this removeItem ""FirstAidKit""; this removeMagazines ""GrenadeMini""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck02""}"]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["B_soldier_AR_F", [4273.2075, 2670.8142], [], 0, "NONE"];
	_unit_19 = _this;
	_this setPos [4273.2075, 2670.8142];
	_this setDir 3.9829769;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles""; this setAmmo [(primaryWeapon this),25]; this removeMagazine ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDright""}; this removePrimaryWeaponItem ""acc_pointer_ir"""]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["B_Soldier_F", [4285.1924, 2649.0371, -0.25483525], [], 0, "NONE"];
	_unit_22 = _this;
	_this setPos [4285.1924, 2649.0371, -0.25483525];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles""; this setAmmo [(primaryWeapon this),17]; this removeMagazines ""HandGrenade""; this removeMagazine ""SmokeShellGreen""; this removeItem ""FirstAidKit""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["B_Soldier_F", [4293.3579, 2659.7087], [], 0, "NONE"];
	_unit_23 = _this;
	_this setPos [4293.3579, 2659.7087];
	_this setDir -26.563135;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles""; this setAmmo [(primaryWeapon this),7]; this removeMagazines ""HandGrenade""; this removeMagazine ""SmokeShell""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck01""}; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_24 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["B_Soldier_F", [4296.6465, 2656.8066], [], 0, "NONE"];
	_unit_24 = _this;
	_this setPos [4296.6465, 2656.8066];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCommander BIS_POI_AbandonedBattlefield_04_Speedboat; this unlinkItem ""NVGoggles""; this setDamage 1"]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["B_Soldier_F", [4297.8389, 2657.2588], [], 0, "NONE"];
	_unit_25 = _this;
	_this setPos [4297.8389, 2657.2588];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo BIS_POI_AbandonedBattlefield_04_Speedboat; this unlinkItem ""NVGoggles""; this setDamage 1"]];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [4284.6777, 2668.8013], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_04_center";
	BIS_POI_AbandonedBattlefield_04_center = _this;
	_this setPos [4284.6777, 2668.8013];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_diver_exp_F", [4204.2383, 2564.6626], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [4204.2383, 2564.6626];
	_this setDir 130.5943;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeBackpack this; this addBackpack ""B_FieldPack_blk""; (unitBackpack this) addMagazineCargo [""DemoCharge_Remote_Mag"",2]; (unitBackpack this) addMagazineCargo [""ClaymoreDirectionalMine_Remote_Mag"",4]; (unitBackpack this) addItemCargo [""MineDetector"",1]; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDright""}; "]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_diver_TL_F", [4208.3672, 2558.6367], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [4208.3672, 2558.6367];
	_this setDir -33.967491;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"_kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck03""}; "]];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4272.4277, 2660.6924, 6.7949295e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setPos [4272.4277, 2660.6924, 6.7949295e-006];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4264.2896, 2723.7407, 6.6757202e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setPos [4264.2896, 2723.7407, 6.6757202e-006];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
