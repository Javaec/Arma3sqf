activateAddons [
];

if !(isNull findDisplay 128) then {[] call (uinamespace getvariable 'bis_fnc_recompile');};
_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_group_0 = createGroup _center_0;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["C_man_p_fugitive_F_euro", [14398.635, 17978.602], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [14398.635, 17978.602];
	_this setDir 229.50487;
	_this setVehicleVarName "BIS_placeholderPlayer";
	BIS_placeholderPlayer = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14395.502, 17975.619, 1.4781952e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir 53.727291;
	_this setPos [14395.502, 17975.619, 1.4781952e-005];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14399.222, 17970.689, 0.097791538], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 149.97914;
	_this setPos [14399.222, 17970.689, 0.097791538];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [14395.688, 17969.623, 0.1969301], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 210.00385;
	_this setPos [14395.688, 17969.623, 0.1969301];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [14394.012, 17974.281, -0.0016808145], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir 311.17712;
	_this setPos [14394.012, 17974.281, -0.0016808145];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [14388.64, 17980.52, 8.9168549e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir 102.29798;
	_this setPos [14388.64, 17980.52, 8.9168549e-005];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Defibrillator_F", [14387.685, 17981.975, 3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 128.86244;
	_this setPos [14387.685, 17981.975, 3.4332275e-005];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [14387.516, 17982.447, 0.00010967255], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir 137.04892;
	_this setPos [14387.516, 17982.447, 0.00010967255];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [14388.215, 17982.461, -0.00012397766], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 106.91167;
	_this setPos [14388.215, 17982.461, -0.00012397766];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [14388.082, 17982.266, -6.0081482e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 72.511513;
	_this setPos [14388.082, 17982.266, -6.0081482e-005];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [14388.216, 17982.297, -4.9591064e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir 106.91167;
	_this setPos [14388.216, 17982.297, -4.9591064e-005];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [14387.785, 17979.809, 5.0544739e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir 327.00525;
	_this setPos [14387.785, 17979.809, 5.0544739e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [14399.333, 17966.209, 1.0967255e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 489.98087;
	_this setPos [14399.333, 17966.209, 1.0967255e-005];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [14390.982, 17979.172, 0.00011062622], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir 189.33025;
	_this setPos [14390.982, 17979.172, 0.00011062622];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14391.291, 17979.818, -1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -13.873436;
	_this setPos [14391.291, 17979.818, -1.7166138e-005];
};

_this = createCenter west;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_medic_F", [14386.505, 17982.283, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [14386.505, 17982.283, -1.9073486e-006];
	_this setDir 39.317379;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_F", [14398.185, 17967.336, 7.8201294e-005], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [14398.185, 17967.336, 7.8201294e-005];
	_this setDir 132.45758;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [14382.004, 17986.449, 0.17655207], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir -198.15869;
	_this setVehicleVarName "BIS_Offroad";
	BIS_Offroad = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [14382.004, 17986.449, 0.17655207];
	_initCodes set [count _initCodes,[_this,"_repairCar = [] spawn {sleep 5; BIS_Offroad setObjectTexture [0, ""\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa""]; BIS_Offroad animate [""HidePolice"", 1]; BIS_Offroad animate [""HideServices"", 0]; BIS_Offroad animate [""HideBackpacks"", 1]; BIS_Offroad animate [""HideBumper1"", 1]; BIS_Offroad animate [""HideBumper2"", 1]; BIS_Offroad animate [""HideConstruction"", 1]; BIS_Offroad animate [""HideDoor3"", 0];}"]];
};

_group_2 = createGroup _center_0;

_unit_4 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["C_man_w_worker_F", [14387.756, 17983.471, -3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [14387.756, 17983.471, -3.4332275e-005];
	_this setDir -131.9631;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_sport_F", [14496.69, 17908.826, 0.1505668], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir 38.419674;
	_this setPos [14496.69, 17908.826, 0.1505668];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [14497.024, 17906.68, 0.00012969971], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setDir 55.698818;
	_this setPos [14497.024, 17906.68, 0.00012969971];
};

_group_3 = createGroup _center_0;

_unit_5 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["C_man_polo_1_F_asia", [14498.632, 17907.404, -0.00018882751], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [14498.632, 17907.404, -0.00018882751];
	_this setDir 184.28113;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["C_man_polo_5_F_euro", [14497.989, 17906.301, -0.0003490448], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [14497.989, 17906.301, -0.0003490448];
	_this setDir 9.9377995;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [14468.72, 17904.791, 0.18703121], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -115.22311;
	_this setPos [14468.72, 17904.791, 0.18703121];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_F", [14454.881, 17913.002, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir 31.272243;
	_this setPos [14454.881, 17913.002, -5.7220459e-005];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
