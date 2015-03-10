_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [7542.0029, 18367.391, 0.42772481], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -33.400578;
	_this setVehicleVarName "BIS_House_03_Table_01";
	BIS_House_03_Table_01 = _this;
	_this setPos [7542.0029, 18367.391, 0.42772481];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7541.5366, 18366.119, 0.32637241], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir -90.195038;
	_this setPos [7541.5366, 18366.119, 0.32637241];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Saw_F", [7541.499, 18367.84, 0.35961708], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 82.205902;
	_this setPos [7541.499, 18367.84, 0.35961708];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Meter3m_F", [7541.5547, 18367.658, 0.37008891], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -66.85807;
	_this setPos [7541.5547, 18367.658, 0.37008891];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [7541.1401, 18367.203, 0.29403695], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -47.714466;
	_this setPos [7541.1401, 18367.203, 0.29403695];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Ammo_F", [7540.0264, 18369.758, 0.21174119], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -78.046257;
	_this setPos [7540.0264, 18369.758, 0.21174119];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Box_IND_Wps_F", [7540.71, 18368.723, 0.33641136], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -17.631611;
	_this setPos [7540.71, 18368.723, 0.33641136];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

/*_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_SMG_02_F", [7533.9873, 18360.648, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [7533.9873, 18360.648, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_03_Table_01,[-0.15,-0.2,0.28]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_03_Table_01 - 145)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["SMG_02_F", 1];
_holder attachTo [BIS_House_03_Table_01, [-0.15,-0.2,0.29]];
_holder setDir (getDir BIS_House_03_Table_01 - 145);
_holder setDamage 1;

/*_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_hgun_ACPC2_F", [7535.3867, 18360.744, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setPos [7535.3867, 18360.744, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_03_Table_01,[0,0.10,0.28]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_03_Table_01)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["hgun_ACPC2_F", 1];
_holder attachTo [BIS_House_03_Table_01, [0,0.10,0.29]];
_holder setDir (getDir BIS_House_03_Table_01);
_holder setDamage 1;

/*_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_hgun_ACPC2_F", [7536.7451, 18360.428, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [7536.7451, 18360.428, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_03_Table_01,[0,0.25,0.28]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_03_Table_01 - 180)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["hgun_ACPC2_F", 1];
_holder attachTo [BIS_House_03_Table_01, [0,0.25,0.29]];
_holder setDir (getDir BIS_House_03_Table_01 - 180);
_holder setDamage 1;

/*_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Weapon_arifle_TRG20_F", [7538.3047, 18359.723, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [7538.3047, 18359.723, 0];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_House_03_Table_01,[0.10,0.55,0.28]]; this setDamage 1; this spawn {sleep 0.1; _this setDir (getDir BIS_House_03_Table_01 + 55)}"]];
};*/

private ["_holder"];
_holder = "WeaponHolder_Single_F" createVehicle [10,10,10];
_holder addWeaponCargo ["arifle_TRG20_F", 1];
_holder attachTo [BIS_House_03_Table_01, [0.10,0.55,0.29]];
_holder setDir (getDir BIS_House_03_Table_01 + 55);
_holder setDamage 1;

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
