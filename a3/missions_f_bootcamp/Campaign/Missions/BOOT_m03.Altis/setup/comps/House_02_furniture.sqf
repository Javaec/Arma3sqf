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
	_this = createVehicle ["Land_Metal_wooden_rack_F", [7554.291, 18353.346, 0.58424199], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -120.91701;
	_this setPos [7554.291, 18353.346, 0.58424199];
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

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [7553.3408, 18351.699, 0.45002934], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -34.006878;
	_this setPos [7553.3408, 18351.699, 0.45002934];
	_initCodes set [count _initCodes,[_this,"[133.202,""asl""] call BIS_fnc_setHeight;"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
