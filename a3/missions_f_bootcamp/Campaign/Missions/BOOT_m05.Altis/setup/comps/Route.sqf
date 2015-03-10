_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3591.54, 12903.768, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -214.64035;
	_this setPos [3591.54, 12903.768, 9.5367432e-006];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [3619.5359, 12888.634, 0.5807687], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -68.322151;
	_this setPos [3619.5359, 12888.634, 0.5807687];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [3591.6545, 12907.023, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir -177.24576;
	_this setPos [3591.6545, 12907.023, 3.8146973e-006];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [3614.1807, 12888.285, 0.17177536], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir 82.426033;
	_this setPos [3614.1807, 12888.285, 0.17177536];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [3589.0972, 12896.939, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir -44.635723;
	_this setPos [3589.0972, 12896.939, 2.8610229e-006];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_hmg_F", [3550.793, 12908.392, 0.10808455], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -41.423183;
	_this setPos [3550.793, 12908.392, 0.10808455];
};

_this = createCenter resistance;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [3560.2778, 12905.15, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [3560.2778, 12905.15, 2.2888184e-005];
	_this setDir 107.24618;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim}]"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [3554.2649, 12910.461, 1.6212463e-005], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [3554.2649, 12910.461, 1.6212463e-005];
	_this setDir -52.757599;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {[this,""KNEEL"",""ASIS""] call BIS_fnc_ambientAnim}]"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_G_Soldier_F", [3554.5918, 12902.513, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [3554.5918, 12902.513, -3.0517578e-005];
	_this setDir 128.87527;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeAllWeapons this; _nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}; removeHeadgear this}]"]];
};

_this = createCenter civilian;
_center_2 = _this;

_group_2 = createGroup _center_2;

_unit_5 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["C_man_p_beggar_F", [3552.8884, 12902.27, 0.34310499], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [3552.8884, 12902.27, 0.34310499];
	_this setDir 178.14854;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {_nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck03""; sleep 2; removeHeadgear _this}}]"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_M_F", [3555.8713, 12903.627, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [3555.8713, 12903.627, 2.2888184e-005];
	_this setDir 125.1072;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeAllWeapons this; _nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01""}; this unlinkItem ""NVGoggles_indep""}]"]];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3553.7734, 12902.552, -1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir 19.090971;
	_this setPos [3553.7734, 12902.552, -1.9073486e-005];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3555.4573, 12903.415, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir -31.533861;
	_this setPos [3555.4573, 12903.415, 3.8146973e-006];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3556.7363, 12903.907, -8.5830688e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir -180.28854;
	_this setPos [3556.7363, 12903.907, -8.5830688e-006];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [3528.5764, 12926.854, 0.11719047], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 11.520406;
	_this setPos [3528.5764, 12926.854, 0.11719047];
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {this setDamage 0.85}]"]];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3553.1289, 12902.189, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -97.585678;
	_this setPos [3553.1289, 12902.189, -4.7683716e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Item_Medikit", [3556.6892, 12904.188, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -55.345943;
	_this setPos [3556.6892, 12904.188, -9.5367432e-007];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3556.9185, 12904.247, -7.5340271e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -111.31303;
	_this setPos [3556.9185, 12904.247, -7.5340271e-005];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_medic_F", [3550.7468, 12901.462, 0.1800096], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [3550.7468, 12901.462, 0.1800096];
	_this setDir 29.320284;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {this unlinkItem ""NVGoggles_indep""; removeAllWeapons this; [this,""SIT_SAD2"",""ASIS""] call BIS_fnc_ambientAnim}]"]];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [3550.6267, 12900.354, 0.6951347], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 244.30264;
	_this setPos [3550.6267, 12900.354, 0.6951347];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3550.6611, 12900.479, 0.69512326], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 146.7171;
	_this setPos [3550.6611, 12900.479, 0.69512326];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenBox_F", [3550.2966, 12900.542, 0.11023356], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir 39.367767;
	_this setPos [3550.2966, 12900.542, 0.11023356];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_GL_F", [3549.634, 12865.921, -1.335144e-005], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [3549.634, 12865.921, -1.335144e-005];
	_this setDir -23.17317;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim}]"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_transport_F", [3551.8335, 12863.948, 0.25664437], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir -105.63673;
	_this setPos [3551.8335, 12863.948, 0.25664437];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
