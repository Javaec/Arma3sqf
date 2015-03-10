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

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [14588.645, 16758.205, 0.095798917], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir -314.67889;
	_this setPos [14588.645, 16758.205, 0.095798917];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [14587.809, 16759.139, 0.090340003], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -314.67889;
	_this setPos [14587.809, 16759.139, 0.090340003];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [14587.014, 16759.912, 0.11459007], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir -314.67889;
	_this setPos [14587.014, 16759.912, 0.11459007];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [14586.237, 16760.688, 0.11184958], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -314.67889;
	_this setPos [14586.237, 16760.688, 0.11184958];
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

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14572.288, 16758.193, 0.12130592], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -135.23071;
	_this setPos [14572.288, 16758.193, 0.12130592];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14570.824, 16759.664, 0.13114902], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -135.23071;
	_this setPos [14570.824, 16759.664, 0.13114902];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14569.515, 16760.959, 0.12581994], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir -135.23071;
	_this setPos [14569.515, 16760.959, 0.12581994];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14568.359, 16762.145, 0.1350839], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -135.23071;
	_this setPos [14568.359, 16762.145, 0.1350839];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14565.935, 16764.564, 0.09026777], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir -135.23071;
	_this setPos [14565.935, 16764.564, 0.09026777];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14564.473, 16766.035, 0.10011164], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir -135.23071;
	_this setPos [14564.473, 16766.035, 0.10011164];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14563.162, 16767.33, 0.094782494], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setDir -135.23071;
	_this setPos [14563.162, 16767.33, 0.094782494];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14562.005, 16768.516, 0.10404649], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir -135.23071;
	_this setPos [14562.005, 16768.516, 0.10404649];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14575.649, 16759.441, 0.0045166016], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir -225.12958;
	_this setPos [14575.649, 16759.441, 0.0045166016];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14574.459, 16758.322, 0.013780594], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -225.12958;
	_this setPos [14574.459, 16758.322, 0.013780594];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14562.697, 16771.227, 4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -45.214336;
	_this setPos [14562.697, 16771.227, 4.0054321e-005];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14564.164, 16772.695, 0.0098838806], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir -45.214336;
	_this setPos [14564.164, 16772.695, 0.0098838806];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14565.479, 16773.977, 0.0045547485], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -45.214336;
	_this setPos [14565.479, 16773.977, 0.0045547485];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14566.649, 16775.152, 0.013818741], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -45.214336;
	_this setPos [14566.649, 16775.152, 0.013818741];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14574.154, 16761.742, 0.10871139], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -44.685822;
	_this setPos [14574.154, 16761.742, 0.10871139];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14573.572, 16762.346, 0.089767292], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -224.63498;
	_this setPos [14573.572, 16762.346, 0.089767292];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14570.642, 16765.314, 0.11238725], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir -44.685822;
	_this setPos [14570.642, 16765.314, 0.11238725];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14570.074, 16765.883, 0.093443468], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir -224.63498;
	_this setPos [14570.074, 16765.883, 0.093443468];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14567.087, 16768.82, 0.101328], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir -44.685822;
	_this setPos [14567.087, 16768.82, 0.101328];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14566.521, 16769.389, 0.082384229], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setDir -224.63498;
	_this setPos [14566.521, 16769.389, 0.082384229];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14570.302, 16771.938, 0.11096881], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -44.685822;
	_this setPos [14570.302, 16771.938, 0.11096881];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14569.733, 16772.506, 0.092025019], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir -224.63498;
	_this setPos [14569.733, 16772.506, 0.092025019];
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
	_this = createVehicle ["Land_LuggageHeap_01_F", [14603.506, 16794.457, 0.062156573], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 50.13065;
	_this setPos [14603.506, 16794.457, 0.062156573];
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

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14634.492, 16826.965, 0.11253019], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setDir -315.00504;
	_this setPos [14634.492, 16826.965, 0.11253019];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14635.956, 16825.461, 0.122374], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setDir -315.00504;
	_this setPos [14635.956, 16825.461, 0.122374];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14637.245, 16824.189, 0.11704487], [], 0, "CAN_COLLIDE"];
	_vehicle_107 = _this;
	_this setDir -315.00504;
	_this setPos [14637.245, 16824.189, 0.11704487];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14638.39, 16822.982, 0.12630887], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir -315.00504;
	_this setPos [14638.39, 16822.982, 0.12630887];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14627.105, 16834.039, 0.14825802], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir -315.00504;
	_this setPos [14627.105, 16834.039, 0.14825802];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14628.567, 16832.535, 0.1581018], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setDir -315.00504;
	_this setPos [14628.567, 16832.535, 0.1581018];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14629.855, 16831.264, 0.15277268], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir -315.00504;
	_this setPos [14629.855, 16831.264, 0.15277268];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [14631.001, 16830.057, 0.16203666], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir -315.00504;
	_this setPos [14631.001, 16830.057, 0.16203666];
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
	_this = createVehicle ["Land_FireExtinguisher_F", [14596.477, 16765.188, 0.090095825], [], 0, "CAN_COLLIDE"];
	_vehicle_135 = _this;
	_this setDir 43.482365;
	_this setPos [14596.477, 16765.188, 0.090095825];
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

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14632.519, 16818.594, 0.10075779], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir -44.685822;
	_this setPos [14632.519, 16818.594, 0.10075779];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14631.947, 16819.162, 0.081814021], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir -224.63498;
	_this setPos [14631.947, 16819.162, 0.081814021];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14629.019, 16822.131, 0.10443326], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setDir -44.685822;
	_this setPos [14629.019, 16822.131, 0.10443326];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14628.447, 16822.699, 0.085489474], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setDir -224.63498;
	_this setPos [14628.447, 16822.699, 0.085489474];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14625.466, 16825.637, 0.093374453], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir -44.685822;
	_this setPos [14625.466, 16825.637, 0.093374453];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14624.9, 16826.205, 0.074430674], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setDir -224.63498;
	_this setPos [14624.9, 16826.205, 0.074430674];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14628.683, 16828.754, 0.10301612], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setDir -44.685822;
	_this setPos [14628.683, 16828.754, 0.10301612];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14628.115, 16829.322, 0.084072322], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setDir -224.63498;
	_this setPos [14628.115, 16829.322, 0.084072322];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_group_1 = createGroup _center_0;

_unit_4 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_polo_1_F", [14603.134, 16793.365, 0.11540439], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [14603.134, 16793.365, 0.11540439];
	_this setDir 42.252735;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_2_F_asia", [14604.517, 16794.414, 0.090017252], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [14604.517, 16794.414, 0.090017252];
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

_unit_11 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [14625.716, 16793.881, 5.10256], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [14625.716, 16793.881, 5.10256];
	_this setDir 155.43707;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_p_fugitive_F_afro", [14577.004, 16768.225, 0.11266376], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [14577.004, 16768.225, 0.11266376];
	_this setDir 28.916071;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;"]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_2_F_afro", [14572.815, 16765.424, 0.11238793], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [14572.815, 16765.424, 0.11238793];
	_this setDir 91.49984;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_w_worker_F", [14573.888, 16764.984, 0.089869268], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [14573.888, 16764.984, 0.089869268];
	_this setDir -88.06073;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
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

_unit_27 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_w_worker_F", [14636.421, 16813.268, 0.097615309], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [14636.421, 16813.268, 0.097615309];
	_this setDir 38.459057;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_28 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_w_worker_F", [14637.873, 16813.826, 0.15778168], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [14637.873, 16813.826, 0.15778168];
	_this setDir -125.80494;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_polo_2_F", [14627.636, 16819.418, 0.11249013], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [14627.636, 16819.418, 0.11249013];
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

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [14609.848, 16794.4, 0.45427752], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir 125.5416;
	_this setPos [14609.848, 16794.4, 0.45427752];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V3_F", [14609.813, 16794.521, 0.18222034], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir 87.287605;
	_this setPos [14609.813, 16794.521, 0.18222034];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Notepad_F", [14609.688, 16794.426, 0.1350265], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setDir 32.747078;
	_this setPos [14609.688, 16794.426, 0.1350265];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FMradio_F", [14609.987, 16794.717, 0.12263261], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setDir 77.271454;
	_this setPos [14609.987, 16794.717, 0.12263261];
	_initCodes set [count _initCodes,[_this,"[18.0364,""ASL""] call BIS_fnc_setHeight"]];
};

_unit_34 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_lite_F", [14604.905, 16821.135, 0.085324116], [], 0, "CAN_COLLIDE"];
	_unit_34 = _this;
	_this setPos [14604.905, 16821.135, 0.085324116];
	_this setDir -44.737133;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
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
	_this = createVehicle ["Land_ChairPlastic_F", [14576.709, 16767.674, 0.135056], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setDir -45.379086;
	_this setPos [14576.709, 16767.674, 0.135056];
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

_unit_42 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_shorts_2_F_afro", [14591.118, 16809.4, 0.12573989], [], 0, "CAN_COLLIDE"];
	_unit_42 = _this;
	_this setPos [14591.118, 16809.4, 0.12573989];
	_this setDir -147.73865;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_46 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_man_p_shorts_1_F_asia", [14590.234, 16808.594, 0.11228506], [], 0, "CAN_COLLIDE"];
	_unit_46 = _this;
	_this setPos [14590.234, 16808.594, 0.11228506];
	_this setDir 18.081562;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_47 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [14632.8, 16790.367, 4.0261087], [], 0, "CAN_COLLIDE"];
	_unit_47 = _this;
	_this setPos [14632.8, 16790.367, 4.0261087];
	_this setDir 140.25882;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""SIT_HIGH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_50 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [14599.737, 16786.004, 0.089986317], [], 0, "CAN_COLLIDE"];
	_unit_50 = _this;
	_this setPos [14599.737, 16786.004, 0.089986317];
	_this setDir -2.2390358;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
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

_unit_57 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_G_Soldier_F", [14617.242, 16807.682, 0.067652166], [], 0, "CAN_COLLIDE"];
	_unit_57 = _this;
	_this setPos [14617.242, 16807.682, 0.067652166];
	_this setDir -49.61079;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVest_oli""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this addUniform ""U_BG_Guerilla2_2""; this addHeadgear ""H_BandMask_blk""; this addGoggles ""G_Shades_Red"";"]];
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

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
