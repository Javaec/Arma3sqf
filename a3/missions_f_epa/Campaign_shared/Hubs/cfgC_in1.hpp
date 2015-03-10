#include "\A3\Missions_F_EPA\Campaign_shared\cfgCharacters.hpp"

//osdLocation = "";
//osdSector = "";

class AmbientTalk
{
	shuffle = 0;

	class Default
	{
		//conversation container, usually same as the mission name
		container	= "C_in1";

		//player distance from participants
		distance 	= 8;

		//how many times the conversation can be played
		playCount	= 10e10;

		//classname of linked POI; empty string means no linked POI
		poi		= "";

		//condition to be met to trigger the conversation
		condStart 	= "";

		//condition for pausing the playback; checked before sentence is being played
		condPause	= "";

		//condition for ending the conversation; checked before sentence is being played
		condEnd		= "";

		//code executed when conversation is triggered
		codeStart 	= "";

		//code executed when playback is paused
		codePause	= "";

		//code executed when playback ends
		codeEnd 	= "";
	};

	class 10_ambient_talk_00:Default
	{
	};
	class 11_ambient_talk_01:Default
	{
	};
	class 12_ambient_talk_02:Default
	{
	};
	class 13_ambient_talk_03:Default
	{
	};
	class 14_ambient_talk_04:Default
	{
	};
};

class Characters:TemplateCharacters
{
	class BIS_inf:PlayerC_PersistentGear
	{
		identity = "EPC_B_Kerry";
		appearance = "B_Story_Protagonist_F";

		primaryWeapon[] =
		{
			"none"
		};

		handgun[] =
		{
			"none"
		};

		remove[] =
		{
			"weapons","vest","headgear"
		};

		add[] =
		{
			{"uniform", "u_b_combatuniform_mcam_vest"}
		};
	};

	class BIS_armory:Default
	{
		identity = "EPC_B_StratisArmorer";
		appearance = "B_Soldier_F";

		remove[] = {"weapons"};
	};

	class BIS_BHQ:Default
	{
		identity = "EPC_B_BHQ";
		appearance = "B_Officer_F";

		add[] =
		{
			{"headgear", "H_Beret_Colonel"}
		};
	};
};

class CfgNotifications
{
	class Default
	{
		title = "";
		iconPicture = "\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
		iconText = "";
		description = "";
		color[] = {1,1,1,0.8};
		colorIconText[] = {1,1,1,0.8};
		colorIconPicture[] = {1,1,1,0.8};
		duration = 5;
		priority = 0;
		difficulty[] = {};
		sound = "defaultNotification";
		soundClose = "defaultNotificationClose";
		soundRadio = "";
	};

	class BriefingNotification:Default
	{
		title = $STR_A3_C_in1_notifBriefingNotification_title;
		description = $STR_A3_C_in1_notifBriefingNotification_desc;
	};

	class ExfilNotification:BriefingNotification
	{
		title = $STR_A3_C_in1_notifExfilNotification_title;
		description = $STR_A3_C_in1_notifExfilNotification_desc;
		iconText = "";
	};
	class ExfilCommencing:BriefingNotification
	{
		title = $STR_A3_C_in1_notifExfilCommencing_title;
		description = $STR_A3_C_in1_notifExfilCommencing_desc;
		iconPicture = "\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa";
	};
};