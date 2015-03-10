_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenBox_F", [7539.6929, 18370.076, 0.20462669], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -29.688158;
	_this setPos [7539.6929, 18370.076, 0.20462669];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenBox_F", [7540.2876, 18369.076, 0.29044035], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -37.793587;
	_this setPos [7540.2876, 18369.076, 0.29044035];
	_initCodes set [count _initCodes,[_this,"[133.85,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [7542.0029, 18367.391, 0.42772481], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -33.400578;
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

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
