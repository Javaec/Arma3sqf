class CfgVRCourses
{
	class Default
	{
		official = 0;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_default_CA.paa";
		locks[] = {};
		priority = -1;
	};
	class TargetDesignation: Default
	{
		title = $STR_A3_VR_targetdesignation_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_target_designation_CA.paa";
		locks[] = {"Ballistics"};
		priority = 4;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_VR_targetdesignation_stage1_title;
				function = "BIS_fnc_VRCourseTargetDesignation1";
			};
			class Stage2
			{
				title = $STR_A3_VR_targetdesignation_stage2_title;
				function = "BIS_fnc_VRCourseTargetDesignation2";
			};
			class Stage3
			{
				title = $STR_A3_VR_targetdesignation_stage3_title;
				function = "BIS_fnc_VRCourseTargetDesignation3";
			};
		};
	};
	class Launchers: Default
	{
		title = $STR_A3_VR_launchers_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_launchers_CA.paa";
		locks[] = {"Ballistics"};
		priority = 3;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_VR_launchers_stage1_title;
				function = "BIS_fnc_VRCourseLaunchers1";
			};
			class Stage2
			{
				title = $STR_A3_VR_launchers_stage2_title;
				function = "BIS_fnc_VRCourseLaunchers2";
			};
			class Stage3
			{
				title = $STR_A3_VR_launchers_stage3_title;
				function = "BIS_fnc_VRCourseLaunchers3";
			};
		};
	};
	class Placeables: Default
	{
		title = $STR_A3_VR_placeables_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_placeables_CA.paa";
		locks[] = {"Ballistics"};
		priority = 2;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_VR_placeables_stage1_title;
				function = "BIS_fnc_VRCoursePlaceables1";
			};
			class Stage2
			{
				title = $STR_A3_VR_placeables_stage2_title;
				function = "BIS_fnc_VRCoursePlaceables2";
			};
			class Stage3
			{
				title = $STR_A3_VR_placeables_stage3_title;
				function = "BIS_fnc_VRCoursePlaceables3";
			};
		};
	};
	class Ballistics: Default
	{
		title = $STR_A3_VR_ballistics_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_balistics_CA.paa";
		locks[] = {};
		priority = 1;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_VR_ballistics_stage1_title;
				function = "BIS_fnc_VRCourseBallistics1";
			};
			class Stage2
			{
				title = $STR_A3_VR_ballistics_stage2_title;
				function = "BIS_fnc_VRCourseBallistics2";
			};
			class Stage3
			{
				title = $STR_A3_VR_ballistics_stage3_title;
				function = "BIS_fnc_VRCourseBallistics3";
			};
			class Stage4
			{
				title = $STR_A3_VR_ballistics_stage4_title;
				function = "BIS_fnc_VRCourseBallistics4";
			};
		};
	};
	class CommandingMovement: Default
	{
		title = $STR_A3_Commanding_Movement_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_commanding_movement_CA.paa";
		locks[] = {};
		priority = 5;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_Commanding_Movement_stage2;
				function = "BIS_fnc_VRCourseCommandingMovement2";
			};
			class Stage2
			{
				title = $STR_A3_Commanding_Movement_stage1;
				function = "BIS_fnc_VRCourseCommandingMovement1";
			};
		};
	};
	class CommandingBehaviour: Default
	{
		title = $STR_A3_Commanding_Behaviour_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_commanding_behavior_CA.paa";
		locks[] = {"CommandingMovement"};
		priority = 6;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_Commanding_Behaviour_stage1;
				function = "BIS_fnc_VRCourseCommandingBehaviour1";
			};
			class Stage2
			{
				title = $STR_A3_Commanding_Behaviour_stage2;
				function = "BIS_fnc_VRCourseCommandingBehaviour2";
			};
			class Stage3
			{
				title = $STR_A3_Commanding_Behaviour_stage3;
				function = "BIS_fnc_VRCourseCommandingBehaviour3";
			};
		};
	};
	class CommandingVehicles: Default
	{
		title = $STR_A3_Commanding_Vehicles_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_commanding_vehicles_CA.paa";
		locks[] = {"CommandingMovement"};
		priority = 8;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_Commanding_Vehicles_stage1;
				function = "BIS_fnc_VRCourseCommandingVehicles1";
			};
			class Stage2
			{
				title = $STR_A3_Commanding_Vehicles_stage2;
				function = "BIS_fnc_VRCourseCommandingVehicles2";
			};
			class Stage3
			{
				title = $STR_A3_Commanding_Vehicles_stage3;
				function = "BIS_fnc_VRCourseCommandingVehicles3";
			};
		};
	};
	class CommandingActions: Default
	{
		title = $STR_A3_Commanding_Actions_title;
		icon = "\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_commanding_actions_CA.paa";
		locks[] = {"CommandingMovement", "Placeables"};
		priority = 7;
		official = 1;
		class Stages
		{
			class Stage1
			{
				title = $STR_A3_Commanding_Actions_stage1;
				function = "BIS_fnc_VRCourseCommandingActions1";
			};
			class Stage2
			{
				title = $STR_A3_Commanding_Actions_stage2;
				function = "BIS_fnc_VRCourseCommandingActions2";
			};
			class Stage3
			{
				title = $STR_A3_Commanding_Actions_stage3;
				function = "BIS_fnc_VRCourseCommandingActions3";
			};
		};
	};
/*
	class CommDummy1: Default
	{
		title = "Dummy Course #1";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 1A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 1B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 1C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy2: Default
	{
		title = "Dummy Course #2";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 2A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 2B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 2C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy3: Default
	{
		title = "Dummy Course #3";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 3A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 3B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 3C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy4: Default
	{
		title = "Dummy Course #4";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 4A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 4B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 4C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy5: Default
	{
		title = "Dummy Course #5";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 5A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 5B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 5C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy6: Default
	{
		title = "Dummy Course #6";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 6A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 6B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 6C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy7: Default
	{
		title = "Dummy Course #7";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 7A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 7B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 7C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy8: Default
	{
		title = "Dummy Course #8";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 8A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 8B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 8C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy9: Default
	{
		title = "Dummy Course #9";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 9A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 9B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 9C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy10: Default
	{
		title = "Dummy Course #10";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 10A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 10B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 10C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy11: Default
	{
		title = "Dummy Course #11";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 11A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 11B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 11C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy12: Default
	{
		title = "Dummy Course #12";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 12A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 12B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 12C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy13: Default
	{
		title = "Dummy Course #13";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 13A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 13B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 13C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy14: Default
	{
		title = "Dummy Course #14";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 14A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 14B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 14C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy15: Default
	{
		title = "Dummy Course #15";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 15A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 15B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 15C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy16: Default
	{
		title = "Dummy Course #16";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 16A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 16B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 16C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy17: Default
	{
		title = "Dummy Course #17";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 17A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 17B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 17C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy18: Default
	{
		title = "Dummy Course #18";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 18A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 18B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 18C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy19: Default
	{
		title = "Dummy Course #19";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 19A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 19B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 19C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy20: Default
	{
		title = "Dummy Course #20";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 20A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 20B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 20C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy21: Default
	{
		title = "Dummy Course #21";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 21A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 21B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 21C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy22: Default
	{
		title = "Dummy Course #22";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 22A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 22B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 22C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy23: Default
	{
		title = "Dummy Course #23";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 23A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 23B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 23C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy24: Default
	{
		title = "Dummy Course #24";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 24A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 24B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 24C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};

	class CommDummy25: Default
	{
		title = "Dummy Course #25";
		class Stages
		{
			class Stage1 {title = "Dummy Stage 25A"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage2 {title = "Dummy Stage 25B"; function = "BIS_fnc_VRCourseTargetDesignation1";};
			class Stage3 {title = "Dummy Stage 25C"; function = "BIS_fnc_VRCourseTargetDesignation1";};
		};
	};
	*/
};