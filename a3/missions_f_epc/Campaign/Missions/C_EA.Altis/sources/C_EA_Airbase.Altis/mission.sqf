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
	_this = _group_0 createUnit ["C_man_p_fugitive_F_euro", [14685.989, 16788.516], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [14685.989, 16788.516];
	_this setDir 21.182528;
	_this setVehicleVarName "BIS_placeholderPlayer";
	BIS_placeholderPlayer = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarGate_F", [14472.971, 16829.248, -6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir 136.11618;
	_this setPos [14472.971, 16829.248, -6.4849854e-005];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarGate_F", [14545.905, 16921.035, -1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 134.3306;
	_this setPos [14545.905, 16921.035, -1.9073486e-005];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14468.924, 16829.604, -8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir 48.833862;
	_this setPos [14468.924, 16829.604, -8.392334e-005];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14465.762, 16833.125, 5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setDir 46.644367;
	_this setPos [14465.762, 16833.125, 5.3405762e-005];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14462.161, 16836.092, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir 29.759188;
	_this setPos [14462.161, 16836.092, 9.5367432e-006];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14457.735, 16836.949, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir -4.965138;
	_this setPos [14457.735, 16836.949, 1.5258789e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14476.497, 16838.979, 0.00011634827], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 46.900131;
	_this setPos [14476.497, 16838.979, 0.00011634827];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14473.222, 16842.377, -0.081790924], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir 44.710636;
	_this setPos [14473.222, 16842.377, -0.081790924];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14470.509, 16846.264, -0.10380554], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir 68.243736;
	_this setPos [14470.509, 16846.264, -0.10380554];
};

_vehicle_19 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14469.928, 16850.049, -0.095752716], [], 0, "CAN_COLLIDE"];
	_vehicle_19 = _this;
	_this setDir -88.963432;
	_this setPos [14469.928, 16850.049, -0.095752716];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14553.509, 16909.67, -0.00011825562], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 47.029053;
	_this setPos [14553.509, 16909.67, -0.00011825562];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14550.136, 16913.191, -0.0069961548], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 46.644367;
	_this setPos [14550.136, 16913.191, -0.0069961548];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14546.215, 16917.166, 2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir 46.644367;
	_this setPos [14546.215, 16917.166, 2.4795532e-005];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14562.25, 16920.475, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir 47.029053;
	_this setPos [14562.25, 16920.475, 1.335144e-005];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14558.877, 16923.996, -0.065811157], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir 46.644367;
	_this setPos [14558.877, 16923.996, -0.065811157];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14554.957, 16927.971, -0.092306137], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir 46.644367;
	_this setPos [14554.957, 16927.971, -0.092306137];
};

_vehicle_44 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [14566.82, 16889.285, 0.19912092], [], 0, "CAN_COLLIDE"];
	_vehicle_44 = _this;
	_this setDir -131.20473;
	_this setVehicleLock "LOCKED";
	_this setPos [14566.82, 16889.285, 0.19912092];
};

_vehicle_46 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14496.74, 16798.988, 0.19912092], [], 0, "CAN_COLLIDE"];
	_vehicle_46 = _this;
	_this setDir 48.809456;
	_this setVehicleLock "LOCKED";
	_this setPos [14496.74, 16798.988, 0.19912092];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14516.167, 16829.979, 0.1991152], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -135.87326;
	_this setVehicleLock "LOCKED";
	_this setPos [14516.167, 16829.979, 0.1991152];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [14542.286, 16840.486, 0.17041916], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -136.93768;
	_this setVehicleLock "LOCKED";
	_this setPos [14542.286, 16840.486, 0.17041916];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_sport_F", [14533.344, 16840.93, 0.16579954], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir -130.20792;
	_this setVehicleLock "UNLOCKED";
	_this setPos [14533.344, 16840.93, 0.16579954];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14595.956, 16846.658, 0.18160503], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir -314.16577;
	_this setVehicleLock "LOCKED";
	_this setPos [14595.956, 16846.658, 0.18160503];
};

_vehicle_64 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [14573.473, 16824.209, 0.16525978], [], 0, "CAN_COLLIDE"];
	_vehicle_64 = _this;
	_this setDir 43.60989;
	_this setVehicleVarName "BIS_car";
	BIS_car = _this;
	_this setPos [14573.473, 16824.209, 0.16525978];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_sport_F", [14551.8, 16860.537, 0.1844541], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir 34.044235;
	_this setVehicleLock "LOCKED";
	_this setPos [14551.8, 16860.537, 0.1844541];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14513.599, 16812.557, 0.20562948], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setDir -159.04048;
	_this setVehicleLock "UNLOCKED";
	_this setPos [14513.599, 16812.557, 0.20562948];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14555.65, 16873.66, 0.22579014], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setDir -134.37186;
	_this setVehicleLock "UNLOCKED";
	_this setPos [14555.65, 16873.66, 0.22579014];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14560.969, 16747.631, -0.00017929077], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setDir 134.06401;
	_this setPos [14560.969, 16747.631, -0.00017929077];
};

_vehicle_90 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14563.959, 16750.623, -0.085823059], [], 0, "CAN_COLLIDE"];
	_vehicle_90 = _this;
	_this setDir 135.17528;
	_this setPos [14563.959, 16750.623, -0.085823059];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14566.666, 16753.451, -0.00011253357], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir 135.06235;
	_this setPos [14566.666, 16753.451, -0.00011253357];
};

_vehicle_94 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14569.39, 16756.289, -0.085756302], [], 0, "CAN_COLLIDE"];
	_vehicle_94 = _this;
	_this setDir 133.90413;
	_this setPos [14569.39, 16756.289, -0.085756302];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14632.238, 16832.547, -0.00012779236], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setDir 134.06401;
	_this setPos [14632.238, 16832.547, -0.00012779236];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14637.518, 16837.797, -0.085771561], [], 0, "CAN_COLLIDE"];
	_vehicle_102 = _this;
	_this setDir 135.17528;
	_this setPos [14637.518, 16837.797, -0.085771561];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = createVehicle ["B_MRAP_01_F", [14528.828, 16735.645, 0.26997909], [], 0, "CAN_COLLIDE"];
	_vehicle_109 = _this;
	_this setDir 135.79546;
	_this setVehicleLock "LOCKED";
	_this setPos [14528.828, 16735.645, 0.26997909];
};

_vehicle_113 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_transport_F", [14582.534, 16909.076, 0.24764587], [], 0, "CAN_COLLIDE"];
	_vehicle_113 = _this;
	_this setDir -89.662621;
	_this setVehicleLock "LOCKED";
	_this setPos [14582.534, 16909.076, 0.24764587];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_transport_F", [14587.432, 16904.109, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_115 = _this;
	_this setDir -88.909424;
	_this setVehicleLock "LOCKED";
	_this setPos [14587.432, 16904.109, 3.8146973e-006];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_covered_F", [14590.837, 16899.445, 0.13314024], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir -90.783669;
	_this setVehicleLock "LOCKED";
	_this setPos [14590.837, 16899.445, 0.13314024];
};

_vehicle_133 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [14576.755, 16879.486, 0.24749611], [], 0, "CAN_COLLIDE"];
	_vehicle_133 = _this;
	_this setDir 221.62126;
	_this setVehicleLock "LOCKED";
	_this setPos [14576.755, 16879.486, 0.24749611];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_fuel_F", [14576.095, 16726.75, 0.18213873], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir 40.597771;
	_this setVehicleLock "LOCKED";
	_this setPos [14576.095, 16726.75, 0.18213873];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_01_F", [14591.944, 16842.076, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setDir 118.40923;
	_this setPos [14591.944, 16842.076, -2.2888184e-005];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Loudspeakers_F", [14564.485, 16782.615, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir -51.173218;
	_this setPos [14564.485, 16782.615, -0.00012207031];
};

_vehicle_141 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Loudspeakers_F", [14613.826, 16831.713, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_141 = _this;
	_this setDir -49.478481;
	_this setPos [14613.826, 16831.713, -7.6293945e-006];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [14591.559, 16842.697, 8.392334e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -19.767008;
	_this setPos [14591.559, 16842.697, 8.392334e-005];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_fuel_F", [14556.526, 16819.547, 0.11226946], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setDir -135.44019;
	_this setVehicleLock "LOCKED";
	_this setPos [14556.526, 16819.547, 0.11226946];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_fuel_F", [14595.515, 16894.225, 0.12554844], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir -90.18325;
	_this setVehicleLock "LOCKED";
	_this setPos [14595.515, 16894.225, 0.12554844];
	_initCodes set [count _initCodes,[_this,"this setFuelCargo 0"]];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [14631.65, 16843.936, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir -136.13528;
	_this setPos [14631.65, 16843.936, -2.0980835e-005];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [14628.855, 16844.74, 5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir -170.34627;
	_this setPos [14628.855, 16844.74, 5.3405762e-005];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [14624.957, 16837.258, 0.0001335144], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setPos [14624.957, 16837.258, 0.0001335144];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Tyres_F", [14636.19, 16839.732, 0.00058607012], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir -131.43436;
	_this setPos [14636.19, 16839.732, 0.00058607012];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["B_APC_Tracked_01_AA_F", [14693.963, 16797.855, 0.090466164], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setDir 134.50444;
	_this setVehicleLock "LOCKED";
	_this setPos [14693.963, 16797.855, 0.090466164];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["B_Plane_CAS_01_F", [14737.319, 16729.475, -5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setDir -135.23544;
	_this setVehicleLock "LOCKED";
	_this setPos [14737.319, 16729.475, -5.9127808e-005];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["B_Plane_CAS_01_F", [14692.433, 16683.666, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir -135.28754;
	_this setVehicleLock "LOCKED";
	_this setPos [14692.433, 16683.666, -1.9073486e-006];
};

_vehicle_184 = objNull;
if (true) then
{
	_this = createVehicle ["B_Truck_01_fuel_F", [14700.284, 16695.5, 0.13355517], [], 0, "CAN_COLLIDE"];
	_vehicle_184 = _this;
	_this setDir 12.752411;
	_this setVehicleLock "LOCKED";
	_this setPos [14700.284, 16695.5, 0.13355517];
};

_this = createCenter west;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Pilot_F", [14730.548, 16728.279, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [14730.548, 16728.279, -7.6293945e-005];
	_this setDir -180.55728;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeBackpack this; removeHeadgear this;  [this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Pilot_F", [14730.657, 16727.107, 0.00025177002], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [14730.657, 16727.107, 0.00025177002];
	_this setDir -8.9072456;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeBackpack this; removeHeadgear this;  [this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_engineer_F", [14697.854, 16699.822, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [14697.854, 16699.822, 3.8146973e-006];
	_this setDir 212.82835;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeBackpack this; [this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_engineer_F", [14697.312, 16698.973, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [14697.312, 16698.973, -2.6702881e-005];
	_this setDir 25.115904;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; removeBackpack this; [this,""STAND_U3"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_185 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HelipadCivil_F", [14747.027, 16679.732, 0.00018501282], [], 0, "CAN_COLLIDE"];
	_vehicle_185 = _this;
	_this setDir -44.310291;
	_this setPos [14747.027, 16679.732, 0.00018501282];
};

_vehicle_190 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HelipadCivil_F", [14711.031, 16640.043], [], 0, "CAN_COLLIDE"];
	_vehicle_190 = _this;
	_this setDir -50.107075;
	_this setPos [14711.031, 16640.043];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HelipadCivil_F", [14785.139, 16716.627, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setDir -44.310291;
	_this setPos [14785.139, 16716.627, -3.8146973e-006];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["B_Heli_Light_01_F", [14711.232, 16639.865, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setDir -50.276363;
	_this setVehicleLock "LOCKEDPLAYER";
	_this setPos [14711.232, 16639.865, 7.6293945e-006];
};

_group_2 = createGroup _center_1;

_unit_15 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_Soldier_F", [14642.496, 16794.357, 6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [14642.496, 16794.357, 6.4849854e-005];
	_this setDir 42.430302;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["B_soldier_AR_F", [14643.762, 16795.541, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [14643.762, 16795.541, 5.7220459e-006];
	_this setDir 220.12306;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_group_3 = createGroup _center_0;

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["B_APC_Wheeled_01_cannon_F", [14545.541, 16808.186, 0.20438741], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setDir -137.31375;
	_this setVehicleLock "LOCKED";
	_this setPos [14545.541, 16808.186, 0.20438741];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_soldier_repair_F", [14560.487, 16823.605, 2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [14560.487, 16823.605, 2.6702881e-005];
	_this setDir -147.56277;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""REPAIR_VEH_STAND"",""NONE""] call BIS_fnc_ambientAnim;"]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_GL_F", [14552.731, 16812.535, 4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [14552.731, 16812.535, 4.3869019e-005];
	_this setDir 154.52496;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_28 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_soldier_M_F", [14575.585, 16910.795, -7.8201294e-005], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [14575.585, 16910.795, -7.8201294e-005];
	_this setDir -86.674179;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_lite_F", [14601.397, 16890.174, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [14601.397, 16890.174, 3.8146973e-006];
	_this setDir 138.65303;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_group_4 = createGroup _center_0;

_unit_34 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["C_man_hunter_1_F", [14592.765, 16843.117, -0.00033569336], [], 0, "CAN_COLLIDE"];
	_unit_34 = _this;
	_this setPos [14592.765, 16843.117, -0.00033569336];
	_this setDir -106.3278;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_35 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["C_man_w_worker_F", [14566.809, 16891.732, 0.00016975403], [], 0, "CAN_COLLIDE"];
	_unit_35 = _this;
	_this setPos [14566.809, 16891.732, 0.00016975403];
	_this setDir 127.48383;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""REPAIR_VEH_KNEEL"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_38 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["C_man_1_2_F", [14591.261, 16843.109, -9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_unit_38 = _this;
	_this setPos [14591.261, 16843.109, -9.5367432e-006];
	_this setDir 102.26759;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND_U2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_209 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_F", [14634.926, 16835.248, -6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_209 = _this;
	_this setDir 134.06401;
	_this setPos [14634.926, 16835.248, -6.8664551e-005];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
