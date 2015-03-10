_initCodes = [];

_this = createCenter civilian;
_center_1 = _this;

_this = createCenter resistance;
_center_0 = _this;

_group_0 = createGroup _center_0;

_group_1 = createGroup _center_0;

_group_2 = createGroup _center_0;

_group_4 = createGroup _center_1;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_Soldier_TL_F", [5178.1987, 19636.846], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [5178.1987, 19636.846];
	_this setUnitRank "CORPORAL";
	_this setUnitAbility 0.49700475;
	if (true) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedPlane_01_groupCyan = group this; this setSkill 0.45"]];
};

_unit_2 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["I_pilot_F", [4785.7773, 19389.313], [], 0, "CAN_COLLIDE"];
	_unit_2 = _this;
	_this setPos [4785.7773, 19389.313];
	_this setDir 19.478277;
	_this setVehicleVarName "BIS_POI_CrashedPlane_01_Pilot";
	BIS_POI_CrashedPlane_01_Pilot = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeAllWeapons this; this addItem ""FirstAidKit""; {this addMagazine ""9Rnd_45ACP_Mag""} forEach [0,1,2,3]; this addMagazine ""SmokeShellBlue""; this addMagazine ""SmokeShellOrange""; {this addMagazine ""Chemlight_green""} forEach [0,1]; this addWeapon ""hgun_ACPC2_F""; this setDamage 1; {this unlinkItem _x} forEach [""ItemMap"",""ItemRadio"",""ItemCompass""]; _null = [] spawn {sleep 1; removeGoggles BIS_POI_CrashedPlane_01_Pilot}"]];
};

_unit_3 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_soldier_F", [5172.4697, 19630.498], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [5172.4697, 19630.498];
	_this setUnitAbility 0.44655821;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""  "]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["I_Soldier_AR_F", [5182.749, 19629.982], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [5182.749, 19629.982];
	_this setUnitAbility 0.47808725;
	if (false) then {_group_0 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_Soldier_GL_F", [4335.8735, 19127.463], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [4335.8735, 19127.463];
	_this setUnitAbility 0.50541252;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_CrashedPlane_01_groupBlue = group this; this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokePurple_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_unit_6 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [4331.0425, 19121.191], [], 0, "CAN_COLLIDE"];
	_unit_6 = _this;
	_this setPos [4331.0425, 19121.191];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""  "]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["I_soldier_F", [4340.0884, 19121.293], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [4340.0884, 19121.293];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_indep""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [4890.0176, 19438.266, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir 111.73344;
	_this setPos [4890.0176, 19438.266, -0.0001373291];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_StallWater_F", [4867.3364, 19453.807, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir -107.4392;
	_this setPos [4867.3364, 19453.807, -4.5776367e-005];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [4787.1372, 19385.586], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setVehicleVarName "BIS_POI_CrashedPlane_01_center";
	BIS_POI_CrashedPlane_01_center = _this;
	_this setPos [4787.1372, 19385.586];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4337.9268, 19138.242], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setPos [4337.9268, 19138.242];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4337.1738, 19138.244], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [4337.1738, 19138.244];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5177.7578, 19640.516], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setPos [5177.7578, 19640.516];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5178.2607, 19640.578], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setPos [5178.2607, 19640.578];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLongRangeRadio_F", [4786.4746, 19389.252, 0.00032043457], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setDir -252.46144;
	_this setPos [4786.4746, 19389.252, 0.00032043457];
};

_vehicle_102 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Map_F", [4787.1865, 19389.152, -0.0023165308], [], 0, "CAN_COLLIDE"];
	_vehicle_102 = _this;
	_this setDir -54.040524;
	_this setPos [4787.1865, 19389.152, -0.0023165308];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Compass_F", [4786.1602, 19388.824, 0.00065612793], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setDir -198.87354;
	_this setPos [4786.1602, 19388.824, 0.00065612793];
};

_vehicle_116 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [4787.252, 19389.184], [], 0, "CAN_COLLIDE"];
	_vehicle_116 = _this;
	_this setDir -122.73322;
	_this setPos [4787.252, 19389.184];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [4785.3848, 19388.311], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir -122.73322;
	_this setPos [4785.3848, 19388.311];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 0.15]"]];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_line_F", [4775.6733, 19373.48, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setPos [4775.6733, 19373.48, -1.5258789e-005];
};

_vehicle_122 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [4774.4868, 19374.443], [], 0, "CAN_COLLIDE"];
	_vehicle_122 = _this;
	_this setDir 165.73944;
	_this setPos [4774.4868, 19374.443];
};

_vehicle_124 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [4772.6709, 19376.031, -0.00012211176], [], 0, "CAN_COLLIDE"];
	_vehicle_124 = _this;
	_this setDir 76.062263;
	_this setPos [4772.6709, 19376.031, -0.00012211176];
};

_vehicle_125 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [4772.4976, 19377.348, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_125 = _this;
	_this setPos [4772.4976, 19377.348, -4.5776367e-005];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Campfire_burning_F", [4781.0254, 19379.18, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setDir -58.174694;
	_this setPos [4781.0254, 19379.18, 6.1035156e-005];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [4781.0347, 19377.363, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir -85.762123;
	_this setPos [4781.0347, 19377.363, -0.00012207031];
};

_vehicle_129 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [4779.4097, 19380.164, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_129 = _this;
	_this setDir 30.182617;
	_this setPos [4779.4097, 19380.164, -3.0517578e-005];
};

_vehicle_130 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BakedBeans_F", [4780.0557, 19380.512, -0.00012207031], [], 0, "CAN_COLLIDE"];
	_vehicle_130 = _this;
	_this setPos [4780.0557, 19380.512, -0.00012207031];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HeatPack_F", [4780.1113, 19380.287, -0.00019836426], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir 65.726921;
	_this setPos [4780.1113, 19380.287, -0.00019836426];
};

_vehicle_132 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [4780.4155, 19377.941, -0.00018310547], [], 0, "CAN_COLLIDE"];
	_vehicle_132 = _this;
	_this setDir -26.716158;
	_this setPos [4780.4155, 19377.941, -0.00018310547];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4155.7651, 19216.834], [], 0, "CAN_COLLIDE"];
	_vehicle_134 = _this;
	_this setPos [4155.7651, 19216.834];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4220.8711, 19452.756], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setPos [4220.8711, 19452.756];
};

_vehicle_138 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4313.9717, 19655.896], [], 0, "CAN_COLLIDE"];
	_vehicle_138 = _this;
	_this setPos [4313.9717, 19655.896];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4409.252, 19751.213, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setPos [4409.252, 19751.213, 0];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4605.2744, 19886.777, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setPos [4605.2744, 19886.777, 0];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4726.5454, 19920.453], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setPos [4726.5454, 19920.453];
};

_vehicle_146 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4794.6787, 19850.408, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_146 = _this;
	_this setPos [4794.6787, 19850.408, 0];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4803.7769, 19704.928, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setPos [4803.7769, 19704.928, 0];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4726.8569, 19527.213, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setPos [4726.8569, 19527.213, 0];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4633.395, 19428.85, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setPos [4633.395, 19428.85, 0];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4480.3838, 19343.713, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setPos [4480.3838, 19343.713, 0];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [4472.1133, 19175.916, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setPos [4472.1133, 19175.916, 0];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5052.5264, 19564.434], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setPos [5052.5264, 19564.434];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [4928.4629, 19461.936], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setPos [4928.4629, 19461.936];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5059.1431, 19323.07], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setPos [5059.1431, 19323.07];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5033.5034, 19213.961], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setPos [5033.5034, 19213.961];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5030.1953, 19103.199, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setPos [5030.1953, 19103.199, 0];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5167.4927, 19153.619, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setPos [5167.4927, 19153.619, 0];
};

_vehicle_175 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5309.7529, 19228.012, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_175 = _this;
	_this setPos [5309.7529, 19228.012, 0];
};

_vehicle_177 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5386.6729, 19389.199, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_177 = _this;
	_this setPos [5386.6729, 19389.199, 0];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5342.8369, 19507.4, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setPos [5342.8369, 19507.4, 0];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [5260.9546, 19582.623, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setPos [5260.9546, 19582.623, 0];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
