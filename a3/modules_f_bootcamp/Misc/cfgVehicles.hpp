class CfgVehicles
{
	class Logic;
	
	class Module_F: Logic
	{
		class ModuleDescription
		{
			class AnyPlayer;
		};
	};
	
	class ModuleBootcampStage_F: Module_F
	{
		//CFGVEHICLES_ModuleBootcampStage_F
		scope = 1;
		scopeCurator = 2;
		category = "Training";
		displayName = $STR_A3_bis_fnc_modulebootcampstage_title;
		icon = "\a3\Modules_F_Bootcamp\Data\IconBootcampStage.paa";
		portrait = "\a3\Modules_F_Bootcamp\Data\PortraitBootcampStage.paa";
		function = "BIS_fnc_moduleBootcampStage";
		isGlobal = 0;
		curatorCanAttach = 0;
		curatorCost = 10;
		curatorInfoType = "RscDisplayAttributesModuleBootcampStage";
		
		class ModuleDescription: ModuleDescription
		{
			position = 1;
		};
	};
	
	class ModuleHint_F: ModuleBootcampStage_F
	{
		//CFGVEHICLES_ModuleHint_F
		displayName = $STR_A3_bis_fnc_modulehint_title;
		icon = "\a3\Modules_F_Bootcamp\Data\IconHint.paa";
		portrait = "\a3\Modules_F_Bootcamp\Data\PortraitHint.paa";
		function = "BIS_fnc_moduleHint";
		isGlobal = 1;
		curatorCanAttach = 0;
		curatorCost = 10;
		curatorInfoType = "RscDisplayAttributesModuleHint";
		
		class ModuleDescription: ModuleDescription
		{
			position = 1;
		};
	};
	
	class ModulePunishment_F: ModuleBootcampStage_F
	{
		//CFGVEHICLES_ModuleHint_F
		displayName = $STR_A3_bis_fnc_modulepunishment_title;
		icon = "\a3\Modules_F_Bootcamp\Data\IconPunishment.paa";
		portrait = "\a3\Modules_F_Bootcamp\Data\PortraitPunishment.paa";
		function = "BIS_fnc_modulePunishment";
		isGlobal = 0;
		curatorCanAttach = 1;
		curatorCost = 10;
		curatorInfoType = "RscDisplayAttributesModulePunishment";
		
		class ModuleDescription: ModuleDescription
		{
			position = 1;
		};
	};
	
	class ModuleArsenal_F: Module_F
	{
		//CFGVEHICLES_ModuleArsenal_F
		scope = 1;
		scopeCurator = 2;
		category = "Curator";
		displayName = $STR_A3_Arsenal;
		portrait = "\A3\Ui_f\data\Logos\a_64_ca.paa";
		function = "BIS_fnc_moduleArsenal";
		isGlobal = 1;
		curatorCanAttach = 1;
		
		class ModuleDescription: ModuleDescription
		{
			position = 1;
		};
	};
};
