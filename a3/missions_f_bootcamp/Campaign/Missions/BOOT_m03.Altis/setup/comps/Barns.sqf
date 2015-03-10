_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [7479.1499, 18327.045, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -111.28202;
	_this setPos [7479.1499, 18327.045, 3.0517578e-005];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [7479.5635, 18327.492, 0.00019836426], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 45.278358;
	_this setPos [7479.5635, 18327.492, 0.00019836426];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [7480.5581, 18328.846, 0.00044250488], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir 13.39765;
	_this setPos [7480.5581, 18328.846, 0.00044250488];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterOil_F", [7482.0952, 18327.73, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir 14.250582;
	_this setPos [7482.0952, 18327.73, 0.0001373291];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_fire_F", [7480.3013, 18328.262, 0.00047302246], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setPos [7480.3013, 18328.262, 0.00047302246];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Hammer_F", [7480.3257, 18328.184, 0.00048828125], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir 9.2174768;
	_this setPos [7480.3257, 18328.184, 0.00048828125];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [7480.9067, 18326.586, 0.00038146973], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -116.57479;
	_this setPos [7480.9067, 18326.586, 0.00038146973];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [7511.5264, 18308.15, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -85.70787;
	_this setPos [7511.5264, 18308.15, 6.1035156e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelSand_grey_F", [7512.7881, 18308.416, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 38.98045;
	_this setPos [7512.7881, 18308.416, 1.5258789e-005];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [7512.3687, 18307.531], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -4.5018678;
	_this setPos [7512.3687, 18307.531];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [7511.6172, 18303.773, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir -74.609428;
	_this setPos [7511.6172, 18303.773, 1.5258789e-005];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [7511.5029, 18303.369], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir -18.81863;
	_this setPos [7511.5029, 18303.369];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WorkStand_F", [7511.5146, 18304.324, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -92.429718;
	_this setPos [7511.5146, 18304.324, -3.0517578e-005];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelWater_F", [7513.605, 18308.336, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -37.97102;
	_this setPos [7513.605, 18308.336, 7.6293945e-005];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [7512.3311, 18314.568, 0.42854229], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setPos [7512.3311, 18314.568, 0.42854229];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [7517.0313, 18314.988, 0.43501765], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir 2.1800792;
	_this setPos [7517.0313, 18314.988, 0.43501765];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [7513.1592, 18314.928, 0.40439957], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir 61.248154;
	_this setPos [7513.1592, 18314.928, 0.40439957];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [7513.3037, 18313.926, 0.37934399], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 80.753708;
	_this setPos [7513.3037, 18313.926, 0.37934399];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [7517.0908, 18311.9, 0.33756143], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setPos [7517.0908, 18311.9, 0.33756143];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [7515.6777, 18310.223, 0.30772895], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir 90.705261;
	_this setPos [7515.6777, 18310.223, 0.30772895];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenBox_F", [7513.7773, 18310.41, 0.29019815], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -3.544858;
	_this setPos [7513.7773, 18310.41, 0.29019815];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [7516.562, 18319.885, 0.94318593], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir -92.715157;
	_this setPos [7516.562, 18319.885, 0.94318593];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesPlastic_F", [7517.0894, 18321.734, 0.84867293], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir 101.09551;
	_this setPos [7517.0894, 18321.734, 0.84867293];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesPlastic_F", [7516.9844, 18327.801, 1.2564213], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir 23.740496;
	_this setPos [7516.9844, 18327.801, 1.2564213];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [7512.1978, 18325.275, 1.1083075], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -179.31409;
	_this setPos [7512.1978, 18325.275, 1.1083075];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesWooden_F", [7512.3306, 18320.262, 0.87063825], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir -88.21299;
	_this setPos [7512.3306, 18320.262, 0.87063825];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_goods_F", [7517.1377, 18326.23, 0.90385944], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir -142.06755;
	_this setPos [7517.1377, 18326.23, 0.90385944];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_heap_F", [7517.2295, 18323.611, 1.0279027], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 87.867836;
	_this setPos [7517.2295, 18323.611, 1.0279027];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [7512.1567, 18324.094, 1.0803921], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -269.31631;
	_this setPos [7512.1567, 18324.094, 1.0803921];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [7513.1636, 18328.371, 1.2730035], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setPos [7513.1636, 18328.371, 1.2730035];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [7514.4712, 18328.396, 1.2511585], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setDir -0.57207978;
	_this setPos [7514.4712, 18328.396, 1.2511585];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [7515.1719, 18313.953, 0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setPos [7515.1719, 18313.953, 0.00012207031];
	_initCodes set [count _initCodes,[_this,"[139.107,""asl""] call BIS_fnc_setHeight;"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
