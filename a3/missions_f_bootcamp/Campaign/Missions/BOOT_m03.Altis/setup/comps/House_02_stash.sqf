_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelTrash_grey_F", [7553.3018, 18354.973, 0.46896508], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setPos [7553.3018, 18354.973, 0.46896508];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelTrash_grey_F", [7552.7515, 18355.518, 0.44922978], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -59.020729;
	_this setPos [7552.7515, 18355.518, 0.44922978];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelTrash_grey_F", [7552.064, 18354.744, 0.4675591], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir 61.408714;
	_this setPos [7552.064, 18354.744, 0.4675591];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [7554.3184, 18353.66, 0.58424199], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -120.91701;
	_this setVehicleVarName "BIS_House_02_Table_01";
	BIS_House_02_Table_01 = _this;
	_this setPos [7554.3184, 18353.66, 0.58424199];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7550.1836, 18352.984, 0.35892025], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir 44.350586;
	_this setPos [7550.1836, 18352.984, 0.35892025];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [7551.917, 18353.373, 0.42001769], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setPos [7551.917, 18353.373, 0.42001769];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [7550.2739, 18349.574, 0.15163769], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -31.538559;
	_this setPos [7550.2739, 18349.574, 0.15163769];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [7551.8208, 18350.252, 0.37066162], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -124.17979;
	_this setPos [7551.8208, 18350.252, 0.37066162];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [7553.6372, 18352.119, 0.47977173], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -40.862125;
	_this setPos [7553.6372, 18352.119, 0.47977173];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Wps_F", [7552.7622, 18351.436, 0.40353897], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir 48.232769;
	_this setPos [7552.7622, 18351.436, 0.40353897];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

/*_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_srifle_EBR_F", [7548.5405, 18361.252, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setPos [7548.5405, 18361.252, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_02_Table_01,[0.25,0,0.1]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_02_Table_01 - 40)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["srifle_EBR_F", 1];
_holder attachTo [BIS_House_02_Table_01, [0.25,0,0.1]];
_holder setDir (getDir BIS_House_02_Table_01 - 40);
_holder setDamage 1;

/*_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_arifle_Mk20C_plain_F", [7547.3013, 18360.26, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [7547.3013, 18360.26, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_02_Table_01,[0.35,0,0.6]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_02_Table_01 + 30)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["arifle_Mk20C_plain_F", 1];
_holder attachTo [BIS_House_02_Table_01, [0.35,0,0.61]];
_holder setDir (getDir BIS_House_02_Table_01 + 30);
_holder setDamage 1;

/*_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_arifle_Mk20C_plain_F", [7545.5059, 18359.305, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [7545.5059, 18359.305, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_02_Table_01,[0,0,0.6]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_02_Table_01 + 20)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["arifle_Mk20C_plain_F", 1];
_holder attachTo [BIS_House_02_Table_01, [0,0,0.61]];
_holder setDir (getDir BIS_House_02_Table_01 + 20);
_holder setDamage 1;

/*_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_SMG_02_F", [7543.6934, 18358.264, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setPos [7543.6934, 18358.264, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_02_Table_01,[0,0,-0.40]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_02_Table_01 - 225)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["SMG_02_F", 1];
_holder attachTo [BIS_House_02_Table_01, [0,0,-0.39]];
_holder setDir (getDir BIS_House_02_Table_01 - 225);
_holder setDamage 1;

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
