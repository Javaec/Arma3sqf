class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription
		{
			class AnyVehicle;
		};
	};
	class ModuleSector_F: Module_F
	{
		CFGVEHICLES_ModuleSector_F
		scope = 2;
		displayName = $STR_A3_CfgVehicles_ModuleSector_F_0;
		category = "Multiplayer";
		icon = "\a3\Modules_f\data\iconSector_ca.paa";

		function = "BIS_fnc_moduleSector";
		isGlobal = 0;
		isTriggerActivated = 1;

		class Arguments
		{
			class Name
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Name_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Name_1;
  				defaultValue = "";
			};
			class Designation
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Designation_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Designation_1;
  				defaultValue = "";
			};
			class ScoreReward
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_ScoreReward_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_ScoreReward_1;
  				defaultValue = "0";
			};
			class OnOwnerChange
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_OnOwnerChange_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_OnOwnerChange_1;
  				defaultValue = "";
			};
			class OwnerLimit
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_OwnerLimit_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_OwnerLimit_1;
  				defaultValue = "0";
			};
			class DefaultOwner
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_DefaultOwner_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_DefaultOwner_1;
				class values
				{
					class None		{name = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_DefaultOwner_values_None_0;	value = -1; default = 1;};
					class BLUFOR		{name = $STR_WEST;	value = 1;};
					class OPFOR		{name = $STR_EAST;	value = 0;};
					class Independent	{name = $STR_GUERRILA;	value = 2;};
					class Civilian		{name = $STR_CIVILIAN;	value = 3;};
				};
			};
			class TaskOwner
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskOwner_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskOwner_1;
				class values
				{
					class Nobody		{name = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskOwner_values_Nobody_0; value = 0; default = 1;};
					class Everyone		{name = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskOwner_values_Everyone_0; value = 1;};
					class DefaultSides	{name = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskOwner_values_Default_0; value = 2;};
					class NotDefaultSides	{name = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskOwner_values_NotDefault_0; value = 3;};
				};
			};
			class TaskTitle
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskTitle_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskTitle_1;
			};
			class TaskDescription
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskDescription_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_TaskDescription_1;
			};

			class CostInfantry
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostInfantry_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostInfantry_1;
  				defaultValue = "1";
			};
			class CostWheeled
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostWheeled_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostWheeled_1;
  				defaultValue = "2";
			};
			class CostTracked
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostTracked_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostTracked_1;
  				defaultValue = "4";
			};
			class CostWater
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostWater_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostWater_1;
  				defaultValue = "0";
			};
			class CostAir
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostAir_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostAir_1;
  				defaultValue = "2";
			};
			class CostPlayers
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostPlayers_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_CostPlayers_1;
  				defaultValue = "2";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description[] = {
				$STR_a3_cfgvehicles_modulesector_f_moduledescription_description_0,
				$STR_a3_cfgvehicles_modulesector_f_moduledescription_description_1,
				$STR_a3_cfgvehicles_modulesector_f_moduledescription_description_2
			};
			duplicate = 1;
			sync[] = {"LocationArea_F","MiscUnlock_F","SideBLUFOR_F","SideOPFOR_F","SideResistance_F"};

			class SideBLUFOR_F
			{
				description = $STR_A3_CfgVehicles_ModuleSector_F_ModuleDescription_SideBLUFOR_F_0;
				sync[] = {};
			};
			class SideOPFOR_F
			{
				description = $STR_A3_CfgVehicles_ModuleSector_F_ModuleDescription_SideOPFOR_F_0;
				sync[] = {};
			};
			class SideResistance_F
			{
				description = $STR_A3_CfgVehicles_ModuleSector_F_ModuleDescription_SideResistance_F_0;
				sync[] = {};
			};
			class LocationArea_F
			{
				description = "";
				duplicate = 1;
				sync[] = {"TriggerArea"};
			};
			class TriggerArea
			{
				position = 1;
				area = 1;
				description = $STR_A3_CfgVehicles_ModuleSector_F_ModuleDescription_TriggerArea_0;
				duplicate = 1;
				vehicle = "EmptyDetector";
			};
			class MiscUnlock_F
			{
				description = "";
				duplicate = 1;
				optional = 1;
				sync[] = {"TriggerUnlock"};
			};
			class TriggerUnlock
			{
				description = $STR_A3_CfgVehicles_ModuleSector_F_ModuleDescription_TriggerUnlock_0;
				duplicate = 1;
				optional = 1;
				vehicle = "EmptyDetector";
			};
		};
	};
	class ModuleSectorDummy_F: ModuleSector_F
	{
		CFGVEHICLES_ModuleSectorDummy_F
		displayName = $STR_A3_CfgVehicles_ModuleSectorDummy_F_0;
		icon = "\a3\Modules_f\data\iconSectorDummy_ca.paa";

		class Arguments
		{
			class Name
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Name_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Name_1;
  				defaultValue = "";
			};
			class Designation
			{
				displayName = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Designation_0;
				description = $STR_A3_CfgVehicles_ModuleSector_F_Arguments_Designation_1;
  				defaultValue = "";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description = $STR_A3_CfgVehicles_ModuleSectorDummy_F_ModuleDescription_0;
			sync[] = {"ModuleSector_F","LocationArea_F","MiscUnlock_F"};
		};
	};
	class ModuleRespawnPosition_F: Module_F
	{
		CFGVEHICLES_ModuleRespawnPosition_F
		scope = 2;
		displayName = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_0;
		category = "Multiplayer";
		icon = "\a3\Modules_f\data\iconRespawn_ca.paa";

		function = "BIS_fnc_moduleRespawnPosition";
		isGlobal = 0;
		isTriggerActivated = 1;

		class Arguments
		{
			class Name
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Name_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Name_1;
  				defaultValue = "";
			};
			class Type
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_1;
				class values
				{
					class Inf		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Inf_0;		value = 0; default = 1;};
					class Vehicles		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Vehicles_0;		value = 1;};
					class Motor		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Motor_0;		value = 2;};
					class Armor		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Armor_0;		value = 3;};
					class Air		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Air_0;		value = 4;};
					class Plane		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Plane_0;		value = 5;};
					class Naval		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Type_values_Naval_0;		value = 6;};
				};
			};
			class Side
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Side_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Side_1;
				class values
				{
					class Leader		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Side_values_Leader_0;		value = -1; default = 1;};
					class BLUFOR		{name = $STR_WEST;	value = 1;};
					class OPFOR		{name = $STR_EAST;	value = 0;};
					class Independent	{name = $STR_GUERRILA;	value = 2;};
					class Civilian		{name = $STR_CIVILIAN;	value = 3;};
				};
			};
			class Marker
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Marker_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Marker_1;
				class values
				{
					class All		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Marker_values_All_0;		value = 0; default = 1;};
					class SideAllies	{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Marker_values_SideAllies_0;	value = 1;};
					class Side		{name = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_Arguments_Marker_values_Side_0;		value = 2;};
				};
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description = $STR_A3_CfgVehicles_ModuleRespawnPosition_F_ModuleDescription_0;
			position = 1;
			direction = 1;
			sync[] = {"AnyVehicle"};
			class AnyVehicle: AnyVehicle
			{
				optional = 1;
			};
		};
	};
	class ModuleRespawnVehicle_F: Module_F
	{
		CFGVEHICLES_ModuleRespawnVehicle_F
		scope = 2;
		displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_0;
		category = "Multiplayer";
		icon = "\a3\Modules_f\data\iconRespawn_ca.paa";

		function = "BIS_fnc_moduleRespawnVehicle";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 1;

		class Arguments
		{
			class Delay
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Delay_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Delay_1;
  				defaultValue = "";
			};
/*
			class DesertedDelay
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_DesertedDelay_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_DesertedDelay_1;
  				defaultValue = "";
			};
*/
			class DesertedDistance
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_DesertedDistance_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_DesertedDistance_1;
  				defaultValue = "";
			};
			class RespawnCount
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_RespawnCount_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_RespawnCount_1;
  				defaultValue = "";
			};
			class Init
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Init_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Init_1;
  				defaultValue = "";
			};
			class Position
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_1;
				class values
				{
					class Start		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_Start_0;			value = 0; default = 1;};
					class Death		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_Death_0;			value = 1;};
					class MarkerDefault	{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_MarkerDefault_0;		value = 2;};
					class MarkerWEST	{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_MarkerWEST_0;		value = 4;};
					class MarkerEAST	{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_MarkerEAST_0;		value = 3;};
					class MarkerGUER	{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_MarkerGUER_0;		value = 5;};
					class MarkerCIV		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_MarkerCIV_0;		value = 6;};
					class MarkerKiller	{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_MarkerKiller_0;		value = 7;};
					class Synced		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Position_values_Synced;			value = 8;};
				};
			};
			class PositionType
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_PositionType_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_PositionType_1;
				class values
				{
					class Random		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_PositionType_values_Random_0;		value = 0; default = 1;};
					class Newest		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_PositionType_values_Newest_0;		value = 1;};
					class Oldest		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_PositionType_values_Oldest_0;		value = 2;};
				};
			};
			class Wreck
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_1;
				class values
				{
					class Preserve		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_values_Preserve_0;			value = 0;}; 
					class Delete		{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_values_Delete_0;			value = 1;}; 
					class DeleteEffect	{name = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_Wreck_values_DeleteEffect_0;		value = 2; default = 1;}; 
				};
			};
			class ShowNotification
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_ShowNotification_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_ShowNotification_1;
				class values
				{
					class Enabled			{name = $STR_DISP_OPT_ENABLED;		value = 1; default = 1;}; 
					class Disabled			{name = $STR_DISP_OPT_DISABLED;		value = 0;}; 
				};
			};
			class ForcedRespawn
			{
				displayName = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_ForcedRespawn_0;
				description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_Arguments_ForcedRespawn_1;
				class values
				{
					class Enabled			{name = $STR_DISP_OPT_ENABLED;		value = 1;}; 
					class Disabled			{name = $STR_DISP_OPT_DISABLED;		value = 0; default = 1;}; 
				};
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description = $STR_A3_CfgVehicles_ModuleRespawnVehicle_F_ModuleDescription_0;
			position = 1;
			sync[] = {"AnyVehicle"};
		};
	};
};
