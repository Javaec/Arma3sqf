activateAddons [
];

if !(isNull findDisplay 128) then {[] call (uinamespace getvariable 'bis_fnc_recompile');};
_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_group_0 = createGroup _center_0;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["C_man_p_fugitive_F_euro", [14633.973, 16787.186, 0.088784449], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [14633.973, 16787.186, 0.088784449];
	_this setDir -59.518936;
	_this setVehicleVarName "BIS_placeholderPlayer";
	BIS_placeholderPlayer = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14589.601, 16749.982, 0.26270413], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir 136.14688;
	_this setVehicleLock "LOCKED";
	_this setPos [14589.601, 16749.982, 0.26270413];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelTrash_grey_F", [14582.937, 16751.213, 0.099632606], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setPos [14582.937, 16751.213, 0.099632606];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [14582.271, 16751.953, 0.12801342], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setPos [14582.271, 16751.953, 0.12801342];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [14581.72, 16752.486, 0.13687497], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [14581.72, 16752.486, 0.13687497];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WaterTank_F", [14578.796, 16755.574, 0.26983285], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir 44.238197;
	_this setPos [14578.796, 16755.574, 0.26983285];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [14582.407, 16752.686, 0.13334477], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [14582.407, 16752.686, 0.13334477];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [14577.686, 16768.898, 0.089977451], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -134.83853;
	_this setPos [14577.686, 16768.898, 0.089977451];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [14582.313, 16790.043, 0.1195472], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setPos [14582.313, 16790.043, 0.1195472];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [14608.393, 16799.953, 0.065396532], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir -151.92424;
	_this setPos [14608.393, 16799.953, 0.065396532];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [14636.015, 16805.52, 0.062156573], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 50.13065;
	_this setPos [14636.015, 16805.52, 0.062156573];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [14608.545, 16798.922, 0.10483008], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -41.485371;
	_this setPos [14608.545, 16798.922, 0.10483008];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_88 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [14608.646, 16799.078, 0.13178113], [], 0, "CAN_COLLIDE"];
	_vehicle_88 = _this;
	_this setDir -143.71613;
	_this setPos [14608.646, 16799.078, 0.13178113];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [14608.451, 16799.027, 0.11289001], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir -191.81715;
	_this setPos [14608.451, 16799.027, 0.11289001];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [14608.701, 16799.26, 0.091845602], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setDir -41.485371;
	_this setPos [14608.701, 16799.26, 0.091845602];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [14626.806, 16818.559, 0.10037424], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -315.19647;
	_this setPos [14626.806, 16818.559, 0.10037424];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14643.513, 16809.084, 0.10345536], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setDir -44.738815;
	_this setPos [14643.513, 16809.084, 0.10345536];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Ground_sheet_folded_blue_F", [14608.204, 16800.697, 0.10683451], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setDir -34.81456;
	_this setPos [14608.204, 16800.697, 0.10683451];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [14606.972, 16808.334, 0.090488099], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir 56.618355;
	_this setPos [14606.972, 16808.334, 0.090488099];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [14587.561, 16788.912, 0.11262608], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setDir 44.965199;
	_this setPos [14587.561, 16788.912, 0.11262608];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_135 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [14596.864, 16764.887, 0.090095825], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setDir 43.482365;
	_this setPos [14596.864, 16764.887, 0.090095825];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [14631.457, 16800.174, 0.097499944], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setDir 40.577366;
	_this setPos [14631.457, 16800.174, 0.097499944];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_group_1 = createGroup _center_0;

_unit_4 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_polo_1_F", [14635.646, 16804.428, 0.11540439], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [14635.646, 16804.428, 0.11540439];
	_this setDir 42.252735;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_2_F_asia", [14637.022, 16805.477, 0.090017252], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [14637.022, 16805.477, 0.090017252];
	_this setDir 218.77315;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_p_fugitive_F_asia", [14608.482, 16797.355, 0.13115419], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [14608.482, 16797.355, 0.13115419];
	_this setDir 316.50342;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_this = createCenter west;
_center_1 = _this;

_group_2 = createGroup _center_1;

_unit_10 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [14601.578, 16769.637, 4.9851465], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [14601.578, 16769.637, 4.9851465];
	_this setDir 122.41496;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_p_fugitive_F_afro", [14577.112, 16768.385, 0.11266376], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [14577.112, 16768.385, 0.11266376];
	_this setDir 28.916071;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;"]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_w_worker_F", [14595.096, 16749.484, -0.0070575117], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [14595.096, 16749.484, -0.0070575117];
	_this setDir -75.461533;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_1_F_euro", [14625.624, 16817.25, 0.092042372], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [14625.624, 16817.25, 0.092042372];
	_this setDir -329.74097;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Suitcase_F", [14625.96, 16816.676, 0.13358197], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir -222.00418;
	_this setPos [14625.96, 16816.676, 0.13358197];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_polo_5_F_afro", [14624.553, 16815.633, 0.11240842], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [14624.553, 16815.633, 0.11240842];
	_this setDir -353.01276;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_polo_6_F", [14607.448, 16799.029, 0.085426696], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [14607.448, 16799.029, 0.085426696];
	_this setDir -241.84018;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""SIT_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_polo_2_F", [14627.416, 16818.916, 0.11249013], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [14627.416, 16818.916, 0.11249013];
	_this setDir -149.81749;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_w_worker_F", [14593.451, 16750.375, 0.13523896], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [14593.451, 16750.375, 0.13523896];
	_this setDir 105.6924;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;"]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_4_F_asia", [14611.067, 16794.328, 0.091250308], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [14611.067, 16794.328, 0.091250308];
	_this setDir -51.215977;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""SIT_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_35 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_lite_F", [14574.618, 16792.732, 0.11780521], [], 0, "CAN_COLLIDE"];
	_unit_35 = _this;
	_this setPos [14574.618, 16792.732, 0.11780521];
	_this setDir -49.496422;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_36 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_p_beggar_F_euro", [14564.3, 16776.641, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_unit_36 = _this;
	_this setPos [14564.3, 16776.641, 3.8146973e-005];
	_this setDir 146.89581;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14592.788, 16750.664, 0.067209423], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setPos [14592.788, 16750.664, 0.067209423];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14576.593, 16767.707, 0.135056], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setDir -45.379086;
	_this setPos [14576.593, 16767.707, 0.135056];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14607.084, 16799.482, 0.67413449], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setDir -226.21199;
	_this setPos [14607.084, 16799.482, 0.67413449];
};

_unit_40 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_2_F_afro", [14578.802, 16770.16, 0.16705762], [], 0, "CAN_COLLIDE"];
	_unit_40 = _this;
	_this setPos [14578.802, 16770.16, 0.16705762];
	_this setDir 211.49939;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_56 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_G_Soldier_F", [14617.516, 16803.471, 0.082785465], [], 0, "CAN_COLLIDE"];
	_unit_56 = _this;
	_this setPos [14617.516, 16803.471, 0.082785465];
	_this setDir -52.09103;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""LEAN"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVest_oli""; {this addMagazine ""30Rnd_65x39_caseless_mag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_MXC_Black_F""; this addPrimaryWeaponItem ""optic_aco""; this addUniform ""U_BG_Guerilla2_3""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Squares"";   "]];
};

_unit_59 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_G_Soldier_F", [14584.463, 16778.387, 0.15755729], [], 0, "CAN_COLLIDE"];
	_unit_59 = _this;
	_this setPos [14584.463, 16778.387, 0.15755729];
	_this setDir 47.092731;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVest_oli""; {this addMagazine ""30Rnd_65x39_caseless_mag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_MX_Black_F""; this addPrimaryWeaponItem ""optic_HAMR""; this addUniform ""U_BG_Guerilla2_1""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Squares"";   "]];
};

_unit_62 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_G_Soldier_F", [14585.671, 16779.391, 0.1123741], [], 0, "CAN_COLLIDE"];
	_unit_62 = _this;
	_this setPos [14585.671, 16779.391, 0.1123741];
	_this setDir -139.23238;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVest_oli""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this addUniform ""U_BG_Guerilla2_3""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Shades_Red"";"]];
};

_vehicle_180 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14611.521, 16793.852, 0.63038051], [], 0, "CAN_COLLIDE"];
	_vehicle_180 = _this;
	_this setDir -45.528576;
	_this setPos [14611.521, 16793.852, 0.63038051];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [14629.978, 16786.502, 0.046895374], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setDir -43.301346;
	_this setPos [14629.978, 16786.502, 0.046895374];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [14635.409, 16791.947, 0.022082953], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setDir -45.363628;
	_this setPos [14635.409, 16791.947, 0.022082953];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [14609.336, 16765.941, 0.056586497], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setDir -45.363628;
	_this setPos [14609.336, 16765.941, 0.056586497];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [14603.928, 16760.387, 0.068031289], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir -45.363628;
	_this setPos [14603.928, 16760.387, 0.068031289];
};

_unit_68 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_soldier_AR_F", [14629.338, 16787.309, 0.065680355], [], 0, "CAN_COLLIDE"];
	_unit_68 = _this;
	_this setPos [14629.338, 16787.309, 0.065680355];
	_this setDir 131.3718;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_70 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_GL_F", [14608.542, 16766.799, 0.086178206], [], 0, "CAN_COLLIDE"];
	_unit_70 = _this;
	_this setPos [14608.542, 16766.799, 0.086178206];
	_this setDir 132.37408;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Billboard_F", [14628.086, 16820.275, -1.4020221], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setDir 45.062454;
	_this setPos [14628.086, 16820.275, -1.4020221];
};

_vehicle_244 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Billboard_F", [14575.817, 16767.053, -1.4074914], [], 0, "CAN_COLLIDE"];
	_vehicle_244 = _this;
	_this setDir -135.07146;
	_this setPos [14575.817, 16767.053, -1.4074914];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
