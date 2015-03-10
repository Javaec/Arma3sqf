////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Tue Mar 10 00:06:16 2015 : Source 'file' date Tue Mar 10 00:06:16 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//ndefs=13
enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
};

//Class air_f : Heli_Light_01\config.bin{
class CfgPatches
{
	class A3_Air_F_Heli_Light_01
	{
		units[] = {"B_Heli_Light_01_F","B_Heli_Light_01_armed_F","C_Heli_light_01_blue_F","C_Heli_light_01_red_F","C_Heli_light_01_ion_F","C_Heli_light_01_blueLine_F","C_Heli_light_01_digital_F","C_Heli_light_01_elliptical_F","C_Heli_light_01_furious_F","C_Heli_light_01_graywatcher_F","C_Heli_light_01_jeans_F","C_Heli_light_01_light_F","C_Heli_light_01_shadow_F","C_Heli_light_01_sheriff_F","C_Heli_light_01_speedy_F","C_Heli_light_01_sunset_F","C_Heli_light_01_vrana_F","C_Heli_light_01_wasp_F","C_Heli_light_01_stripped_F","C_Heli_light_01_luxe_F","B_Heli_Light_01_stripped_F","C_Heli_light_01_wave_F"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Air_F"};
	};
};
class CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{
		chopperLight_L_In_H = "chopperLight_L_In_H";
		chopperLight_L_Out_H = "chopperLight_L_Out_H";
		chopperLight_L_static_H = "ChopperLight_L_static_H_getin";
		chopperLight_R_in_H = "chopperLight_R_in_H";
		chopperLight_R_out_H = "chopperLight_R_out_H";
		chopperLight_R_static_H = "chopperLight_R_static_H";
		chopperLight_RP_static_H = "chopperLight_RP_static_H";
		chopperLight_C_L_idleA_H = "chopperLight_C_L_idleA_H";
		chopperLight_C_L_idleB_H = "chopperLight_C_L_idleB_H";
		chopperLight_C_L_idleC_H = "chopperLight_C_L_idleC_H";
		chopperLight_C_L_idleD_H = "chopperLight_C_L_idleD_H";
		chopperLight_C_L_static_H = "chopperLight_C_L_static_H";
		chopperLight_C_LIn_H = "chopperLight_C_LIn_H";
		chopperLight_C_LOut_H = "chopperLight_C_LOut_H";
		chopperLight_C_R_idleA_H = "chopperLight_C_R_idleA_H";
		chopperLight_C_R_idleB_H = "chopperLight_C_R_idleB_H";
		chopperLight_C_R_idleC_H = "chopperLight_C_R_idleC_H";
		chopperLight_C_R_idleD_H = "chopperLight_C_R_idleD_H";
		chopperLight_C_R_static_H = "chopperLight_C_R_static_H";
		chopperLight_C_Rin_H = "chopperLight_C_Rin_H";
		chopperLight_C_Rout_H = "chopperLight_C_Rout_H";
		chopperLight_CB_static_H = "chopperLight_CB_static_H";
		bench_Heli_Light_01_get_in = "bench_Heli_Light_01_get_in";
		bench_Heli_Light_01_get_out = "bench_Heli_Light_01_get_out";
	};
	class Actions
	{
		class CargoActions;
		class Heli_Light_Cargo01_Shooting_Actions: CargoActions
		{
			reloadMagazine[] = {"WeaponMagazineReloadStand","Gesture"};
		};
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class KIA_chopperLight_L_01_H: DefaultDie
		{
			actions = "DeadActions";
			file = "A3\Air_F\Heli_Light_01\Data\Anim\L\death1.rtm";
			speed = 0.769231;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class KIA_chopperLight_L_02_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\L\death2.rtm";
			speed = 0.625;
		};
		class KIA_chopperLight_L_03_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\L\death3.rtm";
			speed = 0.652174;
		};
		class KIA_chopperLight_R_01_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\R\death1.rtm";
			speed = 0.769231;
		};
		class KIA_chopperLight_R_02_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\R\death2.rtm";
			speed = 0.625;
		};
		class KIA_chopperLight_RP_01_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\Death1.rtm";
			speed = 0.44117;
		};
		class KIA_chopperLight_RP_02_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\Death2.rtm";
			speed = 0.652174;
		};
		class KIA_chopperLight_RP_03_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\Death3.rtm";
			speed = 0.652174;
		};
		class KIA_chopperLight_C_L01_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\L_death1.rtm";
			speed = 0.769231;
		};
		class KIA_chopperLight_C_L02_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\L_death2.rtm";
			speed = 0.652174;
		};
		class KIA_chopperLight_C_R01_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\R_death1.rtm";
			speed = 0.441176;
		};
		class KIA_chopperLight_C_R02_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\R_death2.rtm";
			speed = 0.652174;
		};
		class KIA_chopperLight_CB_01_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\death1.rtm";
			speed = 0.291262;
		};
		class KIA_chopperLight_CB_02_H: KIA_chopperLight_L_01_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\death2.rtm";
			speed = 0.357143;
		};
		class Crew;
		class ChopperLight_L_static_H_getin: Crew
		{
			file = "A3\cargoposes_F\anim\pilot_Heli_Light_01_settlein.rtm";
			speed = -1.8;
			looped = 0;
			connectTo[] = {"ChopperLight_L_static_H",1};
			interpolateTo[] = {"KIA_chopperLight_L_01_H",1,"KIA_chopperLight_L_02_H",1,"KIA_chopperLight_L_03_H",1};
			variantsAI[] = {"ChopperLight_L_static_H",1};
			variantsPlayer[] = {"ChopperLight_L_static_H",1};
			variantAfter[] = {1.8,1.8,1.8};
			useIdles = 0;
		};
		class ChopperLight_L_static_H: Crew
		{
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftLegIKCurve[] = {1};
			rightLegIKCurve[] = {1};
			file = "A3\cargoposes_F\anim\pilot_Heli_Light_01_static.rtm";
			speed = 1e+010;
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_L_01_H",1,"KIA_chopperLight_L_02_H",1,"KIA_chopperLight_L_03_H",1};
		};
		class ChopperLight_R_static_H: Crew
		{
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftLegIKCurve[] = {1};
			rightLegIKCurve[] = {1};
			file = "A3\Air_F\Heli_Light_01\Data\Anim\R\static.rtm";
			speed = 1e+010;
			looped = 0;
			connectTo[] = {};
			interpolateTo[] = {"KIA_chopperLight_R_01_H",1,"KIA_chopperLight_R_02_H",1};
		};
		class ChopperLight_RP_static_H: Crew
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\static.rtm";
			speed = 1e+010;
			looped = 0;
			connectTo[] = {};
			interpolateTo[] = {"KIA_chopperLight_RP_01_H",1,"KIA_chopperLight_RP_02_H",1,"KIA_chopperLight_RP_03_H",1};
		};
		class ChopperLight_C_L_static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\C\L_static.rtm";
			speed = 1e+010;
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_C_R01_H",1,"KIA_chopperLight_C_R02_H",1,"ChopperLight_C_L_static_H",0.4,"ChopperLight_C_L_idleA_H",0.15,"ChopperLight_C_L_idleB_H",0.15,"ChopperLight_C_L_idleC_H",0.15,"ChopperLight_C_L_idleD_H",0.15};
			equivalentTo = "ChopperLight_C_L_static_H";
			variantsAI[] = {"ChopperLight_C_L_static_H",0.4,"ChopperLight_C_L_idleA_H",0.15,"ChopperLight_C_L_idleB_H",0.15,"ChopperLight_C_L_idleC_H",0.15,"ChopperLight_C_L_idleD_H",0.15};
			variantAfter[] = {5,10,20};
		};
		class ChopperLight_C_R_static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\C\R_static.rtm";
			speed = 1e+010;
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_C_L01_H",1,"KIA_chopperLight_C_L02_H",1,"ChopperLight_C_R_static_H",0.4,"ChopperLight_C_R_idleA_H",0.15,"ChopperLight_C_R_idleB_H",0.15,"ChopperLight_C_R_idleC_H",0.15,"ChopperLight_C_R_idleD_H",0.15};
			equivalentTo = "ChopperLight_C_R_static_H";
			variantsAI[] = {"ChopperLight_C_R_static_H",0.4,"ChopperLight_C_R_idleA_H",0.15,"ChopperLight_C_R_idleB_H",0.15,"ChopperLight_C_R_idleC_H",0.15,"ChopperLight_C_R_idleD_H",0.15};
			variantAfter[] = {5,10,20};
		};
		class ChopperLight_CB_Static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\CB\static.rtm";
			speed = 1e+010;
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_CB_01_H",1,"KIA_chopperLight_CB_02_H",1,"ChopperLight_CB_idle1shaky_H",0.1,"ChopperLight_CB_idle1stable_H",0.1,"ChopperLight_CB_idle2lookleft_H",0.1,"ChopperLight_CB_idle3lookright_H",0.1,"ChopperLight_CB_idle4_H",0.1,"ChopperLight_CB_idle5lookdown_H",0.1,"ChopperLight_CB_idle6pointing_H",0.1,"ChopperLight_CB_idle7lookaround_H",0.1,"ChopperLight_CB_Static_H",0.1};
			equivalentTo = "ChopperLight_CB_Static_H";
			variantsAI[] = {"ChopperLight_CB_idle1shaky_H",0.1,"ChopperLight_CB_idle1stable_H",0.1,"ChopperLight_CB_idle2lookleft_H",0.1,"ChopperLight_CB_idle3lookright_H",0.1,"ChopperLight_CB_idle4_H",0.1,"ChopperLight_CB_idle5lookdown_H",0.1,"ChopperLight_CB_idle6pointing_H",0.1,"ChopperLight_CB_idle7lookaround_H",0.1,"ChopperLight_CB_Static_H",0.2};
			variantAfter[] = {5,10,20};
		};
		class ChopperLight_RP_idleA_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleA";
			speed = 0.09901;
		};
		class ChopperLight_RP_idleBored_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleBored";
			speed = 0.12987;
		};
		class ChopperLight_RP_idleBoredB_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleBoredB";
			speed = 0.103448;
		};
		class ChopperLight_RP_idleCtalk_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleCtalk";
			speed = 0.09901;
		};
		class ChopperLight_RP_idleDtalk_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleDtalk";
			speed = 0.092308;
		};
		class ChopperLight_RP_idleE_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleE";
			speed = 0.050505;
		};
		class ChopperLight_RP_idleF_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleF";
			speed = 0.044843;
		};
		class ChopperLight_RP_idleG_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleG";
			speed = 0.048232;
		};
		class ChopperLight_RP_idleH_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleH";
			speed = 0.1;
		};
		class ChopperLight_RP_idleI_H: ChopperLight_RP_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\RP\idleI";
			speed = 0.454545;
		};
		class ChopperLight_C_L_idleA_H: ChopperLight_C_L_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\L_idleA";
			speed = 0.265487;
		};
		class ChopperLight_C_L_idleB_H: ChopperLight_C_L_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\L_idleB";
			speed = 0.160428;
		};
		class ChopperLight_C_L_idleC_H: ChopperLight_C_L_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\L_idleC";
			speed = 0.319149;
		};
		class ChopperLight_C_L_idleD_H: ChopperLight_C_L_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\L_idleD";
			speed = 0.234375;
		};
		class ChopperLight_C_R_idleA_H: ChopperLight_C_R_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\R_idleA";
			speed = 0.265487;
		};
		class ChopperLight_C_R_idleB_H: ChopperLight_C_R_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\R_idleB";
			speed = 0.160428;
		};
		class ChopperLight_C_R_idleC_H: ChopperLight_C_R_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\R_idleC";
			speed = 0.319149;
		};
		class ChopperLight_C_R_idleD_H: ChopperLight_C_R_static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\R_idleD";
			speed = 0.234375;
		};
		class ChopperLight_CB_idle1shaky_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle1shaky";
			speed = 0.084986;
		};
		class ChopperLight_CB_idle1stable_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle1stable";
			speed = 0.084986;
		};
		class ChopperLight_CB_idle2lookleft_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle2lookleft";
			speed = 0.05425;
		};
		class ChopperLight_CB_idle3lookright_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle3lookright";
			speed = 0.063425;
		};
		class ChopperLight_CB_idle4_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle4";
			speed = 0.07335;
		};
		class ChopperLight_CB_idle5lookdown_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle5lookdown";
			speed = 0.051546;
		};
		class ChopperLight_CB_idle6pointing_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle6pointing";
			speed = 0.101695;
		};
		class ChopperLight_CB_idle7lookaround_H: ChopperLight_CB_Static_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\CB\idle7lookaround";
			speed = 0.084507;
		};
		class AmovPercMstpSnonWnonDnon;
		class ChopperLight_L_In_H: AmovPercMstpSnonWnonDnon
		{
			variantsPlayer[] = {};
			actions = "CivilStandActions";
			file = "\A3\cargoposes_F\anim\pilot_smallheli_getin.rtm";
			speed = -1.8;
			looped = 0;
			soundEnabled = 0;
			disableWeapons = 1;
			enableOptics = 0;
			canPullTrigger = 0;
			ConnectTo[] = {"Chopperlight_L_Static_H",0.02,"AmovPercMstpSnonWnonDnon",0.02};
			InterpolateTo[] = {"Unconscious",0.1};
			collisionShape = "A3\Anims_f\data\geom\sdr\geom_empty.p3d";
			head = "headNo";
			headBobMode = 1;
			headBobStrength = 0.8;
		};
		class ChopperLight_L_Out_H: ChopperLight_L_In_H
		{
			file = "\A3\cargoposes_F\anim\pilot_smallheli_getout.rtm";
			speed = -1;
			InterpolateTo[] = {"AmovPercMstpSnonWnonDnon",0.1,"AmovPercMstpSrasWrflDnon",0.1,"AmovPercMstpSrasWpstDnon",0.1,"Unconscious",0.1};
		};
		class bench_Heli_Light_01_get_in: AmovPercMstpSnonWnonDnon
		{
			variantsPlayer[] = {};
			file = "\A3\cargoposes_F\anim\passenger_Heli_Light_01_get_in";
			speed = -4;
			looped = 0;
			soundOverride = "Walk";
			disableWeapons = 1;
			enableOptics = 0;
			leaningFactorBeg = 1;
			headBobMode = 1;
			headBobStrength = 0.5;
			ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.02};
			InterpolateTo[] = {"Unconscious",0.1};
		};
		class bench_Heli_Light_01_get_out: bench_Heli_Light_01_get_in
		{
			file = "\A3\cargoposes_F\anim\passenger_Heli_Light_01_get_out";
			speed = 0.7;
			InterpolateTo[] = {"AmovPercMstpSnonWnonDnon",0.1,"AmovPercMstpSrasWrflDnon",0.1,"AmovPercMstpSrasWpstDnon",0.1,"Unconscious",0.1};
		};
		class Chopperlight_R_In_H: ChopperLight_L_In_H
		{
			file = "\A3\cargoposes_F\anim\copilot_Heli_Light_01_get_in";
			speed = 0.577;
		};
		class Chopperlight_R_Out_H: ChopperLight_L_Out_H
		{
			file = "\A3\cargoposes_F\anim\copilot_Heli_Light_01_getout";
			speed = 1.25;
		};
		class ChopperLight_C_LIn_H: ChopperLight_L_In_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\LIn";
		};
		class ChopperLight_C_LOut_H: ChopperLight_L_Out_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\LOut";
		};
		class ChopperLight_C_Rin_H: ChopperLight_L_In_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\RIn";
		};
		class ChopperLight_C_Rout_H: ChopperLight_L_Out_H
		{
			file = "A3\Air_F\Heli_Light_01\Data\Anim\C\ROut";
		};
	};
};
class CfgMovesWomen: CfgMovesBasic
{
	class ManActions
	{
		chopperLight_L_buttonPush_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_greetFront_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_greetLeft_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_greetRight_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_HeadInHand_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_headSetOff_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_headSetOn_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_idleLoopA_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_idleLoopB_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_idleLoopC_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_idleLoopD_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_idleLoopE_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_In_H = "Crew";
		chopperLight_L_lookLeft_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_lookLeftBackUp_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_lookRight_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_lookRightBackUp_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_out_H = "Crew";
		chopperLight_L_pointFront_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_pointLeft_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_pointRight_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_seatBeltOff_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_seatBeltOn_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_static_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_switchOff_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_switchOn_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_thumbDownFront_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_thumbDownLeft_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_thumbDownRight_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_thumbUpFront_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_thumbUpLeft_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_thumbUpRight_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_tweakHeadSetMicA_H = "ChopperLight_L_wmn_static_H";
		chopperLight_L_tweakHeadSetMicB_H = "ChopperLight_L_wmn_static_H";
		chopperLight_R_buttonPush_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_copilot_to_passenger_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_greetFront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_greetLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_greetRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_HeadInHand_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_headSetOff_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_headSetOn_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_idleLoopA_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_idleLoopB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_idleLoopC_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_idleLoopD_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_idleLoopE_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_in_H = "Crew";
		chopperLight_R_lookLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_lookLeftBackUp_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_lookRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_lookRightBackUp_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_out_H = "Crew";
		chopperLight_R_pointFront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_pointLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_pointRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_seatBeltOff_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_seatBeltOn_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_static_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_switchOff_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_switchOn_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_thumbDownFront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_thumbDownLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_thumbDownRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_thumbUpFront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_thumbUpLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_R_thumbUpRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_bothThumbsUp_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_CongratsToPilot_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_grumbling_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleA_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleBored_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleBoredB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleCtalk_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleDtalk_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleE_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleF_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleG_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleH_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_idleI_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_LittleNervous_scratching_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_LittleNervous_watchClockA_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_LittleNervous_watchClockB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_lookingAround_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_musicA_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_musicB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_musicC_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_NoFront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_NoLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_NoRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_passenger_to_copilot_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_POIfront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_POIfrontB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_POIleft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pointingAheadTalking_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_POIright_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_replyToPilot_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_replyToPilot2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_replyToPilotAgree_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_scaredA_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_scaredB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_scaredDin_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_scaredDloop_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_scaredDout_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_scratching_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_seatBeltOff_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_seatBeltOn_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_sneezingCoughing_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_static_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_talkIntercom_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_talkRightOut_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_talkToPilotConsideringProposal_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_talkToPilotFlyAhead_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_talkToPilotNoProblemAtall_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_tellingStory_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_tinyNervous_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_tinyNervousB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_tiredA_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_tiredB_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_watchClock_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_YesFront_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_YesLeft_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_YesRight_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_copilot_to_cameraHold_1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_copilot_to_cameraHold_2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_filmingF_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_filmingL_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_filmingR1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_filmingR2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_hold_to_copilot_1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_hold_to_copilot_2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_idle_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_lowerStanceLoop_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_lowerStanceToCamPose_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_malfunction_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_camera_toLowerStance_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_copilot_to_cellHold_1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_copilot_to_cellHold_2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_dial_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_hold_to_copilot_1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_hold_to_copilot_2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_idle_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_idle2talkingToPilot_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_idle3_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_idle4_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_cell_talkToCell_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_copilot_to_padHold_1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_copilot_to_padHold_2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_hold_to_copilot_1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_hold_to_copilot_2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_idle_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_typing1_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_typing2_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_RP_pad_typing3_H = "ChopperLight_RP_wmn_static_H";
		chopperLight_C_L_idleA_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_L_idleB_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_L_idleC_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_L_idleD_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_L_static_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_LIn_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_LOut_H = "ChopperLight_C_L_wmn_static_H";
		chopperLight_C_R_idleA_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_C_R_idleB_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_C_R_idleC_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_C_R_idleD_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_C_R_static_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_C_Rin_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_C_Rout_H = "ChopperLight_C_R_wmn_static_H";
		chopperLight_CB_getin_fromErcRflLow_H = "";
		chopperLight_CB_getout_toErcRflLow_H = "";
		chopperLight_CB_idle1shaky_H = "";
		chopperLight_CB_idle1stable_H = "";
		chopperLight_CB_idle2lookleft_H = "";
		chopperLight_CB_idle3lookright_H = "";
		chopperLight_CB_idle4_H = "";
		chopperLight_CB_idle5lookdown_H = "";
		chopperLight_CB_idle6pointing_H = "";
		chopperLight_CB_idle7lookaround_H = "";
		chopperLight_CB_static_H = "";
	};
	class States
	{
		class KIA_chopperLight_L_wmn_H: DefaultDie
		{
			actions = "DeadActions";
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\L_death.rtm";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class KIA_chopperLight_RP_wmn_H: KIA_chopperLight_L_wmn_H
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\RP_death.rtm";
		};
		class KIA_chopperLight_C_L_wmn_H: KIA_chopperLight_L_wmn_H
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\C_L_death.rtm";
		};
		class KIA_chopperLight_C_R_wmn_H: KIA_chopperLight_L_wmn_H
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\C_R_death.rtm";
		};
		class Crew;
		class ChopperLight_L_wmn_static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\L_static.rtm";
			speed = 1e+010;
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_L_wmn_H",1};
		};
		class ChopperLight_RP_wmn_static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\RP_static.rtm";
			speed = 1e+010;
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_RP_wmn_H",1};
		};
		class ChopperLight_C_L_wmn_static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\C_L_static.rtm";
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_C_L_wmn_H",1};
		};
		class ChopperLight_C_R_wmn_static_H: Crew
		{
			file = "\A3\Air_F\Heli_Light_01\Data\Anim\wmn\C_R_static.rtm";
			looped = 0;
			interpolateTo[] = {"KIA_chopperLight_C_R_wmn_H",1};
		};
	};
};
class CfgVehicles
{
	class Helicopter;
	class Helicopter_Base_F: Helicopter
	{
		class Turrets;
		class HitPoints;
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class EventHandlers;
		class Turrets: Turrets
		{
			class CopilotTurret;
		};
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitFuel;
			class HitEngine;
			class HitAvionics;
			class HitVRotor;
			class HitHRotor;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class AnimationSources;
		class ViewOptics;
		class RotorLibHelicopterProperties;
	};
	class Heli_Light_01_base_F: Helicopter_Base_H
	{
		features = "Randomization: No						<br />Camo selections: 1 - the whole exterior						<br />Script door sources: DoorL_Front_Open, DoorR_Front_Open, DoorL_Back_Open, DoorR_Back_Open						<br />Script animations: AddDoors, AddBackseats, AddTread, AddTread_Short, BenchL_Up, BenchR_Up, AddHoldingFrame, AddGunHolder, AddCivilian_hide, AddMusicUnit						<br />Executed scripts: None 						<br />Firing from vehicles: Positions 1, 2, 3, 4 (benches)						<br />Slingload: Slingloads up to 500 kg						<br />Cargo proxy indexes: 11, 10, 1, 2, 3, 4";
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Heli_Light_01_base_F";
		displayName = "$STR_A3_CfgVehicles_Heli_Light_01_Base0";
		model = "\A3\Air_F\Heli_Light_01\Heli_Light_01_F.p3d";
		driveOnComponent[] = {"Skids"};
		picture = "A3\Air_F\Heli_Light_01\Data\UI\Heli_Light_01_CA.paa";
		icon = "\A3\Air_F\Heli_Light_01\Data\UI\Map_Heli_Light_01_CA.paa";
		accuracy = 0.5;
		nameSound = "veh_helicopter";
		class MFD{};
		fuelCapacity = 242;
		fuelConsumptionRate = 0.0322;
		maxFordingDepth = 0.65;
		mainBladeRadius = 3.8;
		class RotorLibHelicopterProperties: RotorLibHelicopterProperties
		{
			RTDconfig = "A3\Air_F\Heli_Light_01\RTD_Heli_Light_01.xml";
			autoHoverCorrection[] = {0.28,2.88,0};
			defaultCollective = 0.635;
			maxTorque = 900;
			stressDamagePerSec = 0.0033333332;
			maxHorizontalStabilizerLeftStress = 10000;
			maxHorizontalStabilizerRightStress = 10000;
			maxVerticalStabilizerStress = 10000;
			horizontalWingsAngleCollMin = 0;
			horizontalWingsAngleCollMax = 0;
			maxMainRotorStress = 31000;
			maxTailRotorStress = 5200;
			retreatBladeStallWarningSpeed = 77.222;
		};
		maxSpeed = 245;
		slingLoadMaxCargoMass = 500;
		radarType = 8;
		liftForceCoef = 1.5;
		cyclicAsideForceCoef = 1.3;
		cyclicForwardForceCoef = 1.0;
		bodyFrictionCoef = 0.3;
		preciseGetInOut = 0;
		cargoPreciseGetInOut[] = {0};
		driverAction = "Chopperlight_L_Static_H";
		getInAction = "ChopperLight_L_In_H";
		getOutAction = "GetOutLow";
		memoryPointsGetInCargo[] = {"pos Cargo R","pos Cargo L","pos Cargo L","pos Cargo R"};
		memoryPointsGetInCargoDir[] = {"pos Cargo dir R","pos Cargo dir L","pos Cargo dir L","pos Cargo dir R"};
		usePreciseGetInAction = 0;
		memoryPointsGetInDriverPrecise = "GetIn_Pilot";
		memoryPointsGetInCargoPrecise[] = {"GetIn_Cargo","GetIn_Cargo2"};
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		typicalCargo[] = {"B_HeliPilot_F"};
		cargoAction[] = {"ChopperLight_C_R_static_H","ChopperLight_C_L_static_H"};
		transportSoldier = 1;
		maximumLoad = 1000;
		class TransportBackpacks
		{
			class _xx_B_Parachute
			{
				backpack = "B_Parachute";
				count = 2;
			};
		};
		class TransportMagazines
		{
			class _xx_SmokeShell
			{
				magazine = "SmokeShell";
				count = 2;
			};
			class _xx_SmokeShellBlue
			{
				magazine = "SmokeShellBlue";
				count = 2;
			};
			class _xx_30Rnd_65x39_caseless_mag
			{
				magazine = "30Rnd_65x39_caseless_mag";
				count = 4;
			};
		};
		class TransportWeapons
		{
			class _xx_arifle_MXC_F
			{
				weapon = "arifle_MXC_F";
				count = 2;
			};
		};
		class TransportItems
		{
			class _xx_FirstAidKit
			{
				name = "FirstAidKit";
				count = 2;
			};
			class _xx_Toolkit
			{
				name = "Toolkit";
				count = 1;
			};
			class _xx_ItemGPS
			{
				name = "ItemGPS";
				count = 1;
			};
		};
		threat[] = {0,0,0};
		sensitivity = 2.5;
		driverCanSee = 31;
		extCameraPosition[] = {0,2,-15};
		class ViewOptics: ViewOptics
		{
			initAngleX = 0;
			minAngleX = -30;
			maxAngleX = 30;
			initAngleY = 0;
			minAngleY = -86;
			maxAngleY = 86;
			initFov = 0.1;
			minFov = 0.03;
			maxFov = 1.2;
		};
		occludeSoundsWhenIn = 0.562341;
		obstructSoundsWhenIn = 0.316228;
		attenuationEffectType = "OpenHeliAttenuation";
		emptySound[] = {"",0,1};
		soundGeneralCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_default_int_1",1.0,1,100};
		soundGeneralCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_default_int_2",1.0,1,100};
		soundGeneralCollision3[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_default_int_3",1.0,1,100};
		soundCrashes[] = {"soundGeneralCollision1",0.33,"soundGeneralCollision2",0.33,"soundGeneralCollision3",0.33};
		soundLandCrashes[] = {"emptySound",0};
		soundBuildingCrash[] = {"soundGeneralCollision1",1,"soundGeneralCollision2",1,"soundGeneralCollision3",1};
		soundArmorCrash[] = {"soundGeneralCollision1",1,"soundGeneralCollision2",1,"soundGeneralCollision3",1};
		soundWoodCrash[] = {"soundGeneralCollision1",1,"soundGeneralCollision2",1,"soundGeneralCollision3",1};
		soundBushCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_1",1.0,1,100};
		soundBushCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_2",1.0,1,100};
		soundBushCollision3[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_3",1.0,1,100};
		soundBushCrash[] = {"soundBushCollision1",0.33,"soundBushCollision2",0.33,"soundBushCollision3",0.33};
		soundWaterCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_water_ext_1",1.0,1,100};
		soundWaterCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_water_ext_2",1.0,1,100};
		soundWaterCrashes[] = {"soundWaterCollision1",0.5,"soundWaterCollision2",0.5};
		soundDammage[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_crash_default_ext_1",3.1622777,1};
		soundGetIn[] = {"A3\Sounds_F\vehicles\air\noises\heli_get_in2",0.56234133,1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\air\noises\heli_get_out2",0.7943282,1,20};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_start",0.31622776,1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_start",0.7943282,1.0,600};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_stop",0.31622776,1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_stop",0.7943282,1.0,600};
		soundLocked[] = {"\A3\Sounds_F\weapons\Rockets\opfor_lock_1",1.0,1};
		soundIncommingMissile[] = {"\A3\Sounds_F\weapons\Rockets\opfor_lock_2",1.0,1};
		rotorDamageInt[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_rotor_int_open_1",1.0,1.0};
		rotorDamageOut[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_rotor_ext_1",2.5118864,1.0,150};
		rotorDamage[] = {"rotorDamageInt","rotorDamageOut"};
		tailDamageInt[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_tail",1.0,1.0};
		tailDamageOut[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_tail",1.0,1.0,300};
		tailDamage[] = {"tailDamageInt","tailDamageOut"};
		landingSoundInt0[] = {"A3\Sounds_F\vehicles\air\noises\landing_skids_int1_open",1.0,1.0,100};
		landingSoundInt1[] = {"A3\Sounds_F\vehicles\air\noises\landing_skids_int1_open",1.0,1.0,100};
		landingSoundInt[] = {"landingSoundInt0",0.5,"landingSoundInt1",0.5};
		landingSoundOut0[] = {"A3\Sounds_F\vehicles\air\noises\landing_skids_ext1",1.7782794,1.0,100};
		landingSoundOut1[] = {"A3\Sounds_F\vehicles\air\noises\landing_skids_ext1",1.7782794,1.0,100};
		landingSoundOut[] = {"landingSoundOut0",0.5,"landingSoundOut1",0.5};
		slingCargoAttach0[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownEndINT",1.0,1.0};
		slingCargoAttach1[] = {"A3\Sounds_F\vehicles\air\noises\SL_1hookLock",1.0,1.0,80};
		slingCargoAttach[] = {"slingCargoAttach0","slingCargoAttach1"};
		slingCargoDetach0[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpEndINT",1.0,1.0};
		slingCargoDetach1[] = {"A3\Sounds_F\vehicles\air\noises\SL_1hookUnlock",1.0,1.0,80};
		slingCargoDetach[] = {"slingCargoDetach0","slingCargoDetach1"};
		slingCargoDetachAir0[] = {"A3\Sounds_F\vehicles\air\noises\SL_unhook_air_int",1.0,1.0};
		slingCargoDetachAir1[] = {"A3\Sounds_F\vehicles\air\noises\SL_unhook_air_ext",1.0,1.0,80};
		slingCargoDetachAir[] = {"slingCargoDetach0","slingCargoDetach1"};
		slingCargoRopeBreak0[] = {"A3\Sounds_F\vehicles\air\noises\SL_rope_break_int",1.0,1.0};
		slingCargoRopeBreak1[] = {"A3\Sounds_F\vehicles\air\noises\SL_rope_break_ext",1.0,1.0,80};
		slingCargoRopeBreak[] = {"slingCargoDetach0","slingCargoDetach1"};
		class Sounds
		{
			class EngineExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_engine",1.2589254,1.0,400};
				frequency = "rotorSpeed";
				volume = "4 * camPos * (0 max (rotorSpeed-0.4))";
			};
			class RotorExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_rotor_normal_new",1.2589254,1.0,1000};
				frequency = "(rotorSpeed factor [0.3, 0.7]) * (rotorSpeed factor [0.3, 1]) * (1 - rotorThrust/4)";
				volume = "camPos * (rotorSpeed factor [0.3, 1]) * (1 + rotorThrust)";
			};
			class RotorSwist
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\rotor_swist",0.70794576,1.0,300};
				frequency = 1;
				volume = "camPos * (rotorThrust factor [0.7, 0.9])";
			};
			class EngineInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_engine",0.7943282,1.0};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*2*(0 max (rotorSpeed-0.4))";
			};
			class RotorInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_rotor_normal_new",0.63095737,1.0};
				frequency = "(rotorSpeed factor [0.3, 0.7]) * (rotorSpeed factor [0.3, 1]) * (1 - rotorThrust/4)";
				volume = "(1 - camPos) * (rotorSpeed factor [0.3, 0.7]) * (1 + rotorThrust) * 0.7";
			};
			class RotorBench
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_rotor_normal_bench",0.5011872,1.0,1000};
				frequency = "(rotorSpeed factor [0.3, 0.7]) * (rotorSpeed factor [0.3, 1]) * (1 - rotorThrust/4)";
				volume = "(playerPos factor [3.9, 4]) * (1 - camPos) * (rotorSpeed factor [0.3, 1]) * (1 + rotorThrust) * 0.4";
				cone[] = {1.6,3.14,1.6,0.95};
			};
			class EngineBench
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_engine_bench",0.35481337,1.0,400};
				frequency = "rotorSpeed";
				volume = "(playerPos factor [3.9, 4]) * (1 - camPos) * (0 max (rotorSpeed-0.4))";
			};
			class WindBench
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_open_out",0.56234133,1.0,50};
				frequency = 1;
				volume = "4 * (playerPos factor [3.9, 4]) * (1 - camPos) * ((speed factor[0, 30]) + (speed factor[0, -30]))";
			};
			class TransmissionDamageExt_phase1
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_1",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "camPos * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class TransmissionDamageExt_phase2
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_2",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "camPos * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class TransmissionDamageInt_phase1
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_1",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "(1 - camPos) * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class TransmissionDamageInt_phase2
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_2",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "(1 - camPos) * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class damageAlarmInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_bluefor",0.31622776,1.0};
				frequency = 1;
				volume = "engineOn * (1 - camPos) * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0.0, 0.001])";
			};
			class damageAlarmExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_bluefor",0.2238721,1.0,20};
				frequency = 1;
				volume = "engineOn * camPos * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0, 0.001])";
			};
			class rotorLowAlarmInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.31622776,1.0};
				frequency = 1;
				volume = "engineOn * (1 - camPos) * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
			};
			class rotorLowAlarmExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.2238721,1.0,20};
				frequency = 1;
				volume = "engineOn * camPos * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
			};
			class scrubLandInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubLandInt_open",1.0,1.0,100};
				frequency = 1;
				volume = "2 * (1-camPos) * (scrubLand factor[0.02, 0.05])";
			};
			class scrubLandExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubLandExt",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * (scrubLand factor[0.02, 0.05])";
			};
			class scrubBuildingInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubBuildingInt",1.0,1.0,100};
				frequency = 1;
				volume = "2 * (1 - camPos) * (scrubBuilding factor[0.02, 0.05])";
			};
			class scrubBuildingExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubBuildingExt",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * (scrubBuilding factor[0.02, 0.05])";
			};
			class scrubTreeInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeExt",1.0,1.0,100};
				frequency = 1;
				volume = "(1 - camPos) * ((scrubTree) factor [0, 0.01])";
			};
			class scrubTreeExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeExt",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * ((scrubTree) factor [0, 0.01])";
			};
			class RainExt
			{
				sound[] = {"A3\Sounds_F\vehicles\noises\rain1_ext",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * (rain - rotorSpeed/2) * 2";
			};
			class RainInt
			{
				sound[] = {"A3\Sounds_F\vehicles\noises\rain1_int_open",1.0,1.0,100};
				frequency = 1;
				volume = "(1-camPos)*(rain - rotorSpeed/2)*2";
			};
			class SlingLoadDownExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownEXT",1.0,1.0,500};
				frequency = 1;
				volume = "camPos*(slingLoadActive factor [0,-1])";
			};
			class SlingLoadUpExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpEXT",1.0,1.0,500};
				frequency = 1;
				volume = "camPos*(slingLoadActive factor [0,1])";
			};
			class SlingLoadDownInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownINT",1.0,1.0,500};
				frequency = 1;
				volume = "(1-camPos)*(slingLoadActive factor [0,-1])";
			};
			class SlingLoadUpInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpINT",1.0,1.0,500};
				frequency = 1;
				volume = "(1-camPos)*(slingLoadActive factor [0,1])";
			};
			class WindInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_open_int",1.1220185,1.0,50};
				frequency = 1;
				volume = "(1-camPos)*(speed factor[5, 50])*(speed factor[5, 50])";
			};
			class WindLateralMovementInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_lateral_open_int",1.9952624,1.0,50};
				frequency = 1;
				volume = "(1-camPos)*lateralMovement*((speed factor [5,40]) + (speed factor [-5,-40]))";
			};
			class GStress
			{
				sound[] = {"A3\Sounds_F\vehicles\noises\vehicle_stress2b",0.31622776,1.0,50};
				frequency = 1;
				volume = "engineOn * (1-camPos) * ((gmeterZ factor[1.5, 2.5]) + (gmeterZ factor[0.5, -0.5]))";
			};
		};
		class SoundsExt
		{
			class SoundEvents{};
			class Sounds
			{
				class EngineExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_engine",1.2589254,1.0,400};
					frequency = "rotorSpeed";
					volume = "4 * camPos * (0 max (rotorSpeed-0.4))";
				};
				class RotorExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_rotor_normal_new",1.2589254,1.0,1000};
					frequency = "(rotorSpeed factor [0.3, 0.7]) * (rotorSpeed factor [0.3, 1]) * (1 - rotorThrust/4)";
					volume = "camPos * (rotorSpeed factor [0.3, 1]) * (1 + rotorThrust)";
				};
				class RotorSwist
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\rotor_swist",0.70794576,1.0,300};
					frequency = 1;
					volume = "camPos * (rotorThrust factor [0.7, 0.9])";
				};
				class EngineInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_engine",0.7943282,1.0};
					frequency = "rotorSpeed";
					volume = "(1-camPos)*2*(0 max (rotorSpeed-0.4))";
				};
				class RotorInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_rotor_normal_new",0.63095737,1.0};
					frequency = "(rotorSpeed factor [0.3, 0.7]) * (rotorSpeed factor [0.3, 1]) * (1 - rotorThrust/4)";
					volume = "(1 - camPos) * (rotorSpeed factor [0.3, 0.7]) * (1 + rotorThrust) * 0.7";
				};
				class RotorBench
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_int_rotor_normal_bench",0.5011872,1.0,1000};
					frequency = "(rotorSpeed factor [0.3, 0.7]) * (rotorSpeed factor [0.3, 1]) * (1 - rotorThrust/4)";
					volume = "(playerPos factor [3.9, 4]) * (1 - camPos) * (rotorSpeed factor [0.3, 1]) * (1 + rotorThrust) * 0.4";
					cone[] = {1.6,3.14,1.6,0.95};
				};
				class EngineBench
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_01\Heli_Light_01_ext_engine_bench",0.35481337,1.0,400};
					frequency = "rotorSpeed";
					volume = "(playerPos factor [3.9, 4]) * (1 - camPos) * (0 max (rotorSpeed-0.4))";
				};
				class WindBench
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_open_out",0.56234133,1.0,50};
					frequency = 1;
					volume = "4 * (playerPos factor [3.9, 4]) * (1 - camPos) * ((speed factor[0, 30]) + (speed factor[0, -30]))";
				};
				class TransmissionDamageExt_phase1
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_1",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "camPos * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class TransmissionDamageExt_phase2
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_2",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "camPos * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class TransmissionDamageInt_phase1
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_1",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "(1 - camPos) * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class TransmissionDamageInt_phase2
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_2",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "(1 - camPos) * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class damageAlarmInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_bluefor",0.31622776,1.0};
					frequency = 1;
					volume = "engineOn * (1 - camPos) * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0.0, 0.001])";
				};
				class damageAlarmExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_bluefor",0.2238721,1.0,20};
					frequency = 1;
					volume = "engineOn * camPos * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0, 0.001])";
				};
				class rotorLowAlarmInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.31622776,1.0};
					frequency = 1;
					volume = "engineOn * (1 - camPos) * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
				};
				class rotorLowAlarmExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.2238721,1.0,20};
					frequency = 1;
					volume = "engineOn * camPos * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
				};
				class scrubLandInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubLandInt_open",1.0,1.0,100};
					frequency = 1;
					volume = "2 * (1-camPos) * (scrubLand factor[0.02, 0.05])";
				};
				class scrubLandExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubLandExt",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * (scrubLand factor[0.02, 0.05])";
				};
				class scrubBuildingInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubBuildingInt",1.0,1.0,100};
					frequency = 1;
					volume = "2 * (1 - camPos) * (scrubBuilding factor[0.02, 0.05])";
				};
				class scrubBuildingExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubBuildingExt",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * (scrubBuilding factor[0.02, 0.05])";
				};
				class scrubTreeInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeExt",1.0,1.0,100};
					frequency = 1;
					volume = "(1 - camPos) * ((scrubTree) factor [0, 0.01])";
				};
				class scrubTreeExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeExt",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * ((scrubTree) factor [0, 0.01])";
				};
				class RainExt
				{
					sound[] = {"A3\Sounds_F\vehicles\noises\rain1_ext",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * (rain - rotorSpeed/2) * 2";
				};
				class RainInt
				{
					sound[] = {"A3\Sounds_F\vehicles\noises\rain1_int_open",1.0,1.0,100};
					frequency = 1;
					volume = "(1-camPos)*(rain - rotorSpeed/2)*2";
				};
				class SlingLoadDownExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownEXT",1.0,1.0,500};
					frequency = 1;
					volume = "camPos*(slingLoadActive factor [0,-1])";
				};
				class SlingLoadUpExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpEXT",1.0,1.0,500};
					frequency = 1;
					volume = "camPos*(slingLoadActive factor [0,1])";
				};
				class SlingLoadDownInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownINT",1.0,1.0,500};
					frequency = 1;
					volume = "(1-camPos)*(slingLoadActive factor [0,-1])";
				};
				class SlingLoadUpInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpINT",1.0,1.0,500};
					frequency = 1;
					volume = "(1-camPos)*(slingLoadActive factor [0,1])";
				};
				class WindInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_open_int",1.1220185,1.0,50};
					frequency = 1;
					volume = "(1-camPos)*(speed factor[5, 50])*(speed factor[5, 50])";
				};
				class WindLateralMovementInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_lateral_open_int",1.9952624,1.0,50};
					frequency = 1;
					volume = "(1-camPos)*lateralMovement*((speed factor [5,40]) + (speed factor [-5,-40]))";
				};
				class GStress
				{
					sound[] = {"A3\Sounds_F\vehicles\noises\vehicle_stress2b",0.31622776,1.0,50};
					frequency = 1;
					volume = "engineOn * (1-camPos) * ((gmeterZ factor[1.5, 2.5]) + (gmeterZ factor[0.5, -0.5]))";
				};
			};
		};
		gunnerUsesPilotView = 1;
		castCargoShadow = 1;
		LockDetectionSystem = 8;
		irScanRangeMax = 10000;
		cameraBegin = "rtd1_pos";
		cameraEnd = "rtd1_dir";
		class RenderTargets
		{
			class LowerMirror
			{
				renderTarget = "rendertarget1";
				class CameraView
				{
					pointPosition = "rtd1_pos";
					pointDirection = "rtd1_dir";
					renderQuality = 0;
					renderVisionMode = 0;
					fov = 0.7;
				};
			};
		};
		class Reflectors
		{
			class Right
			{
				color[] = {7000,7500,10000};
				ambient[] = {70,75,100};
				intensity = 50;
				size = 1;
				innerAngle = 15;
				outerAngle = 65;
				coneFadeCoef = 10;
				position = "Light_pos";
				direction = "Light_dir";
				hitpoint = "Light_hitpoint";
				selection = "Light";
				useFlare = 1;
				flareSize = 10;
				flareMaxDistance = 250;
				dayLight = 0;
				class Attenuation
				{
					start = 0;
					constant = 0;
					linear = 1;
					quadratic = 1;
					hardLimitStart = 100;
					hardLimitEnd = 200;
				};
			};
		};
		class Exhausts
		{
			class Exhaust01
			{
				position = "exhaust1";
				direction = "exhaust1_dir";
				effect = "ExhaustEffectHeli";
			};
		};
		armor = 35;
		damageResistance = 0.01039;
		epeImpulseDamageCoef = 20;
		class HitPoints: HitPoints
		{
			class HitFuel: HitFuel
			{
				visual = "";
				radius = 0.1;
				explosionShielding = 2;
			};
			class HitHull: HitHull
			{
				armor = 999;
				visual = "zbytek";
				depends = "Total";
				radius = 0.01;
			};
			class HitEngine: HitEngine
			{
				visual = "";
				radius = 0.2;
				explosionShielding = 2;
			};
			class HitAvionics: HitAvionics
			{
				armor = 1;
				visual = "";
				radius = 0.5;
				explosionShielding = 2;
			};
			class HitHRotor: HitHRotor
			{
				visual = "main rotor static";
				armor = 3;
				radius = 0.3;
				explosionShielding = 2.5;
			};
			class HitVRotor: HitVRotor
			{
				visual = "tail rotor static";
				armor = 2;
				radius = 0.06;
				explosionShielding = 6;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.5;
				radius = 0.15;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.5;
				radius = 0.15;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.5;
				radius = 0.15;
			};
			class HitGlass4: HitGlass4
			{
				armor = 0.5;
				radius = 0.15;
			};
		};
		class Damage
		{
			tex[] = {};
			mat[] = {"A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_destruct.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_UNIColor.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_UNIColor_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_UNIColor_destruct.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_in.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_int.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_int_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_int_destruct.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_detail.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_detail_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_detail_destruct.rvmat"};
		};
		class AnimationSources: AnimationSources
		{
			class AddTread_Short
			{
				DisplayName = "Add short tread";
				source = "user";
				author = "$STR_A3_Bohemia_Interactive";
				animPeriod = 1e-006;
				initPhase = 0;
				forceAnimatePhase = 1;
				forceAnimate[] = {"AddTread",0};
			};
			class AddTread
			{
				displayName = "Add tread";
				author = "$STR_A3_Bohemia_Interactive";
				source = "user";
				animPeriod = 1e-006;
				initPhase = 0;
				forceAnimatePhase = 1;
				forceAnimate[] = {"AddTread_Short",0};
			};
			class AddScreen1
			{
				source = "user";
				animPeriod = 1e-006;
				initPhase = 0;
			};
			class AddCivilian_hide
			{
				source = "user";
				animPeriod = 1e-006;
				initPhase = -1;
			};
			class AddMusicUnit
			{
				source = "user";
				animPeriod = 1e-006;
				initPhase = 1;
			};
			class FLIR_HRot
			{
				source = "user";
				animPeriod = 1e-007;
				initPhase = 0;
			};
			class FLIR_VRot
			{
				source = "user";
				animPeriod = 1e-007;
				initPhase = 0;
			};
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			class HitGlass2: HitGlass1
			{
				hitpoint = "HitGlass2";
			};
			class HitGlass3: HitGlass1
			{
				hitpoint = "HitGlass3";
			};
			class HitGlass4: HitGlass1
			{
				hitpoint = "HitGlass4";
			};
			class HitGlass5: HitGlass1
			{
				hitpoint = "HitGlass5";
			};
			class HitGlass6: HitGlass1
			{
				hitpoint = "HitGlass6";
			};
			class HitGlass7: HitGlass1
			{
				hitpoint = "HitGlass7";
			};
			class HitGlass8: HitGlass1
			{
				hitpoint = "HitGlass8";
			};
			class HitGlass9: HitGlass1
			{
				hitpoint = "HitGlass9";
			};
			class HitGlass10: HitGlass1
			{
				hitpoint = "HitGlass10";
			};
		};
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
				gunnerAction = "Chopperlight_R_Static_H";
				gunnerInAction = "Chopperlight_R_Static_H";
				weapons[] = {};
				magazines[] = {};
				gunnerGetInAction = "Chopperlight_R_In_H";
				gunnergetOutAction = "GetOutLow";
				usePreciseGetInAction = 0;
				memoryPointsGetInGunnerPrecise = "GetIn_Turret";
				preciseGetInOut = 0;
				canEject = 0;
				isPersonTurret = 0;
				personTurretAction = "vehicle_coshooter_1";
				maxElev = 15;
				minElev = -60;
				maxTurn = -20;
				minTurn = -105;
				class dynamicViewLimits
				{
					CargoTurret_01[] = {-70,-20};
				};
			};
		};
		hiddenSelections[] = {"camo1"};
		hiddenSelectionsTextures[] = {"A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_CO.paa"};
		class Armory
		{
			description = "$str_a3_cfgvehicles_b_heli_light_01_armory0";
		};
		cargoCanEject = 1;
		driverCanEject = 0;
		ejectDeadCargo = 0;
		class pilotCamera
		{
			class OpticsIn
			{
				class Wide
				{
					opticsDisplayName = "W";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.5;
					minFov = 0.5;
					maxFov = 0.5;
					directionStabilized = 1;
					visionMode[] = {"Normal","NVG"};
					thermalMode[] = {0,1};
					gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
				};
				showMiniMapInOptics = 0;
				showUAVViewpInOptics = 0;
				showSlingLoadManagerInOptics = 1;
			};
			minTurn = 0;
			maxTurn = 0;
			initTurn = 0;
			minElev = 80;
			maxElev = 80;
			initElev = 80;
			maxXRotSpeed = 0.5;
			maxYRotSpeed = 0.5;
			pilotOpticsShowCursor = 1;
			controllable = 0;
		};
		memoryPointDriverOptics = "slingCamera";
		class TextureSources
		{
			class blu
			{
				DisplayName = "BLUFOR";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_Blufor_CO.paa"};
				factions[] = {"BLU_F"};
			};
		};
	};
	class Heli_Light_01_unarmed_base_F: Heli_Light_01_base_F
	{
		availableForSupportTypes[] = {"Transport"};
		class UserActions
		{
			class BenchL_Fold
			{
				userActionID = 58;
				displayName = "Fold left bench";
				displayNameDefault = "";
				textToolTip = "";
				position = "action_doorL_front";
				priority = 1.5;
				radius = 1.5;
				radiusView = 0.2;
				showIn3D = 17;
				available = 0;
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "((this animationPhase 'BenchL_Up') == 0) && (alive this) && ((this animationPhase 'AddBenches') == 1) && {(_x select 2) in [3,4]} count fullCrew [this, 'Turret'] == 0 && false";
				statement = "this animate ['BenchL_Up', 1]; {this lockCargo [_x, true]} forEach [3,4]";
			};
			class BenchR_Fold: BenchL_Fold
			{
				userActionID = 60;
				displayName = "Fold right bench";
				position = "action_doorR_front";
				condition = "((this animationPhase 'BenchR_Up') == 0) && (alive this) && ((this animationPhase 'AddBenches') == 1) && {(_x select 2) in [2,5]} count fullCrew [this, 'Turret'] == 0 && false";
				statement = "this animate ['BenchR_Up', 1]; {this lockCargo [_x, true]} forEach [2,5]";
			};
			class BenchL_Unfold: BenchL_Fold
			{
				userActionID = 59;
				displayName = "Unfold left bench";
				condition = "((this animationPhase 'BenchL_Up') == 1) && (alive this) && ((this animationPhase 'AddBenches') == 1) && {(_x select 2) in [3,4]} count fullCrew [this, 'Turret'] == 0 && false";
				statement = "this animate ['BenchL_Up', 0]; {this lockCargo [_x, false]} forEach [3,4]";
				textToolTip = "";
				displayNameDefault = "";
			};
			class BenchR_Unfold: BenchL_Unfold
			{
				userActionID = 61;
				displayName = "Unfold right bench";
				position = "action_doorR_front";
				condition = "((this animationPhase 'BenchR_Up') == 1) && (alive this) && ((this animationPhase 'AddBenches') == 1) && {(_x select 2) in [2,5]} count fullCrew [this, 'Turret'] == 0 && false";
				statement = "this animate ['BenchR_Up', 0]; {this lockCargo [_x, false]} forEach [2,5]";
			};
		};
		class animationSources: AnimationSources
		{
			class AddFLIR
			{
				displayName = "Add FLIR";
				source = "user";
				animPeriod = 1e-006;
				initPhase = 0;
			};
			class AddBackseats
			{
				displayName = "Add back seats";
				source = "user";
				animPeriod = 1e-006;
				initPhase = 1;
				author = "$STR_A3_Bohemia_Interactive";
				lockCargoAnimationPhase = 0;
				lockCargo[] = {0,1};
			};
			class AddBenches
			{
				displayName = "Add benches";
				author = "$STR_A3_Bohemia_Interactive";
				source = "user";
				animPeriod = 1e-006;
				initPhase = 0;
				lockCargoAnimationPhase = 0;
				lockCargo[] = {2,3,4,5};
				forceAnimatePhase = 0;
				forceAnimate[] = {"BenchL_Up_instant",1,"BenchR_Up_instant",1};
			};
			class AddHoldingFrame
			{
				displayName = "Add holding frame";
				author = "$STR_A3_Bohemia_Interactive";
				source = "user";
				animPeriod = 1e-006;
				initPhase = 0;
			};
			class BenchL_Up
			{
				DisplayName = "Fold left bench";
				source = "user";
				author = "$STR_A3_Bohemia_Interactive";
				animPeriod = 0.8;
				initPhase = 0;
				lockCargoAnimationPhase = 1;
				lockCargo[] = {3,4};
				forceAnimatePhase = 1;
				forceAnimate[] = {"BenchL_Up_instant",0};
				scope = 0;
			};
			class BenchL_Up_instant: BenchL_Up
			{
				displayName = "Fold left bench (instant)";
				animPeriod = 0.1;
				forceAnimate[] = {"BenchL_Up",0};
			};
			class BenchR_Up: BenchL_Up
			{
				displayName = "Fold right bench";
				lockCargo[] = {2,5};
				forceAnimate[] = {"BenchR_Up_instant",1};
			};
			class BenchR_Up_instant: BenchR_Up
			{
				displayName = "Fold right bench (instant)";
				animPeriod = 0.01;
				forceAnimate[] = {"BenchR_Up",0};
			};
		};
	};
	class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F
	{
		mapSize = 9.83;
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "B_Heli_Light_01_F";
		scope = 2;
		accuracy = 1;
		side = 1;
		faction = "BLU_F";
		crew = "B_Helipilot_F";
		class Armory
		{
			description = "$str_a3_cfgvehicles_b_heli_light_01_armory0";
		};
		hiddenSelectionsTextures[] = {"A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_Blufor_CO.paa"};
		class TransportBackpacks
		{
			class _xx_B_Parachute
			{
				backpack = "B_Parachute";
				count = 4;
			};
		};
		showNVGCargo[] = {0,0,1};
		cargoPreciseGetInOut[] = {0};
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		cargoAction[] = {"ChopperLight_C_L_static_H","ChopperLight_C_R_static_H","ChopperLight_CB_static_H","ChopperLight_CB_static_H","ChopperLight_CB_static_H","ChopperLight_CB_static_H"};
		memoryPointsGetInCargo[] = {"pos Cargo L","pos Cargo R","pos Cargo R","pos Cargo L","pos Cargo L","pos Cargo R"};
		memoryPointsGetInCargoDir[] = {"pos Cargo dir L","pos Cargo dir R","pos Cargo dir R","pos Cargo dir L","pos Cargo dir L","pos Cargo dir R"};
		memoryPointsGetInCargoPrecise[] = {"GetIn_Cargo","GetIn_Cargo2","GetIn_Cargo3","GetIn_Cargo4","GetIn_Cargo5","GetIn_Cargo6"};
		class AnimationSources: animationSources
		{
			class AddBenches: AddBenches
			{
				initPhase = 1;
			};
			class AddTread: AddTread
			{
				initPhase = 1;
			};
			class AddCivilian_hide: AddCivilian_hide
			{
				initPhase = 0;
			};
		};
		cost = 7000000;
		class RotorLibHelicopterProperties: RotorLibHelicopterProperties
		{
			defaultCollective = 0.5;
		};
		transportSoldier = 2;
		hideWeaponsCargo = 1;
		cargoProxyIndexes[] = {10,11};
		getInProxyOrder[] = {10,11,1,2,3,4};
		ejectDeadCargo = 0;
		class CargoTurret;
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret{};
			class CargoTurret_01: CargoTurret
			{
				gunnerAction = "passenger_bench_1";
				gunnerCompartments = "Compartment2";
				memoryPointsGetInGunner = "pos cargo RF";
				memoryPointsGetInGunnerDir = "pos cargo RF dir";
				gunnerName = "$STR_A3_TURRETS_BENCH_R1";
				proxyIndex = 1;
				maxElev = 45;
				minElev = -45;
				maxTurn = 95;
				minTurn = -95;
				isPersonTurret = 1;
				ejectDeadGunner = 0;
				class dynamicViewLimits
				{
					CargoTurret_04[] = {-65,95};
				};
				playerPosition = 4;
				soundAttenuationTurret = "";
				disableSoundAttenuation = 1;
				gunnerGetInAction = "GetInHeli_Light_01bench";
			};
			class CargoTurret_02: CargoTurret_01
			{
				gunnerCompartments = "Compartment3";
				memoryPointsGetInGunner = "pos cargo LR";
				memoryPointsGetInGunnerDir = "pos cargo LR dir";
				gunnerName = "$STR_A3_TURRETS_BENCH_L2";
				proxyIndex = 2;
				class dynamicViewLimits
				{
					CargoTurret_03[] = {-65,95};
				};
			};
			class CargoTurret_03: CargoTurret_02
			{
				gunnerCompartments = "Compartment3";
				gunnerName = "$STR_A3_TURRETS_BENCH_L1";
				memoryPointsGetInGunner = "pos cargo LF";
				memoryPointsGetInGunnerDir = "pos cargo LF dir";
				proxyIndex = 3;
				class dynamicViewLimits
				{
					CargoTurret_02[] = {-95,65};
				};
			};
			class CargoTurret_04: CargoTurret_01
			{
				gunnerCompartments = "Compartment2";
				gunnerName = "$STR_A3_TURRETS_BENCH_R2";
				memoryPointsGetInGunner = "pos cargo RR";
				memoryPointsGetInGunnerDir = "pos cargo RR dir";
				proxyIndex = 4;
				class dynamicViewLimits
				{
					CargoTurret_01[] = {-95,65};
				};
			};
		};
		class EventHandlers: EventHandlers{};
	};
	class Heli_Light_01_armed_base_F: Heli_Light_01_base_F
	{
		forceInGarage = 1;
		features = "Randomization: No						<br />Camo selections: 1 - the whole exterior						<br />Script door sources: DoorL_Front_Open, DoorR_Front_Open, DoorL_Back_Open, DoorR_Back_Open						<br />Script animations:  AddDoors, AddBackseats, AddTread, AddTread_Short, BenchL_Up, BenchR_Up, AddHoldingFrame, AddGunHolder, AddCivilian_hide, AddMusicUnit						<br />Executed scripts: None 						<br />Firing from vehicles: No						<br />Slingload: Slingloads up to 500 kg						<br />Cargo proxy indexes: No";
		mapSize = 9.83;
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Heli_Light_01_armed_base_F";
		displayName = "$STR_A3_CfgVehicles_B_heli_light_01_armed";
		icon = "\A3\Air_F\Heli_Light_01\Data\UI\Map_Heli_Light_01_armed_CA.paa";
		picture = "A3\Air_F\Heli_Light_01\Data\UI\Heli_Light_01_armed_CA.paa";
		accuracy = 1;
		hiddenSelectionsTextures[] = {"A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_Blufor_CO.paa"};
		transportSoldier = 0;
		class TransportBackpacks{};
		ejectDeadCargo = 1;
		memoryPointsGetInCargoPrecise[] = {};
		class AnimationSources: AnimationSources
		{
			class AddMusicUnit: AddMusicUnit
			{
				initPhase = 0;
			};
			class AddCivilian_hide: AddCivilian_hide
			{
				initPhase = 0;
			};
			class AddGunHolder
			{
				displayName = "Add gun holder";
				author = "$STR_A3_Bohemia_Interactive";
				source = "user";
				animPeriod = 1e-006;
				initPhase = 1;
				scope = 0;
			};
			class GunL_Revolving
			{
				source = "user";
				animPeriod = 1e-006;
				initPhase = 1;
			};
			class GunR_Revolving: GunL_Revolving{};
			class Muzzle_flash
			{
				source = "ammorandom";
				animPeriod = 1e-006;
				weapon = "M134_minigun";
			};
			class Missiles_revolving
			{
				source = "revolving";
				weapon = "missiles_DAR";
			};
		};
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
				selectionFireAnim = "";
			};
		};
		weapons[] = {"M134_minigun","missiles_DAR"};
		magazines[] = {"5000Rnd_762x51_Belt","24Rnd_missiles"};
		LockDetectionSystem = 8;
		incomingMissileDetectionSystem = 16;
		threat[] = {0.6,0.4,0.1};
		memoryPointGun[] = {"z_gunL_muzzle","z_gunR_muzzle"};
		gunBeg[] = {"z_gunL_muzzle","z_gunR_muzzle"};
		gunEnd[] = {"z_gunL_chamber","z_gunR_chamber"};
		memoryPointLMissile = "Rocket_1";
		memoryPointRMissile = "Rocket_2";
		availableForSupportTypes[] = {"CAS_Heli"};
	};
	class Heli_Light_01_civil_base_F: Heli_Light_01_unarmed_base_F
	{
		features = "Randomization: Yes, 15 skins, disabled by: this setVariable [""BIS_enableRandomization"",false];						<br />Specific skin may be set by: this setVariable [""color"",X]; (the number ranges from 0 to 14)						<br />Camo selections: 1 - the whole exterior						<br />Script door sources: DoorL_Front_Open, DoorR_Front_Open, DoorL_Back_Open, DoorR_Back_Open						<br />Script animations: AddDoors, AddBackseats, AddTread						<br />Executed scripts: \A3\Air_F_Heli\Heli_Light_01\scripts\randomize.sqf 						<br />Firing from vehicles: No						<br />Slingload: Slingloads up to 500 kg						<br />Cargo proxy indexes: 11, 10";
		displayName = "$STR_A3_CfgVehicles_C_Heli_Light_01";
		class Library
		{
			libTextDesc = "$STR_A3_M900_DESC_F0";
		};
		model = "\A3\Air_F\Heli_Light_01\Heli_Light_01_civil_F.p3d";
		icon = "\A3\Air_F\Heli_Light_01\Data\UI\Map_Heli_Light_01_CIV_CA.paa";
		accuracy = 1;
		DLC = "Heli";
		overviewPicture = "\A3\Data_F_Heli\Images\watermarkInfo_page03_ca.paa";
		transportSoldier = 2;
		hideWeaponsCargo = 1;
		cargoProxyIndexes[] = {11,10};
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		class TransportItems
		{
			class _xx_FirstAidKit
			{
				name = "FirstAidKit";
				count = 4;
			};
		};
		class Damage
		{
			tex[] = {};
			mat[] = {"A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_CIV.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_destruct.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_UNIColor.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_UNIColor_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_UNIColor_destruct.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_in.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_glass_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_int.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_int_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_int_destruct.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_detail.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_detail_damage.rvmat","A3\Air_F\Heli_Light_01\Data\Heli_Light_01_detail_destruct.rvmat"};
		};
		class animationSources: animationSources
		{
			class AddMusicUnit: AddMusicUnit
			{
				scope = 0;
			};
			class addFLIR: AddFLIR
			{
				scope = 0;
			};
			class FLIR_HRot: FLIR_HRot
			{
				scope = 0;
			};
			class FLIR_VRot: FLIR_VRot
			{
				scope = 0;
			};
			class AddBenches: AddBenches
			{
				scope = 0;
			};
			class AddHoldingFrame: AddHoldingFrame
			{
				scope = 0;
			};
			class BenchL_Up: BenchL_Up
			{
				scope = 0;
			};
			class BenchR_Up: BenchR_Up
			{
				scope = 0;
			};
			class BenchL_Up_instant: BenchL_Up_instant
			{
				scope = 0;
			};
			class BenchR_Up_instant: BenchR_Up_instant
			{
				scope = 0;
			};
			class AddDoors
			{
				displayName = "Add doors";
				source = "user";
				author = "$STR_A3_Bohemia_Interactive";
				animPeriod = 1e-006;
				initPhase = 1;
				onPhaseChanged = "if ((_this select 1) == 1) then {(_this select 0) enablePersonTurret [[0], false];} else {(_this select 0) enablePersonTurret [[0], true];};";
			};
			class AddBackseats: AddBackseats
			{
				initPhase = 1;
			};
			class AddTread: AddTread
			{
				initPhase = 1;
			};
			class DoorL_Front_Open
			{
				source = "user";
				animPeriod = 0.8;
			};
			class DoorR_Front_Open
			{
				source = "user";
				animPeriod = 0.8;
			};
			class DoorL_Back_Open
			{
				source = "user";
				animPeriod = 0.8;
			};
			class DoorR_Back_Open
			{
				source = "user";
				animPeriod = 0.8;
			};
		};
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
				isPersonTurret = 0;
			};
		};
		class UserActions
		{
			class DoorLF_Open
			{
				userActionID = 50;
				displayName = "$STR_A3_CFGVEHICLES_USERACTIONS_OPENLDOOR0";
				displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
				textToolTip = "$STR_A3_CFGVEHICLES_USERACTIONS_OPENLDOOR0";
				priority = 1.5;
				radius = 1.5;
				radiusView = 0.2;
				showIn3D = 17;
				available = 0;
				position = "action_doorL_front";
				showWindow = 1;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "((this DoorPhase 'DoorL_Front_Open')  ==  0) && (alive this) && ((this animationPhase 'AddDoors')  ==  1) && false";
				statement = "this animatedoor ['DoorL_Front_Open', 1]";
			};
			class DoorRF_Open: DoorLF_Open
			{
				userActionID = 52;
				displayName = "$STR_A3_CFGVEHICLES_USERACTIONS_OPENRDOOR0";
				textToolTip = "$STR_A3_CFGVEHICLES_USERACTIONS_OPENRDOOR0";
				position = "action_doorR_front";
				condition = "((this DoorPhase 'DoorR_Front_Open') == 0) && (alive this) && ((this animationPhase 'AddDoors') == 1) && false";
				statement = "this animatedoor ['DoorR_Front_Open', 1]";
			};
			class DoorLB_Open: DoorLF_Open
			{
				userActionID = 54;
				position = "action_doorL_back";
				condition = "((this DoorPhase 'DoorL_Back_Open') == 0) && (alive this) && ((this animationPhase 'AddDoors') == 1) && false";
				statement = "this animatedoor ['DoorL_Back_Open', 1]";
			};
			class DoorRB_Open: DoorLF_Open
			{
				userActionID = 56;
				displayName = "$STR_A3_CFGVEHICLES_USERACTIONS_OPENRDOOR0";
				textToolTip = "$STR_A3_CFGVEHICLES_USERACTIONS_OPENRDOOR0";
				position = "action_doorR_back";
				condition = "((this DoorPhase 'DoorR_Back_Open') == 0) && (alive this) && ((this animationPhase 'AddDoors') == 1) && false";
				statement = "this animatedoor ['DoorR_Back_Open', 1]";
			};
			class DoorLF_Close: DoorLF_Open
			{
				userActionID = 51;
				displayName = "$STR_A3_CFGVEHICLES_USERACTIONS_CLOSELDOOR0";
				textToolTip = "$STR_A3_CFGVEHICLES_USERACTIONS_CLOSELDOOR0";
				condition = "((this DoorPhase 'DoorL_Front_Open') > 0) && (alive this) && ((this animationPhase 'AddDoors')  ==  1) && false";
				statement = "this animatedoor ['DoorL_Front_Open', 0]";
			};
			class DoorRF_Close: DoorLF_Close
			{
				userActionID = 53;
				displayName = "$STR_A3_CFGVEHICLES_USERACTIONS_CLOSERDOOR0";
				textToolTip = "$STR_A3_CFGVEHICLES_USERACTIONS_CLOSERDOOR0";
				position = "action_doorR_front";
				condition = "((this DoorPhase 'DoorR_Front_Open') > 0) && (alive this) && ((this animationPhase 'AddDoors') == 1) && false";
				statement = "this animatedoor ['DoorR_Front_Open', 0]";
			};
			class DoorLB_Close: DoorLF_Close
			{
				userActionID = 55;
				position = "action_doorL_back";
				condition = "((this DoorPhase 'DoorL_Back_Open') > 0) && (alive this) && ((this animationPhase 'AddDoors') == 1) && false";
				statement = "this animatedoor ['DoorL_Back_Open', 0]";
			};
			class DoorRB_Close: DoorLF_Close
			{
				userActionID = 57;
				displayName = "$STR_A3_CFGVEHICLES_USERACTIONS_CLOSERDOOR0";
				textToolTip = "$STR_A3_CFGVEHICLES_USERACTIONS_CLOSERDOOR0";
				position = "action_doorR_back";
				condition = "((this DoorPhase 'DoorR_Back_Open') > 0) && (alive this) && ((this animationPhase 'AddDoors') == 1) && false";
				statement = "this animatedoor ['DoorR_Back_Open', 0]";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\A3\Air_F\Heli_Light_01\scripts\randomize.sqf""";
		};
		class RotorLibHelicopterProperties: RotorLibHelicopterProperties
		{
			defaultCollective = 0.5;
		};
		class TextureSources
		{
			class blue
			{
				displayName = "Blue";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
				factions[] = {"CIV_F"};
			};
			class red
			{
				displayName = "Red";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
				factions[] = {"CIV_F"};
			};
			class ion
			{
				displayName = "Ion";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};
				factions[] = {"CIV_F"};
			};
			class blueLine
			{
				displayName = "BlueLine";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueLine_co.paa"};
				factions[] = {"CIV_F"};
			};
			class digital
			{
				displayName = "Digital";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
				factions[] = {"CIV_F"};
			};
			class elliptical
			{
				displayName = "Elliptical";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
				factions[] = {"CIV_F"};
			};
			class furious
			{
				displayName = "Furious";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
				factions[] = {"CIV_F"};
			};
			class graywatcher
			{
				displayName = "Graywatcher";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};
				factions[] = {"CIV_F"};
			};
			class jeans
			{
				displayName = "Jeans";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
				factions[] = {"CIV_F"};
			};
			class light
			{
				displayName = "Light";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};
				factions[] = {"CIV_F"};
			};
			class shadow
			{
				displayName = "Shadow";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};
				factions[] = {"CIV_F"};
			};
			class sheriff
			{
				displayName = "Sheriff";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};
				factions[] = {"CIV_F"};
			};
			class speedy
			{
				displayName = "Speedy";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
				factions[] = {"CIV_F"};
			};
			class sunset
			{
				displayName = "Sunset";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
				factions[] = {"CIV_F"};
			};
			class vrana
			{
				displayName = "Vrana";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
				factions[] = {"CIV_F"};
			};
			class wasp
			{
				displayName = "Wasp";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};
				factions[] = {"CIV_F"};
			};
			class wave
			{
				displayName = "Wave";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
				factions[] = {"CIV_F"};
			};
		};
		animationList[] = {"AddDoors",0.9,"AddBackseats",0.9,"AddTread_Short",0.5,"AddTread",0.4};
		textureList[] = {"Red",1,"Blue",1,"Ion",1,"BlueLine",1,"Digital",1,"Elliptical",1,"Furious",1,"Graywatcher",1,"Jeans",1,"Light",1,"Shadow",1,"Sheriff",1,"Speedy",1,"Sunset",1,"Vrana",1,"Wasp",1,"Wave",1};
	};
	class B_Heli_Light_01_armed_F: Heli_Light_01_armed_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "B_Heli_Light_01_armed_F";
		scope = 2;
		side = 1;
		faction = "BLU_F";
		crew = "B_Helipilot_F";
		cost = 1000000;
	};
	class C_Heli_Light_01_civil_F: Heli_Light_01_civil_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Heli_Light_01_civil_F";
		scope = 2;
		crew = "C_man_1_1_F";
		hiddenSelectionsTextures[] = {"A3\Air_f\Heli_Light_01\Data\Heli_Light_01_ext_co.paa"};
	};
	class C_Heli_light_01_blue_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_blue_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Blue",1};
	};
	class C_Heli_light_01_red_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_red_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Red",1};
	};
	class C_Heli_light_01_ion_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_ion_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"ION",1};
	};
	class C_Heli_light_01_blueLine_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_blueLine_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"BlueLine",1};
	};
	class C_Heli_light_01_digital_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_digital_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Digital",1};
	};
	class C_Heli_light_01_elliptical_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_elliptical_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Elliptical",1};
	};
	class C_Heli_light_01_furious_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_furious_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Furious",1};
	};
	class C_Heli_light_01_graywatcher_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_graywatcher_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"GrayWatcher",1};
	};
	class C_Heli_light_01_jeans_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_jeans_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Jeans",1};
	};
	class C_Heli_light_01_light_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_light_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Light",1};
	};
	class C_Heli_light_01_shadow_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_shadow_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Shadow",1};
	};
	class C_Heli_light_01_sheriff_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_sheriff_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Sheriff",1};
	};
	class C_Heli_light_01_speedy_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_speedy_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Speedy",1};
	};
	class C_Heli_light_01_sunset_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_sunset_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Sunset",1};
	};
	class C_Heli_light_01_vrana_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_vrana_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"VRANA",1};
	};
	class C_Heli_light_01_wasp_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_wasp_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"wasp",1};
	};
	class C_Heli_light_01_wave_F: C_Heli_Light_01_civil_F
	{
		displayName = "$STR_A3_C_Heli_light_01_wave_F0";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		textureList[] = {"Wave",1};
	};
	class C_Heli_light_01_stripped_F: C_Heli_Light_01_civil_F
	{
		displayName = "M-900 (Stripped)";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		animationList[] = {"AddDoors",0,"AddBenches",0,"AddBackseats",0,"BenchL_Up_instant",0,"BenchR_Up_instant",0,"AddHoldingFrame",0,"AddTread_Short",0,"AddTread",0};
	};
	class C_Heli_light_01_luxe_F: C_Heli_Light_01_civil_F
	{
		displayName = "M-900 (Luxe)";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		animationList[] = {"AddDoors",1,"AddBenches",0,"AddBackseats",1,"BenchL_Up_instant",0,"BenchR_Up_instant",0,"AddHoldingFrame",1,"AddTread_Short",0,"AddTread",1};
	};
	class B_Heli_Light_01_stripped_F: B_Heli_Light_01_F
	{
		displayName = "MH-9 Hummingbird (Stripped)";
		scope = 1;
		scopeCurator = 0;
		author = "$STR_A3_Bohemia_Interactive";
		animationList[] = {"AddDoors",0,"AddBenches",0,"AddBackseats",0,"BenchL_Up_instant",0,"BenchR_Up_instant",0,"AddHoldingFrame",0,"AddTread_Short",0,"AddTread",0};
	};
};
//};
