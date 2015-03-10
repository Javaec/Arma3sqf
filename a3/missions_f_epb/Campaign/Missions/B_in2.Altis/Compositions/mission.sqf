activateAddons [
];

activateAddons [];
initAmbientLife;
[] call (uinamespace getvariable 'bis_fnc_recompile');
'bis_functions_mainscope' call (uinamespace getvariable ['bis_fnc_endLoadingScreen',{}]);
_initCodes = [];

_this = createCenter civilian;
_center_1 = _this;

_group_0 = createGroup _center_1;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["C_man_p_fugitive_F", [4811.4736, 16144.051], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [4811.4736, 16144.051];
	_this setVehicleVarName "BIS_player";
	BIS_player = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [4253.8804, 15831.247, 8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setPos [4253.8804, 15831.247, 8.392334e-005];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [4258.5098, 15832.51, 0.00019836426], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setPos [4258.5098, 15832.51, 0.00019836426];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [4257.7134, 15831.631, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setPos [4257.7134, 15831.631, 7.6293945e-005];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [4282.2041, 15928.347, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [4282.2041, 15928.347, 3.8146973e-005];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [4953.3452, 16140.517, 0.17549346], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -227.8748;
	_this setPos [4953.3452, 16140.517, 0.17549346];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [4929.7798, 16146.48, 0.044996787], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 77.798477;
	_this setPos [4929.7798, 16146.48, 0.044996787];
	_initCodes set [count _initCodes,[_this,"this lock true; this setFuel 0.435; clearItemCargo this"]];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_04_F", [4813.8994, 16139.019, 0.021083729], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -154.8716;
	_this setPos [4813.8994, 16139.019, 0.021083729];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [4814.4072, 16140.309, 0.087125801], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -122.05191;
	_this setPos [4814.4072, 16140.309, 0.087125801];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_CargoTruck,[0.1,-1,-0.2]]"]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [4814.6938, 16136.494, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setPos [4814.6938, 16136.494, 3.0517578e-005];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [4862.1943, 16137.669, 0.61659098], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -67.019798;
	_this setPos [4862.1943, 16137.669, 0.61659098];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [4861.855, 16138.018, 0.51330853], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setPos [4861.855, 16138.018, 0.51330853];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [4862.543, 16138.213, 0.62295526], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setPos [4862.543, 16138.213, 0.62295526];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RiceBox_F", [4862.1479, 16138.091, 0.59077704], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir -44.033051;
	_this setPos [4862.1479, 16138.091, 0.59077704];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [4908.8301, 16141.142, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -167.10732;
	_this setPos [4908.8301, 16141.142, 7.6293945e-006];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [4950.1953, 16129.945, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir -25.877281;
	_this setPos [4950.1953, 16129.945, 2.2888184e-005];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [4947.2207, 16129.647, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir 26.319382;
	_this setPos [4947.2207, 16129.647, -3.8146973e-005];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [4948.2642, 16133.483, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setPos [4948.2642, 16133.483, 6.8664551e-005];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [4944.5269, 16131.396, -0.025040559], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -250.58066;
	_this setPos [4944.5269, 16131.396, -0.025040559];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ButaneCanister_F", [4946.8101, 16131.952, 0.15946263], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [4946.8101, 16131.952, 0.15946263];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [4926.7041, 16146.111, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir 20.69832;
	_this setPos [4926.7041, 16146.111, 7.6293945e-006];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [4926.3462, 16147.768, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 51.698257;
	_this setPos [4926.3462, 16147.768, 1.5258789e-005];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [4927.1895, 16145.754, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir 55.265797;
	_this setPos [4927.1895, 16145.754, 7.6293945e-006];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [4927.0615, 16145.57, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir 89.658813;
	_this setPos [4927.0615, 16145.57, 1.5258789e-005];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [4926.335, 16146.438, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir 107.91579;
	_this setPos [4926.335, 16146.438, 7.6293945e-006];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [4926.1699, 16146.455, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir 89.658813;
	_this setPos [4926.1699, 16146.455, 1.5258789e-005];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [4925.7046, 16147.372], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setPos [4925.7046, 16147.372];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [4926.4722, 16146.345, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir 15.665433;
	_this setPos [4926.4722, 16146.345, 7.6293945e-006];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V1_F", [4926.189, 16146.287, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [4926.189, 16146.287, 3.8146973e-005];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V1_F", [4926.0352, 16146.613, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir 89.658813;
	_this setPos [4926.0352, 16146.613, 7.6293945e-006];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [5101.1187, 16143.957, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setPos [5101.1187, 16143.957, 1.5258789e-005];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [5285.6201, 16160.42, 0.051228326], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setPos [5285.6201, 16160.42, 0.051228326];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [5323.4248, 16167.759, 5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 52.872879;
	_this setPos [5323.4248, 16167.759, 5.3405762e-005];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [5323.9478, 16167.783, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setPos [5323.9478, 16167.783, -0.00012207031];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [5477.9805, 16361.411, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setDir 57.696743;
	_this setPos [5477.9805, 16361.411, -3.2424927e-005];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [5202.3149, 16496.051, -0.00022697449], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setDir 86.283508;
	_this setPos [5202.3149, 16496.051, -0.00022697449];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [5082.2539, 16650.689, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setPos [5082.2539, 16650.689, -2.0980835e-005];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [4819.6328, 16139.103, 0.15463023], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir -318.34277;
	_this setVehicleVarName "BIS_CargoTruck";
	BIS_CargoTruck = _this;
	_this setPos [4819.6328, 16139.103, 0.15463023];
	_initCodes set [count _initCodes,[_this,"this lock true; this setFuel 0.145; clearItemCargo this"]];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [4815.6699, 16139.262, -0.011042302], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setDir -93.651695;
	_this setPos [4815.6699, 16139.262, -0.011042302];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_CargoTruck,[0.2,-2.3,-0.15]]"]];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4814.6313, 16140.287, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir -50.147293;
	_this setPos [4814.6313, 16140.287, 2.2888184e-005];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4814.5239, 16140.184, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir 42.256432;
	_this setPos [4814.5239, 16140.184, 7.6293945e-005];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4814.687, 16140.155, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setDir 95.50489;
	_this setPos [4814.687, 16140.155, 4.5776367e-005];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4813.1665, 16139.624, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 44.752594;
	_this setPos [4813.1665, 16139.624, 3.0517578e-005];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4813.3208, 16139.567, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setDir -25.479486;
	_this setPos [4813.3208, 16139.567, 6.8664551e-005];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ButaneTorch_F", [4814.4829, 16139.879, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir -2.7047229;
	_this setPos [4814.4829, 16139.879, 3.8146973e-005];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [4818.3418, 16141.188, 0.040081501], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir 11.380018;
	_this setPos [4818.3418, 16141.188, 0.040081501];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [4813.1016, 16139.879, 0.00026702881], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setDir -20.66091;
	_this setPos [4813.1016, 16139.879, 0.00026702881];
};

_vehicle_88 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [4813.6685, 16141.352, 0.010306198], [], 0, "CAN_COLLIDE"];
	_vehicle_88 = _this;
	_this setDir -186.36732;
	_this setPos [4813.6685, 16141.352, 0.010306198];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_CargoTruck,[-0.75,-2.7,-0.25]]"]];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GasCooker_F", [4813.3467, 16139.888, 8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir 15.909333;
	_this setPos [4813.3467, 16139.888, 8.392334e-005];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V2_F", [4814.814, 16138.244, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setDir -8.2078323;
	_this setPos [4814.814, 16138.244, 9.9182129e-005];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V2_F", [4814.4614, 16140.408, 0.00021362305], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setDir 28.678436;
	_this setPos [4814.4614, 16140.408, 0.00021362305];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V2_F", [4812.501, 16139.166, 0.0001449585], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir 28.678436;
	_this setPos [4812.501, 16139.166, 0.0001449585];
};

_vehicle_94 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Suitcase_F", [4812.5366, 16138.541, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_94 = _this;
	_this setDir 200.00417;
	_this setPos [4812.5366, 16138.541, -3.8146973e-005];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RiceBox_F", [4814.3408, 16140.288, -0.0079451483], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir -16.325045;
	_this setPos [4814.3408, 16140.288, -0.0079451483];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RiceBox_F", [4813.541, 16139.977, 0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_96 = _this;
	_this setDir 35.698933;
	_this setPos [4813.541, 16139.977, 0.00012207031];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [4813.6479, 16140.097, 0.00016784668], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setDir 28.678436;
	_this setPos [4813.6479, 16140.097, 0.00016784668];
};

_vehicle_98 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [4813.9839, 16140.139, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_98 = _this;
	_this setDir 36.118515;
	_this setPos [4813.9839, 16140.139, -2.2888184e-005];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [5102.3667, 16141.874, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setDir 127.50356;
	_this setPos [5102.3667, 16141.874, -4.5776367e-005];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [5101.9692, 16143.087, 0.12162223], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setPos [5101.9692, 16143.087, 0.12162223];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [5100.9985, 16141.725, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_102 = _this;
	_this setDir 188.59467;
	_this setPos [5100.9985, 16141.725, -7.6293945e-006];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [5100.3716, 16143.009, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setDir 43.326454;
	_this setPos [5100.3716, 16143.009, -6.1035156e-005];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [5100.0054, 16143.537, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setDir -37.728413;
	_this setPos [5100.0054, 16143.537, 6.1035156e-005];
};

_vehicle_107 = objNull;
if (true) then
{
	_this = createVehicle ["C_Quadbike_01_F", [5318.7656, 16166.621, 0.1338688], [], 0, "CAN_COLLIDE"];
	_vehicle_107 = _this;
	_this setDir 179.11124;
	_this setPos [5318.7656, 16166.621, 0.1338688];
	_initCodes set [count _initCodes,[_this,"this lock true; this setFuel 0.435"]];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkull_F", [5286.043, 16160.957, 0.044862635], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setPos [5286.043, 16160.957, 0.044862635];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [5533.8008, 16085.397, 8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_109 = _this;
	_this setDir 98.584503;
	_this setPos [5533.8008, 16085.397, 8.392334e-005];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [5538.9434, 16093.268, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir -67.664108;
	_this setPos [5538.9434, 16093.268, 3.0517578e-005];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [5535.6367, 16093.658, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setDir -32.977402;
	_this setPos [5535.6367, 16093.658, 3.8146973e-005];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [5532.5605, 16084.561, 5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir -8.9472389;
	_this setPos [5532.5605, 16084.561, 5.3405762e-005];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_fire_F", [5535.6748, 16094.215, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir -23.334597;
	_this setPos [5535.6748, 16094.215, 9.1552734e-005];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [5074.4048, 16652.832, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setPos [5074.4048, 16652.832, -9.1552734e-005];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [5086.8584, 16646.822, 2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir 89.007622;
	_this setPos [5086.8584, 16646.822, 2.6702881e-005];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [5085.4165, 16652.066, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir -38.961838;
	_this setPos [5085.4165, 16652.066, -2.0980835e-005];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [5085.9121, 16653.018, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setDir 44.971588;
	_this setPos [5085.9121, 16653.018, -3.8146973e-006];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [5086.5288, 16652.227, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setDir 71.018723;
	_this setPos [5086.5288, 16652.227, -7.6293945e-006];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [4885.6592, 17061.691, -9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir 85.131058;
	_this setPos [4885.6592, 17061.691, -9.9182129e-005];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [4887.1826, 17061.232, -1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setDir 126.03257;
	_this setPos [4887.1826, 17061.232, -1.9073486e-005];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [4895.2847, 17058.092, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setDir 116.96085;
	_this setPos [4895.2847, 17058.092, -4.5776367e-005];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FirePlace_F", [4886.062, 17060.078, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir -18.288776;
	_this setPos [4886.062, 17060.078, -1.1444092e-005];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [4886.2412, 17060.85, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir -18.288776;
	_this setPos [4886.2412, 17060.85, 1.1444092e-005];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [4888.8325, 17048.203, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir 33.793526;
	_this setPos [4888.8325, 17048.203, -2.2888184e-005];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [4947.8096, 17116.283, -8.0108643e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_158 = _this;
	_this setDir -8.7159328;
	_this setPos [4947.8096, 17116.283, -8.0108643e-005];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [4888.6089, 17048.682, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setDir 73.464302;
	_this setPos [4888.6089, 17048.682, -4.5776367e-005];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4885.6885, 17061.475, 0.48628342], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setPos [4885.6885, 17061.475, 0.48628342];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanOpener_F", [4885.4414, 17061.113, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir -197.96379;
	_this setPos [4885.4414, 17061.113, -2.2888184e-005];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [4886.7173, 17059.977, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir 70.621986;
	_this setPos [4886.7173, 17059.977, -3.8146973e-006];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HeatPack_F", [4885.5854, 17060.455, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setDir -40.540264;
	_this setPos [4885.5854, 17060.455, 1.9073486e-005];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Matches_F", [4885.4155, 17060.564, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setDir -1.678124;
	_this setPos [4885.4155, 17060.564, -3.8146973e-005];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_F", [4886.4741, 17062.793, 0.0079629309], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setDir -61.296925;
	_this setPos [4886.4741, 17062.793, 0.0079629309];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_folded_F", [4815.5654, 16140.217, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir -33.720352;
	_this setPos [4815.5654, 16140.217, 7.6293945e-005];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_folded_F", [4815.0181, 16140.252], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setDir -106.89748;
	_this setPos [4815.0181, 16140.252];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_folded_F", [4812.7217, 16139.628, 5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir 106.42405;
	_this setPos [4812.7217, 16139.628, 5.3405762e-005];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Gloves_F", [4818.2939, 16141.487, 0.021737564], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setDir 52.486557;
	_this setPos [4818.2939, 16141.487, 0.021737564];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_painted_F", [4818.0386, 16140.839, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setDir -23.022373;
	_this setPos [4818.0386, 16140.839, 1.5258789e-005];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [5533.9365, 16095.691, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setDir -58.445896;
	_this setPos [5533.9365, 16095.691, 1.5258789e-005];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [5534.937, 16097.209], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir -228.96306;
	_this setPos [5534.937, 16097.209];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
runInitScript;
finishMissionInit;
