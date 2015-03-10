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
	_this = createVehicle ["Sign_Arrow_Large_F", [3029.7949, 4085.9697], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -1.0990903;
	_this setVehicleVarName "BIS_POI_CrashedHeli_03_center";
	BIS_POI_CrashedHeli_03_center = _this;
	_this setPos [3029.7949, 4085.9697];
};

_this = createCenter resistance;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_TL_F", [3029.6836, 4080.9749], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [3029.6836, 4080.9749];
	_this setDir -116.53526;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.5684709;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this addHeadgear ""H_MilCap_dgtl""; {_x unlinkItem ""NVGoggles_indep""} forEach (units group this); this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up"""]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["I_Heli_Transport_02_F", [3031.1726, 4089.0427], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -97.61602;
	_this setVehicleVarName "BIS_POI_CrashedHeli_03_Mohawk";
	BIS_POI_CrashedHeli_03_Mohawk = _this;
	_this setPos [3031.1726, 4089.0427];
	_initCodes set [count _initCodes,[_this,"this lock true; clearItemCargo this; clearMagazineCargo this; clearBackpackCargo this; clearWeaponCargo this; this setFuel 0.425; this setDamage 0.75"]];
};

_group_2 = createGroup _center_1;

_unit_2 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_helipilot_F", [3030.0908, 4090.6702], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [3030.0908, 4090.6702];
	_this setDir -21.62096;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x unlinkItem ""NVGoggles_indep""} forEach (units group this); this addUniform ""U_I_CombatUniform_shortsleeve""; this moveInDriver BIS_POI_CrashedHeli_03_Mohawk; this setDamage 1"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_helicrew_F", [3030.7292, 4084.2212], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [3030.7292, 4084.2212];
	_this setDir 164.00148;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeUniform this; this addHeadgear ""H_CrewHelmetHeli_I""; this addUniform ""U_I_CombatUniform_shortsleeve""; removeVest this; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2,3]; this addMagazine ""Chemlight_green""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01""}"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_helicrew_F", [3029.3306, 4084.1848], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [3029.3306, 4084.1848];
	_this setDir -174.62766;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addVest ""V_TacVest_oli""; removeUniform this; this addUniform ""U_I_CombatUniform_shortsleeve""; removeAllWeapons this; this addMagazine ""9Rnd_45ACP_Mag""; this addWeapon ""hgun_ACPC2_F""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2,3]; this addMagazine ""SmokeShellYellow""; this addMagazine ""SmokeShellPink""; _kill = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck02""}"]];
};

_group_3 = createGroup _center_1;

_unit_8 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_soldier_F", [3035.8269, 4073.4126], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [3035.8269, 4073.4126];
	_this setDir 175.21397;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_ir""; this setVariable [""BIS_ambientAnim"",[""WATCH1"",""ASIS""]]; this setUnitPos ""Middle""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_group_4 = createGroup _center_1;

_unit_9 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_AR_F", [3014.1008, 4065.9004], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [3014.1008, 4065.9004];
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedHeli_03_groupBlue = group this; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_ir""; this setBehaviour ""Safe""; this setSpeedMode ""Limited"""]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3014.0061, 4067.186], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setPos [3014.0061, 4067.186];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3014.2437, 4067.1899], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [3014.2437, 4067.1899];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3050.2385, 4079.6563], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [3050.2385, 4079.6563];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3046.2617, 4108.7764], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setPos [3046.2617, 4108.7764];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3013.3279, 4095.0859], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setPos [3013.3279, 4095.0859];
};

_group_5 = createGroup _center_1;

_unit_18 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["I_medic_F", [3027.9814, 4080.437], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [3027.9814, 4080.437];
	_this setDir 68.014366;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.56636906;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_ir""; this setUnitPos ""Middle""; removeHeadgear this; this addHeadgear ""H_Bandanna_khk""; this removeItems ""FirstAidKit""; this addItem ""FirstAidKit""; (unitBackpack this) addItemCargo [""FirstAidKit"",8]; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [3031.1558, 4089.1309], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setPos [3031.1558, 4089.1309];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), +2.5]"]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Green_F", [3032.8142, 4085.5293], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setPos [3032.8142, 4085.5293];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3028.5925, 4082.6753, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setPos [3028.5925, 4082.6753, 7.6293945e-006];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3030.9321, 4083.0532, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 93.246376;
	_this setPos [3030.9321, 4083.0532, 3.0517578e-005];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3031.5618, 4083.2634, -6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -53.683537;
	_this setPos [3031.5618, 4083.2634, -6.8664551e-005];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Defibrillator_F", [3031.2615, 4083.0369, -6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setDir -61.383873;
	_this setPos [3031.2615, 4083.0369, -6.8664551e-005];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3031.4814, 4083.0559, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir 0.4217751;
	_this setPos [3031.4814, 4083.0559, 2.2888184e-005];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [3031.0215, 4083.3494, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir -6.7778215;
	_this setPos [3031.0215, 4083.3494, -7.6293945e-006];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
