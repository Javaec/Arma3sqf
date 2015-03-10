_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_this = createCenter resistance;
_center_3 = _this;

_this = createCenter civilian;
_center_4 = _this;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [3753.7461, 13006.561, 0.22589985], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -86.075119;
	_this setPos [3753.7461, 13006.561, 0.22589985];
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {this setDamage 0.75}]"]];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [3733.064, 13010.293, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir 58.46196;
	_this setVehicleVarName "BIS_Victim_Offroad";
	BIS_Victim_Offroad = _this;
	_this setPos [3733.064, 13010.293, 2.2888184e-005];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_F", [3749.1758, 13038.059, 0.12741435], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -49.655243;
	_this setPos [3749.1758, 13038.059, 0.12741435];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_transport_F", [3749.7957, 12999.757, 0.27771708], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -171.99023;
	_this setPos [3749.7957, 12999.757, 0.27771708];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_medical_F", [3734.7236, 13021.479, 0.28438139], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 8.8951664;
	_this setPos [3734.7236, 13021.479, 0.28438139];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_medical_F", [3744.4658, 12988.271, 0.27036479], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -6.1421614;
	_this setPos [3744.4658, 12988.271, 0.27036479];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [3727.9038, 12984.03, 0.18042545], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 179.52853;
	_this setPos [3727.9038, 12984.03, 0.18042545];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3728.3752, 13001.473, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -10.115948;
	_this setPos [3728.3752, 13001.473, 1.335144e-005];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3726.5183, 12994.681, 2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -18.163355;
	_this setPos [3726.5183, 12994.681, 2.6702881e-005];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3730.3933, 12997.564, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir 56.867943;
	_this setPos [3730.3933, 12997.564, 2.2888184e-005];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3726.0032, 12998.092, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [3726.0032, 12998.092, 1.1444092e-005];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3732.2947, 12991.853, 1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [3732.2947, 12991.853, 1.7166138e-005];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3725.0728, 12994.928, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 25.665031;
	_this setPos [3725.0728, 12994.928, 5.7220459e-006];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3726.584, 12994.462, -0.018534061], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir 30.63139;
	_this setPos [3726.584, 12994.462, -0.018534061];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3733.0029, 12990.126, 0.014728583], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir 29.264214;
	_this setPos [3733.0029, 12990.126, 0.014728583];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3726.0818, 12999.39, 0.0066301106], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setDir 57.809578;
	_this setPos [3726.0818, 12999.39, 0.0066301106];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3728.3159, 13001.35, 2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir -96.672913;
	_this setPos [3728.3159, 13001.35, 2.4795532e-005];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3728.6306, 12990.178, 0.033285141], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir -49.102913;
	_this setPos [3728.6306, 12990.178, 0.033285141];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3732.1379, 12991.692, 0.025188446], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir -23.176737;
	_this setPos [3732.1379, 12991.692, 0.025188446];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Defibrillator_F", [3731.0681, 12997.338, 4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -51.224751;
	_this setPos [3731.0681, 12997.338, 4.0054321e-005];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [3727.3464, 13002.292, -9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir -61.008217;
	_this setPos [3727.3464, 13002.292, -9.5367432e-006];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [3728.4597, 12990.099, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setPos [3728.4597, 12990.099, 3.8146973e-006];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [3725.3496, 12995.073, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir -33.95433;
	_this setPos [3725.3496, 12995.073, -3.8146973e-006];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [3730.3787, 12995.682, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -49.546497;
	_this setPos [3730.3787, 12995.682, 1.9073486e-005];
};

_group_1 = createGroup _center_3;

_group_2 = createGroup _center_4;

_unit_5 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_medic_F", [3725.4207, 12994.529, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [3725.4207, 12994.529, 1.335144e-005];
	_this setDir 81.728119;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeAllWeapons this; removeBackpack this; this unlinkItem ""NVGoggles_indep"";  [this,""KNEEL_TREAT"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_officer_F", [3732.7419, 12991.182, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [3732.7419, 12991.182, 1.335144e-005];
	_this setDir 6.7203689;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeAllWeapons this; this unlinkItem ""NVGoggles_indep"";  [this,""PRONE_INJURED_U2"",""ASIS""] call BIS_fnc_ambientAnim; removeVest this;}]"]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [3733.5085, 12991.052, 8.9645386e-005], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [3733.5085, 12991.052, 8.9645386e-005];
	_this setDir -84.299995;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeAllWeapons this; this unlinkItem ""NVGoggles_indep"";  [this,""KNEEL_TREAT"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_helicrew_F", [3728.0625, 13002.013, 0.00010108948], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [3728.0625, 13002.013, 0.00010108948];
	_this setDir -169.45384;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeAllWeapons this; this unlinkItem ""NVGoggles_indep"";  [this,""PRONE_INJURED"",""ASIS""] call BIS_fnc_ambientAnim; removeHeadgear this; removeVest this;}]"]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_LAT_F", [3732.832, 13026.479, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [3732.832, 13026.479, -1.1444092e-005];
	_this setDir -4.168633;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [3718.0544, 13041.227, 0.14077248], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [3718.0544, 13041.227, 0.14077248];
	_this setDir 68.482376;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_medic_F", [3728.7725, 13001.864, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [3728.7725, 13001.864, 4.7683716e-005];
	_this setDir -78.476219;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {removeHeadgear this; removeAllWeapons this; this unlinkItem ""NVGoggles_indep"";  [this,""KNEEL_TREAT"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_helipilot_F", [3730.2266, 12996.716, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [3730.2266, 12996.716, 5.9127808e-005];
	_this setDir -89.664055;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {_nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}; removeAllWeapons this;}]"]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["C_man_polo_1_F_afro", [3726.3008, 12998.603, 4.196167e-005], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [3726.3008, 12998.603, 4.196167e-005];
	_this setDir 92.391373;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {_nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_standup01""}; removeAllWeapons this;}]"]];
};

_unit_24 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["C_man_shorts_1_F_euro", [3732.4492, 13002.476, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_unit_24 = _this;
	_this setPos [3732.4492, 13002.476, 9.9182129e-005];
	_this setDir -38.62796;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {_nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_gunner_static_low01""}; removeAllWeapons this;}]"]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["C_man_p_fugitive_F_afro", [3729.2229, 12989.538, 2.8610229e-005], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [3729.2229, 12989.538, 2.8610229e-005];
	_this setDir 84.424339;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {_nul = this spawn {sleep 0.001; _this setDamage 1; _this switchMove ""KIA_passenger_injured_medevac_truck02""}; removeAllWeapons this;}]"]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["C_man_w_worker_F", [3726.0029, 12994.634, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [3726.0029, 12994.634, 5.9127808e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {_nul = this spawn {sleep 1; removeHeadgear this}; [this,""PRONE_INJURED_U1"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBarrel_01_F", [3721.9272, 12982.667, 0.11622956], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -114.77044;
	_this setPos [3721.9272, 12982.667, 0.11622956];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [3722.3713, 12984.959, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir -41.86076;
	_this setPos [3722.3713, 12984.959, 3.8146973e-006];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["I_APC_Wheeled_03_cannon_F", [3701.1738, 13002.459, 0.13507496], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir -65.760666;
	_this setPos [3701.1738, 13002.459, 0.13507496];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [3705.0532, 13005.697, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [3705.0532, 13005.697, 1.5258789e-005];
	_this setDir -62.519444;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable ['BIS_fnc_saveScene_init', {[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;}]"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
