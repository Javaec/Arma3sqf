class CfgFunctions
{
	class A3_Bootcamp
	{
		tag = "BIS";

		class Inventory
		{
			file = "A3\functions_f_bootcamp\Inventory";
			class exportInventory{};
			class saveInventory{};
			class deleteInventory{};
			class baseWeapon{};

			class arsenal{};

			class addVirtualItemCargo{};
			class removeVirtualItemCargo{};
			class getVirtualItemCargo{};

			class addVirtualWeaponCargo{};
			class removeVirtualWeaponCargo{};
			class getVirtualWeaponCargo{};

			class addVirtualMagazineCargo{};
			class removeVirtualMagazineCargo{};
			class getVirtualMagazineCargo{};

			class addVirtualBackpackCargo{};
			class removeVirtualBackpackCargo{};
			class getVirtualBackpackCargo{};
		};

		class Misc
		{
			file = "A3\functions_f_bootcamp\Misc";

			class traceBullets{};
			class getUnitByUid{};
			class moveAction{};
		};

		class Training
		{
			file = "A3\functions_f_bootcamp\Training";

			class target{};
		};

		class VR
		{
			file = "A3\functions_f_bootcamp\VR";

			class VRDrawBorder{};
			class VRDrawGrid{};
			class VREffectKilled{};
			class VRFadeIn{};
			class VRFadeOut{};
			class VRSpawnEffect{};
			class VRSpawnSelector{};
			class VRTimer{};
			class VRHitpart{};

			class VRCourseTargetDesignation1{ext=".fsm";};
			class VRCourseTargetDesignation2{ext=".fsm";};
			class VRCourseTargetDesignation3{ext=".fsm";};

			class VRCourseLaunchers1{ext=".fsm";};
			class VRCourseLaunchers2{ext=".fsm";};
			class VRCourseLaunchers3{ext=".fsm";};

			class VRCoursePlaceables1{ext=".fsm";};
			class VRCoursePlaceables2{ext=".fsm";};
			class VRCoursePlaceables3{ext=".fsm";};

			class VRCourseBallistics1{ext=".fsm";};
			class VRCourseBallistics2{ext=".fsm";};
			class VRCourseBallistics3{ext=".fsm";};
			class VRCourseBallistics4{ext=".fsm";};

			class VRCourseCommandingMovement1{ext=".fsm";};
			class VRCourseCommandingMovement2{ext=".fsm";};

			class VRCourseCommandingBehaviour1{ext=".fsm";};
			class VRCourseCommandingBehaviour2{ext=".fsm";};
			class VRCourseCommandingBehaviour3{ext=".fsm";};

			class VRCourseCommandingVehicles1{ext=".fsm";};
			class VRCourseCommandingVehicles2{ext=".fsm";};
			class VRCourseCommandingVehicles3{ext=".fsm";};

			class VRCourseCommandingActions1{ext=".fsm";};
			class VRCourseCommandingActions2{ext=".fsm";};
			class VRCourseCommandingActions3{ext=".fsm";};
		};

		class GUI
		{
			file = "A3\functions_f_bootcamp\GUI";

			class animateTaskWaypoint{};
		};
	};
};