_initCodes = [];

_this = createCenter west;
_center_0 = _this;

_group_0 = createGroup _center_0;

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [6922.0757, 16336.682, 0.10879024], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir 53.786343;
	_this setPos [6922.0757, 16336.682, 0.10879024];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [-0.5,0,0]; this allowDamage false"]];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [6925.3232, 16344.146, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir 250.23743;
	_this setVehicleVarName "BIS_RepairTruck";
	BIS_RepairTruck = _this;
	_this setPos [6925.3232, 16344.146, -3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"this lock true; "]];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [6919.4839, 16335.834, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir 105.33472;
	_this setPos [6919.4839, 16335.834, -6.1035156e-005];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [1,0,0]"]];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [6921.228, 16329.874, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir -40.947258;
	_this setPos [6921.228, 16329.874, -7.6293945e-005];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [-0.75,0,0]"]];
};

_this = createCenter civilian;
_center_1 = _this;

_group_1 = createGroup _center_1;

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [6921.6396, 16338.807, -0.0001449585], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir -45.869648;
	_this setPos [6921.6396, 16338.807, -0.0001449585];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [6915.7656, 16453.867, 0.20438728], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir 138.89255;
	_this setPos [6915.7656, 16453.867, 0.20438728];
	_initCodes set [count _initCodes,[_this,"this lock true; "]];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TablePlastic_01_F", [7416.1387, 17167.479, -0.00046539307], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir -141.96446;
	_this setPos [7416.1387, 17167.479, -0.00046539307];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [7416.8804, 17168.453, -0.0005569458], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir 128.36459;
	_this setPos [7416.8804, 17168.453, -0.0005569458];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FishingGear_01_F", [7417.4424, 17172.051, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 0.42305675;
	_this setPos [7417.4424, 17172.051, 1.5258789e-005];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [7420.2021, 17169.596, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -58.798164;
	_this setPos [7420.2021, 17169.596, 4.5776367e-005];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_04_F", [7417.1987, 17167.777, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setPos [7417.1987, 17167.777, -1.5258789e-005];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [7148.4648, 16733.922, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir -7.8221726;
	_this setPos [7148.4648, 16733.922, -0.00012207031];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_CarDismantled_F", [7396.145, 17179.313, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir 34.494591;
	_this setPos [7396.145, 17179.313, -6.1035156e-005];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [7386.1709, 17182.15, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setDir 38.172878;
	_this setPos [7386.1709, 17182.15, -3.0517578e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [7391.3809, 17181.084, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir -157.47147;
	_this setPos [7391.3809, 17181.084, 1.5258789e-005];
};

_this = createCenter resistance;
_center_2 = _this;

_group_2 = createGroup _center_2;

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [7232.5352, 17394.02, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir 106.71349;
	_this setPos [7232.5352, 17394.02, 3.0517578e-005];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [6752.1904, 16264.672, 0.06903597], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -73.375923;
	_this setPos [6752.1904, 16264.672, 0.06903597];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [6913.5859, 16456.494, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 64.014183;
	_this setPos [6913.5859, 16456.494, -0.00012207031];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [6913.5244, 16455.938, -0.00023651123], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setPos [6913.5244, 16455.938, -0.00023651123];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [6913.0459, 16456.021, -0.0005645752], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setPos [6913.0459, 16456.021, -0.0005645752];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [6953.3379, 16672.625], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir -187.60017;
	_this setPos [6953.3379, 16672.625];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [7099.2324, 16771.039], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setDir 51.945782;
	_this setPos [7099.2324, 16771.039];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [7099.4971, 16771.314], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir 40.719391;
	_this setPos [7099.4971, 16771.314];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [7099.9014, 16770.988, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir 103.58768;
	_this setPos [7099.9014, 16770.988, -3.0517578e-005];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [7141.2769, 16714.664, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setPos [7141.2769, 16714.664, -1.5258789e-005];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBarrel_01_F", [7377.959, 17181.365, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir -132.80717;
	_this setPos [7377.959, 17181.365, -0.00012207031];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [7140.2832, 16715.17, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir -135.04655;
	_this setPos [7140.2832, 16715.17, 1.5258789e-005];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [7142.2729, 16712.816, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 277.53931;
	_this setPos [7142.2729, 16712.816, -5.3405762e-005];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Timbers_F", [7254.0083, 17595.006, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 7.4825249;
	_this setPos [7254.0083, 17595.006, 3.0517578e-005];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Timbers_F", [7251.125, 17598.822, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir -3.8095572;
	_this setPos [7251.125, 17598.822, -3.0517578e-005];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
