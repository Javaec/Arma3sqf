_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_this = createCenter resistance;
_center_1 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_1;

_group_4 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_TL_F", [10415.22, 17118.701], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [10415.22, 17118.701];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.5243302;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedHeli_01_groupCyan = group this; this setSkill 0.45"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_TL_F", [11114.53, 17407.621], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [11114.53, 17407.621];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.52000004;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedHeli_01_groupYellow = group this; this setSkill 0.45; "]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_Soldier_AR_F", [10411.093, 17116.336], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [10411.093, 17116.336];
	_this setUnitAbility 0.51802415;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_soldier_F", [10414.909, 17114.809], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [10414.909, 17114.809];
	_this setUnitAbility 0.44000006;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_medic_F", [10419.298, 17115.574], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [10419.298, 17115.574];
	_this setUnitAbility 0.50961637;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_GL_F", [11110.043, 17403.887], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [11110.043, 17403.887];
	_this setUnitAbility 0.5012086;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_M_F", [11113.118, 17403.27], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [11113.118, 17403.27];
	_this setUnitAbility 0.50961655;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_lite_F", [11116.836, 17403.652], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [11116.836, 17403.652];
	_this setUnitAbility 0.46757758;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; removeHeadgear this; this addHeadgear ""H_booniehat_dgtl""; this unlinkItem ""NVGoggles_indep""; this removeWeapon (handgunWeapon this); this removeMagazines ""9Rnd_45ACP_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_556x45_Stanag""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4]; this addWeapon ""SMG_02_ACO_F""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_helipilot_F", [10497.689, 17235.127], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [10497.689, 17235.127];
	_this setUnitAbility 0.55375731;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInDriver BIS_POI_CrashedHeli_01_Hellcat; {_x setDamage 1} forEach (units group this)"]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_helipilot_F", [10487.243, 17233.311], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [10487.243, 17233.311];
	_this setDir 14.211249;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; removeHeadgear this"]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_AR_F", [10484.048, 17232.234], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [10484.048, 17232.234];
	_this setDir -34.427273;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_GL_F", [10499.021, 17232.641], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [10499.021, 17232.641];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo [BIS_POI_CrashedHeli_01_Hellcat,5]"]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_officer_F", [10488.075, 17225.881], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [10488.075, 17225.881];
	_this setDir -187.69217;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
};

_unit_18 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [10498.118, 17231.264], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [10498.118, 17231.264];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo [BIS_POI_CrashedHeli_01_Hellcat,4]"]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_soldier_F", [10500.908, 17230.408], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [10500.908, 17230.408];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this moveInCargo [BIS_POI_CrashedHeli_01_Hellcat,2]"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["I_Heli_light_03_F", [10483.157, 17229.918, -0.10450554], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir 75.085571;
	_this setVehicleVarName "BIS_POI_CrashedHeli_01_Hellcat";
	BIS_POI_CrashedHeli_01_Hellcat = _this;
	_this setPos [10483.157, 17229.918, -0.10450554];
	_initCodes set [count _initCodes,[_this,"this lock true; this setDamage 0.75; this setVehicleAmmo 0; this setFuel 0; clearItemCargo this"]];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [10405.857, 17180.867, -0.0001449585], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 49.607239;
	_this setPos [10405.857, 17180.867, -0.0001449585];
};

_vehicle_3 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [10381.182, 17211.834, -0.00020599365], [], 0, "CAN_COLLIDE"];
	_vehicle_3 = _this;
	_this setDir -35.879871;
	_this setPos [10381.182, 17211.834, -0.00020599365];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [10382.256, 17210.652, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setPos [10382.256, 17210.652, 7.6293945e-006];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [10388.569, 17207.404, 0.44878763], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir 50.568966;
	_this setPos [10388.569, 17207.404, 0.44878763];
	_initCodes set [count _initCodes,[_this,"[81.1081,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_7 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CashDesk_F", [10397.794, 17206.719, 0.19867533], [], 0, "CAN_COLLIDE"];
	_vehicle_7 = _this;
	_this setDir -41.337711;
	_this setPos [10397.794, 17206.719, 0.19867533];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [10410.503, 17221.801, 0.44564733], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -57.375027;
	_this setPos [10410.503, 17221.801, 0.44564733];
	_initCodes set [count _initCodes,[_this,"[82.3498,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [10407.733, 17222.816, 0.4361878], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 32.692982;
	_this setPos [10407.733, 17222.816, 0.4361878];
	_initCodes set [count _initCodes,[_this,"[82.3498,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_khaki_F", [10407.354, 17215.354, 0.61329663], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir -61.898167;
	_this setPos [10407.354, 17215.354, 0.61329663];
	_initCodes set [count _initCodes,[_this,"[82.3498,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_blue_F", [10405.666, 17215.982, 0.37561956], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir -66.207138;
	_this setPos [10405.666, 17215.982, 0.37561956];
	_initCodes set [count _initCodes,[_this,"[82.3498,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [10408.214, 17223.721, 3.5643711], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir -50.777687;
	_this setPos [10408.214, 17223.721, 3.5643711];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [10409.745, 17220.83, 3.5356615], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir 71.812271;
	_this setPos [10409.745, 17220.83, 3.5356615];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [10434.811, 17249.336, 0.49382731], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -42.434566;
	_this setPos [10434.811, 17249.336, 0.49382731];
	_initCodes set [count _initCodes,[_this,"[84.843,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [10433.543, 17251.402, 0.54018098], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir 10.199156;
	_this setPos [10433.543, 17251.402, 0.54018098];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [10457.547, 17237.719, 0.63244867], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 141.70886;
	_this setPos [10457.547, 17237.719, 0.63244867];
	_initCodes set [count _initCodes,[_this,"[84.7203,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10455.201, 17236.076, 0.67812413], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir 133.58899;
	_this setPos [10455.201, 17236.076, 0.67812413];
	_initCodes set [count _initCodes,[_this,"[84.7203,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [10453.434, 17240.273, 4.1411695], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir 21.037674;
	_this setPos [10453.434, 17240.273, 4.1411695];
	_initCodes set [count _initCodes,[_this,"[84.7203,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [10463.515, 17206.119, 0.47498602], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setPos [10463.515, 17206.119, 0.47498602];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [10440.034, 17223.811, 0.89046937], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir 36.486496;
	_this setPos [10440.034, 17223.811, 0.89046937];
	_initCodes set [count _initCodes,[_this,"[84.0964,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [10437.626, 17225.678, 1.0463341], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 42.736267;
	_this setPos [10437.626, 17225.678, 1.0463341];
	_initCodes set [count _initCodes,[_this,"[84.0964,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10437.165, 17227.529, 0.8531481], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 36.261456;
	_this setPos [10437.165, 17227.529, 0.8531481];
	_initCodes set [count _initCodes,[_this,"[84.0964,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10439.707, 17229.076, 0.86478633], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir 125.29956;
	_this setPos [10439.707, 17229.076, 0.86478633];
	_initCodes set [count _initCodes,[_this,"[84.0964,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [10441.477, 17228.219, 0.49487793], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -59.001415;
	_this setPos [10441.477, 17228.219, 0.49487793];
	_initCodes set [count _initCodes,[_this,"[84.0964,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [10445.383, 17225.676, 0.71779323], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir 14.11429;
	_this setPos [10445.383, 17225.676, 0.71779323];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Slide_F", [10505.188, 17239.111, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir 122.14253;
	_this setPos [10505.188, 17239.111, -2.2888184e-005];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [10475.69, 17218.885, 0.30431154], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir -49.240738;
	_this setPos [10475.69, 17218.885, 0.30431154];
	_initCodes set [count _initCodes,[_this,"[83.1659,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [10473.797, 17213.717, 0.37162802], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir -67.492058;
	_this setPos [10473.797, 17213.717, 0.37162802];
	_initCodes set [count _initCodes,[_this,"[83.1659,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [10472.759, 17214.977, 0.24636042], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir 23.804115;
	_this setPos [10472.759, 17214.977, 0.24636042];
};

_vehicle_37 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallet_F", [10475.761, 17216.881, 0.22205791], [], 0, "CAN_COLLIDE"];
	_vehicle_37 = _this;
	_this setDir -13.664453;
	_this setPos [10475.761, 17216.881, 0.22205791];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bench_F", [10487.72, 17253.008, 0.31042194], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir 41.139206;
	_this setPos [10487.72, 17253.008, 0.31042194];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [10416.771, 17222.057, 0.67789483], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir 13.72571;
	_this setPos [10416.771, 17222.057, 0.67789483];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [10413.852, 17225.646, 0.4419291], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -75.724609;
	_this setPos [10413.852, 17225.646, 0.4419291];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10482.239, 17299.986, 0.23926018], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setDir -146.9615;
	_this setPos [10482.239, 17299.986, 0.23926018];
	_initCodes set [count _initCodes,[_this,"[88.145,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [10475.635, 17298.572, 0.73934609], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -57.058071;
	_this setPos [10475.635, 17298.572, 0.73934609];
	_initCodes set [count _initCodes,[_this,"[88.145,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [10500.742, 17238.232, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setPos [10500.742, 17238.232, -2.2888184e-005];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square3_F", [10504.46, 17237.502, -0.00010681152], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [10504.46, 17237.502, -0.00010681152];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [10474.596, 17223.441, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setPos [10474.596, 17223.441, 6.1035156e-005];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [10459.243, 17253.707, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setDir -405.51172;
	_this setPos [10459.243, 17253.707, -4.5776367e-005];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [10474.177, 17254.16, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -53.60519;
	_this setPos [10474.177, 17254.16, 9.9182129e-005];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_F", [10437.201, 17343.635, 0.41908842], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setDir -73.027954;
	_this setPos [10437.201, 17343.635, 0.41908842];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [10438.125, 17346.027, 0.30668965], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setDir 34.21246;
	_this setPos [10438.125, 17346.027, 0.30668965];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [10489.662, 17317.338, 0.29499179], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir -75.182739;
	_this setPos [10489.662, 17317.338, 0.29499179];
	_initCodes set [count _initCodes,[_this,"[89.4418,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesWooden_F", [10489.964, 17319.395, 0.43633616], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -56.884708;
	_this setPos [10489.964, 17319.395, 0.43633616];
	_initCodes set [count _initCodes,[_this,"[89.4418,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bucket_F", [10488.943, 17315.729, 0.34040713], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setPos [10488.943, 17315.729, 0.34040713];
	_initCodes set [count _initCodes,[_this,"[89.4418,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ShelvesMetal_F", [10485.613, 17311.219, 0.74116832], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir 26.545546;
	_this setPos [10485.613, 17311.219, 0.74116832];
	_initCodes set [count _initCodes,[_this,"[89.4418,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [10461.125, 17261.205, -8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir -84.977562;
	_this setPos [10461.125, 17261.205, -8.392334e-005];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [10459.203, 17262.51, 7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [10459.203, 17262.51, 7.6293945e-005];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_CarDismantled_F", [10488.477, 17296.832, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir -66.926277;
	_this setPos [10488.477, 17296.832, -0.00012207031];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad2_F", [10426.333, 17224.338, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 47.677471;
	_this setPos [10426.333, 17224.338, 4.5776367e-005];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [10483.137, 17231.523], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setVehicleVarName "BIS_POI_CrashedHeli_01_center";
	BIS_POI_CrashedHeli_01_center = _this;
	_this setPos [10483.137, 17231.523];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["I_Soldier_A_F", [10483.898, 17227.248], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [10483.898, 17227.248];
	_this setDir -108.3764;
	_this setUnitAbility 0.528534;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [11114.351, 17412.277], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setPos [11114.351, 17412.277];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10417.996, 17129.828], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setPos [10417.996, 17129.828];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10386.337, 17153.115], [], 0, "CAN_COLLIDE"];
	_vehicle_132 = _this;
	_this setPos [10386.337, 17153.115];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10342.857, 17187.762], [], 0, "CAN_COLLIDE"];
	_vehicle_134 = _this;
	_this setPos [10342.857, 17187.762];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10365.575, 17268.361], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setPos [10365.575, 17268.361];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10428.272, 17325.273], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setPos [10428.272, 17325.273];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10525.979, 17324.385], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setPos [10525.979, 17324.385];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10537.156, 17245.855], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setPos [10537.156, 17245.855];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10506.69, 17164.006], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setPos [10506.69, 17164.006];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [10418.323, 17129.775], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setPos [10418.323, 17129.775];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [11114.789, 17412.309], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setPos [11114.789, 17412.309];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [11019.723, 17716.664], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setPos [11019.723, 17716.664];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10586.851, 17810.309], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setPos [10586.851, 17810.309];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10204.325, 17701.9], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setPos [10204.325, 17701.9];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10002, 17511.531], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setPos [10002, 17511.531];
};

_vehicle_168 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10000.225, 17291.83], [], 0, "CAN_COLLIDE"];
	_vehicle_168 = _this;
	_this setPos [10000.225, 17291.83];
};

_vehicle_172 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10120.485, 17069.135], [], 0, "CAN_COLLIDE"];
	_vehicle_172 = _this;
	_this setPos [10120.485, 17069.135];
};

_vehicle_174 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10358.105, 16916.115], [], 0, "CAN_COLLIDE"];
	_vehicle_174 = _this;
	_this setPos [10358.105, 16916.115];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10740.342, 17015.43], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setPos [10740.342, 17015.43];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Yellow_F", [10945.82, 17213.02], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setPos [10945.82, 17213.02];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [10444.01, 17257.777, 0.041182902], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir 141.77106;
	_this setPos [10444.01, 17257.777, 0.041182902];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.205"]];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [10484.243, 17230.279], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setPos [10484.243, 17230.279];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 2]"]];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [10485.152, 17230.449], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setPos [10485.152, 17230.449];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 0.75]"]];
};

_vehicle_233 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10474.429, 17216.057], [], 0, "CAN_COLLIDE"];
	_vehicle_233 = _this;
	_this setPos [10474.429, 17216.057];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_235 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10516.144, 17219.074, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_235 = _this;
	_this setPos [10516.144, 17219.074, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_237 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10516.04, 17221.539, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_237 = _this;
	_this setPos [10516.04, 17221.539, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_239 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10516.04, 17223.08, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_239 = _this;
	_this setPos [10516.04, 17223.08, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_241 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10478.667, 17300.412], [], 0, "CAN_COLLIDE"];
	_vehicle_241 = _this;
	_this setPos [10478.667, 17300.412];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10486.305, 17314.885], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setPos [10486.305, 17314.885];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_245 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10455.845, 17238.598], [], 0, "CAN_COLLIDE"];
	_vehicle_245 = _this;
	_this setPos [10455.845, 17238.598];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

_vehicle_247 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10439.635, 17226.615], [], 0, "CAN_COLLIDE"];
	_vehicle_247 = _this;
	_this setPos [10439.635, 17226.615];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_249 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10407.401, 17219.959], [], 0, "CAN_COLLIDE"];
	_vehicle_249 = _this;
	_this setPos [10407.401, 17219.959];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_251 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10390.472, 17205.82], [], 0, "CAN_COLLIDE"];
	_vehicle_251 = _this;
	_this setPos [10390.472, 17205.82];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""OfficeLowTech""];"]];
};

_vehicle_254 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [10435.977, 17251.389, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_254 = _this;
	_this setPos [10435.977, 17251.389, 0];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
