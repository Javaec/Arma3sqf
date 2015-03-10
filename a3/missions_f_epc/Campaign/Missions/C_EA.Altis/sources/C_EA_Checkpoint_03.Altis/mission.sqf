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
	_this = _group_0 createUnit ["C_man_p_fugitive_F_euro", [15121.94, 17543.314], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [15121.94, 17543.314];
	_this setDir 119.02712;
	_this setVehicleVarName "BIS_placeholderPlayer";
	BIS_placeholderPlayer = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Small_F", [15115.901, 17509.555, -0.15721165], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 46.939594;
	_this setPos [15115.901, 17509.555, -0.15721165];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15117.262, 17505.938, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir 48.426022;
	_this setPos [15117.262, 17505.938, -9.5367432e-007];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15119.267, 17503.723, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 48.426022;
	_this setPos [15119.267, 17503.723, 2.8610229e-006];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15121.261, 17503.361, -4.4822693e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir -39.567631;
	_this setPos [15121.261, 17503.361, -4.4822693e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["B_HMG_01_high_F", [15118.831, 17505.416, 0.00020122528], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -129.54546;
	_this setVehicleLock "LOCKED";
	_this setPos [15118.831, 17505.416, 0.00020122528];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15100.517, 17524.738, 1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir 45.257645;
	_this setPos [15100.517, 17524.738, 1.7166138e-005];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15102.647, 17522.637, -0.0403862], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 45.257645;
	_this setPos [15102.647, 17522.637, -0.0403862];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15104.661, 17522.396, -0.072270393], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir -42.736008;
	_this setPos [15104.661, 17522.396, -0.072270393];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15100.205, 17526.871, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -42.736008;
	_this setPos [15100.205, 17526.871, -2.0980835e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [15216.827, 17560.135, -1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 89.076431;
	_this setPos [15216.827, 17560.135, -1.9073486e-005];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [15216.774, 17563.521, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setDir 89.076431;
	_this setPos [15216.774, 17563.521, -3.6239624e-005];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [15214.737, 17564.928, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir -0.30211246;
	_this setPos [15214.737, 17564.928, -5.3405762e-005];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_3_F", [15211.412, 17564.861, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -2.3424194;
	_this setPos [15211.412, 17564.861, 3.8146973e-005];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["B_MBT_01_cannon_F", [15212.066, 17560.473, 0.097512946], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir 87.914642;
	_this setVehicleLock "LOCKED";
	_this setPos [15212.066, 17560.473, 0.097512946];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15217.328, 17541.672, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -89.5504;
	_this setPos [15217.328, 17541.672, -3.6239624e-005];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15217.272, 17538.664, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -89.5504;
	_this setPos [15217.272, 17538.664, 2.0980835e-005];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15216.05, 17543.344, 3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setDir -0.83500421;
	_this setPos [15216.05, 17543.344, 3.2424927e-005];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15213.061, 17543.324, 0.012338638], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -0.83500421;
	_this setPos [15213.061, 17543.324, 0.012338638];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15215.935, 17536.934, -4.4822693e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir -0.83500421;
	_this setPos [15215.935, 17536.934, -4.4822693e-005];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Long_F", [15212.945, 17536.914, 0.021660805], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -0.83500421;
	_this setPos [15212.945, 17536.914, 0.021660805];
};

_this = createCenter west;
_center_1 = _this;

_group_1 = createGroup _center_1;

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_GL_F", [15104.231, 17523.973, -4.7683716e-006], [], 0, "NONE"];
	_unit_2 = _this;
	_this setPos [15104.231, 17523.973, -4.7683716e-006];
	_this setDir -155.82109;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_soldier_AR_F", [15101.857, 17526.135, -3.7193298e-005], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [15101.857, 17526.135, -3.7193298e-005];
	_this setDir -115.30196;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_lite_F", [15120.587, 17504.781, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [15120.587, 17504.781, 5.9127808e-005];
	_this setDir -136.47101;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_crew_F", [15210.902, 17558.203, -4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [15210.902, 17558.203, -4.0054321e-005];
	_this setDir 169.79544;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""LEAN"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_8 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_F", [15215.821, 17538.299, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_unit_8 = _this;
	_this setPos [15215.821, 17538.299, 1.9073486e-006];
	_this setDir 129.71088;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_10 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_soldier_LAT_F", [15215.441, 17541.811, -2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [15215.441, 17541.811, -2.4795532e-005];
	_this setDir 26.387577;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_F", [15124.279, 17543.459, -0.011470501], [], 0, "NONE"];
	_unit_14 = _this;
	_this setPos [15124.279, 17543.459, -0.011470501];
	_this setDir 173.97299;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_soldier_M_F", [15124.472, 17541.305, -4.2915344e-005], [], 0, "NONE"];
	_unit_15 = _this;
	_this setPos [15124.472, 17541.305, -4.2915344e-005];
	_this setDir -3.4055753;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [15097.998, 17591.133, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -13.56567;
	_this setPos [15097.998, 17591.133, -3.0517578e-005];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [15110.604, 17621.918, -0.00010490417], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir -110.87024;
	_this setPos [15110.604, 17621.918, -0.00010490417];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [15085.326, 17632.389, 0.00012397766], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir 158.00214;
	_this setPos [15085.326, 17632.389, 0.00012397766];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningUnexplodedAmmo_F", [15074.76, 17600.947, 0.00025749207], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 52.518963;
	_this setPos [15074.76, 17600.947, 0.00025749207];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15077.096, 17599.705, 4.196167e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir 24.130735;
	_this setPos [15077.096, 17599.705, 4.196167e-005];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15081.244, 17597.746, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setDir 24.130735;
	_this setPos [15081.244, 17597.746, 1.1444092e-005];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15085.609, 17595.736, 6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setDir 24.130735;
	_this setPos [15085.609, 17595.736, 6.4849854e-005];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15089.858, 17593.93, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setDir 24.130735;
	_this setPos [15089.858, 17593.93, -2.0980835e-005];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15094.74, 17592.01, -7.4386597e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setDir 24.130735;
	_this setPos [15094.74, 17592.01, -7.4386597e-005];
};

_vehicle_82 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15089.539, 17630.854, -8.0108643e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_82 = _this;
	_this setDir 21.941181;
	_this setPos [15089.539, 17630.854, -8.0108643e-005];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15093.747, 17629.045, -0.13300514], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir 21.941181;
	_this setPos [15093.747, 17629.045, -0.13300514];
};

_vehicle_84 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15098.187, 17627.213, -0.25093269], [], 0, "CAN_COLLIDE"];
	_vehicle_84 = _this;
	_this setDir 21.941181;
	_this setPos [15098.187, 17627.213, -0.25093269];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15102.511, 17625.572, -0.37398338], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setDir 21.941181;
	_this setPos [15102.511, 17625.572, -0.37398338];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15107.452, 17623.834, -0.46055412], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir 21.941181;
	_this setPos [15107.452, 17623.834, -0.46055412];
};

_vehicle_92 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15106.541, 17612.074], [], 0, "CAN_COLLIDE"];
	_vehicle_92 = _this;
	_this setDir 112.30635;
	_this setPos [15106.541, 17612.074];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15104.708, 17607.867, -0.083494186], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setDir 112.30635;
	_this setPos [15104.708, 17607.867, -0.083494186];
};

_vehicle_94 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15102.831, 17603.43, -0.1371994], [], 0, "CAN_COLLIDE"];
	_vehicle_94 = _this;
	_this setDir 112.30635;
	_this setPos [15102.831, 17603.43, -0.1371994];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15101.191, 17599.131, -0.14127731], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir 112.30635;
	_this setPos [15101.191, 17599.131, -0.14127731];
};

_vehicle_96 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15099.418, 17594.197, -0.10508156], [], 0, "CAN_COLLIDE"];
	_vehicle_96 = _this;
	_this setDir 112.30635;
	_this setPos [15099.418, 17594.197, -0.10508156];
};

_vehicle_103 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15108.868, 17617.701, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_103 = _this;
	_this setDir 112.30635;
	_this setPos [15108.868, 17617.701, -5.7220459e-005];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15082.436, 17623.854, -0.12566757], [], 0, "CAN_COLLIDE"];
	_vehicle_115 = _this;
	_this setDir 108.62725;
	_this setPos [15082.436, 17623.854, -0.12566757];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15080.875, 17619.535, -0.23496628], [], 0, "CAN_COLLIDE"];
	_vehicle_116 = _this;
	_this setDir 108.62725;
	_this setPos [15080.875, 17619.535, -0.23496628];
};

_vehicle_117 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15079.287, 17614.988, -0.27605438], [], 0, "CAN_COLLIDE"];
	_vehicle_117 = _this;
	_this setDir 108.62725;
	_this setPos [15079.287, 17614.988, -0.27605438];
};

_vehicle_118 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15077.929, 17610.57, -0.24331474], [], 0, "CAN_COLLIDE"];
	_vehicle_118 = _this;
	_this setDir 108.62725;
	_this setPos [15077.929, 17610.57, -0.24331474];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15076.47, 17605.553, -0.12309837], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir 108.62725;
	_this setPos [15076.47, 17605.553, -0.12309837];
};

_vehicle_120 = objNull;
if (true) then
{
	_this = createVehicle ["TapeSign_F", [15084.396, 17629.615, -0.18310928], [], 0, "CAN_COLLIDE"];
	_vehicle_120 = _this;
	_this setDir 108.62725;
	_this setPos [15084.396, 17629.615, -0.18310928];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Hunter_F", [15092.831, 17600.35, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir 179.5219;
	_this setPos [15092.831, 17600.35, 9.5367432e-006];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_Soldier_GL_F", [15101.528, 17590.738, 2.7656555e-005], [], 0, "NONE"];
	_unit_17 = _this;
	_this setPos [15101.528, 17590.738, 2.7656555e-005];
	_this setDir -224.02802;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["B_soldier_AR_F", [15072.25, 17601.742, -4.9591064e-005], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [15072.25, 17601.742, -4.9591064e-005];
	_this setDir -131.43434;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;"]];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [15276.028, 17568.496, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setDir -160.29234;
	_this setPos [15276.028, 17568.496, -3.8146973e-006];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
