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
	_this = _group_0 createUnit ["C_man_p_fugitive_F_euro", [14049.574, 18643.195, 0.093171418], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [14049.574, 18643.195, 0.093171418];
	_this setDir 783.1701;
	_this setVehicleVarName "BIS_placeholderPlayer";
	BIS_placeholderPlayer = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14066.113, 18549.434, 3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir 32.866005;
	_this setPos [14066.113, 18549.434, 3.6239624e-005];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14063.386, 18551.135, 4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 32.866005;
	_this setPos [14063.386, 18551.135, 4.3869019e-005];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14055.252, 18556.623, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir 39.553673;
	_this setPos [14055.252, 18556.623, -7.6293945e-006];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14068.822, 18547.703, -8.2015991e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir 32.866005;
	_this setPos [14068.822, 18547.703, -8.2015991e-005];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14074.213, 18544.258, -0.00016212463], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 32.866005;
	_this setPos [14074.213, 18544.258, -0.00016212463];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14079.589, 18540.83, -0.00011444092], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 32.866005;
	_this setPos [14079.589, 18540.83, -0.00011444092];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14085.829, 18539.844, 7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -14.462584;
	_this setPos [14085.829, 18539.844, 7.0571899e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14082.701, 18539.617, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 10.377988;
	_this setPos [14082.701, 18539.617, 6.8664551e-005];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14076.871, 18542.547, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir 32.866005;
	_this setPos [14076.871, 18542.547, 9.5367432e-006];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14071.521, 18545.977, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 32.866005;
	_this setPos [14071.521, 18545.977, -4.196167e-005];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14081.891, 18536.977, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 124.38332;
	_this setPos [14081.891, 18536.977, 4.5776367e-005];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14052.759, 18556.219, -8.7738037e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -66.808395;
	_this setPos [14052.759, 18556.219, -8.7738037e-005];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14060.686, 18552.879, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir 32.866005;
	_this setPos [14060.686, 18552.879, -6.1035156e-005];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14058.015, 18554.604, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir 32.866005;
	_this setPos [14058.015, 18554.604, -5.7220459e-005];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14079.355, 18539.107, -0.00017547607], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [14079.355, 18539.107, -0.00017547607];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14076.714, 18540.746, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [14076.714, 18540.746, 9.1552734e-005];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14065.86, 18547.432, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [14065.86, 18547.432, 5.7220459e-006];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14063.074, 18549.254, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [14063.074, 18549.254, -3.8146973e-005];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14056.014, 18553.512, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setPos [14056.014, 18553.512, -3.8146973e-006];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14074.173, 18542.15, -8.2015991e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [14074.173, 18542.15, -8.2015991e-005];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14071.536, 18543.766, 0.0072193146], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setPos [14071.536, 18543.766, 0.0072193146];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14069.059, 18545.434, 0.013065338], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [14069.059, 18545.434, 0.013065338];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14059.73, 18551.258, 0.0085048676], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [14059.73, 18551.258, 0.0085048676];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14053.119, 18561.355, 0.00044631958], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setPos [14053.119, 18561.355, 0.00044631958];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBarrel_01_F", [14076.052, 18544.992, -5.1498413e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -63.719891;
	_this setPos [14076.052, 18544.992, -5.1498413e-005];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [14074.271, 18546.883, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir 31.464014;
	_this setPos [14074.271, 18546.883, -2.2888184e-005];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [14078.026, 18544.09, -7.2479248e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir -87.805817;
	_this setPos [14078.026, 18544.09, -7.2479248e-005];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [14066.669, 18551.26, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setDir 30.292315;
	_this setPos [14066.669, 18551.26, -6.2942505e-005];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageWashingMachine_F", [14069.021, 18550.604, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setDir 111.50287;
	_this setPos [14069.021, 18550.604, 1.9073486e-006];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [14073.55, 18552.563, 0.20620561], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setDir 129.95413;
	_this setPos [14073.55, 18552.563, 0.20620561];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [14046.685, 18584.475, -0.050081249], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir 265.70847;
	_this setPos [14046.685, 18584.475, -0.050081249];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14061.099, 18570.877, 7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir -56.184246;
	_this setPos [14061.099, 18570.877, 7.0571899e-005];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14057.346, 18565.262, 0.04650674], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -60.30439;
	_this setPos [14057.346, 18565.262, 0.04650674];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14059.182, 18568.07, 0.041416861], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setDir -57.224674;
	_this setPos [14059.182, 18568.07, 0.041416861];
};

_vehicle_88 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14055.67, 18562.486, 0.020537782], [], 0, "CAN_COLLIDE"];
	_vehicle_88 = _this;
	_this setDir -56.314724;
	_this setPos [14055.67, 18562.486, 0.020537782];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14063.122, 18573.668, -0.00019073486], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setDir -52.192436;
	_this setPos [14063.122, 18573.668, -0.00019073486];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14065.011, 18576.254, -0.00010108948], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir -57.224674;
	_this setPos [14065.011, 18576.254, -0.00010108948];
};

_vehicle_112 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14066.953, 18578.941, 0.022444688], [], 0, "CAN_COLLIDE"];
	_vehicle_112 = _this;
	_this setDir -52.192436;
	_this setPos [14066.953, 18578.941, 0.022444688];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14068.837, 18581.525, 0.01762132], [], 0, "CAN_COLLIDE"];
	_vehicle_113 = _this;
	_this setDir -57.224674;
	_this setPos [14068.837, 18581.525, 0.01762132];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14079.614, 18574.607, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir -138.60367;
	_this setPos [14079.614, 18574.607, 7.6293945e-005];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14088.807, 18567.609, -5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setDir -146.26242;
	_this setPos [14088.807, 18567.609, -5.9127808e-005];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14091.376, 18565.621, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_132 = _this;
	_this setDir -136.65665;
	_this setPos [14091.376, 18565.621, -9.1552734e-005];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14095.153, 18560.471, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir -115.14681;
	_this setPos [14095.153, 18560.471, 5.7220459e-006];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14095.947, 18557.379, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setDir -275.14078;
	_this setPos [14095.947, 18557.379, -6.1035156e-005];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14095.241, 18554.365, -8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir -238.63123;
	_this setPos [14095.241, 18554.365, -8.392334e-005];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14094.393, 18551.344, -7.2479248e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir -276.18814;
	_this setPos [14094.393, 18551.344, -7.2479248e-005];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [14083.362, 18541.213, -5.531311e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir 182.03864;
	_this setPos [14083.362, 18541.213, -5.531311e-005];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [14088.24, 18546.26, -0.18021372], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir 41.691875;
	_this setPos [14088.24, 18546.26, -0.18021372];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13941.572, 18726.863, -0.00010490417], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir 28.446051;
	_this setPos [13941.572, 18726.863, -0.00010490417];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13939.387, 18726.652, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setDir -28.005859;
	_this setPos [13939.387, 18726.652, -5.7220459e-005];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13938.827, 18728.354, -0.00015830994], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setDir -139.78505;
	_this setPos [13938.827, 18728.354, -0.00015830994];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13937.333, 18727.012, 3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir -142.85033;
	_this setPos [13937.333, 18727.012, 3.2424927e-005];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [13941.894, 18722.885, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir 59.791004;
	_this setPos [13941.894, 18722.885, -6.2942505e-005];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [13930.773, 18718.809, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setPos [13930.773, 18718.809, 3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTruck_01,[0.1,-1.3,-0.6]]"]];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [13942.947, 18721.666], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setDir -42.713772;
	_this setPos [13942.947, 18721.666];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [13935.413, 18729.971, -1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir 60.771446;
	_this setPos [13935.413, 18729.971, -1.335144e-005];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [13949.226, 18705.131, 0.13712496], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir -229.89503;
	_this setVehicleLock "LOCKED";
	_this setPos [13949.226, 18705.131, 0.13712496];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [13944.308, 18719.518, 0.22472329], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setDir 51.490925;
	_this setVehicleVarName "BIS_AthiraTruck_01";
	BIS_AthiraTruck_01 = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [13944.308, 18719.518, 0.22472329];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [13931.554, 18717.225, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setDir -23.322443;
	_this setPos [13931.554, 18717.225, 7.6293945e-006];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTruck_01,[-0.05,-2.5,-0.6]]"]];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Scaffolding_F", [13934.653, 18741.777, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir -21.621712;
	_this setPos [13934.653, 18741.777, -5.7220459e-005];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [0,0,1]"]];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [13860.525, 18656.434], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setDir 24.595415;
	_this setPos [13860.525, 18656.434];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [13861.723, 18653.809, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir 66.289009;
	_this setPos [13861.723, 18653.809, -7.6293945e-006];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_sport_F", [13962.856, 18657.68, 0.11237071], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setDir 92.41111;
	_this setVehicleLock "LOCKED";
	_this setPos [13962.856, 18657.68, 0.11237071];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["C_Quadbike_01_F", [13976.945, 18648.578, 0.2085894], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setDir -10.322964;
	_this setVehicleLock "LOCKED";
	_this setPos [13976.945, 18648.578, 0.2085894];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [13923.837, 18735.084, 0.19267756], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setDir -8.0132399;
	_this setPos [13923.837, 18735.084, 0.19267756];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [13927.115, 18724.67, -9.5367432e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setDir -152.04294;
	_this setPos [13927.115, 18724.67, -9.5367432e-005];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [13940.009, 18721.486, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setDir -19.033413;
	_this setPos [13940.009, 18721.486, -1.1444092e-005];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [13931.526, 18736.635, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir 190.29834;
	_this setPos [13931.526, 18736.635, 1.9073486e-005];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WorkStand_F", [13933.274, 18732.992, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setDir -117.68082;
	_this setPos [13933.274, 18732.992, 1.1444092e-005];
};

_vehicle_185 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Gloves_F", [13938.554, 18725.598, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_185 = _this;
	_this setDir -125.82021;
	_this setPos [13938.554, 18725.598, -4.7683716e-005];
};

_vehicle_191 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14101.569, 18472.443, 0.00011253357], [], 0, "CAN_COLLIDE"];
	_vehicle_191 = _this;
	_this setDir 56.237808;
	_this setPos [14101.569, 18472.443, 0.00011253357];
};

_vehicle_192 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Slide_F", [14111.167, 18460.854, -0.00011062622], [], 0, "CAN_COLLIDE"];
	_vehicle_192 = _this;
	_this setDir 61.818436;
	_this setPos [14111.167, 18460.854, -0.00011062622];
};

_vehicle_193 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SlideCastle_F", [14115.956, 18429.631, -7.2479248e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_193 = _this;
	_this setDir -29.458208;
	_this setPos [14115.956, 18429.631, -7.2479248e-005];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14116.084, 18442.133, -3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setDir 74.130592;
	_this setPos [14116.084, 18442.133, -3.4332275e-005];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14115.091, 18445.488, -0.00015640259], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setDir -106.25617;
	_this setPos [14115.091, 18445.488, -0.00015640259];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14113.972, 18448.545, -9.5367432e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setDir 74.130592;
	_this setPos [14113.972, 18448.545, -9.5367432e-005];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14107.059, 18475.002, 6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setDir 141.30428;
	_this setPos [14107.059, 18475.002, 6.4849854e-005];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14109.345, 18469.596], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setDir 233.70195;
	_this setPos [14109.345, 18469.596];
};

_vehicle_205 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14103.983, 18467.613, -0.00011253357], [], 0, "CAN_COLLIDE"];
	_vehicle_205 = _this;
	_this setDir -31.82081;
	_this setPos [14103.983, 18467.613, -0.00011253357];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SlideCastle_F", [14100.355, 18484.549, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setDir 51.814857;
	_this setPos [14100.355, 18484.549, -1.9073486e-006];
};

_vehicle_213 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14099.205, 18440.713, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_213 = _this;
	_this setDir 239.50464;
	_this setPos [14099.205, 18440.713, -2.6702881e-005];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14101.026, 18437.713, 0.12458611], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setDir 59.11784;
	_this setPos [14101.026, 18437.713, 0.12458611];
};

_vehicle_215 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14102.872, 18435.039, 0.23960876], [], 0, "CAN_COLLIDE"];
	_vehicle_215 = _this;
	_this setDir 239.50464;
	_this setPos [14102.872, 18435.039, 0.23960876];
};

_vehicle_220 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Slide_F", [14096.12, 18449.813, -9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_220 = _this;
	_this setDir 250.58005;
	_this setPos [14096.12, 18449.813, -9.9182129e-005];
};

_vehicle_222 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [13968.766, 18640.713, 0.83110738], [], 0, "CAN_COLLIDE"];
	_vehicle_222 = _this;
	_this setDir -59.3741;
	_this setPos [13968.766, 18640.713, 0.83110738];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [13960.573, 18645.725, 1.0341483], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setDir 118.12124;
	_this setPos [13960.573, 18645.725, 1.0341483];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [13971.969, 18645.676, 0.48152488], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setDir -59.042835;
	_this setPos [13971.969, 18645.676, 0.48152488];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [13963.443, 18650.59, 0.72092354], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setDir 119.49531;
	_this setPos [13963.443, 18650.59, 0.72092354];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_231 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13964.29, 18649.693, 0.7005074], [], 0, "CAN_COLLIDE"];
	_vehicle_231 = _this;
	_this setDir 116.91491;
	_this setPos [13964.29, 18649.693, 0.7005074];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_233 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13961.49, 18644.691, 1.0946023], [], 0, "CAN_COLLIDE"];
	_vehicle_233 = _this;
	_this setDir 120.36913;
	_this setPos [13961.49, 18644.691, 1.0946023];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_235 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13971.291, 18646.66, 0.63953882], [], 0, "CAN_COLLIDE"];
	_vehicle_235 = _this;
	_this setDir -32.032661;
	_this setPos [13971.291, 18646.66, 0.63953882];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_237 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13967.991, 18641.168, 1.0034658], [], 0, "CAN_COLLIDE"];
	_vehicle_237 = _this;
	_this setDir -76.769501;
	_this setPos [13967.991, 18641.168, 1.0034658];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_239 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13970.788, 18646.057, 0.79356855], [], 0, "CAN_COLLIDE"];
	_vehicle_239 = _this;
	_this setDir -61.259609;
	_this setPos [13970.788, 18646.057, 0.79356855];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_241 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13962.631, 18645.754, 1.1772937], [], 0, "CAN_COLLIDE"];
	_vehicle_241 = _this;
	_this setDir 90.067482;
	_this setPos [13962.631, 18645.754, 1.1772937];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13964.929, 18650.934, 0.74467164], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setDir -20.469633;
	_this setPos [13964.929, 18650.934, 0.74467164];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_247 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [14110.962, 18518.609, 0.40655121], [], 0, "CAN_COLLIDE"];
	_vehicle_247 = _this;
	_this setDir 38.573067;
	_this setVehicleLock "LOCKED";
	_this setPos [14110.962, 18518.609, 0.40655121];
};

_vehicle_248 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [14103.037, 18526.164, 0.2227947], [], 0, "CAN_COLLIDE"];
	_vehicle_248 = _this;
	_this setDir -125.4503;
	_this setPos [14103.037, 18526.164, 0.2227947];
};

_vehicle_250 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [14059.076, 18539.414, 0.15745398], [], 0, "CAN_COLLIDE"];
	_vehicle_250 = _this;
	_this setDir -151.70851;
	_this setVehicleVarName "BIS_AthiraTruck_02";
	BIS_AthiraTruck_02 = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [14059.076, 18539.414, 0.15745398];
};

_vehicle_251 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [14061.301, 18543.229, -0.00011253357], [], 0, "CAN_COLLIDE"];
	_vehicle_251 = _this;
	_this setPos [14061.301, 18543.229, -0.00011253357];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTruck_02,[0,-2.25,0.65]]"]];
};

_vehicle_252 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_UAZ_F", [14138.556, 18463.221, 0.11968378], [], 0, "CAN_COLLIDE"];
	_vehicle_252 = _this;
	_this setDir 79.491074;
	_this setPos [14138.556, 18463.221, 0.11968378];
};

_vehicle_253 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_CarDismantled_F", [13938.955, 18595.971, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_253 = _this;
	_this setDir -95.088593;
	_this setPos [13938.955, 18595.971, -0.0001373291];
};

_vehicle_254 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad2_F", [13851.642, 18655.09, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_254 = _this;
	_this setDir 146.17728;
	_this setPos [13851.642, 18655.09, -3.0517578e-005];
};

_vehicle_255 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [13864.977, 18692.713, -0.00019645691], [], 0, "CAN_COLLIDE"];
	_vehicle_255 = _this;
	_this setDir -23.912151;
	_this setPos [13864.977, 18692.713, -0.00019645691];
};

_vehicle_256 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [13898.202, 18686.912, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_256 = _this;
	_this setDir 24.646299;
	_this setPos [13898.202, 18686.912, -1.9073486e-006];
};

_vehicle_257 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sack_F", [13897.623, 18685.719, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_257 = _this;
	_this setDir -15.534001;
	_this setPos [13897.623, 18685.719, 9.5367432e-006];
};

_vehicle_258 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_goods_F", [13895.869, 18685.547, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_258 = _this;
	_this setDir 33.789066;
	_this setPos [13895.869, 18685.547, 7.6293945e-006];
};

_vehicle_259 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [13931.316, 18710.771, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_259 = _this;
	_this setPos [13931.316, 18710.771, -5.3405762e-005];
};

_vehicle_260 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [13871.153, 18693.697, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_260 = _this;
	_this setDir 13.112207;
	_this setPos [13871.153, 18693.697, 3.0517578e-005];
};

_vehicle_262 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_rocks_F", [13963.467, 18609.076, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_262 = _this;
	_this setDir -55.858814;
	_this setPos [13963.467, 18609.076, 7.6293945e-006];
};

_vehicle_263 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [14223.525, 18239.898, -7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_263 = _this;
	_this setDir 146.07759;
	_this setPos [14223.525, 18239.898, -7.0571899e-005];
};

_vehicle_264 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [14222.449, 18241.406, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_264 = _this;
	_this setDir 145.42502;
	_this setPos [14222.449, 18241.406, 1.1444092e-005];
};

_vehicle_265 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Slammer_F", [14217.279, 18237.758, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_265 = _this;
	_this setDir -48.194775;
	_this setPos [14217.279, 18237.758, 1.1444092e-005];
};

_group_1 = createGroup _center_0;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_Nikos_aged", [14059.286, 18654.656, -5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [14059.286, 18654.656, -5.9127808e-005];
	_this setDir -149.26079;
	_this setVehicleVarName "BIS_Nikos";
	BIS_Nikos = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim; this addGoggles ""G_Squares_tinted""; "]];
};

_this = createCenter west;
_center_2 = _this;

_group_4 = createGroup _center_2;

_unit_3 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["B_G_Soldier_F", [14057.443, 18656.475, -0.00010108948], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [14057.443, 18656.475, -0.00010108948];
	_this setDir -111.30006;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVestIR_blk""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this addUniform ""U_BG_Guerilla2_2""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Shades_Red"";   "]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["B_G_Soldier_F", [14060.716, 18652.25, -0.00010108948], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [14060.716, 18652.25, -0.00010108948];
	_this setDir -124.68253;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVestIR_blk""; {this addMagazine ""30Rnd_65x39_caseless_mag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_MXC_Black_F""; this addPrimaryWeaponItem ""optic_aco""; this addUniform ""U_BG_Guerilla2_3""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Squares"";   "]];
};

_vehicle_266 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14008.336, 18636.244, 0.91479164], [], 0, "CAN_COLLIDE"];
	_vehicle_266 = _this;
	_this setDir -72.671059;
	_this setPos [14008.336, 18636.244, 0.91479164];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_268 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14011.747, 18634.969, 0.69539338], [], 0, "CAN_COLLIDE"];
	_vehicle_268 = _this;
	_this setDir -69.136444;
	_this setPos [14011.747, 18634.969, 0.69539338];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_270 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14010.564, 18634.063, 0.87717509], [], 0, "CAN_COLLIDE"];
	_vehicle_270 = _this;
	_this setDir 210.77699;
	_this setPos [14010.564, 18634.063, 0.87717509];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_272 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14011.458, 18634.045, 0.81440073], [], 0, "CAN_COLLIDE"];
	_vehicle_272 = _this;
	_this setDir 184.63353;
	_this setPos [14011.458, 18634.045, 0.81440073];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_274 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14007.541, 18635.156, 0.93680942], [], 0, "CAN_COLLIDE"];
	_vehicle_274 = _this;
	_this setDir 189.89717;
	_this setPos [14007.541, 18635.156, 0.93680942];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_276 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [14021.231, 18631.322, 0.63620323], [], 0, "CAN_COLLIDE"];
	_vehicle_276 = _this;
	_this setDir 108.14132;
	_this setPos [14021.231, 18631.322, 0.63620323];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_278 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [14016.088, 18633.295, 0.72861844], [], 0, "CAN_COLLIDE"];
	_vehicle_278 = _this;
	_this setDir -70.148857;
	_this setPos [14016.088, 18633.295, 0.72861844];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_280 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14020.968, 18630.59, 0.74707669], [], 0, "CAN_COLLIDE"];
	_vehicle_280 = _this;
	_this setDir 183.5696;
	_this setPos [14020.968, 18630.59, 0.74707669];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_282 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14015.965, 18632.588, 0.81960404], [], 0, "CAN_COLLIDE"];
	_vehicle_282 = _this;
	_this setDir 196.07622;
	_this setPos [14015.965, 18632.588, 0.81960404];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_285 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14019.98, 18629.607, 0.66628897], [], 0, "CAN_COLLIDE"];
	_vehicle_285 = _this;
	_this setDir 160.58258;
	_this setPos [14019.98, 18629.607, 0.66628897];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_288 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_04_F", [14009.91, 18635.506, 1.1584228], [], 0, "CAN_COLLIDE"];
	_vehicle_288 = _this;
	_this setPos [14009.91, 18635.506, 1.1584228];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_292 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14026.71, 18649.201, 0.86718047], [], 0, "CAN_COLLIDE"];
	_vehicle_292 = _this;
	_this setDir 18.876457;
	_this setPos [14026.71, 18649.201, 0.86718047];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_294 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14019.95, 18650.922, 1.1235386], [], 0, "CAN_COLLIDE"];
	_vehicle_294 = _this;
	_this setDir -70.855499;
	_this setPos [14019.95, 18650.922, 1.1235386];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_296 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14028.471, 18655.438, 0.59138209], [], 0, "CAN_COLLIDE"];
	_vehicle_296 = _this;
	_this setDir -71.292351;
	_this setPos [14028.471, 18655.438, 0.59138209];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_298 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14026.575, 18656.154, 0.59167826], [], 0, "CAN_COLLIDE"];
	_vehicle_298 = _this;
	_this setDir -66.016609;
	_this setPos [14026.575, 18656.154, 0.59167826];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_300 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14022.108, 18653.348, 0.93916589], [], 0, "CAN_COLLIDE"];
	_vehicle_300 = _this;
	_this setDir -108.75812;
	_this setPos [14022.108, 18653.348, 0.93916589];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_302 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14020.234, 18652.09, 1.1562546], [], 0, "CAN_COLLIDE"];
	_vehicle_302 = _this;
	_this setDir -19.356985;
	_this setPos [14020.234, 18652.09, 1.1562546];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_304 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14027.823, 18654.568, 0.63043463], [], 0, "CAN_COLLIDE"];
	_vehicle_304 = _this;
	_this setDir -155.90556;
	_this setPos [14027.823, 18654.568, 0.63043463];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_306 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14026.063, 18649.51, 0.87575299], [], 0, "CAN_COLLIDE"];
	_vehicle_306 = _this;
	_this setDir -66.016609;
	_this setPos [14026.063, 18649.51, 0.87575299];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_308 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14025.881, 18648.955, 0.8199029], [], 0, "CAN_COLLIDE"];
	_vehicle_308 = _this;
	_this setDir -66.016609;
	_this setPos [14025.881, 18648.955, 0.8199029];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_310 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14039.752, 18664.119, 0.1922103], [], 0, "CAN_COLLIDE"];
	_vehicle_310 = _this;
	_this setDir -295.94489;
	_this setVehicleLock "LOCKED";
	_this setPos [14039.752, 18664.119, 0.1922103];
};

_vehicle_311 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TablePlastic_01_F", [14058.151, 18653.871, -7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_311 = _this;
	_this setDir 54.309326;
	_this setVehicleVarName "BIS_AthiraTable";
	BIS_AthiraTable = _this;
	_this setPos [14058.151, 18653.871, -7.0571899e-005];
};

_vehicle_312 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Laptop_unfolded_F", [14049.553, 18651.75, 1.0909926], [], 0, "CAN_COLLIDE"];
	_vehicle_312 = _this;
	_this setDir 94.937119;
	_this setPos [14049.553, 18651.75, 1.0909926];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTable,[-0.2,0.3,0.60]]"]];
};

_group_5 = createGroup _center_0;

_unit_5 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_p_beggar_F_afro", [14110.528, 18514.885, -0.0055749705], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [14110.528, 18514.885, -0.0055749705];
	_this setDir 89.133965;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_polo_4_F_asia", [14111.716, 18514.152, 0.037223078], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [14111.716, 18514.152, 0.037223078];
	_this setDir -85.516617;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_shorts_2_F_euro", [14114.568, 18511.902, 0.44537923], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [14114.568, 18511.902, 0.44537923];
	_this setDir -157.44116;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_group_6 = createGroup _center_2;

_unit_10 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_Soldier_lite_F", [14085.226, 18536.834, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [14085.226, 18536.834, -4.196167e-005];
	_this setDir -204.6891;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;  "]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_Soldier_lite_F", [14059.382, 18555.596, 0.00017356873], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [14059.382, 18555.596, 0.00017356873];
	_this setDir -124.46992;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;  "]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_shorts_2_F_asia", [13997.489, 18569.58, 0.58860904], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [13997.489, 18569.58, 0.58860904];
	_this setDir 5.6581106;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U2"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_p_shorts_1_F_asia", [13997.582, 18570.797, 0.5115732], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [13997.582, 18570.797, 0.5115732];
	_this setDir 102.9408;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_313 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [14002.896, 18569.846, 9.727478e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_313 = _this;
	_this setDir -63.373077;
	_this setPos [14002.896, 18569.846, 9.727478e-005];
};

_vehicle_314 = objNull;
if (true) then
{
	_this = createVehicle ["C_Quadbike_01_F", [13988.956, 18592.836, 0.25085217], [], 0, "CAN_COLLIDE"];
	_vehicle_314 = _this;
	_this setDir 36.526455;
	_this setPos [13988.956, 18592.836, 0.25085217];
};

_vehicle_315 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [13989.505, 18591.746, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_315 = _this;
	_this setDir 64.728279;
	_this setPos [13989.505, 18591.746, 2.0980835e-005];
};

_vehicle_316 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [13921.51, 18626.811, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_316 = _this;
	_this setDir -130.44305;
	_this setPos [13921.51, 18626.811, -6.2942505e-005];
};

_vehicle_317 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [13917.914, 18627.381, 0.18007135], [], 0, "CAN_COLLIDE"];
	_vehicle_317 = _this;
	_this setDir -159.65372;
	_this setPos [13917.914, 18627.381, 0.18007135];
};

_vehicle_318 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [13919.959, 18626.098, -0.00023460388], [], 0, "CAN_COLLIDE"];
	_vehicle_318 = _this;
	_this setDir -21.4389;
	_this setPos [13919.959, 18626.098, -0.00023460388];
};

_vehicle_320 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [13876.402, 18696.057, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_320 = _this;
	_this setDir -123.67081;
	_this setPos [13876.402, 18696.057, -1.9073486e-006];
};

_group_8 = createGroup _center_0;

_unit_14 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_polo_2_F", [13903.191, 18692.004, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [13903.191, 18692.004, -0.0001373291];
	_this setDir -123.6002;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_shorts_1_F_afro", [13902.001, 18691.496, -0.00010299683], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [13902.001, 18691.496, -0.00010299683];
	_this setDir 68.976624;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_p_beggar_F_asia", [13914.545, 18698.555, 1.0448589], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [13914.545, 18698.555, 1.0448589];
	_this setDir -59.995602;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U3"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_group_9 = createGroup _center_0;

_unit_17 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_1", [13977.876, 18668.686, 0.23678231], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [13977.876, 18668.686, 0.23678231];
	_this setDir -245.14235;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_1_F_afro", [13960.077, 18659.668, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [13960.077, 18659.668, -7.6293945e-005];
	_this setDir 63.764133;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F", [13975.087, 18648.584, 4.9591064e-005], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [13975.087, 18648.584, 4.9591064e-005];
	_this setDir 77.903305;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""REPAIR_VEH_KNEEL""] call BIS_fnc_ambientAnim;  "]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_3_F_afro", [13949.104, 18703.293, 0.00016021729], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [13949.104, 18703.293, 0.00016021729];
	_this setDir -177.58423;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_4_F_asia", [13952.481, 18695.365, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [13952.481, 18695.365, 9.9182129e-005];
	_this setDir -37.176697;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_5_F_afro", [13948.902, 18702.068, -7.4386597e-005], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [13948.902, 18702.068, -7.4386597e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_shorts_1_F_asia", [13952.736, 18696.568, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [13952.736, 18696.568, -9.1552734e-005];
	_this setDir 252.24716;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U2"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_24 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_1_1_F", [13952.541, 18669.371, 4.1143546], [], 0, "CAN_COLLIDE"];
	_unit_24 = _this;
	_this setPos [13952.541, 18669.371, 4.1143546];
	_this setDir 48.161552;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_p_fugitive_F_asia", [13963.328, 18659.865, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [13963.328, 18659.865, 4.7683716e-005];
	_this setDir 269.61533;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_26 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_p_shorts_1_F_euro", [13954.557, 18691.545, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_unit_26 = _this;
	_this setPos [13954.557, 18691.545, 1.335144e-005];
	_this setDir 203.79181;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_hunter_1_F", [13953.925, 18690.418, -5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [13953.925, 18690.418, -5.7220459e-006];
	_this setDir 22.928234;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_322 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_03_F", [13961.532, 18659.961, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_322 = _this;
	_this setPos [13961.532, 18659.961, 1.5258789e-005];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14007.65, 18635.482, 0.97052419], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [14007.65, 18635.482, 0.97052419];
	_this setDir -1.2407066;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_4_F", [14008.915, 18633.244, 0.96638787], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [14008.915, 18633.244, 0.96638787];
	_this setDir 90.633118;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [14023.363, 18649.742, 0.96719694], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [14023.363, 18649.742, 0.96719694];
	_this setDir 97.7267;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [13986.598, 18664.627, 0.26916644], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [13986.598, 18664.627, 0.26916644];
	_this setDir 18.676405;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_shorts_4_F", [14009.868, 18633.084, 0.83791447], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [14009.868, 18633.084, 0.83791447];
	_this setDir -91.245819;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_34 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_hunter_1_F", [14024.578, 18649.957, 0.92926675], [], 0, "CAN_COLLIDE"];
	_unit_34 = _this;
	_this setPos [14024.578, 18649.957, 0.92926675];
	_this setDir -127.58971;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_324 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [14227.839, 18286.441, 0.15737602], [], 0, "CAN_COLLIDE"];
	_vehicle_324 = _this;
	_this setDir 333.18256;
	_this setVehicleVarName "BIS_Offroad";
	BIS_Offroad = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [14227.839, 18286.441, 0.15737602];
	_initCodes set [count _initCodes,[_this,"_policecar = [] spawn {sleep 5; BIS_Offroad setObjectTexture [0, ""\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa""]; BIS_Offroad animate [""HidePolice"", 0]; BIS_Offroad animate [""HideServices"", 1]; BIS_Offroad animate [""HideBackpacks"", 1]; BIS_Offroad animate [""HideBumper1"", 0]; BIS_Offroad animate [""HideBumper2"", 0]; BIS_Offroad animate [""HideConstruction"", 0]; BIS_Offroad animate [""HideDoor3"", 1];}"]];
};

_group_11 = createGroup _center_2;

_unit_36 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_Soldier_GL_F", [14225.374, 18284.799, -5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_unit_36 = _this;
	_this setPos [14225.374, 18284.799, -5.7220459e-006];
	_this setDir 57.600201;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim; "]];
};

_unit_37 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_G_Soldier_F", [14226.834, 18285.596, -4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_unit_37 = _this;
	_this setPos [14226.834, 18285.596, -4.3869019e-005];
	_this setDir 226.43709;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""LEAN"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVest_blk_POLICE""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_Mk20_ACO_F""; this addPrimaryWeaponItem ""optic_hamr""; this addUniform ""U_BG_Guerilla2_3""; this addHeadgear ""H_Beret_blk_POLICE"";    "]];
};

_unit_40 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_Soldier_F", [14205.996, 18314.242, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_unit_40 = _this;
	_this setPos [14205.996, 18314.242, 2.2888184e-005];
	_this setDir 26.728456;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""REPAIR_VEH_STAND"",""ASIS""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_325 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_transport_F", [14210.695, 18313.676, 0.1125776], [], 0, "CAN_COLLIDE"];
	_vehicle_325 = _this;
	_this setDir -58.973503;
	_this setVehicleVarName "BIS_shipHEMTT";
	BIS_shipHEMTT = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [14210.695, 18313.676, 0.1125776];
};

_vehicle_329 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_01_police_F", [14224.654, 18266.35, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_329 = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [14224.654, 18266.35, 3.8146973e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_shipHEMTT,[0,-2.3,1]]"]];
};

_vehicle_330 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14115.03, 18512.904, 0.13188811], [], 0, "CAN_COLLIDE"];
	_vehicle_330 = _this;
	_this setDir 121.3756;
	_this setPos [14115.03, 18512.904, 0.13188811];
};

_vehicle_331 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13997.071, 18569.318, 0.58791703], [], 0, "CAN_COLLIDE"];
	_vehicle_331 = _this;
	_this setDir -52.259186;
	_this setPos [13997.071, 18569.318, 0.58791703];
};

_vehicle_333 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13996.96, 18570.957, 0.5436995], [], 0, "CAN_COLLIDE"];
	_vehicle_333 = _this;
	_this setDir 7.6779175;
	_this setPos [13996.96, 18570.957, 0.5436995];
};

_vehicle_335 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TablePlastic_01_F", [13998.853, 18569.594, 0.38402566], [], 0, "CAN_COLLIDE"];
	_vehicle_335 = _this;
	_this setDir 115.79787;
	_this setPos [13998.853, 18569.594, 0.38402566];
};

_vehicle_336 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13914.861, 18698.203, 1.0837141], [], 0, "CAN_COLLIDE"];
	_vehicle_336 = _this;
	_this setDir 137.77013;
	_this setPos [13914.861, 18698.203, 1.0837141];
};

_vehicle_337 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13952.589, 18694.793, 4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_337 = _this;
	_this setDir -107.17069;
	_this setPos [13952.589, 18694.793, 4.0054321e-005];
};

_vehicle_338 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13953.292, 18696.627, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_338 = _this;
	_this setDir -188.19496;
	_this setPos [13953.292, 18696.627, 3.8146973e-005];
};

_vehicle_339 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13952.691, 18697.834, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_339 = _this;
	_this setDir 130.13348;
	_this setPos [13952.691, 18697.834, 5.7220459e-006];
};

_unit_42 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [14020.28, 18651.762, 1.0604281], [], 0, "CAN_COLLIDE"];
	_unit_42 = _this;
	_this setPos [14020.28, 18651.762, 1.0604281];
	_this setDir 119.92361;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U3"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_44 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_afro", [13978.862, 18668.16, 0.14819823], [], 0, "CAN_COLLIDE"];
	_unit_44 = _this;
	_this setPos [13978.862, 18668.16, 0.14819823];
	_this setDir -80.430794;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_46 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14016.813, 18628.498, 3.9481163], [], 0, "CAN_COLLIDE"];
	_unit_46 = _this;
	_this setPos [14016.813, 18628.498, 3.9481163];
	_this setDir 26.330374;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_340 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14016.688, 18628.283, 3.9685292], [], 0, "CAN_COLLIDE"];
	_vehicle_340 = _this;
	_this setDir -69.172211;
	_this setPos [14016.688, 18628.283, 3.9685292];
};

_unit_50 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [13934.683, 18726.549, 3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_unit_50 = _this;
	_this setPos [13934.683, 18726.549, 3.4332275e-005];
	_this setDir 93.163658;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_343 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14037.595, 18654.664, -0.00019073486], [], 0, "CAN_COLLIDE"];
	_vehicle_343 = _this;
	_this setDir 107.16638;
	_this setVehicleVarName "BIS_infPoint1";
	BIS_infPoint1 = _this;
	_this setPos [14037.595, 18654.664, -0.00019073486];
};

_vehicle_348 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14038.052, 18653.643, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_348 = _this;
	_this setDir 104.55103;
	_this setVehicleVarName "BIS_journalistPoint1";
	BIS_journalistPoint1 = _this;
	_this setPos [14038.052, 18653.643, -0.00012207031];
};

_vehicle_351 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14050.378, 18652.496, -0.00025939941], [], 0, "CAN_COLLIDE"];
	_vehicle_351 = _this;
	_this setDir 225.02425;
	_this setVehicleVarName "BIS_nikosPoint1";
	BIS_nikosPoint1 = _this;
	_this setPos [14050.378, 18652.496, -0.00025939941];
};

_vehicle_353 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [14037.207, 18654.188, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_353 = _this;
	_this setVehicleVarName "BIS_triggerPoint1";
	BIS_triggerPoint1 = _this;
	_this setPos [14037.207, 18654.188, -3.8146973e-006];
};

_vehicle_357 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14050.348, 18648.742, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_357 = _this;
	_this setDir 56.372807;
	_this setVehicleVarName "BIS_infPoint2";
	BIS_infPoint2 = _this;
	_this setPos [14050.348, 18648.742, -5.3405762e-005];
};

_vehicle_358 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14051.556, 18648.609, 0.017980576], [], 0, "CAN_COLLIDE"];
	_vehicle_358 = _this;
	_this setDir 53.777016;
	_this setVehicleVarName "BIS_journalistPoint2";
	BIS_journalistPoint2 = _this;
	_this setPos [14051.556, 18648.609, 0.017980576];
};

_vehicle_359 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [14054.201, 18650.986, 0.011951447], [], 0, "CAN_COLLIDE"];
	_vehicle_359 = _this;
	_this setDir -101.46418;
	_this setVehicleVarName "BIS_triggerPoint2";
	BIS_triggerPoint2 = _this;
	_this setPos [14054.201, 18650.986, 0.011951447];
};

_vehicle_364 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14059.092, 18654.602, -4.9591064e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_364 = _this;
	_this setDir 233.91498;
	_this setVehicleVarName "BIS_nikosPoint2";
	BIS_nikosPoint2 = _this;
	_this setPos [14059.092, 18654.602, -4.9591064e-005];
};

_vehicle_365 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14195.877, 18305.096, 0.1296604], [], 0, "CAN_COLLIDE"];
	_vehicle_365 = _this;
	_this setDir -27.385178;
	_this setPos [14195.877, 18305.096, 0.1296604];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.345"]];
};

_vehicle_373 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14054.237, 18559.578, 0.000207901], [], 0, "CAN_COLLIDE"];
	_vehicle_373 = _this;
	_this setDir -70.917755;
	_this setPos [14054.237, 18559.578, 0.000207901];
};

_vehicle_381 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14052.44, 18558.674, 0.00010871887], [], 0, "CAN_COLLIDE"];
	_vehicle_381 = _this;
	_this setPos [14052.44, 18558.674, 0.00010871887];
};

_vehicle_384 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [14071.185, 18581.988, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_384 = _this;
	_this setDir 31.008518;
	_this setPos [14071.185, 18581.988, -4.5776367e-005];
};

_vehicle_385 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14060.106, 18654, 6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_385 = _this;
	_this setDir -182.12907;
	_this setPos [14060.106, 18654, 6.2942505e-005];
};

_vehicle_386 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V2_F", [14060.303, 18653.521], [], 0, "CAN_COLLIDE"];
	_vehicle_386 = _this;
	_this setPos [14060.303, 18653.521];
};

_vehicle_387 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_01_F", [14057.721, 18655.242, -9.727478e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_387 = _this;
	_this setDir -4.9597483;
	_this setPos [14057.721, 18655.242, -9.727478e-005];
};

_vehicle_388 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_01_F", [14059.419, 18652.947, -0.00012397766], [], 0, "CAN_COLLIDE"];
	_vehicle_388 = _this;
	_this setDir -9.989624;
	_this setPos [14059.419, 18652.947, -0.00012397766];
};

_vehicle_389 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V1_F", [14060.397, 18653.484, -0.00010299683], [], 0, "CAN_COLLIDE"];
	_vehicle_389 = _this;
	_this setDir 19.812412;
	_this setPos [14060.397, 18653.484, -0.00010299683];
};

_vehicle_390 = objNull;
if (true) then
{
	_this = createVehicle ["Land_File1_F", [14058.906, 18651.416, -1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_390 = _this;
	_this setPos [14058.906, 18651.416, -1.7166138e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTable,[0.4,0.1,0.45]]"]];
};

_vehicle_392 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MobilePhone_smart_F", [14057.26, 18652.254, 0.23637271], [], 0, "CAN_COLLIDE"];
	_vehicle_392 = _this;
	_this setPos [14057.26, 18652.254, 0.23637271];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTable,[0.55,0.4,0.45]]"]];
};

_vehicle_393 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14077.811, 18588.891, 0.13497896], [], 0, "CAN_COLLIDE"];
	_vehicle_393 = _this;
	_this setDir -27.526924;
	_this setVehicleLock "LOCKED";
	_this setPos [14077.811, 18588.891, 0.13497896];
};

_vehicle_394 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [14095.221, 18618.822, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_394 = _this;
	_this setDir 9.8642817;
	_this setPos [14095.221, 18618.822, 4.7683716e-005];
};

_vehicle_395 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [14076.714, 18593.279, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_395 = _this;
	_this setPos [14076.714, 18593.279, -5.7220459e-005];
};

_vehicle_396 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [14108.173, 18624.906, -0.00011634827], [], 0, "CAN_COLLIDE"];
	_vehicle_396 = _this;
	_this setPos [14108.173, 18624.906, -0.00011634827];
};

_vehicle_397 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [14108.153, 18624.588, -6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_397 = _this;
	_this setDir -34.588215;
	_this setPos [14108.153, 18624.588, -6.4849854e-005];
};

_vehicle_398 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [14090.171, 18648.078, -0.00036048889], [], 0, "CAN_COLLIDE"];
	_vehicle_398 = _this;
	_this setDir -123.35413;
	_this setPos [14090.171, 18648.078, -0.00036048889];
};

_unit_52 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14079.689, 18674.467, 0.11105608], [], 0, "CAN_COLLIDE"];
	_unit_52 = _this;
	_this setPos [14079.689, 18674.467, 0.11105608];
	_this setDir -130.43022;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_401 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14080.173, 18674.926, 0.59842032], [], 0, "CAN_COLLIDE"];
	_vehicle_401 = _this;
	_this setDir 230.87526;
	_this setPos [14080.173, 18674.926, 0.59842032];
};

_vehicle_402 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [14079.711, 18673.83, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_402 = _this;
	_this setDir 35.19743;
	_this setPos [14079.711, 18673.83, 7.6293945e-006];
};

_vehicle_412 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [14044.76, 18664.004, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_412 = _this;
	_this setDir 67.494667;
	_this setPos [14044.76, 18664.004, -3.2424927e-005];
};

_vehicle_421 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14083.212, 18601.305, 0.60734403], [], 0, "CAN_COLLIDE"];
	_vehicle_421 = _this;
	_this setDir 294.0863;
	_this setPos [14083.212, 18601.305, 0.60734403];
};

_unit_61 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_shorts_2_F_asia", [14082.454, 18601.588, 0.022659261], [], 0, "CAN_COLLIDE"];
	_unit_61 = _this;
	_this setPos [14082.454, 18601.588, 0.022659261];
	_this setDir -49.976978;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_62 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_hunter_1_F", [14081.724, 18602.102], [], 0, "CAN_COLLIDE"];
	_unit_62 = _this;
	_this setPos [14081.724, 18602.102];
	_this setDir 113.63567;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_427 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14069.897, 18679.525, 0.20047566], [], 0, "CAN_COLLIDE"];
	_vehicle_427 = _this;
	_this setDir -45.400795;
	_this setVehicleLock "LOCKED";
	_this setPos [14069.897, 18679.525, 0.20047566];
};

_unit_64 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_5_F_euro", [14068.729, 18678.732, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_unit_64 = _this;
	_this setPos [14068.729, 18678.732, 9.5367432e-006];
	_this setDir 35.021168;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""REPAIR_VEH_PRONE""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_429 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [14043.759, 18666.09, -8.7738037e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_429 = _this;
	_this setDir 67.505356;
	_this setPos [14043.759, 18666.09, -8.7738037e-005];
};

_unit_69 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14055.66, 18646.344, 0.030419052], [], 0, "CAN_COLLIDE"];
	_unit_69 = _this;
	_this setPos [14055.66, 18646.344, 0.030419052];
	_this setDir 10.292644;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_433 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14055.587, 18645.66, 0.48788497], [], 0, "CAN_COLLIDE"];
	_vehicle_433 = _this;
	_this setDir 371.59799;
	_this setPos [14055.587, 18645.66, 0.48788497];
};

_vehicle_438 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14045.884, 18648.674, 0.5534904], [], 0, "CAN_COLLIDE"];
	_vehicle_438 = _this;
	_this setDir 369.26694;
	_this setPos [14045.884, 18648.674, 0.5534904];
};

_unit_75 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_3_F_euro", [14046.126, 18649.137, -0.0002117157], [], 0, "CAN_COLLIDE"];
	_unit_75 = _this;
	_this setPos [14046.126, 18649.137, -0.0002117157];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_77 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [14054.377, 18647.129, -0.00023269653], [], 0, "CAN_COLLIDE"];
	_unit_77 = _this;
	_this setPos [14054.377, 18647.129, -0.00023269653];
	_this setDir 26.990564;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_81 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_5_F", [14054.675, 18645.623, 0.55331504], [], 0, "CAN_COLLIDE"];
	_unit_81 = _this;
	_this setPos [14054.675, 18645.623, 0.55331504];
	_this setDir 9.8254871;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_82 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_p_fugitive_F", [14046.745, 18650.52, -0.00011253357], [], 0, "CAN_COLLIDE"];
	_unit_82 = _this;
	_this setPos [14046.745, 18650.52, -0.00011253357];
	_this setDir 198.84944;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
