_initCodes = [];

_this = createCenter civilian;
_center_1 = _this;

_this = createCenter east;
_center_2 = _this;

_this = createCenter west;
_center_3 = _this;

_group_1 = createGroup _center_1;

_group_2 = createGroup _center_2;

_group_3 = createGroup _center_2;

_group_4 = createGroup _center_2;

_group_6 = createGroup _center_3;

_unit_4 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_SL_F", [3731.3242, 17675.811], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [3731.3242, 17675.811];
	_this setDir -102.9432;
	_this setUnitRank "SERGEANT";
	_this setUnitAbility 0.60000002;
	if (true) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setDamage 1} forEach (units group this); this setAmmo [(primaryWeapon this),7]; removeHeadgear this; this addHeadgear ""H_MilCap_ocamo""; "]];
};

_unit_5 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_TL_F", [3777.3669, 17560.613], [], 0, "CAN_COLLIDE"];
	_unit_5 = _this;
	_this setPos [3777.3669, 17560.613];
	_this setUnitAbility 0.61050975;
	if (true) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_03_groupBlue = group this; this setSkill 0.45; this setSpeedMode ""Limited""; (group this) setFormation ""Line"""]];
};

_unit_7 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_Soldier_GL_F", [3859.6677, 17491.051], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [3859.6677, 17491.051];
	_this setUnitAbility 0.53694177;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"BIS_POI_AbandonedBattlefield_03_groupCyan = group this; this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeYellow_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3]"]];
};

_unit_9 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_G_Soldier_AR_F", [3801.8547, 17730.105, 4.5058532], [], 0, "CAN_COLLIDE"];
	_unit_9 = _this;
	_this setPos [3801.8547, 17730.105, 4.5058532];
	_this setDir -150.2045;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"{_x setDamage 1} forEach (units group this); this setAmmo [(primaryWeapon this),53]; this removeMagazine ""SmokeShell"" "]];
};

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["O_APC_Wheeled_02_rcws_F", [3718.3997, 17668.924], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -25.011562;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_03_Marid";
	BIS_POI_AbandonedBattlefield_03_Marid = _this;
	_this setPos [3718.3997, 17668.924];
	_initCodes set [count _initCodes,[_this,"this lock true; this setFuel 0.435; this setDamage 0.75; clearMagazineCargo this; clearWeaponCargo this; clearItemCargo this; {this setHit [_x,1]} forEach [""wheel_2_1_steering"", ""wheel_2_2_steering"", ""wheel_2_3_steering""]"]];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_F", [3764.6819, 17700.172], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setVehicleVarName "BIS_POI_AbandonedBattlefield_03_center";
	BIS_POI_AbandonedBattlefield_03_center = _this;
	_this setPos [3764.6819, 17700.172];
};

_unit_11 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_AR_F", [3747.2644, 17698.299], [], 0, "CAN_COLLIDE"];
	_unit_11 = _this;
	_this setPos [3747.2644, 17698.299];
	_this setDir 42.642292;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addHeadgear ""H_Cap_tan""; this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),92]; this removePrimaryWeaponItem ""acc_pointer_ir""; this removeMagazine ""SmokeShell"""]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_LAT_F", [3737.8748, 17709.998], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [3737.8748, 17709.998];
	_this setDir 44.132381;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),3]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; "]];
};

_unit_14 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_soldier_M_F", [3710.7273, 17716.121, 3.496196], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [3710.7273, 17716.121, 3.496196];
	_this setDir 92.236038;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),6]; this removePrimaryWeaponItem ""acc_pointer_ir""; this removeMagazine ""10Rnd_762x51_Mag""; this removeItem ""FirstAidKit"""]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_F", [3740.386, 17688.424], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [3740.386, 17688.424];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),26]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""HandGrenade""; this removeMagazine ""30Rnd_65x39_caseless_green""; "]];
};

_unit_17 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_F", [3767.4751, 17673.311], [], 0, "CAN_COLLIDE"];
	_unit_17 = _this;
	_this setPos [3767.4751, 17673.311];
	_this setDir 38.837852;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),7]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""SmokeShell""; this removeMagazine ""30Rnd_65x39_caseless_green""; "]];
};

_unit_19 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_medic_F", [3725.0322, 17692.311], [], 0, "CAN_COLLIDE"];
	_unit_19 = _this;
	_this setPos [3725.0322, 17692.311];
	_this setDir 24.072924;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addHeadgear ""H_Booniehat_tan""; this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),12]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight"";"]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_G_Soldier_GL_F", [3777.6165, 17719.314], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [3777.6165, 17719.314];
	_this setDir -150.19751;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),5]; this removeItem ""FirstAidKit""; this removeMagazine ""30Rnd_556x45_Stanag""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeBlue_Grenade_shell"",""1Rnd_SmokeGreen_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1]"]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_G_Soldier_F", [3792.8301, 17705.527], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [3792.8301, 17705.527];
	_this setDir -104.23107;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this addHeadgear ""H_Booniehat_mcamo""; this setAmmo [(primaryWeapon this),14]; this removeMagazine ""30Rnd_556x45_Stanag"""]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_G_Soldier_F", [3799.637, 17734.994, 0.67451602], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [3799.637, 17734.994, 0.67451602];
	_this setDir -136.47684;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),21]; this removeMagazine ""HandGrenade""; this removeMagazine ""30Rnd_556x45_Stanag""; "]];
};

_unit_27 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_G_Soldier_M_F", [3799.1799, 17736.088, 4.1105056], [], 0, "CAN_COLLIDE"];
	_unit_27 = _this;
	_this setPos [3799.1799, 17736.088, 4.1105056];
	_this setDir -154.99495;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setAmmo [(primaryWeapon this),11]; this removeMagazine ""30Rnd_556x45_Stanag""; this removeMagazine ""30Rnd_556x45_Stanag"";"]];
};

_unit_28 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_crew_F", [3721.3508, 17672.375], [], 0, "CAN_COLLIDE"];
	_unit_28 = _this;
	_this setPos [3721.3508, 17672.375];
	_this setDir 42.236423;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"removeHeadgear this; this unlinkItem ""NVGoggles_opfor""; this removeWeapon (handgunWeapon this); this removeMagazines ""16Rnd_9x21_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; this addMagazine [""30Rnd_9x21_Mag"",16]; this addWeapon ""SMG_02_F""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3]; this removeMagazines ""HandGrenade"""]];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_crew_F", [3721.1687, 17663.355], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [3721.1687, 17663.355];
	_this setDir -199.4164;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this removeWeapon (handgunWeapon this); this removeMagazines ""16Rnd_9x21_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; this addMagazine [""30Rnd_9x21_Mag"",22]; this addWeapon ""SMG_02_F""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3]; this removeMagazines ""HandGrenade"""]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_crew_F", [3715.093, 17693.686], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [3715.093, 17693.686];
	_this setDir -101.2326;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this removeItem ""FirstAidKit""; this unlinkItem ""NVGoggles_opfor""; this removeWeapon (handgunWeapon this); this removeMagazines ""16Rnd_9x21_Mag""; this removeWeapon (primaryWeapon this); this removeMagazines ""30Rnd_65x39_caseless_green""; this addMagazine [""30Rnd_65x39_caseless_green"",19]; this addWeapon ""arifle_Katiba_C_F""; {this addMagazine ""30Rnd_65x39_caseless_green""} forEach [0,1,2,3,4,5]; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazines ""HandGrenade"""]];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3727.9783, 17675.25], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setPos [3727.9783, 17675.25];
};

_vehicle_6 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Green_F", [3718.3479, 17713.025], [], 0, "CAN_COLLIDE"];
	_vehicle_6 = _this;
	_this setPos [3718.3479, 17713.025];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3804.2966, 17731.6, 0.89601517], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setPos [3804.2966, 17731.6, 0.89601517];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_2 createUnit ["O_Soldier_GL_F", [3721.5386, 17714.514], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [3721.5386, 17714.514];
	_this setDir -81.326286;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_2 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this unlinkItem ""NVGoggles_opfor""; this setAmmo [(primaryWeapon this),1]; this removePrimaryWeaponItem ""acc_pointer_ir""; this addPrimaryWeaponItem ""acc_flashlight""; this removeMagazine ""1Rnd_HE_Grenade_shell""; this removeMagazine ""1Rnd_HE_Grenade_shell""; {this removeMagazines _x} forEach [""1Rnd_Smoke_Grenade_shell"",""1Rnd_SmokeOrange_Grenade_shell"",""1Rnd_SmokeYellow_Grenade_shell"",""1Rnd_SmokeRed_Grenade_shell""]; {this addMagazine ""UGL_FlareWhite_F""} forEach [0,1,2,3,4,5]"]];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bandage_F", [3797.7532, 17736.533, 4.1018353], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setPos [3797.7532, 17736.533, 4.1018353];
};

_vehicle_10 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BloodBag_F", [3798.5891, 17736.549, 4.1024957], [], 0, "CAN_COLLIDE"];
	_vehicle_10 = _this;
	_this setDir -40.069149;
	_this setPos [3798.5891, 17736.549, 4.1024957];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_V1_F", [3799.2131, 17735.951, 0.58370513], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setPos [3799.2131, 17735.951, 0.58370513];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CerealsBox_F", [3796.7568, 17736.695, 0.56237477], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir -66.424767;
	_this setPos [3796.7568, 17736.695, 0.56237477];
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Canteen_F", [3802.5859, 17729.178, 4.5282135], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir -39.38979;
	_this setPos [3802.5859, 17729.178, 4.5282135];
};

_vehicle_14 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [3813.0317, 17733.969, -1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_14 = _this;
	_this setDir -79.402016;
	_this setPos [3813.0317, 17733.969, -1.335144e-005];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [3854.5615, 17731.143, -0.00023078918], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir -144.11635;
	_this setPos [3854.5615, 17731.143, -0.00023078918];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [3851.5984, 17731.082, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 185.64964;
	_this setPos [3851.5984, 17731.082, -0.0001373291];
};

_vehicle_17 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sun_chair_F", [3857.1494, 17730.006, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_17 = _this;
	_this setDir -153.82765;
	_this setPos [3857.1494, 17730.006, -5.7220459e-005];
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_F", [3855.0852, 17729.486, -0.00020217896], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setPos [3855.0852, 17729.486, -0.00020217896];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TableDesk_F", [3868.0298, 17738.52, 3.799473], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir 95.388664;
	_this setPos [3868.0298, 17738.52, 3.799473];
	_initCodes set [count _initCodes,[_this,"[27.0719,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_21 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [3869.167, 17738.15, 4.0345879], [], 0, "CAN_COLLIDE"];
	_vehicle_21 = _this;
	_this setDir 97.10968;
	_this setPos [3869.167, 17738.15, 4.0345879];
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [3872.5791, 17732.414, 4.0827041], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setDir 46.756401;
	_this setPos [3872.5791, 17732.414, 4.0827041];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [3851.25, 17666.258, 0.69942355], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir -121.55055;
	_this setPos [3851.25, 17666.258, 0.69942355];
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [3851.2324, 17661.807, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 65.812836;
	_this setPos [3851.2324, 17661.807, -5.3405762e-005];
};

_vehicle_25 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [3853.0388, 17660.65, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_25 = _this;
	_this setDir 32.252003;
	_this setPos [3853.0388, 17660.65, 4.5776367e-005];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [3857.7107, 17666.498, 7.295785], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -11.074782;
	_this setPos [3857.7107, 17666.498, 7.295785];
};

_vehicle_27 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pallets_stack_F", [3851.324, 17665.801, 4.1876245], [], 0, "CAN_COLLIDE"];
	_vehicle_27 = _this;
	_this setDir -27.749186;
	_this setPos [3851.324, 17665.801, 4.1876245];
};

_vehicle_28 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [3859.8613, 17658.9], [], 0, "CAN_COLLIDE"];
	_vehicle_28 = _this;
	_this setDir -187.54794;
	_this setPos [3859.8613, 17658.9];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelSand_grey_F", [3855.6748, 17657.797, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setPos [3855.6748, 17657.797, -2.0980835e-005];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BarrelWater_F", [3861.2009, 17660.51, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setPos [3861.2009, 17660.51, -4.5776367e-005];
};

_vehicle_31 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo20_military_green_F", [3833.7014, 17615.246, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_31 = _this;
	_this setDir 42.443932;
	_this setPos [3833.7014, 17615.246, -3.6239624e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Truck_dropside_F", [3836.5825, 17609.238, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 64.204216;
	_this setPos [3836.5825, 17609.238, -1.1444092e-005];
};

_vehicle_33 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Rack_F", [3860.4377, 17632.484, 0.50315648], [], 0, "CAN_COLLIDE"];
	_vehicle_33 = _this;
	_this setDir 19.472322;
	_this setPos [3860.4377, 17632.484, 0.50315648];
	_initCodes set [count _initCodes,[_this,"[18.8984,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_34 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_wooden_rack_F", [3866.6858, 17634.928, 0.26988137], [], 0, "CAN_COLLIDE"];
	_vehicle_34 = _this;
	_this setDir 25.882513;
	_this setPos [3866.6858, 17634.928, 0.26988137];
	_initCodes set [count _initCodes,[_this,"[18.8984,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_36 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [3743.3696, 17645.184, -5.4359436e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_36 = _this;
	_this setDir -32.808479;
	_this setPos [3743.3696, 17645.184, -5.4359436e-005];
	_initCodes set [count _initCodes,[_this,"[0] call BIS_fnc_setHeight; this setVariable [""BIS_spawnObjects"",[""TOP"",""Land_Camping_Light_off_F"",1,[0.3,-0.25,0]]];"]];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [3743.8284, 17645.725, 2.9563904e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -198.27174;
	_this setPos [3743.8284, 17645.725, 2.9563904e-005];
	_initCodes set [count _initCodes,[_this,"[0] call BIS_fnc_setHeight; "]];
};

_vehicle_39 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_Tall_F", [3746.6394, 17656.732, 0.67137688], [], 0, "CAN_COLLIDE"];
	_vehicle_39 = _this;
	_this setDir -25.682268;
	_this setPos [3746.6394, 17656.732, 0.67137688];
	_initCodes set [count _initCodes,[_this,"[14.9955,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_40 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Metal_rack_F", [3748.4973, 17656.969, 0.62348485], [], 0, "CAN_COLLIDE"];
	_vehicle_40 = _this;
	_this setDir 61.751522;
	_this setPos [3748.4973, 17656.969, 0.62348485];
	_initCodes set [count _initCodes,[_this,"[14.9955,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3750.5391, 17651.582, 1.0176011], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setDir 124.2032;
	_this setPos [3750.5391, 17651.582, 1.0176011];
};

_vehicle_42 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [3751.3564, 17652.246, 0.72583836], [], 0, "CAN_COLLIDE"];
	_vehicle_42 = _this;
	_this setDir -127.56699;
	_this setPos [3751.3564, 17652.246, 0.72583836];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [3742.947, 17654.18, 3.9474781], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir 63.056095;
	_this setPos [3742.947, 17654.18, 3.9474781];
	_initCodes set [count _initCodes,[_this,"[18.427,""asl""] call BIS_fnc_setHeight;"]];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad_F", [3741.8755, 17806.055, 0.52391726], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setDir -46.205109;
	_this setPos [3741.8755, 17806.055, 0.52391726];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["C_Quadbike_01_F", [3785.5461, 17584.324, 0.22202288], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir -135.43947;
	_this setPos [3785.5461, 17584.324, 0.22202288];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.645"]];
};

_vehicle_50 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [3837.9053, 17664.658, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_50 = _this;
	_this setDir -101.90124;
	_this setPos [3837.9053, 17664.658, -3.6239624e-005];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_single_F", [3849.2976, 17652.311, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir -152.97029;
	_this setPos [3849.2976, 17652.311, -1.9073486e-006];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Portable_generator_F", [3837.5349, 17665.402, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setDir -107.16374;
	_this setPos [3837.5349, 17665.402, 2.2888184e-005];
};

_vehicle_53 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [3837.4229, 17655.713, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_53 = _this;
	_this setDir -121.12077;
	_this setPos [3837.4229, 17655.713, -3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"clearItemCargo this; this setFuel 0.435; this setHit [""karoserie"",0.25]"]];
};

_vehicle_55 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HumanSkeleton_F", [3760.6833, 17805.977, 3.6734538], [], 0, "CAN_COLLIDE"];
	_vehicle_55 = _this;
	_this setPos [3760.6833, 17805.977, 3.6734538];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Ural_F", [3754.8469, 17786.66, 0.00023078918], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir -77.102219;
	_this setPos [3754.8469, 17786.66, 0.00023078918];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Car2_F", [3780.8118, 17788.215, 1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setDir 46.800293;
	_this setPos [3780.8118, 17788.215, 1.7166138e-005];
};

_vehicle_58 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_F", [3637.5315, 17810.578], [], 0, "CAN_COLLIDE"];
	_vehicle_58 = _this;
	_this setDir -63.016201;
	_this setPos [3637.5315, 17810.578];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_F", [3635.4927, 17806.719, -2.9563904e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -59.987839;
	_this setPos [3635.4927, 17806.719, -2.9563904e-005];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [3637.2439, 17808.135, -0.00010490417], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setDir -49.940506;
	_this setPos [3637.2439, 17808.135, -0.00010490417];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [3634.9236, 17804.92, -2.7656555e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setDir -71.338257;
	_this setPos [3634.9236, 17804.92, -2.7656555e-005];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [3638.9385, 17811.672, -8.4877014e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir -68.541618;
	_this setPos [3638.9385, 17811.672, -8.4877014e-005];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_small_F", [3783.5508, 17586.914, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setDir -211.21967;
	_this setPos [3783.5508, 17586.914, 1.9073486e-005];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [3784.1897, 17586.232, -8.5830688e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 9.8654728;
	_this setPos [3784.1897, 17586.232, -8.5830688e-006];
};

_vehicle_66 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterOil_F", [3784.2808, 17585.357, -4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_66 = _this;
	_this setDir -67.928596;
	_this setPos [3784.2808, 17585.357, -4.0054321e-005];
};

_unit_37 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_AR_F", [3772.979, 17557.211], [], 0, "CAN_COLLIDE"];
	_unit_37 = _this;
	_this setPos [3772.979, 17557.211];
	_this setUnitAbility 0.54114574;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR"""]];
};

_unit_38 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_F", [3776.6257, 17556.117], [], 0, "CAN_COLLIDE"];
	_unit_38 = _this;
	_this setPos [3776.6257, 17556.117];
	_this setUnitAbility 0.53273779;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_41 = objNull;
if (true) then
{
	_this = _group_3 createUnit ["O_Soldier_F", [3779.9988, 17555.752], [], 0, "CAN_COLLIDE"];
	_unit_41 = _this;
	_this setPos [3779.9988, 17555.752];
	_this setUnitAbility 0.55165535;
	if (false) then {_group_3 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_42 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_medic_F", [3856.1521, 17488.025], [], 0, "CAN_COLLIDE"];
	_unit_42 = _this;
	_this setPos [3856.1521, 17488.025];
	_this setUnitAbility 0.53694177;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_43 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_Soldier_F", [3859.8899, 17486.113], [], 0, "CAN_COLLIDE"];
	_unit_43 = _this;
	_this setPos [3859.8899, 17486.113];
	_this setUnitAbility 0.44445634;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_unit_44 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["O_Soldier_F", [3863.3547, 17486.84], [], 0, "CAN_COLLIDE"];
	_unit_44 = _this;
	_this setPos [3863.3547, 17486.84];
	_this setUnitAbility 0.50541264;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setSkill 0.35; this unlinkItem ""NVGoggles_opfor""; this removePrimaryWeaponItem ""acc_pointer_IR""; this addPrimaryWeaponItem ""acc_flashlight"""]];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3748.6003, 17608.803], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setPos [3748.6003, 17608.803];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3724.5718, 17654.879, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setPos [3724.5718, 17654.879, 0];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3695.4702, 17698.402, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setPos [3695.4702, 17698.402, 0];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3728.1521, 17749.943], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setPos [3728.1521, 17749.943];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3806.4902, 17752.648], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setPos [3806.4902, 17752.648];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3834.5547, 17692.115], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setPos [3834.5547, 17692.115];
};

_vehicle_93 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3859.1836, 17619.832], [], 0, "CAN_COLLIDE"];
	_vehicle_93 = _this;
	_this setPos [3859.1836, 17619.832];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Blue_F", [3749.0403, 17608.816], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setPos [3749.0403, 17608.816];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3859.3313, 17494.629], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setPos [3859.3313, 17494.629];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3860.0344, 17494.588], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setPos [3860.0344, 17494.588];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["O_Truck_02_transport_F", [3785.0981, 17549.969], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir -40.403568;
	_this setPos [3785.0981, 17549.969];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.735; clearItemCargo this; clearMagazineCargo this; clearWeaponCargo this"]];
};

_vehicle_158 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Blue_F", [3719.1914, 17667.205], [], 0, "CAN_COLLIDE"];
	_vehicle_158 = _this;
	_this setPos [3719.1914, 17667.205];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 2]"]];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Yellow_F", [3718.9937, 17669.332], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setPos [3718.9937, 17669.332];
	_initCodes set [count _initCodes,[_this,"this setPos [(getPos this select 0), (getPos this select 1), 0.45]"]];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3954.0435, 17570.965], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setPos [3954.0435, 17570.965];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3914.7861, 17537.561], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setPos [3914.7861, 17537.561];
};

_vehicle_186 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3981.855, 17629.047, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_186 = _this;
	_this setPos [3981.855, 17629.047, 0];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3982.5879, 17707.43, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setPos [3982.5879, 17707.43, 0];
};

_vehicle_190 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3934.2769, 17769.027, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_190 = _this;
	_this setPos [3934.2769, 17769.027, 0];
};

_vehicle_192 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3867.0452, 17824.986, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_192 = _this;
	_this setPos [3867.0452, 17824.986, 0];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3819.1372, 17864.842, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setPos [3819.1372, 17864.842, 0];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3745.8657, 17853.168, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setPos [3745.8657, 17853.168, 0];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3681.4512, 17812.105, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setPos [3681.4512, 17812.105, 0];
};

_vehicle_200 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3666.3674, 17757.82, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_200 = _this;
	_this setPos [3666.3674, 17757.82, 0];
};

_vehicle_202 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3661.593, 17696.873, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_202 = _this;
	_this setPos [3661.593, 17696.873, 0];
};

_vehicle_204 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3636.876, 17633.953, 4.7683716e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_204 = _this;
	_this setPos [3636.876, 17633.953, 4.7683716e-007];
};

_vehicle_206 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3697.5459, 17579.465, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_206 = _this;
	_this setPos [3697.5459, 17579.465, 0];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3742.7671, 17538.176, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setPos [3742.7671, 17538.176, 0];
};

_vehicle_210 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Cyan_F", [3786.3037, 17498.012, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_210 = _this;
	_this setPos [3786.3037, 17498.012, 0];
};

_vehicle_211 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Large_Yellow_F", [3741.4814, 17644.566], [], 0, "CAN_COLLIDE"];
	_vehicle_211 = _this;
	_this setPos [3741.4814, 17644.566];
	_initCodes set [count _initCodes,[_this,"this setVariable [""BIS_HubSection"",""NoObjects""];"]];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
