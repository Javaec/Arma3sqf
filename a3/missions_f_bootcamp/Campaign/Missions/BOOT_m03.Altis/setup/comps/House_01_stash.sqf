_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [7561.4019, 18356.656, 0.40139407], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -39.940342;
	_this setPos [7561.4019, 18356.656, 0.40139407];
	_initCodes set [count _initCodes,[_this,"[132.686,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [7560.5454, 18353.203, 0.50252533], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -126.6815;
	_this setPos [7560.5454, 18353.203, 0.50252533];
	_initCodes set [count _initCodes,[_this,"[132.686,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [7558.0215, 18357.531, 0.40648681], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setPos [7558.0215, 18357.531, 0.40648681];
	_initCodes set [count _initCodes,[_this,"[132.686,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [7559.4512, 18353.682, 3.2211249], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir -219.29567;
	_this setVehicleVarName "BIS_House_01_Table_02";
	BIS_House_01_Table_02 = _this;
	_this setPos [7559.4512, 18353.682, 3.2211249];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight; this enableSimulation false"]];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [7560.5786, 18358.156, 3.2720454], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -33.131031;
	_this setVehicleVarName "BIS_House_01_Table_01";
	BIS_House_01_Table_01 = _this;
	_this setPos [7560.5786, 18358.156, 3.2720454];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight; this enableSimulation false"]];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [7558.1162, 18355.365, 3.2070074], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir -130.16263;
	_this setPos [7558.1162, 18355.365, 3.2070074];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [7560.8188, 18356.549, 3.2913671], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -37.422844;
	_this setPos [7560.8188, 18356.549, 3.2913671];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7554.564, 18358.783, 2.9434476], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -63.609341;
	_this setPos [7554.564, 18358.783, 2.9434476];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_F", [7558.979, 18356.324, 0.36358309], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -90.957146;
	_this setPos [7558.979, 18356.324, 0.36358309];
	_initCodes set [count _initCodes,[_this,"[132.686,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Gloves_F", [7559.3496, 18356.107, 0.46560642], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -232.52133;
	_this setPos [7559.3496, 18356.107, 0.46560642];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [7559.7236, 18356.473, 3.3390355], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 25.342207;
	_this setPos [7559.7236, 18356.473, 3.3390355];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [7556.2378, 18359.797, 3.0533597], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [7556.2378, 18359.797, 3.0533597];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [7560.9087, 18354.213, 3.3057799], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir -272.64737;
	_this setPos [7560.9087, 18354.213, 3.3057799];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Wps_F", [7562.3296, 18354.949, 3.3060124], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir -213.7657;
	_this setPos [7562.3296, 18354.949, 3.3060124];
	_initCodes set [count _initCodes,[_this,"[135.552,""asl""] call BIS_fnc_setHeight;"]];
};

/*_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_arifle_TRG21_F", [7554.0176, 18362.605, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setPos [7554.0176, 18362.605, 1.5258789e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_01_Table_01,[-0.1,0.25,0.43]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_01_Table_01 + 40)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["arifle_TRG21_F", 1];
_holder attachTo [BIS_House_01_Table_01, [-0.1,0.25,0.51]];
_holder setDir (getDir BIS_House_01_Table_01 + 40);
_holder setDamage 1;

/*_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_SMG_02_F", [7554.748, 18360.883, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [7554.748, 18360.883, 3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_01_Table_01,[-0.25,-0.35,0.43]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_01_Table_01 + 165)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["SMG_02_F", 1];
_holder attachTo [BIS_House_01_Table_01, [-0.25,-0.35,0.51]];
_holder setDir (getDir BIS_House_01_Table_01 + 165);
_holder setDamage 1;

/*_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_hgun_ACPC2_F", [7552.5771, 18360.367, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setPos [7552.5771, 18360.367, -1.5258789e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_01_Table_02,[-0.3,0,0.43]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_01_Table_02 + 45)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["hgun_ACPC2_F", 1];
_holder attachTo [BIS_House_01_Table_02, [-0.3,0,0.51]];
_holder setDir (getDir BIS_House_01_Table_02 + 45);
_holder setDamage 1;

/*_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_hgun_PDW2000_F", [7551.3169, 18361.77, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setPos [7551.3169, 18361.77, 3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_01_Table_02,[-0.1,-0.25,0.43]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_01_Table_02 - 125)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["hgun_ACPC2_F", 1];
_holder attachTo [BIS_House_01_Table_02, [-0.1,-0.25,0.51]];
_holder setDir (getDir BIS_House_01_Table_02 - 125);
_holder setDamage 1;

/*_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_srifle_EBR_F", [7550.3706, 18362.621, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [7550.3706, 18362.621, -3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_01_Table_02,[0.25,0,0.43]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_01_Table_02 - 40)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["srifle_EBR_F", 1];
_holder attachTo [BIS_House_01_Table_02, [0.25,0,0.51]];
_holder setDir (getDir BIS_House_01_Table_02 - 40);
_holder setDamage 1;

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
