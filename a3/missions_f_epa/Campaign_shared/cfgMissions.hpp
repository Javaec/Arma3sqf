//per-hubmission specific data
class Missions
{
	/*--------------------------------------------------------------------------------------------------

		TEMPLATES

	--------------------------------------------------------------------------------------------------*/

	class DefMission
	{
	};

	//MODULE: QUICKSTART
	class DefQuickStart
	{
		position[] = {1000,1000,0};			//mission placement on the map
	};

	//MODULE: FULLSTART
	class DefFullStart
	{
		trigger = "BIS_AlphaLead";

		class Tasks
		{
			name 	= "auto";
			desc 	= "auto";
			marker 	= "auto";
		};

		class Conversations
		{
			class MissionIntro
			{
				kb = "";

				lines[] =
				{
					{"trigger","Placeholder intro conversation line #1."},
					{"trigger","Placeholder intro conversation line #2."},
					{"trigger","Placeholder intro conversation line #3."}
				};
			};
			class MissionChosen
			{
				kb = "";

				lines[] =
				{
					{"player","I'm ready, sir."},
					{"trigger","Copy that, let's go speak to Captain Miller."}
				};
			};
			class MissionDenied
			{
				kb = "";

				lines[] =
				{
					{"player","Not ready just yet, sir."},
					{"trigger","Okay, well, don't wait too long. Those guys need our help."}
				};
			};
		};
	};

	//MODULE: SKIRMISH
	class DefSkirmish
	{
		class Distances
		{
			warning 	= 100;		//distance where player get the warning about triggering skirmish
			trigger 	= 120;		//distance where skirmish triggers
			portFromHub 	= 200;		//how far from hub will player teleport when going from hub to skirmish
			portToHub 	= 75;		//how far from hub will player teleport when going back from skirmish to hub
		};

		class Tasks
		{
			name 	= "Start Patrol";
			desc 	= "[Patrol Description]";
			marker 	= "Start Patrol";
		};

		class Vehicles
		{
			//vehicle for single player
			class Player
			{
				name = "BIS_SkirmishVeh1";
				type = "B_Quadbike_01_F";
				cust = "";
			};

			//vehicle for player & squad
			class Squad
			{
				name = "";
				type = "B_G_Offroad_01_F";
				cust = "B_G_Offroad_01_F_1";
			};
		};

		/*
		1: getPos player
		2: getDir player
		3: compile format["{%1,%2,0},%3",_debug1 select 0,_debug1 select 1,_debug2];
		*/
		spawnpoints[] =
		{
			{{3545.64,2832.48,0},71.9986},		//road, east of Maxwell
			{{3274.2,2642.25,0},256.909},		//road, south of Maxwell
			{{3370.27,3153.08,0},26.3868},		//grass, north-east of Maxwell
			{{3247.33,3201.13,0},343.228}		//grass, north-west of Maxwell
		};
	};

	class DefSimpleStart
	{
		triggerCenter[] = {};
		triggerRadius	= 4;
	};

	//MODULE: SKIRMISH
	class DefHubBriefingA
	{
		center = "BIS_briefingCenter";
		skipTime = 1;

		class XtraCharacters
		{
			count = 0;
			classes[] = {};
		};

		class Player
		{
			position = "BIS_hubBriefing_player";
		};

		class SpecialCharacters
		{
			class Speaker
			{
				unitName = "BIS_recon";
				position = "BIS_hubBriefing_A_m01";
			};
			class HotSeat
			{
				unitName = "";
				position = "BIS_hubBriefing_hotSeat";
			};
			class VIP1
			{
				unitName = "";
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

		class Armory
		{
			playIntro 	= 0;
			teleportTo 	= 0;
			blackOut 	= 0;
			autoRearm 	= 0;

			unitName = "BIS_armory";
			position = "BIS_armory_player";

			triggerClose 	   = 2.5;			//triggers required gear rearm
			triggerLong  	   = 9.0;			//triggers required gear list
			triggerHeightDelta = 1.0;
		};

		class AssemblePoint
		{
			position = "BIS_exit1";

			class Vehicle1
			{
				vehicleClass = "";
				position = "BIS_vehicleExit1";
			};
			class Vehicle2
			{
				vehicleClass = "";
				position = "BIS_vehicleExit2";
			};
			class Vehicle3
			{
				vehicleClass = "";
				position = "BIS_vehicleExit3";
			};
		};

		class Whiteboard
		{
			object = "BIS_whiteboard";
			texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_m01_CO.paa";
		};

		class Conversations
		{
			class MissionBriefing
			{
				kb = "";

				lines[] =
				{
					{"speaker","Hours ago, enemy forces launched a sudden attack from the north."},
					{"speaker","They're steadily advancing south, driving us into the sea."},
					{"speaker","Bravo has been pinned down by a swift assault on their position; now, they're trapped inside the village and are in need of support."},
					{"speaker","We're stretched thin, and need to make a stand."},
					{"speaker","An advanced element of your team has take up a position in the valley. Regroup and report in, Alpha."}
				};

				gestures[] =
				{
				};
			};

			class ArmoryIntro
			{
				kb = "340_armory_intro";

				lines[] =
				{
					{"armorer","Alright, so that's you all set, Kerry."},
					{"armorer","It's the best kit we've got for the task at hand."},
					{"armorer","If you want to adjust your loadout, feel free. Your stuff is in the crate over there."}
				};

				gestures[] =
				{
				};
			};

			class RecommendedGearApplied
			{
				kb = "340_armory_intro";

				lines[] =
				{
					{"armorer","Alright, so that's you all set, Kerry."},
					{"armorer","It's the best kit we've got for the task at hand."},
					{"armorer","If you want to adjust your loadout, feel free. Your stuff is in the crate over there."}
				};

				gestures[] =
				{
				};
			};
		};

		class Cutscene
		{
			actor	= "BIS_recon";
			weapon	= "";
			timeout = 0;

			prefix 	= "a_hub_030_a_m01_briefing_MIL_";

			timekeys[] =
			{
				03.797642,
				12.746984,
				26.320317,
				33.381655,
				42.466984,
				47.386984,
				53.786984,
				60.242993,
				64.669660,
				77.240317,
				86.208322
			};
			topic 	= "030_a_m01_briefing";
			bikb 	= "\a3\Missions_F_EPA\kb\A_hub\a_hub_030_a_m01_briefing.bikb";
			offset 	= 1.0;
			anim 	= "acts_a_m01_briefing";
			last	= 2.474649;			//length of last sentence, used for blackOut timing
		};
	};

	class DefHubBriefingB:DefHubBriefingA
	{
		class SpecialCharacters:SpecialCharacters
		{
			class Speaker:Speaker
			{
				unitName = "BIS_guerLeader";
				position = "BIS_HubBriefing";
			};

			class HotSeat:HotSeat
			{
				unitName = "";
			};
			class VIP1:VIP1
			{
				unitName = "";
			};
			class VIP2:VIP2
			{
				unitName = "";
			};
			class VIP3:VIP3
			{
				unitName = "";
			};
		};

		class Cutscene:Cutscene
		{
			actor 	= "BIS_guerLeader";
			timeout = 300;
		};

		class Whiteboard:Whiteboard
		{
			object = "BIS_map";
			texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m01_CO.paa";
		};
	};

	class DefHubBriefingB_hub01:DefHubBriefingB
	{
		class Armory:Armory
		{
			triggerClose 	   = 1.5;			//triggers required gear rearm
			triggerLong  	   = 2.8;			//triggers required gear list
			triggerHeightDelta = 0.2;
		};

	};
	class DefHubBriefingB_hub02:DefHubBriefingB
	{
		class Armory:Armory
		{
			triggerClose 	   = 1.5;			//triggers required gear rearm
			triggerLong  	   = 5.5;			//triggers required gear list
			triggerHeightDelta = 0.5;
		};
	};
	class DefHubBriefingB_hub03:DefHubBriefingB
	{
		class Armory:Armory
		{
			triggerClose 	   = 1.5;			//triggers required gear rearm
			triggerLong  	   = 4.0;			//triggers required gear list
			triggerHeightDelta = 0.2;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		STAGE A

	--------------------------------------------------------------------------------------------------*/

	//AP Mines
	class A_m01:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {3015,3199,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_AlphaLead";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "000_a_m01_intro";

					lines[] =
					{
						{"trigger","Kerry, good to see you, man, this shit's a mess..."},
						{"trigger","Anyway, this 'Captain Miller' wants to speak to us."},
						{"trigger","C'mon, let's find out what's going on. You coming?"}
					};
				};
			};
		};

		class HubBriefing:DefHubBriefingA
		{
			class XtraCharacters
			{
				count = 10;
				classes[] = {};
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_hubBriefing_A_m01";
				};
				class HotSeat:HotSeat
				{
					unitName = "BIS_deltaLead";
				};
				class VIP1:VIP1
				{
					unitName = "BIS_alphaLead";
				};
				class VIP2:VIP2
				{
					unitName = "BIS_bravoLead";
				};
				class VIP3:VIP3
				{
					unitName = "BIS_charlieLead";
				};
			};

			class Armory:Armory
			{
				playIntro = 0;
			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_m01_CO.paa";
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb = "030_a_m01_briefing";

					lines[] =
					{
						{"speaker","We're still piecing together what happened this morning, but one thing's clear: Altis Armed Forces on Stratis are hostile."},
						{"speaker","Right now, long-range comms are down, Commander MacKinnon is confirmed KIA, and whatever equipment we may have had is either halfway-scrapped or wrecked entirely."},
						{"speaker","We need to organise. Rearm. Make a plan. Take back the initiative."},
						{"speaker","We'll split up. I've nominated three men - Conway, Lacey and Mitchell - to each lead a squad, Alpha through Charlie."},
						{"speaker","My own team will operate as Delta under the command of Lt. James."},
						{"speaker","Now, our first priority is situational awareness. Half our force will move out on recon."},
						{"speaker","Another squad will dig in here and take stock of whatever equipment we've got at hand."},
						{"speaker","That just leaves our most pressing concern."},
						{"speaker","The AAF managed to bring down a Blackfoot. It crash-landed dangerously close to our position. There's a burning wreck and smoke-stack a mile high - that's no good."},
						{"speaker","Alpha will secure the crash site, make a sweep for survivors, and get rid of it. Questions?"},
						{"speaker","Alright. Let's move out, gentlemen."}
					};

					gestures[] =
					{
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
					kb = "340_armory_intro";

					lines[] =
					{
						{"speaker","Alright, so that's you all set, Kerry."},
						{"speaker","It's the best kit we've got for the task at hand."},
						{"speaker","If you want to adjust your loadout, feel free. Your stuff is in the crate over there."}
					};

					gestures[] =
					{
					};
				};
			};
		};
	};

	//Infantry
	class A_m02:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {2051,2749,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_CharlieLead";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "005_a_m02_intro";

					lines[] =
					{
						{"trigger","Kerry, did you hear? Bravo ran into some trouble."},
						{"trigger","Sergeant Lacey's pinned down in some village. You ready to go?"}
					};
				};
			};
		};

		class HubBriefing:DefHubBriefingA
		{
			class Cutscene:Cutscene
			{
				prefix = "a_hub_035_a_m02_briefing_MIL_";

				timekeys[] =
				{
					0.000000,
					5.055782,
					10.904308,
					14.039002,
					19.193832,
					25.846349,
					30.577415,
					33.691791
				};
				topic 	= "035_a_m02_briefing";
				bikb 	= "\a3\Missions_F_EPA\kb\A_hub\a_hub_035_a_m02_briefing.bikb";
				offset 	= 1.5;
				anim 	= "acts_a_m02_briefing";
				last	= 2.43;			//length of last sentence, used for blackOut timing
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_HubBriefing_A_m02";
				};
				class HotSeat:HotSeat
				{
					unitName = "BIS_alphaLead";
				};
			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_m02_CO.paa";
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb = "035_a_m02_briefing";

					lines[] =
					{
						{"speaker","As you're probably aware, we've been scouting positions to our north, keeping tabs on enemy movement."},
						{"speaker","Unfortunately, Bravo ran into trouble, taking contact in a village a little to the west of our position."},
						{"speaker","They're pinned down and need our support, gentlemen."},
						{"speaker","Now, an advanced element has already set up a position nearby to get eyes on the situation."},
						{"speaker","AAF units have mobilized along the valley leading to the village. More support is no doubt en route."},
						{"speaker","Alpha will approach from the east. Use the high ground and forest cover to your advantage."},
						{"speaker","Clear the village and get our boys out of there."},
						{"speaker","Okay. Regroup and report in."}
					};

					gestures[] =
					{
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
				};
			};
		};
	};

	class A_m03:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {4348,3848,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_BravoLead";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "010_a_m03_intro";

					lines[] =
					{
						{"trigger","Shit, looks like we're going to hit Mike-26, Kerry."},
						{"trigger","Miller's going to brief us now. You ready?"}
					};
				};
			};
		};

		class HubBriefing:DefHubBriefingA
		{
			class Cutscene:Cutscene
			{
				prefix = "a_hub_040_a_m03_briefing_MIL_";

				timekeys[] =
				{
					05.602630,
					09.155283,
					14.820952,
					20.718821,
					26.221950,
					30.733878,
					41.687891,
					43.607891,
					48.723537,
					57.087075,
					60.439456
				};
				topic 	= "040_a_m03_briefing";
				bikb 	= "\a3\Missions_F_EPA\kb\A_hub\a_hub_040_a_m03_briefing.bikb";

				offset 	= -0.35;
				anim 	= "acts_a_m03_briefing";
				last	= 2.12;			//length of last sentence, used for blackOut timing
			};

			class XtraCharacters
			{
				count = 4;
				classes[] = {};
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_HubBriefing_A_m03";
				};
				class HotSeat:HotSeat
				{
					unitName = "BIS_charlieLead";
				};
			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_m03_CO.paa";
			};

			class AssemblePoint:AssemblePoint
			{
				class Vehicle1:Vehicle1
				{
					vehicleClass = "B_MRAP_01_F";
				};
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb = "040_a_m03_briefing";

					lines[] =
					{
						{"speaker","As I'm sure you're all well aware, comms are still down."},
						{"speaker","Efforts to restore contact with NATO MEDCOM have, thus far, proven fruitless."},
						{"speaker","The plain truth is, gentlemen - with the AAF regrouping - we must re-establish a link soon."},
						{"speaker","Now, aside from the airbase, Mike-26 is probably the most hi-tech installation on Stratis."},
						{"speaker","It's also one of the most strategically valuable positions on the island."},
						{"speaker","It's a risk, but hitting the facility will deal a serious blow to the AAF, and - if anywhere holds an opportunity to re-open com channels - it's there."},
						{"speaker","This will be a coordinated effort."},
						{"speaker","Charlie will set up a mortar. Alpha will provide overwatch and mark priority targets."},
						{"speaker","We'll strike hard from distance and - together with Bravo - move in quickly, holding the position against any potential counter-attack."},
						{"speaker","Ok, squad leaders, form on me. I'll share some extra details."},
						{"speaker","The rest of you, get set. Dismissed."}
					};

					gestures[] =
					{
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
				};
			};
		};
	};

	//Laser Show
	class A_m04:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {2973,1868,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_AlphaLead";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "015_a_m04_intro";

					lines[] =
					{
						{"trigger","Seems like Miller's set up some sort of supply operation tonight."},
						{"trigger","You in, Kerry?"}
					};
				};
			};
		};

		class HubBriefing:DefHubBriefingA
		{
			class Cutscene:Cutscene
			{
				prefix = "a_hub_045_a_m04_briefing_MIL_";

				timekeys[] =
				{
					06.074,
					11.841,
					17.786,
					26.424,
					35.643,
					44.082,
					51.361,
					55.582,
					58.480
				};
				topic 	= "045_a_m04_briefing";
				bikb 	= "\a3\Missions_F_EPA\kb\A_hub\a_hub_045_a_m04_briefing.bikb";
				offset 	= 0;
				anim	= "acts_a_m04_briefing";
				last	= 3.75;			//length of last sentence, used for blackOut timing
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_HubBriefing_A_m04";
				};
				class HotSeat:HotSeat
				{
					unitName = "BIS_alphaLead";
				};
			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_m04_CO.paa";
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb = "045_a_m04_briefing";

					lines[] =
					{
						{"speaker","We've struck some fairly significant blows against the AAF. They've been weakened."},
						{"speaker","We only have a small window of opportunity to exploit that fact, though, before they're reinforced."},
						{"speaker","It's also become clear that we're running short on ammo and supplies. We've got the momentum, but we risk stretching ourselves thin, gentlemen."},
						{"speaker","Fortunately, an opportunity has presented itself. We've managed to re-establish communication with a contact that has ties to the local guerrillas."},
						{"speaker","It's a small cell. Part of a larger network of resistance on the Altis mainland. They call themselves the F-I-A. 'Fee-ah'."},
						{"speaker","In the wake of the AAF attack, our contact - goes by the name 'Nikos' - set up an ammunition dump somewhere near LZ Connor."},
						{"speaker","He's offering to, well, share it, in a manner of speaking."},
						{"speaker","Now, we've agreed to link up just south of here."},
						{"speaker","Meet with him, secure some supplies, and RTB. Be on your guard and good luck."}
					};

					gestures[] =
					{
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
				};
			};
		};
	};

	//SCUBA
	class A_m05:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {1907,3298,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_DeltaLead";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "020_a_m05_intro";

					lines[] =
					{
						{"trigger","Kerry, you went through diver training, didn't you."},
						{"trigger","Miller's got an op for us - are you up to it?"}
					};
				};
			};
		};

		class HubBriefing:DefHubBriefingA
		{
			class Cutscene:Cutscene
			{
				prefix = "a_hub_050_a_m05_briefing_MIL_";

				timekeys[] =
				{
					05.108209,
					07.534694,
					16.393107,
					25.866848,
					31.532517,
					36.640907,
					43.409524,
					47.473016,
					53.742404,
					62.322177
				};
				topic 	= "050_a_m05_briefing";
				bikb 	= "\a3\Missions_F_EPA\kb\A_hub\a_hub_050_a_m05_briefing.bikb";
				offset 	= 0;
				anim	= "acts_a_m05_briefing";
				last	= 2.832834;			//length of last sentence, used for blackOut timing
			};

			class XtraCharacters
			{
				count = 2;
				classes[] = {"EPA_B_A_m05_briefingDiver1","EPA_B_A_m05_briefingDiver2"};
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_HubBriefing_A_m05";
				};
				class HotSeat:HotSeat
				{
					unitName = "BIS_deltaLead";
				};
				class VIP1:VIP1
				{
					unitName = "BIS_ctrgNorthgate";
				};
				class VIP2:VIP2
				{
					unitName = "BIS_ctrgHardy";
				};
				class VIP3:VIP3
				{
					unitName = "BIS_ctrgMcKay";
				};
			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_m05_CO.paa";
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb = "050_a_m05_briefing";

					lines[] =
					{
						{"speaker","Ok, listen up."},
						{"speaker","Recon reports indicate that the AAF will make a push south in the next few hours. It appears they're keen to lock down the area around Girna."},
						{"speaker","Intel suggests that the highest-ranking officer on Stratis will himself be in the area. Neutralising him will deal a serious blow to our enemy."},
						{"speaker","Decapitating their command structure may even signal an end to this whole situation."},
						{"speaker","We simply cannot let this opportunity pass us by, gentlemen."},
						{"speaker","Now, we've come up with a plan of action. My team has a submersible stashed just off the west coast."},
						{"speaker","That's why we asked for volunteers - those with diving experience."},
						{"speaker","One of my men, Lieutenant James here, will use it to lead a small team and insert just north of Girna."},
						{"speaker","Meanwhile, Bravo will circle around and take up a position to the south. Once both teams are in place, we close the trap."},
						{"speaker","Alright, let's set this in motion. Dismissed."}
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
				};
			};
		};
	};

	class A_out:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {2904,5995,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_BravoLead";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "025_a_out_intro";

					lines[] =
					{
						{"trigger","Kerry, it's good to see you're still in one piece."},
						{"trigger","Miller wants to speak to us. Sounds serious. You coming?"}
					};
				};
			};
		};

		class HubBriefing:DefHubBriefingA
		{
			class Cutscene:Cutscene
			{
				weapon	= "arifle_mxc_aco_pointer_f";
				prefix 	= "a_hub_055_a_out_briefing_MIL_";

				timekeys[] =
				{
					04.670027,
					13.017631,
					19.426073,
					25.185951,
					29.478835,
					36.215420,
					43.932575,
					50.788836,
					60.332010,
					66.315797,
					71.681902
				};
				topic 	= "055_a_out_briefing";
				bikb 	= "\a3\Missions_F_EPA\kb\A_hub\a_hub_055_a_out_briefing.bikb";
				offset 	= 0.2;
				anim	= "acts_a_out_briefing";
				last	= 1.806;			//length of last sentence, used for blackOut timing
			};

			class XtraCharacters
			{
				count = 8;
				classes[] = {};
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_HubBriefing_A_out";
				};
				class HotSeat:HotSeat
				{
					unitName = "BIS_deltaLead";
				};
				class VIP1:VIP1
				{
					unitName = "BIS_ctrgNorthgate";
				};
				class VIP2:VIP2
				{
					unitName = "BIS_ctrgHardy";
				};
				class VIP3:VIP3
				{
					unitName = "BIS_ctrgMcKay";
				};
			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPA\data\img\whiteboards\whiteboard_briefing_A_out_CO.paa";
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb = "055_a_out_briefing";

					lines[] =
					{
						{"speaker","I know things don't look good for us right now. We took a hit. We lost a number of good men."},
						{"speaker","Now, nothing I've got to say will change that fact, but I do have new information."},
						{"speaker","Late last night Delta managed to establish temporary long-range contact with NATO MEDCOM."},
						{"speaker","Reinforcements are inbound."},
						{"speaker","We need to lay the groundwork for a full invasion. They need an established foothold, not a broken down base hidden in the woods."},
						{"speaker","I say we attack now. We catch the AAF off-guard. We hold the ground we seize."},
						{"speaker","I'll lead Delta behind enemy lines and take up an advanced position to the North of Agia Marina."},
						{"speaker","Alpha and Bravo will lead the assault on the military range, while Charlie hit Camp Rogain and contain any counter-attack that might flank our main assault."},
						{"speaker","Once the range is secure, we'll converge on the town and entrench our position."},
						{"speaker","I'll go through the exact details of the plan with each individual squad leader. They'll bring the rest of their men up to speed."},
						{"speaker","Good luck, gentlemen."}
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
				};
			};
		};
	};

	/*--------------------------------------------------------------------------------------------------

		STAGE B

	--------------------------------------------------------------------------------------------------*/

	//Stronghold (started from B_hub02)
	class B_m01:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {4858,21912,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_FullStart_B_m01";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "001_b_m01_intro";

					lines[] = {};
				};
			};
		};

		class HubBriefing:DefHubBriefingB_hub02
		{
			class Armory:Armory
			{
				triggerClose 	   = 2.5;			//triggers required gear rearm
				triggerLong  	   = 8.3;			//triggers required gear list
				triggerHeightDelta = 0.5;

			};

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m01_CO.paa";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					//position = "BIS_HubBriefing_B_m01";
					position = "BIS_HubBriefing_Speaker";
				};

				class HotSeat:HotSeat
				{
					unitName = "BIS_recon";
				};
				class VIP1:VIP1
				{
					unitName = "";
				};
				class VIP2:VIP2
				{
					unitName = "";
				};
				class VIP3:VIP3
				{
					unitName = "";
				};
			};

			class Cutscene:Cutscene
			{
				weapon	= "";
				prefix 	= "b_hub_011_b_m01_briefing_sta_";

				timekeys[] =
				{
					5.629751,
					10.989320,
					17.445057,
					28.058617,
					38.023061,
					46.066259,
					53.343084,
					58.616961,
					65.220295
				};
				topic 	= "011_b_m01_briefing";
				bikb 	= "\a3\missions_f_epb\kb\b_hub\b_hub_011_b_m01_briefing.bikb";
				offset 	= 0.1;
				anim	= "acts_b_m01_briefing";
				last	= 12.5;			//length of last sentence, used for blackOut timing
			};
		};
	};

	//Rescue (played on Stratis) (started from B_hub02)
	class B_m02_1:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {3027,18185,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_FullStart_B_m02";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "002_b_m02_intro";

					lines[] = {};
				};
			};
		};

		class HubBriefing:DefHubBriefingB_hub02
		{
			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m02_CO.paa";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					//position = "BIS_HubBriefing_B_m02";
					position = "BIS_HubBriefing_Speaker";
				};

				class HotSeat:HotSeat
				{
					unitName = "BIS_recon";
				};
				class VIP1:VIP1
				{
					unitName = "";
				};
				class VIP2:VIP2
				{
					unitName = "";
				};
				class VIP3:VIP3
				{
					unitName = "";
				};
			};

			class Cutscene:Cutscene
			{
				weapon	= "";
				prefix 	= "b_hub_012_b_m02_briefing_sta_";

				timekeys[] =
				{
					8.921088,
					18.403129,
					26.500816,
					37.091111,
					41.688458,
					51.399637,
					55.404082,
					63.582834,
					70.013537,
					85.097438
				};
				topic 	= "012_b_m02_briefing";
				bikb 	= "\a3\Missions_F_EPB\kb\B_hub\b_hub_012_b_m02_briefing.bikb";
				offset 	= 0.45;
				anim	= "acts_b_m02_briefing";
				last	= 8.0;			//length of last sentence, used for blackOut timing
			};
		};
	};

	//Fuel Bomb (started from B_hub02)
	class B_m03:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {12208,14426,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_FullStart_B_m03";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "003_b_m03_intro";

					lines[] = {};
				};
			};
		};

		class HubBriefing:DefHubBriefingB_hub02
		{
			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m03_CO.paa";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					//position = "BIS_HubBriefing_B_m03";
					position = "BIS_HubBriefing_Speaker";
				};

				class HotSeat:HotSeat
				{
					unitName = "BIS_recon";
				};
				class VIP1:VIP1
				{
					unitName = "";
				};
				class VIP2:VIP2
				{
					unitName = "";
				};
				class VIP3:VIP3
				{
					unitName = "";
				};
			};

			class Cutscene:Cutscene
			{
				weapon	= "";
				prefix 	= "b_hub_013_b_m03_briefing_STA_";

				timekeys[] =
				{
					4.361429,
					8.662449,
					17.561701,
					25.710612,
					36.238934,
					45.253741,
					61.027664,
					69.223560,
					78.199751
				};
				topic 	= "013_b_m03_briefing";
				bikb 	= "\a3\Missions_F_EPB\kb\B_hub\b_hub_013_b_m03_briefing.bikb";
				offset 	= 0.0;
				anim	= "acts_b_m03_briefing";
				last	= 7;			//length of last sentence, used for blackOut timing
			};
		};
	};

	//Intel (started from B_hub02)
	class B_m05:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {5639,19543,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_FullStart_B_m05";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "005_b_m05_intro";

					lines[] = {};
				};
			};
		};

		class HubBriefing:DefHubBriefingB_hub02
		{
			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m05_CO.paa";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					//position = "BIS_HubBriefing_B_m05";
					position = "BIS_HubBriefing_Speaker";
				};

				class HotSeat:HotSeat
				{
					unitName = "BIS_recon";
				};
				class VIP1:VIP1
				{
					unitName = "";
				};
				class VIP2:VIP2
				{
					unitName = "";
				};
				class VIP3:VIP3
				{
					unitName = "";
				};
			};

			class Cutscene:Cutscene
			{
				weapon	= "";
				prefix 	= "b_hub_015_b_m05_briefing_STA_";

				timekeys[] =
				{
					6.057211,
					9.533855,
					16.034308,
					27.584036,
					32.352472,
					44.883900,
					55.011497,
					59.644218
				};
				topic 	= "015_b_m05_briefing";
				bikb 	= "\a3\Missions_F_EPB\kb\B_hub\b_hub_015_b_m05_briefing.bikb";
				offset 	= -0.1;
				anim	= "acts_b_m05_briefing";
				last	= 8;			//length of last sentence, used for blackOut timing
			};
		};
	};

	//Supplies (started from B_hub01)
	class B_m06:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {4068,17296,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_SFX";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "006_b_m06_intro";

					lines[] = {};
				};
			};
		};

		class HubBriefing:DefHubBriefingB_hub01
		{
			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m06_CO.paa";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					position = "BIS_HubBriefing_Speaker";
				};

				class HotSeat:HotSeat
				{
					unitName = "BIS_SF1";
				};
				class VIP1:VIP1
				{
					unitName = "BIS_recon";
				};
				class VIP2:VIP2
				{
					unitName = "BIS_SF2";
				};
				class VIP3:VIP3
				{
					unitName = "BIS_SF3";
				};
			};

			class Cutscene:Cutscene
			{
				weapon	= "";
				prefix 	= "b_hub_016_b_m06_briefing_STA_";

				timekeys[] =
				{
					8.867052,
					12.759864,
					17.143265,
					23.682993,
					33.509297,
					44.700068,
					58.049070,
					62.947188,
					70.404512,
					79.56990
				};
				topic 	= "016_b_m06_briefing";
				bikb 	= "\a3\Missions_F_EPB\kb\B_hub\b_hub_016_b_m06_briefing.bikb";
				offset 	= 0.0;
				anim	= "acts_b_m06_briefing";
				last	= 5;			//length of last sentence, used for blackOut timing
			};
		};
	};

	//(started from B_hub03)
	class B_out2:DefMission
	{
		class QuickStart:DefQuickStart
		{
			position[] = {10519,12308,0};
		};

		class FullStart:DefFullStart
		{
			trigger = "BIS_FullStart_B_out";

			class Conversations:Conversations
			{
				class MissionIntro:MissionIntro
				{
					kb = "007_b_out_intro";

					lines[] = {};
				};
			};
		};

		class HubBriefing:DefHubBriefingB_hub03
		{
			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_out2_CO.paa";
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					//position = "BIS_HubBriefing_B_out";
					position = "BIS_HubBriefing_Speaker";
				};

				class HotSeat:HotSeat
				{
					unitName = "";
				};
				class VIP1:VIP1
				{
					unitName = "BIS_nikos";
				};
				class VIP2:VIP2
				{
					unitName = "";
				};
				class VIP3:VIP3
				{
					unitName = "";
				};
			};

			class Cutscene:Cutscene
			{
				weapon	= "";
				prefix 	= "b_hub_017_b_out2_briefing_STA_";

				timekeys[] =
				{
					8.380408,
					14.883696,
					22.945533,
					33.854354,
					37.189252,
					45.903311,
					49.958345,
					57.460159,
					69.910385,
					77.124989,
					85.351565,
					94.434331,
					101.596871
				};
				topic 	= "017_b_out2_briefing";
				bikb 	= "\a3\Missions_F_EPB\kb\B_hub\b_hub_017_b_out2_briefing.bikb";
				offset 	= 0.0;
				anim	= "Acts_B_out2_briefing";
				last	= 7.5;			//length of last sentence, used for blackOut timing
			};
		};
	};

	class C_in2:DefMission
	{
		class SimpleStart:DefSimpleStart
		{
			center[] = {2161.28,5610.19,3.12796};		//ATL
			radius	 = 3.3;
		};

		class HubBriefing:DefHubBriefingA
		{
			center = "BIS_BriefingCenter";
			skipTime = 0;

			class Whiteboard:Whiteboard
			{
				texture = "\A3\Missions_F_EPB\data\img\papermaps\papermap_briefing_B_m06_CO.paa";
			};

			class XtraCharacters
			{
				count = 0;
				classes[] = {};
			};

			class Player
			{
				position = "BIS_HubBriefing_PlayerPos";
			};

			class Armory:Armory
			{
				playIntro = 1;
				teleportTo = 0;
				blackOut = 0;
				autoRearm = 0;

				unitName = "BIS_Armory";
				position = "BIS_Armory_PlayerPos";

				triggerClose 	   = 1.5;			//triggers required gear rearm
				triggerLong  	   = 10.0;			//triggers required gear list
				triggerHeightDelta = 0.2;
			};

			class AssemblePoint
			{
				position = "BIS_AssemblePoint";

				class Vehicle1
				{
					vehicleClass = "B_MRAP_01_F";
					position = "BIS_vehicleExit1";
				};
				class Vehicle2
				{
					vehicleClass = "";
					position = "BIS_vehicleExit2";
				};
				class Vehicle3
				{
					vehicleClass = "";
					position = "BIS_vehicleExit3";
				};
			};

			class SpecialCharacters:SpecialCharacters
			{
				class Speaker:Speaker
				{
					unitName = "BIS_BHQ";
					position = "BIS_HubBriefing_SpeakerPos";
				};
				class HotSeat
				{
					unitName = "";
					position = "BIS_hubBriefing_hotSeat";
				};
				class VIP1
				{
					unitName = "";
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

			class Cutscene:Cutscene
			{
				actor = "BIS_BHQ";
				prefix = "c_in1_00_briefing_bhq_";
				timeout = 300;

				timekeys[] =
				{
					02.671,
					08.785,
					11.000,
					15.872,
					21.353,
					26.431,
					32.199,
					39.979,
					44.043,
					52.414,
					63.192,
					67.068,
					76.123	// end 77.021
				};
				topic 	= "00_briefing";
				bikb 	= "\a3\Missions_F_EPC\kb\C_in1\c_in1_00_briefing.bikb";
				//offset 	= 0.55;
				offset 	= -1.45;
				anim 	= "acts_c_in1_briefing";
				last	= 0.9;			//length of last sentence, used for blackOut timing
			};

			class Conversations:Conversations
			{
				class MissionBriefing:MissionBriefing
				{
					kb[] = {"00_briefing","C_in1"};

					lines[] =
					{
						{"speaker","As you're probably aware, we've been scouting positions to our north, keeping tabs on enemy movement."},
						{"speaker","Unfortunately, Bravo ran into trouble, taking contact in a village a little to the west of our position."},
						{"speaker","They're pinned down and need our support, gentlemen."},
						{"speaker","Now, an advanced element has already set up a position nearby to get eyes on the situation."},
						{"speaker","AAF units have mobilized along the valley leading to the village. More support is no doubt en route."},
						{"speaker","Alpha will approach from the east. Use the high ground and forest cover to your advantage."},
						{"speaker","Clear the village and get our boys out of there."},
						{"speaker","Okay. Regroup and report in."}
					};

					gestures[] =
					{
					};
				};

				class ArmoryIntro:ArmoryIntro
				{
					kb[] = {"01_armory","C_in1"};

					lines[] =
					{
						{"speaker","Alright, so that's you all set, Kerry."},
						{"speaker","It's the best kit we've got for the task at hand."},
						{"speaker","If you want to adjust your loadout, feel free. Your stuff is in the crate over there."}
					};

					gestures[] =
					{
					};
				};
			};
		};
	};

	/*--------------------------------------------------------------------------------------------------

		SKIRMISHES FOR BOTH STAGES

	--------------------------------------------------------------------------------------------------*/
	class A_skirmish01:DefSkirmish
	{
	};

	class A_skirmish02:A_skirmish01
	{
	};

	class B_skirmish01:DefSkirmish
	{
		class Distances:Distances
		{
			warning 	= 80;		//distance where player get the warning about triggering skirmish
			trigger 	= 120;		//distance where skirmish triggers
			portFromHub 	= 500;		//how far from hub will player teleport when going from hub to skirmish
			portToHub 	= 75;		//how far from hub will player teleport when going back from skirmish to hub
		};

		class Vehicles
		{
			//vehicle for single player
			class Player
			{
				name = "BIS_SkirmishVeh1";
				type = "B_G_Quadbike_01_F";
				cust = "";
			};

			//vehicle for player & squad
			class Squad
			{
				name = "BIS_SkirmishVehX";
				type = "B_G_Offroad_01_F";
				cust = "B_G_Offroad_01_F_1";
			};
		};

		spawnpoints[] =
		{
			{{2753.7,21952.7,0},354.273},		//north-west island
			{{3287.91,21397.8,0},111.675},		//road, south
			{{3489.14,21559.7,0},106.761,0},	//hilly terrain, south-east
			{{3592.73,21950,0},95.7158,0}		//hilly terrain, east
		};
	};

	class B_skirmish02:DefSkirmish
	{
		class Distances:Distances
		{
			warning 	= 85;		//distance where player get the warning about triggering skirmish
			trigger 	= 125;		//distance where skirmish triggers
			portFromHub 	= 500;		//how far from hub will player teleport when going from hub to skirmish
			portToHub 	= 75;		//how far from hub will player teleport when going back from skirmish to hub
		};

		class Vehicles
		{
			//vehicle for single player
			class Player
			{
				name = "BIS_SkirmishVeh1";
				type = "B_G_Quadbike_01_F";
				cust = "";
			};

			//vehicle for player & squad
			class Squad
			{
				name = "BIS_SkirmishVehX";
				type = "B_G_Offroad_01_F";
				cust = "B_G_Offroad_01_F_1";
			};
		};

		spawnpoints[] =
		{
			{{5841.81,18193,0},31.7043},	//road, north-east
			{{5473.42,17369.2,0},233.185},	//road, south
			{{4720,17738.1,0},266.526,0},	//terrain, west
			{{5441.18,18462,0},60.3428,0},	//terrain, north
			{{5985.59,17452.4,0},90.409,0}	//terrain, south-east
		};
	};

	class B_skirmish03:DefSkirmish
	{
		class Distances:Distances
		{
			warning 	= 85;		//distance where player get the warning about triggering skirmish
			trigger 	= 125;		//distance where skirmish triggers
			portFromHub 	= 500;		//how far from hub will player teleport when going from hub to skirmish
			portToHub 	= 75;		//how far from hub will player teleport when going back from skirmish to hub
		};

		class Vehicles
		{
			//vehicle for single player
			class Player
			{
				name = "BIS_SkirmishVeh1";
				type = "B_G_Quadbike_01_F";
				cust = "";
			};

			//vehicle for player & squad
			class Squad
			{
				name = "BIS_SkirmishVehX";
				type = "B_G_Offroad_01_F";
				cust = "B_G_Offroad_01_F_1";
			};
		};

		spawnpoints[] =
		{
			{{8596.23,14701.4,0},102.066},	//road, east
			{{7855.68,15090.4,0},283.498},	//road, north-west
			{{8375.34,15392.2,0},332.18},	//road, north
			{{7943.67,14430.7,0},266.93,0},	//hilly south-west
			{{8417.99,14488.4,0},158.719,0}	//terrain, south
		};
	};
};