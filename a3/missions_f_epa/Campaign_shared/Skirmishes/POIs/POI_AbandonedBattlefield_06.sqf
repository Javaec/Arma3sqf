activateAddons [
];

if !(isNull findDisplay 128) then {[] call (uinamespace getvariable 'bis_fnc_recompile');};
_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [4362.4141, 3805.541], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_06_center";
	BIS_POI_AbandonedBattlefield_06_center = _this;
	_this setPos [4362.4141, 3805.541];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_F", [4357.9482, 3808.3582, 0.12342142], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 178.5808;
	_this setPos [4357.9482, 3808.3582, 0.12342142];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; clearWeaponCargo this; clearMagazineCargo this; this lock true; this setDamage 0.75; {this setHit [_x,1]} forEach [""wheel_1_1_steering"",""wheel_2_1_steering""]"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_transport_F", [4379.7344, 3748.3582, 0.2393074], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setPos [4379.7344, 3748.3582, 0.2393074];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; clearWeaponCargo this; clearMagazineCargo this; this lock true; this setDamage 0.75; {this setHit [_x,0.75]} forEach [""glass1"",""glass2""]; {this setHit [_x,1]} forEach [""wheel_1_1_steering"",""wheel_1_2_steering"",""wheel_1_3_steering""]"]];
};

_this = createCenter resistance;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_SL_F", [4361.2412, 3802.8438], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [4361.2412, 3802.8438];
	_this setDir 200.09616;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),1]; removeHeadgear this; this addHeadgear ""H_milcap_dgtl""; {_x removePrimaryWeaponItem ""acc_pointer_ir""} forEach (units group this); _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01""}"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_TL_F", [4343.7266, 3772.6111], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [4343.7266, 3772.6111];
	_this setDir 27.315447;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"_kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_medic_F", [4372.4751, 3796.0754], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [4372.4751, 3796.0754];
	_this setDir -110.03838;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; removeHeadgear this; this addGoggles ""G_lowprofile""; this setAmmo [(primaryWeapon this),2]; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDleft""}"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [4326.0054, 3806.4092], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [4326.0054, 3806.4092];
	_this setDir 84.081871;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeHeadgear this; removeVest this; removeGoggles this; this unlinkItem ""NVGoggles_indep""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck02""; _this attachTo [BIS_POI_AbandonedBattlefield_06_Stretcher_01,[0,0.15,0.20]]}; "]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [4363.1108, 3757.8547], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [4363.1108, 3757.8547];
	_this setDir -136.47862;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),164]; this removeItem ""FirstAidKit""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_GL_F", [4359.4219, 3810.2729], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [4359.4219, 3810.2729];
	_this setDir 92.316162;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),4]; this removeMagazines ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_commander_sdv""}"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_LAT_F", [4353.4365, 3757.1018], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [4353.4365, 3757.1018];
	_this setDir -269.15564;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),11]; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDright""}"]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [4325.9233, 3808.0562], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [4325.9233, 3808.0562];
	_this setDir -289.23215;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; removeGoggles this; removeVest this; this setAmmo [(primaryWeapon this),21]; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""; _this attachTo [BIS_POI_AbandonedBattlefield_06_Stretcher_02,[0,-0.2,0.20]]}"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [4389.9053, 3793.7375], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [4389.9053, 3793.7375];
	_this setDir 69.346504;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),24]; this removeMagazines ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""  ""}"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [4363.6279, 3686.8132], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [4363.6279, 3686.8132];
	_this setDir -133.82341;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"_kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDleft""}"]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_GL_F", [4375.5596, 3731.8015], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [4375.5596, 3731.8015];
	_this setDir -63.471119;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; removeHeadgear this; this setAmmo [(primaryWeapon this),6]; this removeMagazine ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDright""}"]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_gmg_F", [4333.9517, 3782.9082, 0.10723109], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir -113.08722;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_06_Strider";
	BIS_POI_AbandonedBattlefield_06_Strider = _this;
	_this setPos [4333.9517, 3782.9082, 0.10723109];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; clearWeaponCargo this; clearMagazineCargo this; this lockDriver true; "]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Loudspeakers_F", [4388.2798, 3779.9949, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [4388.2798, 3779.9949, 4.5776367e-005];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [4368.1729, 3693.3384], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [4368.1729, 3693.3384];
	_this setDir 90.164482;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"_kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}"]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [4358.9487, 3864.8035], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [4358.9487, 3864.8035];
	_this setDir -169.88326;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this setAmmo [(primaryWeapon this),24]; this removeMagazine ""HandGrenade""; this removeItem ""FirstAidKit""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDright""}"]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [4378.1304, 3755.5881], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [4378.1304, 3755.5881];
	_this setDir -63.358063;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),7]; this removeMagazine ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDdown""}"]];
};

_this = createCenter west;
_center_2 = _this;

_group_2 = createGroup _center_2;

_unit_17 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [4374.3662, 3768.3037], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [4374.3662, 3768.3037];
	_this setDir 37.393818;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setCaptive true} forEach (units group this); {_x unlinkItem ""NVGoggles""} forEach (units group this); {_x removePrimaryWeaponItem ""acc_pointer_ir""} forEach (units group this);  this setAmmo [(primaryWeapon this),4]; this removeMagazine ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPpneMstpSrasWrflDdown""}"]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_soldier_AR_F", [4376.0415, 3736.2485], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [4376.0415, 3736.2485];
	_this setDir -11.727176;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),57]; this removeMagazines ""HandGrenade""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01""}"]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_GL_F", [4351.8755, 3716.2239], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [4351.8755, 3716.2239];
	_this setDir 70.951118;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),7]; this removeMagazines ""HandGrenade""; this removeItem ""FirstAidKit""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPercMstpSrasWrflDleft""}"]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [4352.5664, 3795.4304], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [4352.5664, 3795.4304];
	_this setDir 79.585007;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),15]; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01"";}"]];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [4369.9653, 3760.0698], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [4369.9653, 3760.0698];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), +1]"]];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [4358.062, 3807.7974], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setPos [4358.062, 3807.7974];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), +1]"]];
};

_group_3 = createGroup _center_1;

_unit_22 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [4335.1934, 3781.5576], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [4335.1934, 3781.5576];
	_this setDir 216.54005;
	_this setUnitAbility 0.54324758;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x unlinkItem ""NVGoggles_indep""} forEach (units group this); {_x removePrimaryWeaponItem ""acc_pointer_ir""} forEach (units group this); this moveInGunner BIS_POI_AbandonedBattlefield_06_Strider; this doWatch BIS_Tire"]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [4329.5166, 3785.4849], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [4329.5166, 3785.4849];
	_this setDir -142.14217;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.57477677;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]];"]];
};

_group_5 = createGroup _center_1;

_unit_27 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_Soldier_M_F", [4350.4424, 3822.2957], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [4350.4424, 3822.2957];
	_this setDir 82.826576;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this addPrimaryWeaponItem ""optic_dms""; this removePrimaryWeaponItem ""acc_pointer_ir""; this addHeadgear ""H_beret_blk""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]];"]];
};

_group_6 = createGroup _center_1;

_unit_28 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_AR_F", [4388.1436, 3714.0708], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [4388.1436, 3714.0708];
	_this setUnitAbility 0.54324758;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_06_groupBlue = group this; {_x unlinkItem ""NVGoggles_indep""} forEach (units group this); {_x removePrimaryWeaponItem ""acc_pointer_ir""} forEach (units group this);  (group this) setSpeedMode ""Limited""; this setUnitPos ""Up"""]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["I_Soldier_GL_F", [4389.0103, 3712.4053], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [4389.0103, 3712.4053];
	_this setUnitAbility 0.51802415;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setUnitPos ""Up"""]];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4387.9937, 3716.3921], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setPos [4387.9937, 3716.3921];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4388.1782, 3716.3613], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setPos [4388.1782, 3716.3613];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4386.5332, 3739.6821], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setPos [4386.5332, 3739.6821];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4380.6504, 3769.4253], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setPos [4380.6504, 3769.4253];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4378.9927, 3802.5083], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setPos [4378.9927, 3802.5083];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4371.4829, 3841.2188], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setPos [4371.4829, 3841.2188];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4316.7544, 3835.2173], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setPos [4316.7544, 3835.2173];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4328.3467, 3791.8774], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setPos [4328.3467, 3791.8774];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4347.8989, 3775.3193], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setPos [4347.8989, 3775.3193];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4347.2314, 3744.2842], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [4347.2314, 3744.2842];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4361.2344, 3715.6294], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setPos [4361.2344, 3715.6294];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [4272.1162, 3696.6152, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setVehicleVarName "BIS_Tire";
	BIS_Tire = _this;
	_this setPos [4272.1162, 3696.6152, 0];
};

_group_7 = createGroup _center_1;

_unit_31 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_officer_F", [4345.2148, 3813.8611, 0.35941085], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [4345.2148, 3813.8611, 0.35941085];
	_this setDir 227.72368;
	_this setUnitRank "LIEUTENANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x unlinkItem ""NVGoggles_indep""} forEach (units group this); this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]];"]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_7 createUnit ["I_medic_F", [4343.6826, 3812.9426, 0.52398908], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [4343.6826, 3812.9426, 0.52398908];
	_this setDir 63.023613;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.60000002;
	if (false) then {_group_7 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; removeBackpack this; this addBackpack ""B_FieldPack_oli""; (unitBackpack this) addItemCargo [""Medikit"",1]; (unitBackpack this) addItemCargo [""FirstAidKit"",3];  "]];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [4360.1084, 3810.9138, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir -9.4786396;
	_this setPos [4360.1084, 3810.9138, 1.5258789e-005];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [4360.0454, 3810.7979, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir -51.657246;
	_this setPos [4360.0454, 3810.7979, -1.5258789e-005];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [4361.9043, 3758.2205, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setPos [4361.9043, 3758.2205, 1.5258789e-005];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4347.1475, 3819.8682, 0.21096583], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir -94.409538;
	_this setPos [4347.1475, 3819.8682, 0.21096583];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4347.292, 3817.9194, 0.22439399], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -94.409538;
	_this setPos [4347.292, 3817.9194, 0.22439399];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4346.5542, 3819.3044, 0.27004299], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -93.452858;
	_this setPos [4346.5542, 3819.3044, 0.27004299];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4346.4814, 3818.3997, 0.27165315], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -93.452858;
	_this setPos [4346.4814, 3818.3997, 0.27165315];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4345.1245, 3819.7119, 0.30932879], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir -41.652691;
	_this setPos [4345.1245, 3819.7119, 0.30932879];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4344.4585, 3816.0229, 0.36739367], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -184.774;
	_this setPos [4344.4585, 3816.0229, 0.36739367];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4344.9614, 3815.2163, 0.40579915], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir -195.12698;
	_this setPos [4344.9614, 3815.2163, 0.40579915];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["MapBoard_stratis_F", [4346.9106, 3814.2546, 0.26266173], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir 81.874306;
	_this setPos [4346.9106, 3814.2546, 0.26266173];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4347.5835, 3810.8738, 0.2925992], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -92.758026;
	_this setPos [4347.5835, 3810.8738, 0.2925992];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4346.6055, 3810.2068, 0.32603148], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir -195.12698;
	_this setPos [4346.6055, 3810.2068, 0.32603148];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4346.96, 3811.2292, 0.39924282], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir -83.012688;
	_this setPos [4346.96, 3811.2292, 0.39924282];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [4344.4609, 3811.1343, 0.48583132], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 178.01645;
	_this setPos [4344.4609, 3811.1343, 0.48583132];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4334.981, 3820.7205, 0.69741756], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setDir -95.25489;
	_this setPos [4334.981, 3820.7205, 0.69741756];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4335.1538, 3818.7749, 0.72700435], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -95.25489;
	_this setPos [4335.1538, 3818.7749, 0.72700435];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4334.3955, 3820.1477, 0.75642329], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir -94.29821;
	_this setPos [4334.3955, 3820.1477, 0.75642329];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4334.334, 3819.2429, 0.76010066], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir -94.29821;
	_this setPos [4334.334, 3819.2429, 0.76010066];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4332.4258, 3819.8062, 0.78741395], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir 15.256909;
	_this setPos [4332.4258, 3819.8062, 0.78741395];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4332.335, 3817.9675, 0.83230537], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir -129.95035;
	_this setPos [4332.335, 3817.9675, 0.83230537];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4335.8687, 3811.4036, 0.90895998], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir -95.033318;
	_this setPos [4335.8687, 3811.4036, 0.90895998];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4335.0493, 3810.8943, 0.97837234], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -105.3863;
	_this setPos [4335.0493, 3810.8943, 0.97837234];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [4335.166, 3812.4099, 0.93200123], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setPos [4335.166, 3812.4099, 0.93200123];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [4334.1636, 3821.3008, 0.72064424], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setPos [4334.1636, 3821.3008, 0.72064424];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [4334.3804, 3823.0383, 0.65293354], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir 170.08818;
	_this setPos [4334.3804, 3823.0383, 0.65293354];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [4333.0767, 3823.0398, 0.71228963], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -151.86768;
	_this setPos [4333.0767, 3823.0398, 0.71228963];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [4332.0044, 3823.8455, 0.77913004], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setDir -112.35516;
	_this setPos [4332.0044, 3823.8455, 0.77913004];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [4339.1035, 3827.8257, 0.26214722], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setDir -5.1247725;
	_this setPos [4339.1035, 3827.8257, 0.26214722];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["I_supplyCrate_F", [4331.3242, 3831.9971, 0.45345604], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setPos [4331.3242, 3831.9971, 0.45345604];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight; this allowDamage false; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; clearBackpackCargo this; this addMagazineCargo [""30Rnd_9x21_Mag"",20];  this addMagazineCargo [""30Rnd_556x45_Stanag"",24];  this addMagazineCargo [""200Rnd_65x39_cased_Box"",8];  this addMagazineCargo [""20Rnd_762x51_Mag"",10];  this addWeaponCargo [""SMG_02_F"",2];  this addMagazineCargo [""NLAW_F"",2];  this addItemCargo [""FirstAidKit"",12];  this addItemCargo [""optic_Aco_smg"",2];"]];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PaperBox_closed_F", [4331.1797, 3827.8708, 0.66588771], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setDir 9.4734602;
	_this setPos [4331.1797, 3827.8708, 0.66588771];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight; this setVectorUp [0,0,1]"]];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PaperBox_closed_F", [4335.1963, 3829.0049, 0.27589142], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setDir -130.43822;
	_this setPos [4335.1963, 3829.0049, 0.27589142];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight; this setVectorUp [0,0,1]"]];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PaperBox_closed_F", [4335.0093, 3832.3677, 0.39837694], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setDir -10.912698;
	_this setPos [4335.0093, 3832.3677, 0.39837694];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight; this setVectorUp [0,0,1]"]];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [4330.8545, 3826.0024, 0.82495284], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir 76.032036;
	_this setPos [4330.8545, 3826.0024, 0.82495284];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PaperBox_closed_F", [4333.2959, 3829.9932, 0.36810964], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setDir -196.70499;
	_this setPos [4333.2959, 3829.9932, 0.36810964];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight; this setVectorUp [0,0,1]"]];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4333.855, 3826.3022], [], 0, "CAN_COLLIDE"];
	_vehicle_112 = _this;
	_this setPos [4333.855, 3826.3022];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_114 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4332.6074, 3813.2622], [], 0, "CAN_COLLIDE"];
	_vehicle_114 = _this;
	_this setPos [4332.6074, 3813.2622];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""InfirmaryKits""];"]];
};

_vehicle_117 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4331.5488, 3811.384, 1.0735275], [], 0, "CAN_COLLIDE"];
	_vehicle_117 = _this;
	_this setDir -274.50162;
	_this setPos [4331.5488, 3811.384, 1.0735275];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_green_F", [4332.6836, 3806.3372, 1.1736345], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir 83.658806;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_06_Stretcher_01";
	BIS_POI_AbandonedBattlefield_06_Stretcher_01 = _this;
	_this setPos [4332.6836, 3806.3372, 1.1736345];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_green_F", [4332.5757, 3807.8352, 1.0988227], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir 86.400856;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_06_Stretcher_02";
	BIS_POI_AbandonedBattlefield_06_Stretcher_02 = _this;
	_this setPos [4332.5757, 3807.8352, 1.0988227];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_green_F", [4332.5605, 3809.3936, 1.1101289], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir 87.637833;
	_this setPos [4332.5605, 3809.3936, 1.1101289];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [4336.2012, 3808.0232, 1.0402359], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setDir -94.543777;
	_this setPos [4336.2012, 3808.0232, 1.0402359];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [4361.748, 3758.28, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setDir -113.05418;
	_this setPos [4361.748, 3758.28, 3.0517578e-005];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [4359.4771, 3806.9941, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setPos [4359.4771, 3806.9941, 0];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4333.1377, 3786.6191], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setPos [4333.1377, 3786.6191];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4364.2798, 3809.2285, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setPos [4364.2798, 3809.2285, 0];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4346.4092, 3873.4277], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setPos [4346.4092, 3873.4277];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [4333.7695, 3807.2051, 1.1363699], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir -115.03835;
	_this setPos [4333.7695, 3807.2051, 1.1363699];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [4334.084, 3807.6243, 1.0973542], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setDir -55.971493;
	_this setPos [4334.084, 3807.6243, 1.0973542];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [4332.5898, 3808.5901, 1.0894103], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir 77.378807;
	_this setPos [4332.5898, 3808.5901, 1.0894103];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4337.7808, 3808.1045, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setPos [4337.7808, 3808.1045, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""Infirmary""];"]];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Defibrillator_F", [4334.7007, 3807.3025, 1.0561329], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -62.350052;
	_this setPos [4334.7007, 3807.3025, 1.0561329];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [4332.9282, 3808.5386, 1.0984093], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setDir -126.43672;
	_this setPos [4332.9282, 3808.5386, 1.0984093];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Antibiotic_F", [4334.4985, 3806.5457, 0.11063421], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setPos [4334.4985, 3806.5457, 0.11063421];
	_initCodes set [count _initCodes,[_this,"[226.764,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["I_APC_Wheeled_03_cannon_F", [4369.9932, 3759.9553], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir -29.411552;
	_this setPos [4369.9932, 3759.9553];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; clearWeaponCargo this; clearMagazineCargo this; this lock true; this setDamage 0.75; {this setHit [_x,1]} forEach [""wheel_1_1_steering"",""wheel_2_1_steering"",""wheel_2_2_steering"",""wheel_1_2_steering""]"]];
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_crew_F", [4374.126, 3771.4033, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [4374.126, 3771.4033, 1.5258789e-005];
	_this setDir -176.79338;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),4]; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""AadjPknlMstpSrasWrflDup""}; this unlinkItem ""NVGoggles_indep"""]];
};

_group_8 = createGroup _center_1;

_unit_34 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_soldier_F", [4378.9282, 3791.1123], [], 0, "CAN_COLLIDE"];
	_unit_34 = _this;
	_this setPos [4378.9282, 3791.1123];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_06_groupCyan = group this; {_x unlinkItem ""NVGoggles_indep""} forEach (units group this); this addPrimaryWeaponItem ""acc_flashlight""; this setBehaviour ""Safe""; (group this) setSpeedMode ""Limited"""]];
};

_unit_35 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["I_engineer_F", [4378.0996, 3789.8164], [], 0, "CAN_COLLIDE"];
	_unit_35 = _this;
	_this setPos [4378.0996, 3789.8164];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this addPrimaryWeaponItem ""acc_flashlight""; removeBackpack this; this addBackpack ""B_Carryall_oli""; (unitBackpack this) addItemCargo [""Toolkit"",3]"]];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4378.5347, 3792.2202], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setPos [4378.5347, 3792.2202];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4378.8716, 3792.0908, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setPos [4378.8716, 3792.0908, 0];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4360.063, 3872.5225, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setPos [4360.063, 3872.5225, 0];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [4371.5928, 3764.9429], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setPos [4371.5928, 3764.9429];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [4363.2617, 3756.771, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setPos [4363.2617, 3756.771, 0];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [4367.124, 3816.896, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_158 = _this;
	_this setPos [4367.124, 3816.896, 0];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Green_F", [4352.3853, 3795.3218], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setPos [4352.3853, 3795.3218];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Green_F", [4359.0005, 3864.9692], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setPos [4359.0005, 3864.9692];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [4369.8091, 3769.1743], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setPos [4369.8091, 3769.1743];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
