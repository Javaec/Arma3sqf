_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [3330.3015, 12967.644, 0.20125958], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -1.4062897;
	_this setPos [3330.3015, 12967.644, 0.20125958];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {this lock true}]"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["I_APC_Wheeled_03_cannon_F", [3308.9314, 12947.646, 0.1083118], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -52.391331;
	_this setPos [3308.9314, 12947.646, 0.1083118];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {clearWeaponCargo this; clearMagazineCargo this; clearItemCargo this; this lock true; this engineOn true}]"]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [3298.2437, 12967.578, 0.14046133], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir -159.4507;
	_this setPos [3298.2437, 12967.578, 0.14046133];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {this lock true; this setDamage 0.75; this setHit [""wheel_1_1_steering"",1]}]"]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [3271.0544, 12955.977, 0.17045437], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [3271.0544, 12955.977, 0.17045437];
	_initCodes set [count _initCodes,[_this,"this setDamage 0.5"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["O_G_Offroad_01_F", [3275.7625, 12954.153, 0.058109496], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir 41.259624;
	_this setPos [3275.7625, 12954.153, 0.058109496];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {this setDamage 0.75; {this setHit [_x,1]} forEach [""wheel_2_1_steering"",""wheel_2_2_steering""]}]"]];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [3289.4001, 12952.161, 1.3113022e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir -62.658489;
	_this setPos [3289.4001, 12952.161, 1.3113022e-005];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [3289.582, 12954.729, 1.0490417e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir 74.081627;
	_this setPos [3289.582, 12954.729, 1.0490417e-005];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [3289.884, 12953.402, 3.7670135e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setPos [3289.884, 12953.402, 3.7670135e-005];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBarrel_01_F", [3294.1306, 12968.692, -1.3589859e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir -101.92059;
	_this setPos [3294.1306, 12968.692, -1.3589859e-005];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [3292.7686, 12968.292, 1.0490417e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -6.5591273;
	_this setPos [3292.7686, 12968.292, 1.0490417e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["I_APC_tracked_03_cannon_F", [3362.9878, 12980.975, 1.3828278e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -126.63961;
	_this setPos [3362.9878, 12980.975, 1.3828278e-005];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {clearWeaponCargo this; clearMagazineCargo this; clearItemCargo this; this lock true; this engineOn true; player action [""LightOn"", this]}]"]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["I_Truck_02_covered_F", [3374.0818, 12980.615, 0.20650984], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -173.13976;
	_this setPos [3374.0818, 12980.615, 0.20650984];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {clearWeaponCargo this; clearMagazineCargo this; clearItemCargo this; this lock true}]"]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_gmg_F", [3211.1912, 12903.228, 0.12898803], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir 41.441746;
	_this setPos [3211.1912, 12903.228, 0.12898803];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {clearWeaponCargo this; clearMagazineCargo this; clearItemCargo this; this lock true}]"]];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3324.6284, 12967.495, 0.87477773], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [3324.6284, 12967.495, 0.87477773];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3318.5671, 12967.626, 0.77600849], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [3318.5671, 12967.626, 0.77600849];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3325.0972, 12968.016, 1.079231], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setPos [3325.0972, 12968.016, 1.079231];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3324.1528, 12968.127, 1.0127487], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [3324.1528, 12968.127, 1.0127487];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3318.4138, 12968.56, 0.846434], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir -13.716592;
	_this setPos [3318.4138, 12968.56, 0.846434];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [3323.239, 12967.403, 0.8464455], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setDir -46.630257;
	_this setPos [3323.239, 12967.403, 0.8464455];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [3319.0046, 12971.717, 0.82380164], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 87.739006;
	_this setPos [3319.0046, 12971.717, 0.82380164];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_fnc_saveScene_init"", {[3.188,""ASL""] call BIS_fnc_setHeight}]"]];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [3327.6558, 12966.82, 2.8848648e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setPos [3327.6558, 12966.82, 2.8848648e-005];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
