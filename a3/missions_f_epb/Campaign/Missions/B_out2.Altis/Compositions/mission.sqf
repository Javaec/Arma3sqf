activateAddons [
];

activateAddons [];
initAmbientLife;
[] call (uinamespace getvariable 'bis_fnc_recompile');
'bis_functions_mainscope' call (uinamespace getvariable ['bis_fnc_endLoadingScreen',{}]);
_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_group_0 = createGroup _center_0;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["C_man_p_fugitive_F", [10996.817, 13302.018], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [10996.817, 13302.018];
	_this setVehicleVarName "BIS_player";
	BIS_player = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [10805.598, 13311.286, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -8.8564548;
	_this setPos [10805.598, 13311.286, 7.6293945e-006];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [10805.65, 13311.935, 2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setPos [10805.65, 13311.935, 2.6702881e-005];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HeatPack_F", [10805.801, 13311.815, 0.00010299683], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir -128.02217;
	_this setPos [10805.801, 13311.815, 0.00010299683];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [10805.852, 13310.466, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setPos [10805.852, 13310.466, 1.1444092e-005];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [10802.516, 13486.872, 0.15526107], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir 25.25638;
	_this setPos [10802.516, 13486.872, 0.15526107];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.605"]];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [11133.37, 13501.819, -0.00010681152], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -24.185711;
	_this setPos [11133.37, 13501.819, -0.00010681152];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.245"]];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_fuel_F", [10974.882, 13421.727, 0.075189993], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir 26.429844;
	_this setPos [10974.882, 13421.727, 0.075189993];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.735"]];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_sport_F", [11083.078, 13391.764, 0.1408111], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir 27.403328;
	_this setPos [11083.078, 13391.764, 0.1408111];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [10949.346, 13412.829, 0.17685111], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -50.004295;
	_this setPos [10949.346, 13412.829, 0.17685111];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.145"]];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [10990.012, 13321.891, 0.13976943], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir -42.675606;
	_this setPos [10990.012, 13321.891, 0.13976943];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.745"]];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [11135.076, 13510.152, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setPos [11135.076, 13510.152, 1.9073486e-006];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [11128.719, 13505.652, 7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setPos [11128.719, 13505.652, 7.0571899e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Skodovka_F", [11157.172, 13192.59, 2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 154.2637;
	_this setPos [11157.172, 13192.59, 2.4795532e-005];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [11151.059, 13192.424, 3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir 194.3278;
	_this setPos [11151.059, 13192.424, 3.6239624e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [11153.497, 13197.507, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setPos [11153.497, 13197.507, -4.196167e-005];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [11158.163, 13196.286, -0.090253204], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setPos [11158.163, 13196.286, -0.090253204];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [11080.644, 13388.453, 3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir 34.394653;
	_this setPos [11080.644, 13388.453, 3.6239624e-005];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Rusty_F", [11080.889, 13387.733, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir 6.1959982;
	_this setPos [11080.889, 13387.733, 3.8146973e-005];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [11081.099, 13387.983, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 12.132627;
	_this setPos [11081.099, 13387.983, -1.5258789e-005];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [11081.099, 13388.265, -6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setPos [11081.099, 13388.265, -6.4849854e-005];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [11081.179, 13389.07, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 17.755293;
	_this setPos [11081.179, 13389.07, -4.196167e-005];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [11080.094, 13387.945, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir 17.526085;
	_this setPos [11080.094, 13387.945, 7.6293945e-006];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [11080.088, 13387.828, 7.2479248e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir 12.837723;
	_this setPos [11080.088, 13387.828, 7.2479248e-005];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_folded_F", [11079.25, 13389.179, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir 22.22892;
	_this setPos [11079.25, 13389.179, 4.7683716e-005];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_brown_folded_F", [11079.088, 13388.835, -0.00012016296], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setPos [11079.088, 13388.835, -0.00012016296];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [11079.621, 13388.859, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setPos [11079.621, 13388.859, 1.5258789e-005];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Ground_sheet_folded_khaki_F", [11079.405, 13389.47, -6.6757202e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir 9.1288099;
	_this setPos [11079.405, 13389.47, -6.6757202e-005];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Ground_sheet_folded_khaki_F", [11079.921, 13389.12, -5.531311e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setDir -96.614998;
	_this setPos [11079.921, 13389.12, -5.531311e-005];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [11092.476, 13410.308, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setPos [11092.476, 13410.308, -3.0517578e-005];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyres_F", [11096.53, 13406.048, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir 31.246378;
	_this setPos [11096.53, 13406.048, 1.1444092e-005];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [11088.856, 13411.054, 6.6757202e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir -25.977682;
	_this setPos [11088.856, 13411.054, 6.6757202e-005];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [11086.074, 13355.402, 0.46026745], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir 109.09306;
	_this setPos [11086.074, 13355.402, 0.46026745];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [11088.35, 13354.458, 0.5025329], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir 17.491173;
	_this setPos [11088.35, 13354.458, 0.5025329];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [11088.961, 13355.328, 0.586622], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir 34.036781;
	_this setPos [11088.961, 13355.328, 0.586622];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [11089.113, 13361.006, 0.4275777], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir 94.692123;
	_this setPos [11089.113, 13361.006, 0.4275777];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [11088.434, 13360.324, 0.39547673], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir -160.00771;
	_this setPos [11088.434, 13360.324, 0.39547673];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car_F", [11030.888, 13351.833, 0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir 6.7680635;
	_this setPos [11030.888, 13351.833, 0.00012207031];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [11028.363, 13346.057, 9.5367432e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setDir -132.04082;
	_this setPos [11028.363, 13346.057, 9.5367432e-005];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [11002.489, 13385.483, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [11002.489, 13385.483, 5.9127808e-005];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [10996.706, 13376.356, -2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir -9.9741802;
	_this setPos [10996.706, 13376.356, -2.4795532e-005];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [10986.65, 13397.589, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [10986.65, 13397.589, 5.7220459e-006];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [10987.274, 13394.078, -0.00010490417], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setPos [10987.274, 13394.078, -0.00010490417];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [10984.928, 13395.212, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir 80.526978;
	_this setPos [10984.928, 13395.212, 1.335144e-005];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [11030.132, 13473.077, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir 250.33354;
	_this setPos [11030.132, 13473.077, 1.335144e-005];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [11029.894, 13473.116, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setPos [11029.894, 13473.116, -7.6293945e-006];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [11020.18, 13466.288, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setPos [11020.18, 13466.288, -2.6702881e-005];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [11115.321, 13443.835, -0.043708701], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir -29.6535;
	_this setPos [11115.321, 13443.835, -0.043708701];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [11171.021, 13346.274, 5.1498413e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setPos [11171.021, 13346.274, 5.1498413e-005];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Antibiotic_F", [11015.561, 13475.059, 0.21275371], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir 39.620625;
	_this setPos [11015.561, 13475.059, 0.21275371];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Antibiotic_F", [11015.352, 13475.252, 0.17134106], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -28.166279;
	_this setPos [11015.352, 13475.252, 0.17134106];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [11015.402, 13474.368, 0.17634514], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [11015.402, 13474.368, 0.17634514];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [11015.865, 13475.01, 0.18788247], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir -94.008247;
	_this setPos [11015.865, 13475.01, 0.18788247];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [11015.295, 13475.016, 0.15764706], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir -142.41382;
	_this setPos [11015.295, 13475.016, 0.15764706];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [11015.624, 13475.228, 0.1968542], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 25.064171;
	_this setPos [11015.624, 13475.228, 0.1968542];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V2_F", [11015.195, 13475.157, 0.17568213], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setPos [11015.195, 13475.157, 0.17568213];
};

_vehicle_66 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FireExtinguisher_F", [11014.163, 13476, 0.15571876], [], 0, "CAN_COLLIDE"];
	_vehicle_66 = _this;
	_this setDir 56.760799;
	_this setPos [11014.163, 13476, 0.15571876];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [11015.819, 13474.753, 0.18765716], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir -87.209221;
	_this setPos [11015.819, 13474.753, 0.18765716];
};

_vehicle_68 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [11015.839, 13474.063, 0.18975425], [], 0, "CAN_COLLIDE"];
	_vehicle_68 = _this;
	_this setPos [11015.839, 13474.063, 0.18975425];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [11015.099, 13474.82, 0.20461385], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setPos [11015.099, 13474.82, 0.20461385];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [11015.749, 13474.472, 0.19479963], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setPos [11015.749, 13474.472, 0.19479963];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PowderedMilk_F", [11016.079, 13474.574, 0.21567267], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir -75.03405;
	_this setPos [11016.079, 13474.574, 0.21567267];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [11017.336, 13474.646, 4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir -9.8491449;
	_this setPos [11017.336, 13474.646, 4.3869019e-005];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [11017.033, 13475.691, 4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setPos [11017.033, 13475.691, 4.0054321e-005];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DuctTape_F", [11017.466, 13475.473, 0.00017929077], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setPos [11017.466, 13475.473, 0.00017929077];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [10884.927, 13352.76, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setDir -163.41484;
	_this setPos [10884.927, 13352.76, 1.5258789e-005];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Van_F", [10881.019, 13344.601, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setDir -124.88124;
	_this setPos [10881.019, 13344.601, 1.1444092e-005];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [10860.932, 13375.831, 0.00014877319], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir -76.641853;
	_this setPos [10860.932, 13375.831, 0.00014877319];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [10858.451, 13375.928, 0.00011062622], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setDir 42.957718;
	_this setPos [10858.451, 13375.928, 0.00011062622];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sack_F", [10862.355, 13374.926, -0.00011444092], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setPos [10862.355, 13374.926, -0.00011444092];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_UAZ_F", [10988.385, 12939.052, -0.0014044517], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setDir -37.433064;
	_this setPos [10988.385, 12939.052, -0.0014044517];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [10988.64, 12939.719, -9.727478e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setPos [10988.64, 12939.719, -9.727478e-005];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_rocks_F", [10869.694, 12895.14, -0.044217058], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setDir 0.79795361;
	_this setPos [10869.694, 12895.14, -0.044217058];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [10852.989, 12899.182, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir -54.759834;
	_this setPos [10852.989, 12899.182, 3.8146973e-005];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [10852.272, 12897.93, 7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -60.21666;
	_this setPos [10852.272, 12897.93, 7.0571899e-005];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10855.416, 12898.749, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setDir 123.10423;
	_this setPos [10855.416, 12898.749, -1.9073486e-006];
};

_vehicle_88 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [10855.019, 12898.319, 9.727478e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_88 = _this;
	_this setPos [10855.019, 12898.319, 9.727478e-005];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ButaneCanister_F", [10854.833, 12898.485, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setDir 10.6033;
	_this setPos [10854.833, 12898.485, 9.9182129e-005];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [10849.803, 12901.293, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir 73.438316;
	_this setPos [10849.803, 12901.293, -1.1444092e-005];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [10852.362, 12898.646, 5.1498413e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setPos [10852.362, 12898.646, 5.1498413e-005];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [10855.164, 12897.852, 0.0001411438], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setPos [10855.164, 12897.852, 0.0001411438];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GasCooker_F", [10855.255, 12898.428, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setPos [10855.255, 12898.428, -1.9073486e-006];
};

_vehicle_94 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [10870.09, 12894.125, 6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_94 = _this;
	_this setDir 113.29765;
	_this setPos [10870.09, 12894.125, 6.4849854e-005];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [10850.345, 12897.246, 8.2015991e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setPos [10850.345, 12897.246, 8.2015991e-005];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [10851.086, 12896.789, 7.0571899e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_96 = _this;
	_this setDir -83.640762;
	_this setPos [10851.086, 12896.789, 7.0571899e-005];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [10854.715, 12897.754, 9.3460083e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setDir -54.791149;
	_this setPos [10854.715, 12897.754, 9.3460083e-005];
};

_vehicle_98 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [10856.714, 12902.073, 0.47246331], [], 0, "CAN_COLLIDE"];
	_vehicle_98 = _this;
	_this setDir 21.237904;
	_this setPos [10856.714, 12902.073, 0.47246331];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [10855.79, 12902.847, 0.54380614], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setDir -38.362263;
	_this setPos [10855.79, 12902.847, 0.54380614];
};

_vehicle_100 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [10854.872, 12901.612, 0.36224434], [], 0, "CAN_COLLIDE"];
	_vehicle_100 = _this;
	_this setDir -92.037003;
	_this setPos [10854.872, 12901.612, 0.36224434];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [10851.952, 12902.648, 0.27862519], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setDir -57.371471;
	_this setPos [10851.952, 12902.648, 0.27862519];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10855.005, 12905.546, 0.51086533], [], 0, "CAN_COLLIDE"];
	_vehicle_102 = _this;
	_this setDir 124.31038;
	_this setPos [10855.005, 12905.546, 0.51086533];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [10850.403, 12898.136, 3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setDir 35.64772;
	_this setPos [10850.403, 12898.136, 3.6239624e-005];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [10970.173, 13252.79, -0.00015258789], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setDir -27.466198;
	_this setPos [10970.173, 13252.79, -0.00015258789];
};

_vehicle_105 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_02_F", [10992.101, 13319.04, 3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_105 = _this;
	_this setDir -21.83334;
	_this setPos [10992.101, 13319.04, 3.2424927e-005];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [10992.674, 13318.55, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setPos [10992.674, 13318.55, -2.0980835e-005];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [10992.531, 13318.378, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir -33.775734;
	_this setPos [10992.531, 13318.378, 1.9073486e-006];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BottlePlastic_V1_F", [10992.587, 13318.538, -2.8610229e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setDir 27.671722;
	_this setPos [10992.587, 13318.538, -2.8610229e-005];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [10992.662, 13318.425, -0.006680062], [], 0, "CAN_COLLIDE"];
	_vehicle_113 = _this;
	_this setPos [10992.662, 13318.425, -0.006680062];
};

_vehicle_114 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [10992.645, 13318.307, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_114 = _this;
	_this setDir -19.450613;
	_this setPos [10992.645, 13318.307, -1.1444092e-005];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Antibiotic_F", [10992.378, 13318.393, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_115 = _this;
	_this setDir -95.507469;
	_this setPos [10992.378, 13318.393, -7.6293945e-006];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PainKillers_F", [10992.19, 13318.26, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_116 = _this;
	_this setDir -3.7707777;
	_this setPos [10992.19, 13318.26, -1.9073486e-006];
};

_vehicle_117 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [10991.396, 13318.81, -4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_117 = _this;
	_this setDir -37.332558;
	_this setPos [10991.396, 13318.81, -4.0054321e-005];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [10991.497, 13318.699, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_118 = _this;
	_this setDir 28.016542;
	_this setPos [10991.497, 13318.699, -1.9073486e-006];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V3_F", [11007.683, 13294.522, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setPos [11007.683, 13294.522, -7.6293945e-006];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [11006.807, 13291.783, -4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setDir -17.892361;
	_this setPos [11006.807, 13291.783, -4.0054321e-005];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WorkStand_F", [11009.569, 13291.734, -0.00011825562], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir 131.35338;
	_this setPos [11009.569, 13291.734, -0.00011825562];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [11008.357, 13292.972, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setPos [11008.357, 13292.972, 2.2888184e-005];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_F", [11077.376, 13352.778, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir 25.577692;
	_this setPos [11077.376, 13352.778, -1.9073486e-006];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [11071.322, 13353.239, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir 51.098415;
	_this setPos [11071.322, 13353.239, 7.6293945e-005];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [11073.675, 13352.44, 4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setDir -4.9682651;
	_this setPos [11073.675, 13352.44, 4.3869019e-005];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [10944.69, 13415.577, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setPos [10944.69, 13415.577, 1.1444092e-005];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyres_F", [10952.401, 13407.225, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setDir 8.0423231;
	_this setPos [10952.401, 13407.225, -3.2424927e-005];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [10947.893, 13396.927, 3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setDir 60.515755;
	_this setPos [10947.893, 13396.927, 3.4332275e-005];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [11000.855, 13454.981, -0.00019836426], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir -105.87051;
	_this setPos [11000.855, 13454.981, -0.00019836426];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [11001.105, 13453.802, -4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_132 = _this;
	_this setDir -180.67197;
	_this setPos [11001.105, 13453.802, -4.3869019e-005];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesWooden_F", [11003.33, 13458.853, 8.9645386e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setDir -42.266331;
	_this setPos [11003.33, 13458.853, 8.9645386e-005];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Van_F", [11016.798, 13519.317, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir 3.0291862;
	_this setPos [11016.798, 13519.317, 6.1035156e-005];
};

_vehicle_137 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [10806.606, 13483.631, -0.040355776], [], 0, "CAN_COLLIDE"];
	_vehicle_137 = _this;
	_this setDir -42.522064;
	_this setPos [10806.606, 13483.631, -0.040355776];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [10805.822, 13486.962, 8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setPos [10805.822, 13486.962, 8.392334e-005];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WaterTank_F", [10803.904, 13481.407, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setPos [10803.904, 13481.407, 9.9182129e-005];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [10798.139, 13492.771, 0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir 53.676178;
	_this setPos [10798.139, 13492.771, 0.0001373291];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [10960.628, 13452.758, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setDir -122.8436;
	_this setPos [10960.628, 13452.758, 5.9127808e-005];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [10986.759, 13415.426, 1.1474115], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir -149.23196;
	_this setPos [10986.759, 13415.426, 1.1474115];
};

_vehicle_143 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [10982.449, 13417.313, 0.87326157], [], 0, "CAN_COLLIDE"];
	_vehicle_143 = _this;
	_this setDir 118.16953;
	_this setPos [10982.449, 13417.313, 0.87326157];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [10983.323, 13413.298, 0.94710165], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 5.2866163;
	_this setPos [10983.323, 13413.298, 0.94710165];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [10983.477, 13413.969, 0.92290092], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setPos [10983.477, 13413.969, 0.92290092];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [10982.824, 13416.571, 0.87049204], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setDir 120.82644;
	_this setPos [10982.824, 13416.571, 0.87049204];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [10984.331, 13416.794, 0.97081447], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir -160.11717;
	_this setPos [10984.331, 13416.794, 0.97081447];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [10986.967, 13414.562, 1.1415417], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir -153.25784;
	_this setPos [10986.967, 13414.562, 1.1415417];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_green_F", [10985.371, 13412.522, 1.0279553], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setDir -24.40518;
	_this setPos [10985.371, 13412.522, 1.0279553];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [10984.375, 13415.158, 1.9026307], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setPos [10984.375, 13415.158, 1.9026307];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [11112.357, 13204.159, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setDir 56.163364;
	_this setPos [11112.357, 13204.159, 2.0980835e-005];
};

_vehicle_153 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [11109.467, 13206.701, 4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_153 = _this;
	_this setDir 24.300663;
	_this setPos [11109.467, 13206.701, 4.0054321e-005];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [11113.155, 13200.992, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setDir 78.008789;
	_this setPos [11113.155, 13200.992, 1.1444092e-005];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Campfire_F", [11109.128, 13202.007, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setPos [11109.128, 13202.007, 7.6293945e-006];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_F", [11106.993, 13204.451, 2.8610229e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir 37.913982;
	_this setPos [11106.993, 13204.451, 2.8610229e-005];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_F", [11108.199, 13203.842, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir 7.2394757;
	_this setPos [11108.199, 13203.842, 7.6293945e-006];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Axe_fire_F", [11081.768, 13388.256, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_158 = _this;
	_this setDir 80.429634;
	_this setPos [11081.768, 13388.256, 1.9073486e-006];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Coil_F", [11067.755, 13516.516, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir -109.58208;
	_this setPos [11067.755, 13516.516, 7.6293945e-006];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Coil_F", [11071.652, 13512.962, 6.6757202e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setDir -29.611021;
	_this setPos [11071.652, 13512.962, 6.6757202e-005];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Coil_F", [11072.68, 13518.257, 9.3460083e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setDir 21.34271;
	_this setPos [11072.68, 13518.257, 9.3460083e-005];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [11075.7, 13514.967, 5.1498413e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setDir -28.616364;
	_this setPos [11075.7, 13514.967, 5.1498413e-005];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [11075.847, 13513.131, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir -170.81627;
	_this setPos [11075.847, 13513.131, 6.1035156e-005];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [11067.015, 13510.243, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir 12.02496;
	_this setPos [11067.015, 13510.243, 9.5367432e-006];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [11176.574, 13602.669, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setDir -5.1517453;
	_this setPos [11176.574, 13602.669, 4.7683716e-005];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [11174.164, 13595.376, 0.00013160706], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setDir 30.827478;
	_this setPos [11174.164, 13595.376, 0.00013160706];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [11176.425, 13593.009, 0.00020217896], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setDir 28.357206;
	_this setPos [11176.425, 13593.009, 0.00020217896];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [11181.475, 13598.965, 0.0002155304], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setDir 48.446644;
	_this setPos [11181.475, 13598.965, 0.0002155304];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V3_F", [11174.563, 13597.075, 0.00017166138], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setPos [11174.563, 13597.075, 0.00017166138];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [11171.293, 13596.092, 5.531311e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setDir -16.178898;
	_this setPos [11171.293, 13596.092, 5.531311e-005];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WorkStand_F", [11185.913, 13595.204, 0.00011444092], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir 120.87308;
	_this setPos [11185.913, 13595.204, 0.00011444092];
};

_vehicle_172 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [11186.02, 13587.86, 0.00010108948], [], 0, "CAN_COLLIDE"];
	_vehicle_172 = _this;
	_this setDir -11.274417;
	_this setPos [11186.02, 13587.86, 0.00010108948];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [11186.483, 13585.734, 0.00010871887], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setDir 35.608955;
	_this setPos [11186.483, 13585.734, 0.00010871887];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [11197.815, 13585.89, -6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setDir -89.983482;
	_this setPos [11197.815, 13585.89, -6.4849854e-005];
};

_vehicle_175 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tank_rust_F", [11171.862, 13567.59, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_175 = _this;
	_this setDir 48.183147;
	_this setPos [11171.862, 13567.59, 5.9127808e-005];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Scaffolding_F", [11172.943, 13576.603, -3.2432659], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setDir -41.435238;
	_this setPos [11172.943, 13576.603, -3.2432659];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [11174.993, 13570.502, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_177 = _this;
	_this setDir 104.2579;
	_this setPos [11174.993, 13570.502, -6.1035156e-005];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["Land_DrillAku_F", [11175.748, 13569.337, 0.00012397766], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setDir 22.707617;
	_this setPos [11175.748, 13569.337, 0.00012397766];
};

_vehicle_180 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Hammer_F", [11176.134, 13569.345, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_180 = _this;
	_this setDir -16.55908;
	_this setPos [11176.134, 13569.345, -3.6239624e-005];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenBox_F", [11175.235, 13568.643, -2.8610229e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir 26.559547;
	_this setPos [11175.235, 13568.643, -2.8610229e-005];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [11176.797, 13569.813, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setPos [11176.797, 13569.813, -7.6293945e-006];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [11176.942, 13568.888, -0.00012016296], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setDir -42.33123;
	_this setPos [11176.942, 13568.888, -0.00012016296];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelSand_grey_F", [11177.48, 13569.488, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setDir 18.72858;
	_this setPos [11177.48, 13569.488, -3.6239624e-005];
};

_vehicle_185 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [11197.563, 13584.885, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_185 = _this;
	_this setPos [11197.563, 13584.885, 7.6293945e-006];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [11188.057, 13540.799, 4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setDir -6.6885662;
	_this setPos [11188.057, 13540.799, 4.3869019e-005];
};

_vehicle_187 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FishingGear_01_F", [11205.206, 13544.665, 7.8201294e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_187 = _this;
	_this setDir -60.677532;
	_this setPos [11205.206, 13544.665, 7.8201294e-005];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [11203.855, 13547.134, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setPos [11203.855, 13547.134, -2.2888184e-005];
};

_vehicle_189 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyre_F", [11203.513, 13546.405, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_189 = _this;
	_this setDir -10.547363;
	_this setPos [11203.513, 13546.405, -2.0980835e-005];
};

_vehicle_190 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [11200.824, 13544.986, -1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_190 = _this;
	_this setDir 12.501214;
	_this setPos [11200.824, 13544.986, -1.335144e-005];
};

_vehicle_191 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [11033.4, 13444.095, 6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_191 = _this;
	_this setDir 50.230087;
	_this setPos [11033.4, 13444.095, 6.2942505e-005];
};

_vehicle_193 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [11035.916, 13441.15, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_193 = _this;
	_this setDir 50.230087;
	_this setPos [11035.916, 13441.15, -3.2424927e-005];
};

_vehicle_195 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [11038.542, 13437.991, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_195 = _this;
	_this setDir 50.230087;
	_this setPos [11038.542, 13437.991, -3.0517578e-005];
};

_vehicle_197 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [11041.446, 13434.696, -5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_197 = _this;
	_this setDir 48.964382;
	_this setPos [11041.446, 13434.696, -5.7220459e-006];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Basket_F", [11030.475, 13428.652, 8.0108643e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setPos [11030.475, 13428.652, 8.0108643e-005];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesWooden_F", [11033.932, 13428.361, -9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setDir -104.24203;
	_this setPos [11033.932, 13428.361, -9.9182129e-005];
};

_vehicle_202 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesWooden_F", [11028.359, 13438.744], [], 0, "CAN_COLLIDE"];
	_vehicle_202 = _this;
	_this setDir 38.836311;
	_this setPos [11028.359, 13438.744];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_goods_F", [11034.353, 13431.189, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setDir -29.622242;
	_this setPos [11034.353, 13431.189, -6.1035156e-005];
};

_vehicle_204 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [11026.586, 13437, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_204 = _this;
	_this setPos [11026.586, 13437, -6.2942505e-005];
};

_vehicle_205 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesPlastic_F", [11027.959, 13435.915, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_205 = _this;
	_this setPos [11027.959, 13435.915, 1.1444092e-005];
};

_vehicle_206 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageWashingMachine_F", [11032.991, 13423.409, -4.9591064e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_206 = _this;
	_this setDir 62.787975;
	_this setPos [11032.991, 13423.409, -4.9591064e-005];
};

_vehicle_210 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelEmpty_grey_F", [11030.457, 13439.869, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_210 = _this;
	_this setPos [11030.457, 13439.869, 3.8146973e-005];
};

_vehicle_211 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WaterBarrel_F", [11036.703, 13435.569, 0.00011444092], [], 0, "CAN_COLLIDE"];
	_vehicle_211 = _this;
	_this setPos [11036.703, 13435.569, 0.00011444092];
};

_vehicle_212 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WaterBarrel_F", [11035.995, 13437.036], [], 0, "CAN_COLLIDE"];
	_vehicle_212 = _this;
	_this setDir -32.303226;
	_this setPos [11035.995, 13437.036];
};

_vehicle_218 = objNull;
if (true) then
{
	_this = createVehicle ["C_Quadbike_01_F", [11030.908, 13435.488, 0.20612182], [], 0, "CAN_COLLIDE"];
	_vehicle_218 = _this;
	_this setDir -103.75986;
	_this setPos [11030.908, 13435.488, 0.20612182];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.435; this addMagazineCargo [""11Rnd_45ACP_Mag"",7]; this addWeaponCargo [""hgun_Pistol_heavy_01_F"",1]; this addMagazineCargo [""Chemlight_yellow"",4]; this addMagazineCargo [""MiniGrenade"",2]"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
runInitScript;
finishMissionInit;
