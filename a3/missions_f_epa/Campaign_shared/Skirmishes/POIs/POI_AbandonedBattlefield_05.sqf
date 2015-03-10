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
	_this = createVehicle ["Sign_Arrow_Large_F", [3350.9231, 4429.5811], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_05_center";
	BIS_POI_AbandonedBattlefield_05_center = _this;
	_this setPos [3350.9231, 4429.5811];
};

_this = createCenter resistance;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_GL_F", [3364.052, 4376.2563], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [3364.052, 4376.2563];
	_this setDir 146.55563;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.56426704;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_ir""; this setUnitPos ""Up""; this addPrimaryWeaponItem ""acc_flashlight""; "]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [3359.9326, 4431.2407], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [3359.9326, 4431.2407];
	_this setDir 67.433723;
	_this setUnitAbility 0.54324758;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_ir""; this setUnitPos ""Middle"""]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [3343.1814, 4432.5151], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [3343.1814, 4432.5151];
	_this setDir 265.59555;
	_this setUnitAbility 0.54955333;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""WATCH2"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; removeHeadgear this; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; {this addMagazine ""SmokeShell""} forEach [0,1]; this addHeadgear ""H_Booniehat_dgtl""; this setUnitPos ""Up""; this addPrimaryWeaponItem ""acc_flashlight""; "]];
};

_group_2 = createGroup _center_1;

_unit_5 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [3363.7957, 4434.3188], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [3363.7957, 4434.3188];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_05_groupBlue = group this; this removePrimaryWeaponItem ""acc_pointer_ir""; this setBehaviour ""Safe""; this setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this addPrimaryWeaponItem ""acc_flashlight""; "]];
};

_this = createCenter west;
_center_2 = _this;

_group_3 = createGroup _center_2;

_unit_7 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_soldier_AR_F", [3359.8335, 4414.7788], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [3359.8335, 4414.7788];
	_this setDir 78.464966;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setCaptive true} forEach (units group this); this setAmmo [(primaryWeapon this),71]; this removeItem ""FirstAidKit""; removeHeadgear this; this unlinkItem ""NVGoggles""; this removePrimaryWeaponItem ""acc_pointer_ir""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck03""}; this addPrimaryWeaponItem ""optic_hamr""; this removeMagazines ""100Rnd_65x39_caseless_mag""; this removeMagazines ""HandGrenade"""]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3368.3557, 4379.375], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [3368.3557, 4379.375];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3362.9209, 4435.0796], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [3362.9209, 4435.0796];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3362.7124, 4435.0776], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [3362.7124, 4435.0776];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3316.2131, 4433.4067], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setPos [3316.2131, 4433.4067];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3327.3809, 4386.5698], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setPos [3327.3809, 4386.5698];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Antibiotic_F", [3351.8628, 4429.6348, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir -105.77345;
	_this setPos [3351.8628, 4429.6348, -1.5258789e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3351.615, 4429.5098, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -240.80066;
	_this setPos [3351.615, 4429.5098, 3.0517578e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HeatPack_F", [3350.5732, 4429.7305, -0.008102417], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 51.690247;
	_this setPos [3350.5732, 4429.7305, -0.008102417];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Map_unfolded_F", [3351.9202, 4429.9072], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir -29.471464;
	_this setPos [3351.9202, 4429.9072];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_Soldier_F", [3353.5442, 4431.4048], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [3353.5442, 4431.4048];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles""; this moveInDriver BIS_POI_AbandonedBattlefield_05_Hunter; this setDamage 1"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["B_officer_F", [3351.0991, 4429.9458], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [3351.0991, 4429.9458];
	_this setDir 172.53978;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; this unlinkItem ""NVGoggles""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_commander_sdv""}; this addMagazine ""SmokeShell""; this addMagazine ""SmokeShellBlue""; {this addMagazine ""Chemlight_blue""} forEach [0,1,2,3]; this addMagazine ""11Rnd_45ACP_Mag""; this addWeapon ""hgun_Pistol_heavy_01_F""; {this addMagazine ""11Rnd_45ACP_Mag""} forEach [0,1,2,3,4,5]"]];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3346.1462, 4429.2217], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setPos [3346.1462, 4429.2217];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3354.3442, 4427.9653, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setPos [3354.3442, 4427.9653, 0];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["B_MRAP_01_gmg_F", [3354.1353, 4432.2524, 0.089701012], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir 72.040382;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_05_Hunter";
	BIS_POI_AbandonedBattlefield_05_Hunter = _this;
	_this setPos [3354.1353, 4432.2524, 0.089701012];
	_initCodes set [count _initCodes,[_this,"_lockHunter = this spawn {sleep 1; _this lockDriver true}; this setVehicleAmmo 0.25; clearItemCargo this; clearMagazineCargo this; clearWeaponCargo this; {this setHit [_x,1]} forEach [""wheel_1_1_steering"",""wheel_2_1_steering""]; this setHit [""glass1"",0.75]; this addItemCargo [""optic_nvs"",1]; this addItemCargo [""FirstAidKit"",3]; this addBackpackCargo [""B_Kitbag_mcamo"",1]; this addMagazineCargo [""30Rnd_65x39_caseless_mag_Tracer"",12];  this addMagazineCargo [""100Rnd_65x39_caseless_mag_Tracer"",6]; this addMagazineCargo [""7Rnd_408_Mag"",4]; this addWeaponcargo [""srifle_LRR_F"",1];  this addItemCargo [""Rangefinder"",1]; this addItemCargo [""V_PlateCarrierSpec_rgr"",1];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
