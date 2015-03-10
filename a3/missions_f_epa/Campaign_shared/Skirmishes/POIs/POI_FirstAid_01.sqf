_initCodes = [];

_this = createCenter civilian;
_center_1 = _this;

_this = createCenter resistance;
_center_0 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_0;

_group_2 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_Soldier_AR_F", [4605.2378, 21512.67], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [4605.2378, 21512.67];
	_this setUnitAbility 0.52000004;
	if (true) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_FirstAid_01_groupCyan = group this; this setBehaviour ""Safe""; this setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; "]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_GL_F", [4527.502, 21332.566], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [4527.502, 21332.566];
	_this setUnitAbility 0.50120878;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_FirstAid_01_groupBlue = group this; this setBehaviour ""Safe""; this setSpeedMode ""Limited""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]; "]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_lite_F", [4528.7134, 21331.365], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [4528.7134, 21331.365];
	_this setUnitAbility 0.47388345;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["I_Quadbike_01_F", [4572.2778, 21458.352, 0.20694156], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -26.109465;
	_this setPos [4572.2778, 21458.352, 0.20694156];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.745"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["I_MRAP_03_F", [4582.2285, 21453.408, 0.22638464], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir 13.646227;
	_this setPos [4582.2285, 21453.408, 0.22638464];
	_initCodes set [count _initCodes,[_this,"this lock true; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this"]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [4561.0679, 21441.383, 4.7204604], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir -14.29021;
	_this setPos [4561.0679, 21441.383, 4.7204604];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [4562.5488, 21442.184, 4.7450395], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [4562.5488, 21442.184, 4.7450395];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [4565.3052, 21441.943, 5.03617], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [4565.3052, 21441.943, 5.03617];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [-0.2,0.3,0.25]"]];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [4568.7749, 21442.381, 4.6683679], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir -14.072178;
	_this setPos [4568.7749, 21442.381, 4.6683679];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [4564.166, 21448.789, 4.0577359], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir -88.356956;
	_this setPos [4564.166, 21448.789, 4.0577359];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [4563.7368, 21440.438, 1.3647935], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -102.79231;
	_this setPos [4563.7368, 21440.438, 1.3647935];
	_initCodes set [count _initCodes,[_this,"[302.777,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [4558.9292, 21451.396, 3.5977299], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 74.842918;
	_this setPos [4558.9292, 21451.396, 3.5977299];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4559.6396, 21451.611, 3.6222577], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir 77.383469;
	_this setPos [4559.6396, 21451.611, 3.6222577];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4561.6934, 21451.049, 3.7423792], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir -198.91017;
	_this setPos [4561.6934, 21451.049, 3.7423792];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4562.7661, 21451.297, 3.8371916], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -175.6805;
	_this setPos [4562.7661, 21451.297, 3.8371916];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [4558.6504, 21452.91, 3.5909305], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir -418.65314;
	_this setPos [4558.6504, 21452.91, 3.5909305];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_clean_F", [4559.9131, 21450.543, 3.6326971], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setPos [4559.9131, 21450.543, 3.6326971];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [4594.1802, 21446.891, 1.159897], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir -25.344538;
	_this setPos [4594.1802, 21446.891, 1.159897];
	_initCodes set [count _initCodes,[_this,"[301.57,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [4595.0273, 21447.273, 1.2075204], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setPos [4595.0273, 21447.273, 1.2075204];
	_initCodes set [count _initCodes,[_this,"[301.57,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Icebox_F", [4564.8413, 21438.746, 0.15758391], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -14.689187;
	_this setPos [4564.8413, 21438.746, 0.15758391];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [4567.5879, 21437.08, 0.34700125], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setPos [4567.5879, 21437.08, 0.34700125];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4567.6816, 21438.223, 0.18168598], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir 8.8075609;
	_this setPos [4567.6816, 21438.223, 0.18168598];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4623.6021, 21431.27, 1.1900541], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -69.791672;
	_this setPos [4623.6021, 21431.27, 1.1900541];
	_initCodes set [count _initCodes,[_this,"[295.149,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4625.5542, 21429.135, 0.89479607], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -33.32901;
	_this setPos [4625.5542, 21429.135, 0.89479607];
	_initCodes set [count _initCodes,[_this,"[295.149,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4622.627, 21429.645, 1.038126], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setPos [4622.627, 21429.645, 1.038126];
	_initCodes set [count _initCodes,[_this,"[295.149,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4625.0737, 21430.295, 1.1316199], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 114.57105;
	_this setPos [4625.0737, 21430.295, 1.1316199];
	_initCodes set [count _initCodes,[_this,"[295.149,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4622.5786, 21427.104, 0.72032535], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -87.326218;
	_this setPos [4622.5786, 21427.104, 0.72032535];
	_initCodes set [count _initCodes,[_this,"[295.149,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [4630.2676, 21426.627, 1.5028892], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -38.626015;
	_this setPos [4630.2676, 21426.627, 1.5028892];
	_initCodes set [count _initCodes,[_this,"[295.335,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [4630.1265, 21426.809, 4.9583416], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir -60.397366;
	_this setPos [4630.1265, 21426.809, 4.9583416];
	_initCodes set [count _initCodes,[_this,"[298.843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [4572.7412, 21406.906, 3.2694657], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir 39.546242;
	_this setPos [4572.7412, 21406.906, 3.2694657];
	_initCodes set [count _initCodes,[_this,"[303.367,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [4573.4375, 21406.156, 3.21753], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir 129.08815;
	_this setPos [4573.4375, 21406.156, 3.21753];
	_initCodes set [count _initCodes,[_this,"[303.367,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_painted_F", [4574.2368, 21408.146, 3.2224007], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setPos [4574.2368, 21408.146, 3.2224007];
	_initCodes set [count _initCodes,[_this,"[303.367,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [4575.8994, 21403.777, 0.52585292], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -33.248531;
	_this setPos [4575.8994, 21403.777, 0.52585292];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [4580.0732, 21410.988, 0.57688999], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir -47.036484;
	_this setPos [4580.0732, 21410.988, 0.57688999];
	_initCodes set [count _initCodes,[_this,"[300.274,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [4579.8511, 21414.662, 0.55036873], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir 51.116447;
	_this setPos [4579.8511, 21414.662, 0.55036873];
	_initCodes set [count _initCodes,[_this,"[300.274,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [4688.4648, 21380.373, 0.76879889], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir 77.123192;
	_this setPos [4688.4648, 21380.373, 0.76879889];
	_initCodes set [count _initCodes,[_this,"[297.736,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4689.3369, 21380.703, 0.79234749], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir 68.521538;
	_this setPos [4689.3369, 21380.703, 0.79234749];
	_initCodes set [count _initCodes,[_this,"[297.736,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [4687.8027, 21383.824, 0.88959372], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir -14.302192;
	_this setPos [4687.8027, 21383.824, 0.88959372];
	_initCodes set [count _initCodes,[_this,"[297.736,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [4691.6006, 21383.758, 0.93759334], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 61.495407;
	_this setPos [4691.6006, 21383.758, 0.93759334];
	_initCodes set [count _initCodes,[_this,"[297.736,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [4704.855, 21356.217, 1.7654369], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir 93.032906;
	_this setPos [4704.855, 21356.217, 1.7654369];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [4704.498, 21357.832, 1.5611374], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir 69.501175;
	_this setPos [4704.498, 21357.832, 1.5611374];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car3_F", [4670.1338, 21354.16, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setDir -324.19666;
	_this setPos [4670.1338, 21354.16, 3.0517578e-005];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [4612.1968, 21345.652, 3.6129525], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir 73.311295;
	_this setPos [4612.1968, 21345.652, 3.6129525];
	_initCodes set [count _initCodes,[_this,"[302.566,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_khaki_F", [4611.666, 21344.045, 3.8535931], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setDir -43.009441;
	_this setPos [4611.666, 21344.045, 3.8535931];
	_initCodes set [count _initCodes,[_this,"[302.566,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [4565.104, 21380.68, 0.38906327], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setPos [4565.104, 21380.68, 0.38906327];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterPlastic_F", [4564.3901, 21383.068, 0.36531112], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 47.044849;
	_this setPos [4564.3901, 21383.068, 0.36531112];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [4566.4263, 21383.215, 0.36838287], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir -218.98657;
	_this setPos [4566.4263, 21383.215, 0.36838287];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [4505.458, 21446.891, 3.5470092], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setPos [4505.458, 21446.891, 3.5470092];
	_initCodes set [count _initCodes,[_this,"[304.285,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_88 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_blue_F", [4503.3774, 21442.867, 3.9389377], [], 0, "CAN_COLLIDE"];
	_vehicle_88 = _this;
	_this setDir 79.123695;
	_this setPos [4503.3774, 21442.867, 3.9389377];
	_initCodes set [count _initCodes,[_this,"[304.285,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4526.4155, 21334.863], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setPos [4526.4155, 21334.863];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4526.8931, 21334.852], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setPos [4526.8931, 21334.852];
};

_vehicle_110 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4605.1216, 21515.121], [], 0, "CAN_COLLIDE"];
	_vehicle_110 = _this;
	_this setPos [4605.1216, 21515.121];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4605.563, 21515.102], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setPos [4605.563, 21515.102];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [4563.2759, 21447.418], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setVehicleVarName "BIS_POI_FirstAid_01_center";
	BIS_POI_FirstAid_01_center = _this;
	_this setPos [4563.2759, 21447.418];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [4563.4619, 21453.705, 0.41149211], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir 170.73579;
	_this setPos [4563.4619, 21453.705, 0.41149211];
	_initCodes set [count _initCodes,[_this,"[302.777,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4558.377, 21450.775], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setPos [4558.377, 21450.775];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""InfirmaryKits""];"]];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [4560.6533, 21453.432, 3.6922123], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setDir 168.64107;
	_this setPos [4560.6533, 21453.432, 3.6922123];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4563.5503, 21441.041], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setPos [4563.5503, 21441.041];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [4561.6968, 21443.467, 1.1718413], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir -102.79231;
	_this setPos [4561.6968, 21443.467, 1.1718413];
	_initCodes set [count _initCodes,[_this,"[302.777,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [4559.4761, 21448.486, 3.8599336], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setDir 74.774368;
	_this setPos [4559.4761, 21448.486, 3.8599336];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [4562.3599, 21449.814, 3.8975441], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir 166.19817;
	_this setPos [4562.3599, 21449.814, 3.8975441];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_149 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [4560.6665, 21449.262, 3.8554659], [], 0, "CAN_COLLIDE"];
	_vehicle_149 = _this;
	_this setDir -6.2612419;
	_this setPos [4560.6665, 21449.262, 3.8554659];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [4567.8657, 21444.564, 4.4801531], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir -104.68305;
	_this setPos [4567.8657, 21444.564, 4.4801531];
	_initCodes set [count _initCodes,[_this,"[306.197,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_238 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4506.1006, 21443.877, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_238 = _this;
	_this setPos [4506.1006, 21443.877, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_240 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4594.4604, 21448.281], [], 0, "CAN_COLLIDE"];
	_vehicle_240 = _this;
	_this setPos [4594.4604, 21448.281];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_242 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4624.0381, 21428.73], [], 0, "CAN_COLLIDE"];
	_vehicle_242 = _this;
	_this setPos [4624.0381, 21428.73];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_244 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4689.7876, 21382.547], [], 0, "CAN_COLLIDE"];
	_vehicle_244 = _this;
	_this setPos [4689.7876, 21382.547];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_246 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4613.1436, 21344.703, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_246 = _this;
	_this setPos [4613.1436, 21344.703, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_248 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4574.4805, 21406.898, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_248 = _this;
	_this setPos [4574.4805, 21406.898, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_250 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4581.2261, 21413.24, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_250 = _this;
	_this setPos [4581.2261, 21413.24, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_253 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [4629.4722, 21425.576, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_253 = _this;
	_this setPos [4629.4722, 21425.576, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_group_3 = createGroup _center_0;

_unit_13 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["I_Soldier_TL_F", [4571.6279, 21455.576], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [4571.6279, 21455.576];
	_this setDir 144.81447;
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this setSkill 0.45"]];
};

_group_4 = createGroup _center_0;

_unit_14 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_medic_F", [4572.5249, 21453.949], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [4572.5249, 21453.949];
	_this setDir -30.187939;
	_this setUnitAbility 0.54955345;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this setVariable [""BIS_ambientAnim"",[""STAND"",""ASIS""]]; this setUnitPos ""Up""; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; clearItemCargo (unitBackpack this); (unitBackpack this) addItemCargo [""Medikit"",1]; (unitBackpack this) addItemCargo [""FirstAidKit"",4]; (unitBackpack this) addMagazineCargo [""UGL_FlareWhite_F"",8]; (unitBackpack this) addMagazineCargo [""Chemlight_green"",5]; this addHeadgear ""H_Booniehat_dgtl"""]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_soldier_F", [4605.9263, 21512.02], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [4605.9263, 21512.02];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_255 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4586.4893, 21480.945, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_255 = _this;
	_this setPos [4586.4893, 21480.945, 0];
};

_vehicle_257 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4578.0288, 21448.627, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_257 = _this;
	_this setPos [4578.0288, 21448.627, 0];
};

_vehicle_259 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4600.4937, 21423.5], [], 0, "CAN_COLLIDE"];
	_vehicle_259 = _this;
	_this setPos [4600.4937, 21423.5];
};

_vehicle_261 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4645.1152, 21399.777, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_261 = _this;
	_this setPos [4645.1152, 21399.777, 0];
};

_vehicle_263 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4663.2837, 21372.82, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_263 = _this;
	_this setPos [4663.2837, 21372.82, 0];
};

_vehicle_265 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4647.1045, 21347.135], [], 0, "CAN_COLLIDE"];
	_vehicle_265 = _this;
	_this setPos [4647.1045, 21347.135];
};

_vehicle_267 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4614.8965, 21359.939], [], 0, "CAN_COLLIDE"];
	_vehicle_267 = _this;
	_this setPos [4614.8965, 21359.939];
};

_vehicle_269 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4590.8369, 21380.518, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_269 = _this;
	_this setPos [4590.8369, 21380.518, 0];
};

_vehicle_271 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4562.687, 21400.801, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_271 = _this;
	_this setPos [4562.687, 21400.801, 0];
};

_vehicle_273 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4539.5562, 21422.742, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_273 = _this;
	_this setPos [4539.5562, 21422.742, 0];
};

_vehicle_275 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4529.4941, 21447.689, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_275 = _this;
	_this setPos [4529.4941, 21447.689, 0];
};

_vehicle_277 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4524.5283, 21482.309, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_277 = _this;
	_this setPos [4524.5283, 21482.309, 0];
};

_vehicle_279 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4528.2881, 21512.748], [], 0, "CAN_COLLIDE"];
	_vehicle_279 = _this;
	_this setPos [4528.2881, 21512.748];
};

_vehicle_281 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4540.9927, 21536.631], [], 0, "CAN_COLLIDE"];
	_vehicle_281 = _this;
	_this setPos [4540.9927, 21536.631];
};

_vehicle_283 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4585.9297, 21525.645], [], 0, "CAN_COLLIDE"];
	_vehicle_283 = _this;
	_this setPos [4585.9297, 21525.645];
};

_vehicle_285 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4566.2227, 21538.852], [], 0, "CAN_COLLIDE"];
	_vehicle_285 = _this;
	_this setPos [4566.2227, 21538.852];
};

_vehicle_288 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4503.4805, 21363.666, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_288 = _this;
	_this setPos [4503.4805, 21363.666, 0];
};

_vehicle_290 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4505.9731, 21403.344, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_290 = _this;
	_this setPos [4505.9731, 21403.344, 0];
};

_vehicle_292 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4519.1758, 21439.375], [], 0, "CAN_COLLIDE"];
	_vehicle_292 = _this;
	_this setPos [4519.1758, 21439.375];
};

_vehicle_294 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4508.958, 21476.887], [], 0, "CAN_COLLIDE"];
	_vehicle_294 = _this;
	_this setPos [4508.958, 21476.887];
};

_vehicle_296 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4545.7266, 21480.57], [], 0, "CAN_COLLIDE"];
	_vehicle_296 = _this;
	_this setPos [4545.7266, 21480.57];
};

_vehicle_298 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4560.8696, 21462.291], [], 0, "CAN_COLLIDE"];
	_vehicle_298 = _this;
	_this setPos [4560.8696, 21462.291];
};

_vehicle_300 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4578.418, 21443.387, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_300 = _this;
	_this setPos [4578.418, 21443.387, 0];
};

_vehicle_302 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4568.0337, 21416.096, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_302 = _this;
	_this setPos [4568.0337, 21416.096, 0];
};

_vehicle_304 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4553.5327, 21383.701, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_304 = _this;
	_this setPos [4553.5327, 21383.701, 0];
};

_vehicle_306 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4567.4927, 21351.592, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_306 = _this;
	_this setPos [4567.4927, 21351.592, 0];
};

_vehicle_308 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4550.7144, 21328.25, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_308 = _this;
	_this setPos [4550.7144, 21328.25, 0];
};

_vehicle_309 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [4569.8706, 21457.121, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_309 = _this;
	_this setPos [4569.8706, 21457.121, -3.0517578e-005];
};

_vehicle_311 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [4547.7017, 21409.422, -0.00021362305], [], 0, "CAN_COLLIDE"];
	_vehicle_311 = _this;
	_this setPos [4547.7017, 21409.422, -0.00021362305];
};

_vehicle_313 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [4620.8779, 21426.828, 0.87407643], [], 0, "CAN_COLLIDE"];
	_vehicle_313 = _this;
	_this setPos [4620.8779, 21426.828, 0.87407643];
	_initCodes set [count _initCodes,[_this,"[295.149,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_315 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [4552.6763, 21506.078, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_315 = _this;
	_this setPos [4552.6763, 21506.078, -9.1552734e-005];
};

_vehicle_316 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_forest_F", [4550.7134, 21506.42, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_316 = _this;
	_this setDir 7.4820142;
	_this setPos [4550.7134, 21506.42, -6.1035156e-005];
};

_vehicle_317 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Shovel_F", [4552.0024, 21505.471, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_317 = _this;
	_this setDir -128.18651;
	_this setPos [4552.0024, 21505.471, 6.1035156e-005];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
