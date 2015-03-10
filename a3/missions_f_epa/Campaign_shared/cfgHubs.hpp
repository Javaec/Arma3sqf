//per-hub specific data
class Hubs
{

	//template data
	class DefHubA
	{
		player = "Cpl. Ben Kerry";			//player character name
		center[] = {3142,21980,0};			//center of the hub

		ambientCombat = 1;

		date[] = {};		//[] = automatic calculation
		overcast = -1;		//-1 = automatic interpolation
		fog = -1;		//-1 = automatic interpolation
		rain = -1;
		lightnings = -1;
		wind[] = {};

		kbWelcome = "";
		quote[] = {"\A3\Missions_F_EPA\video\A_hub_quotation.ogv","STR_A3_Campaign_Quote_13"};

		class ZoneRestriction
		{
			center[] 	= {};
			radius1		= 100;
			radius2		= 120;

			class Notifications
			{
				fail1 	  = "ZR_AccessProhibited1";
				fail2 	  = "ZR_AccessProhibited2";

				mission1  = "ZR_StartOperation1";
				mission2  = "ExfilCommencing";

				skirmish1 = "ZR_SkirmishEntering1";
				skirmish2 = "";

				briefing1 = "ZR_AttendBriefing1";
				briefing2 = "";
			};

		};

		class Diary
		{
			title = $STR_A3_category_welcome;
			desc  = $STR_A3_A_hub_Briefing_A_hub01;
		};

		class Tasks
		{
			class BIS_ReportIn
			{
				title  = $STR_A3_A_hub_Task_BIS_ReportIn_Title;
				desc   = $STR_A3_A_hub_Task_BIS_ReportIn_Description;
				marker = $STR_A3_A_hub_Task_BIS_ReportIn_Marker;
			};

			//optional
			class BIS_GoArmoryOptional
			{
				title  = $STR_A3_A_hub_Task_BIS_Rearm_Title;
				desc   = $STR_A3_C_in1_taskBIS_goArmory_desc;
				marker = $STR_A3_C_in1_taskBIS_goArmory_mrkr;
			};

			//forced
			class BIS_GoArmory
			{
				title  = $STR_A3_C_in1_taskBIS_goArmory_title;
				desc   = $STR_A3_C_in1_taskBIS_goArmory_desc;
				marker = $STR_A3_C_in1_taskBIS_goArmory_mrkr;
			};

			class BIS_Assemble
			{
				title  = $STR_A3_A_hub_Task_BIS_Assemble_Title;
				desc   = $STR_A3_A_hub_Task_BIS_Assemble_Description;
				marker = $STR_A3_A_hub_Task_BIS_Assemble_Marker;
			};
			class BIS_Patrol
			{
				title  = $STR_A3_A_hub_Task_BIS_Patrol_Title;
				desc   = $STR_A3_A_hub_Task_BIS_Patrol_Description;
				marker = $STR_A3_A_hub_Task_BIS_Patrol_Marker;
			};
			class BIS_AttendDebriefing
			{
				title  = "";
				desc   = "";
				marker = "";
			};
		};

		class IntroBriefing
		{
			active = 0;

			class AfterCutscene
			{
				date[] = {2035,7,20,01,00};
				position = "BIS_debriefingPosAfter";
				overcast = 0.3;
				rain = -1;
				lightnings = -1;
				wind[] = {};

				quote[] = {"\A3\Missions_F_EPB\video\B_Hub01_10_days_later.ogv","STR_A3_B_hub01_Few_days_later"};
			};

			class Map
			{
				object = "";
				texture = "";
			};

			class SpecialCharacters
			{
				class Player
				{
					unitName = "BIS_inf";
					position = "BIS_hubBriefing_player";
				};
				class Speaker
				{
					unitName = "BIS_guerLeader";
					position = "BIS_hubBriefing";
				};
				class HotSeat
				{
					unitName = "";
					position = "BIS_hubBriefing_hotSeat";
				};
				class VIP1
				{
					unitName = "BIS_recon";
					position = "BIS_hubBriefing_VIP1";
				};
				class VIP2
				{
					unitName = "";
					position = "BIS_hubBriefing_VIP2";
				};
				class VIP3
				{
					unitName = "";
					position = "BIS_hubBriefing_VIP3";
				};
			};

			class Cutscene
			{
				actor	= "BIS_guerLeader";
				weapon	= "";
				timeout = 300;

				prefix 	= "b_hub_010_b_hub_briefing_STA_";

				timekeys[] =
				{
		                        4.987710,
		                        9.945873,
		                        16.530816,
		                	23.013810,
		                        29.869184,
		                        34.251701,
		                        41.236100,
		                        48.353810,
		                        57.857959,
		                        64.718186,
		                        72.153832,
		                        76.564717,
		                        86.836576,
		                        92.608163
				};
				topic 	= "010_b_hub01_briefing";
				bikb 	= "\A3\Missions_F_EPB\kb\B_hub\b_hub_010_b_hub_briefing.bikb";
				offset 	= 1.0;
				anim 	= "Acts_B_hub01_briefing";
				last	= 2.474649;			//length of last sentence, used for blackOut timing
			};
		};

		class 3dTweaks
		{
		};

		//modules
		class QuickStart
		{

			trigger = "BIS_Whiteboard";
		};

		class FullStart
		{
		};

		class HubBriefing
		{

			walkDistanceShort = 6;
			walkDistanceLong  = 10;

			class Map
			{
				object = "";
				texture = "";

				parent = "";
				offset[] = {0,0,0};
				dir = 0;
			};
		};

		class Skirmish
		{
		};

		class ShootingRange
		{
		};

		class HubIntro
		{

			playWelcome = 1;

			topic 	= "120_welcome_a_hub01";
			bikb 	= "\a3\missions_f_epa\kb\a_hub\a_hub_120_welcome_a_hub01.bikb";
			offset  = -0.3;
			last	= -1;

			class Guide
			{
				unit       = "BIS_deltaLead";
				position[] = {3305.01895,2902.73141,0};
				direction  = 180;
				animation  = "acts_welcomeonhub01_aiwalk";
				prefix     = "a_hub_120_welcome_a_hub01_DEL_";
				timekeys[] =
				{
					01.670,
					03.470,
					06.800,
					10.470,
					16.730,
					21.400,
					24.070,
					28.930,
					33.270,
					40.070,
					46.130,
					49.000
				};

				class AfterCutscene
				{
					position[] = {3298.28,2918.59,0.00143433};
					direction = 153.153;
					walkTarget = "BIS_missionGiver_heliport";
					watchTarget = "BIS_bravoLead";
				};
			};

			class Player
			{
				unit       = "BIS_inf";
				position[] = {3305.41694,2901.53407,0.00};
				direction  = 335;
				animation  = "acts_welcomeonhub01_playerwalk";
				prefix 	   = "";
				timekeys[] = {};
			};
		};
	};

	class DefHubB:DefHubA
	{
		ambientCombat = 0;

		class ZoneRestriction:ZoneRestriction
		{
			radius1		= 85;
			radius2		= 125;
		};

		class Tasks:Tasks
		{
			class BIS_ReportIn
			{
				title  = $STR_A3_b_hub_task_reportin_title;
				desc   = $STR_A3_b_hub_task_reportin_desc;
				marker = $STR_A3_b_hub_task_reportin_marker;
			};
			class BIS_Assemble
			{
				title  = $STR_A3_b_hub_task_assemble_title;
				desc   = $STR_A3_b_hub_task_assemble_desc;
				marker = $STR_A3_b_hub_task_assemble_marker;
			};
			class BIS_Patrol
			{
				title  = $STR_A3_b_hub_task_patrol_title;
				desc   = $STR_A3_b_hub_task_patrol_desc;
				marker = "";
			};
			class BIS_AttendDebriefing
			{
				title  = $STR_A3_b_hub_task_debriefing_title;
				desc   = $STR_A3_b_hub_task_debriefing_desc;
				marker = $STR_A3_b_hub_task_debriefing_marker;
			};
		};

		class HubBriefing:HubBriefing
		{
			class Map:Map
			{
				object = "BIS_map";
				texture = "";

				parent = "BIS_briefingTable";
				offset[] = {0,-0.58,0.857};
				dir = 95;
			};
		};

	};

	class DefHubC:DefHubA
	{
		ambientCombat = 0;

		class QuickStart:QuickStart
		{
		};

		class FullStart:FullStart
		{
		};

		class HubBriefing:HubBriefing
		{
			walkDistanceShort = 4;
			walkDistanceLong  = 4;

			class Map:Map
			{
				object = "";
				texture = "";

				parent = "";
				offset[] = {0,0,0};
				dir = 0;
			};
		};

		class Skirmish
		{
		};

		class ShootingRange
		{
		};

		class HubIntro:HubIntro
		{
			playWelcome = 0;
		};
	};

	/*-------------------------------------------------------------------------------------------------

		STAGE A

	--------------------------------------------------------------------------------------------------*/

	class A_hub01:DefHubA
	{
		center[] = {3296,2944,0};

		date[] = {2035,7,7,08,25};
		overcast = 0.60;
		rain = 0;
		fog = 0.1;

		kbWelcome = "120_welcome_a_hub01";
		quote[] = {"\A3\Missions_F_EPA\video\A_hub_quotation.ogv","STR_A3_Campaign_Quote_13"};

		class Diary:Diary
		{
			desc = $STR_A3_A_hub_Briefing_A_hub01;
		};

		class 3dTweaks
		{
			_0[] = {-1,{3296,2944,0},"CLOSE","house",120};
			_1[] = {7,{3291,2913,0},"DESTROY"};			//south watch-tower (near cars)
			_2[] = {7,{3273,2950,0},"DESTROY"};			//main 1-stock office building
			_3[] = {7,{3315,2945,0},"DESTROY","house",20};	//2 small buildings, north of the center
		};

		class HubIntro:HubIntro
		{
		};
	};

	//destroyed version of A_hub01
	class A_hub02:A_hub01
	{
		date[] = {2035,7,7,23,40};
		overcast = 0.95;
		//fog[] = {0.99,0.025,250};
		fog = 0;
		rain = 1;
		lightnings = 1;
		wind[] = {0.3, 0.3};

		kbWelcome = "140_welcome_a_hub02";
		quote[] = {"\A3\Missions_F_EPA\video\A_in2_two_hours_later.ogv","STR_A3_a_hub_misc_osd_time_elapsed_2h"};

		class Diary:Diary
		{
			desc = $STR_A3_A_hub_Briefing_A_hub02;
		};

		class 3dTweaks
		{
			_0[] = {-1,{3296,2944,0},"CLOSE","house",120};
			_1[] = {7,{3291,2913,0},"DESTROY"};			//south watch-tower (near cars)
			_2[] = {7,{3273,2950,0},"DESTROY"};			//main 1-stock office building
			_3[] = {7,{3315,2945,0},"DESTROY","house",20};		//2 small buildings, north of the center
		};

		class HubIntro:HubIntro
		{
			topic   = "140_welcome_a_hub02";
			bikb    = "\a3\Missions_F_EPA\kb\A_hub\a_hub_140_welcome_a_hub02.bikb";
			offset 	= -0.3;
			last	= -1;

			class Guide:Guide
			{
				unit 	   = "BIS_deltaLead";
				position[] = {3301.41062,2911.66807,0};
				direction  = 180;
				animation  = "acts_welcomeonhub02_aiwalk";
				prefix 	   = "a_hub_140_welcome_a_hub02_DEL_";
				timekeys[] =
				{
					01.829,
					05.015,
					06.953,
					10.402,
					15.122,
					17.674,
					22.116,
					25.043,
					29.836,
					33.518
				};
			};

			class Player:Player
			{
				unit       = "BIS_inf";
				position[] = {3302.10699,2910.53617,0.00};
				direction  = 323.0;
				animation  = "acts_welcomeonhub02_playerwalk";
				prefix 	   = "";
				timekeys[] = {};
			};
		};
	};

	/*--------------------------------------------------------------------------------------------------

		STAGE B

	--------------------------------------------------------------------------------------------------*/

	class B_hub01:DefHubB
	{
		date[] = {2035,7,10,6,45};

		center[] = {3142,21980,0};

		overcast = 0.3;
		//fog[] = {0.5,0.05,20};

		quote[] = {"\A3\Missions_F_EPB\video\B_Hub01_quotation.ogv","str_a3_campaign_quote_31"};

		class Diary:Diary
		{
			desc = $STR_A3_B_hub01_briefing;
		};

		class IntroBriefing:IntroBriefing
		{
			active = 1;

			class AfterCutscene:AfterCutscene
			{
				date[] = {2035,7,20,01,00};
				position = "BIS_debriefingPosAfter";
				overcast = 0.3;
				fog[] = {0.5,0.05,20};
			};

			class Map:Map
			{
				object = "";
				texture = "";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Player:Player
				{
					unitName = "BIS_inf";
					position = "BIS_hubBriefing_player";
				};
				class Speaker:Speaker
				{
					unitName = "BIS_guerLeader";
					position = "BIS_debriefing";
				};
				class HotSeat:HotSeat
				{
					unitName = "";
					position = "BIS_hubBriefing_hotSeat";
				};
				class VIP1:VIP1
				{
					unitName = "BIS_recon";
					position = "BIS_hubBriefing_VIP1";
				};
				class VIP2:VIP2
				{
					unitName = "";
					position = "BIS_hubBriefing_VIP2";
				};
				class VIP3:VIP3
				{
					unitName = "";
					position = "BIS_hubBriefing_VIP3";
				};
			};

			class Cutscene:Cutscene
			{
				actor	= "BIS_guerLeader";
				weapon	= "";
				timeout = 300;

				prefix 	= "b_hub_010_b_hub_briefing_STA_";

				timekeys[] =
				{
		                        4.987710,
		                        9.945873,
		                        16.530816,
		                	23.013810,
		                        29.869184,
		                        34.251701,
		                        41.236100,
					48.353,
					53.626,
					57.753,
					64.710,
		                        76.564717,
		                        86.836576,
		                        92.608163
				};
				topic 	= "010_b_hub01_briefing";
				bikb 	= "\A3\Missions_F_EPB\kb\B_hub\b_hub_010_b_hub_briefing.bikb";
				offset 	= 1.0;
				anim 	= "Acts_B_hub01_briefing";
				last	= 7.5;			//length of last sentence, used for blackOut timing
			};
		};

		class 3dTweaks:3dTweaks
		{
			_0[] = {-1,{3156.5,21985.1,-0.261333},"OPEN"};
			_1[] = {-1,{3126.97,21990.3,0.345885},"OPEN"};
		};

		class HubIntro:HubIntro
		{
			playWelcome = 1;

			topic 	   = "401_welcome_b_hub01";
			bikb 	   = "\a3\missions_f_epb\kb\b_hub\b_hub_401_welcome_b_hub01.bikb";
			offset 	   = 0;
			last	   = 7.0;

			class Guide:Guide
			{
				unit       = "BIS_recon";
				position[] = {3164.99731,21950.7705,0};
				direction  = 305;
				animation  = "acts_welcomeonhub03_aiwalk_1";
				prefix 	   = "b_hub_401_welcome_b_hub01_mil_";
				timekeys[] =
				{
					02.790,
					05.515,
					11.993,
					14.560,
					20.410,
					26.231
				};

				class AfterCutscene:AfterCutscene
				{
					position[]  = {};
					direction   = 0;
					walkTarget  = "BIS_guerLeader";
					watchTarget = "BIS_guerLeader";
				};
			};

			class Player:Player
			{
				unit       = "BIS_inf";
				position[] = {3165.88594,21949.58500,0};
				direction  = 305;
				animation  = "acts_welcomeonhub03_playerwalk_1";
				prefix 	   = "b_hub_401_welcome_b_hub01_ker_";
				timekeys[] =
				{
					01.594,
					08.878,
					29.498
				};
			};
		};
	};

	class B_hub02:DefHubB
	{
		center[] = {5396.19,17911.8,0.00140381};

		quote[] = {};

		class Diary:Diary
		{
			desc = $STR_A3_B_hub02_briefing;
		};

		class 3dTweaks:3dTweaks
		{
			_0[] = {-1,{5396.19,17911.8,0.00140381},"OPEN","house",100};
			_1[] = {-1,{5365.98,17905.3,0.00169373},"CLOSE"};
		};

		/*
		class ShootingRange:ShootingRange
		{
			class Positions
			{
				_0[] = {"DOWN"};
				_1[] = {"DOWN"};
				_2[] = {"MIDDLE","UP"};
				_3[] = {"MIDDLE","UP"};
				_4[] = {"MIDDLE","UP"};
			};
		};
		*/

		class HubBriefing:HubBriefing
		{
		};

		class HubIntro:HubIntro
		{
			playWelcome = 1;

			topic 	   = "402_welcome_b_hub02";
			bikb 	   = "\a3\missions_f_epb\kb\b_hub\b_hub_402_welcome_b_hub02.bikb";
			offset 	   = 0;
			last	   = 5.6;

			class Guide:Guide
			{
				unit       = "BIS_GuerLeader";
				position[] = {5442.86182,17923.71875,0};
				direction  = 270;
				animation  = "acts_welcomeonhub04_aiwalk_1";
				prefix 	   = "b_hub_402_welcome_b_hub02_sta_";
				timekeys[] =
				{
					02.790,
					05.515,
					11.993,
					14.560,
					20.410,
					26.231
				};

				class AfterCutscene:AfterCutscene
				{
					position[]  = {};
					direction   = 0;
					walkTarget  = "BIS_briefingTable";
					watchTarget = "BIS_briefingTable";
				};
			};

			class Player:Player
			{
				unit       = "BIS_inf";
				position[] = {5444.05664,17923.66016,0};
				direction  = 270;
				animation  = "acts_welcomeonhub04_playerwalk_1";
				prefix 	   = "";
				timekeys[] = {};
			};
		};
	};

	class B_hub03:DefHubB
	{
		center[] = {8236.57,14869.1,0};

		quote[] = {};

		class Diary:Diary
		{
			desc = $STR_A3_B_hub03_briefing;
		};

		class 3dTweaks
		{
			_0[] = {-1,{8198.4,14888.1,0.0388947},"DELETE"};		//metal sheck
			_1[] = {-1,{8262.57,14847.8,0.00144958},"OPEN"};		//stone house with closed doors
		};

		class HubIntro:HubIntro
		{
			playWelcome = 1;

			topic 	   = "403_welcome_b_hub03";
			bikb 	   = "\a3\missions_f_epb\kb\b_hub\b_hub_403_welcome_b_hub03.bikb";
			offset 	   = 0;
			last	   = 2;

			class Guide:Guide
			{
				unit       = "BIS_nikos";
				position[] = {8275.19,14849.4,0.00138855};
				direction  = 298.68;
				animation  = "acts_welcomeonhub05_aiwalk_1";
				prefix 	   = "b_hub_403_welcome_b_hub03_nik_";
				timekeys[] =
				{
					02.487,
		                	06.633,
		                	12.225,
		                	15.438,
		                	20.878,
		                	24.749,
		                	31.233,
		                	40.354,
		                	43.666
				};

				class AfterCutscene:AfterCutscene
				{
					position[]  = {};
					direction   = 0;
					walkTarget  = "BIS_briefingTable";
					watchTarget = "BIS_briefingTable";
				};
			};

			class Player:Player
			{
				unit       = "BIS_inf";
				position[] = {8276.27,14849,0.00135803};
				direction  =  298.68;
				animation  = "acts_welcomeonhub05_playerwalk_1";
				prefix 	   = "";
				timekeys[] = {};
			};
		};

		class HubBriefing:HubBriefing
		{
			class Map:Map
			{
				texture = "";
				offset[] = {-0.15,0.1,0.857};
				dir = 185;
			};
		};
	};

	/*--------------------------------------------------------------------------------------------------

		STAGE C

	--------------------------------------------------------------------------------------------------*/

	class C_in1:DefHubC
	{
		player = "Cpl. Ben Kerry";			//player character name
		center[] = {2168,5610,0};			//center of the hub

		date[] = {2035,8,8,6,50};
		overcast = 0.65;
		fog = 0.003;
		rain = 0;
		lightnings = 0;
		wind[] = {};

		kbWelcome = "";
		quote[] = {"\A3\Missions_F_EPC\video\C_in1_quotation.ogv","STR_A3_B_in2_12_hours_later"};

		class ZoneRestriction:ZoneRestriction
		{
			center[] 	= {2168,5610,0};
			radius1		= 45;
			radius2		= 70;
		};

		class Diary:Diary
		{
			title = $STR_A3_category_welcome;
			desc  = $STR_A3_C_in1_briefingSituation;
		};

		class Tasks:Tasks
		{
			class BIS_ReportIn
			{
				title  = $STR_A3_C_in1_taskBIS_reportIn_title;
				desc   = $STR_A3_C_in1_taskBIS_reportIn_desc;
				marker = $STR_A3_C_in1_taskBIS_reportIn_mrkr;
			};
			class BIS_Assemble
			{
				title  = $STR_A3_C_in1_taskBIS_assemble_title;
				desc   = $STR_A3_C_in1_taskBIS_assemble_desc;
				marker = $STR_A3_C_in1_taskBIS_assemble_mrkr;
			};
		};

		class 3dTweaks
		{
			_0[] = {-1,{2159.22,5609,0.603114},"OPEN","house",10,1,"'BIS_GoArmory' call BIS_fnc_taskExists"};
			_1[] = {-1,{2196.64,5590.12,0.618455},"OPEN","house",5};
		};
	};
};