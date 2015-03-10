//per-hub specific data
class HubObjects
{
	/*--------------------------------------------------------------------------------------------------

		ANCHORS

	--------------------------------------------------------------------------------------------------*/

	class SurfaceObjects
	{
		class Default
		{
			show		= 1;

			anchors[] 	= {{0,0,1000}};		//model anchors
			anchorMagnet	= 0.10;			//how much will the anchor move towards adjacent soldier
			maxSize		= 3;
			probability 	= 0.9;
			fixDir		= 0;
			randomX		= 0.1;
			randomY		= 0.1;

			useXtras	= 0;
			remGroup[] 	= {};
			addGroup[] 	= {};
		};

		//modern 'military looking' tables
		class Land_CampingTable_small_F:Default
		{
			useXtras	= 1;
			addGroup[]	= {};
			remGroup[] 	= {};
		};
		class Land_CampingTable_F:Land_CampingTable_small_F
		{
			anchors[] 	= {{-0.5,0,1000},{0.5,0,1000}};
			addGroup[]	= {};
		};

		//wooden tables
		class Land_WoodenTable_small_F:Default
		{
			maxSize		= 4;
			fixDir		= 90;

		};
		class Land_WoodenTable_large_F:Land_WoodenTable_small_F
		{
			anchors[] 	= {{0,-0.6,1000},{0,0.6,1000}};
		};

		//office desk
		class Land_TableDesk_F:Default
		{
			maxSize 	= 4;
			anchors[] 	= {{0,0.1,1000}};
			probability 	= 1;
			useXtras	= 1;
			addGroup[]	= {"Devices","Devices","Devices"};
			remGroup[] 	= {};
		};

		//big 'coffin like' box
		/*
		class Land_WoodenBox_F:Default
		{
			maxSize 	= 2.2;
			anchors[] 	= {{-0.75,0,1000},{0,0,1000},{0.75,0,1000}};
			probability 	= 0.3;
		};
		*/

		//red wooden/metal shelves
		class Land_Metal_wooden_rack_F:Default
		{
			maxSize	  	= 3;
			anchors[] 	= {{0,0,0.105,3,0.493}};
			remGroup[] 	= {"Devices","Office","OfficeSmall","Cans"};
			randomX		= 0.2;
		};

		//small 3-layer shelves
		class Land_ShelvesWooden_F:Default
		{
			maxSize 	= 2.5;
			anchors[] 	= {{0,0,0.307,2,0.328}};
			fixDir 		= 90;
			remGroup[] 	= {"Devices","Cans"};
		};
		class Land_ShelvesWooden_khaki_F:Land_ShelvesWooden_F
		{
		};
		class Land_ShelvesWooden_blue_F:Land_ShelvesWooden_F
		{
		};


		class Land_Metal_rack_Tall_F:Default
		{
			maxSize 	= 1.9;
			anchors[] 	= {{-0.2,0,0.1,4,0.38},{0.2,0,0.1,4,0.38}};
			fixDir 		= 180;
			probability 	= 0.9;
		};
		class Land_Metal_rack_F:Land_Metal_rack_Tall_F
		{
			anchors[] 	= {{-0.2,0,0.1,3,0.45},{0.2,0,0.1,3,0.45}};
		};

		class Land_Rack_F:Default
		{
			maxSize 	= 1.5;
			anchors[] 	= {{0,-0.35,0.095,3,0.335},{0,0.35,0.095,3,0.335}};
			fixDir 		= 90;
			probability 	= 0.8;
		};

		/*----------------------------------------------------------------------------------

			CUSTOM ANCHOR SETUPS

		----------------------------------------------------------------------------------*/

		class CampingTable_NoLeft:Land_CampingTable_F
		{
			anchors[] 	= {{-0.5,0,1000}};
		};
		class CampingTable_NoRight:Land_CampingTable_F
		{
			anchors[] 	= {{0.5,0,1000}};
		};
		class CampingTable_Empty:Land_CampingTable_F
		{
			anchors[] 	= {};
		};

		class WoodenTable_NoLeft:Land_WoodenTable_large_F
		{
			anchors[] 	= {{0,0.6,1000}};
		};
		class WoodenTable_NoRight:Land_WoodenTable_large_F
		{
			anchors[] 	= {{0,-0.6,1000}};
		};
		class WoodenTable_Empty:Land_WoodenTable_large_F
		{
			anchors[] 	= {};
		};

		/*----------------------------------------------------------------------------------

			CUSTOM OBJECT SETUPS

		----------------------------------------------------------------------------------*/

		//Used for "Land_Ground_sheet_blue_F" and similar.
		class WORKSHOP_Pallet:Default
		{
			useXtras	= 0;

			addGroup[] 	= {"Tools","Canisters"};
			remGroup[] 	= {"ToolsLarge","Devices","Cans"};

			anchors[] 	= {{0.35,0.35,1000},{-0.35,-0.35,1000},{-0.35,0.35,1000},{0.35,-0.35,1000}};

			anchorMagnet	= 0;
			maxSize		= 3;
			probability 	= 1;
			fixDir		= 0;
			randomX		= 0.1;
			randomY		= 0.1;
		};

		//Used for "Land_Ground_sheet_blue_F" and similar.
		class INFIRMARY_SleepingMat:Default
		{
			anchors[] 	= {{0,-0.7,1000},{0,-0.25,1000},{0,0.25,1000},{0,0.7,1000}};
			addGroup[] 	= {"MedicalLarge","MedicalSmall","MedicalSmall","MedicalSmall"};
			remGroup[]	= {"Devices"};
			fixDir		= 90;
			useXtras	= 1;
			probability 	= 0.75;
			anchorMagnet	= 0;
			randomX		= 0.1;
			randomY		= 0.1;
		};

		//Used for "Land_Ground_sheet_blue_F" and similar.
		class INFIRMARY_SleepingMat_Hidden:Default
		{
			show		= 0;

			anchors[] 	= {{0,-0.7,0.02},{0,-0.25,0.02},{0,0.25,0.02},{0,0.7,0.02}};
			addGroup[] 	= {"MedicalLarge","MedicalSmall","MedicalSmall","MedicalSmall"};
			remGroup[]	= {"Devices"};
			fixDir		= 90;
			useXtras	= 1;
			probability 	= 0.75;
			anchorMagnet	= 0;
			randomX		= 0.1;
			randomY		= 0.1;
		};

		//Used for camping tables in armory.
		class ARMORY_CampingTable:Land_CampingTable_small_F
		{
			anchors[] 	= {{-0.8,0,1000},{-0.5,0,1000},{-0.2,0,1000},{0.2,0,1000},{0.5,0,1000},{0.8,0,1000}};
			addGroup[] 	= {"Weapons","Weapons","Weapons","Grenades"};
			remGroup[]	= {"Devices"};
			fixDir		= 90;
			useXtras	= 0;
			probability 	= 1;
			anchorMagnet	= 0;
			randomX		= 0;
			randomY		= 0.05;
		};
		class ARMORY_CampingTableSmall:ARMORY_CampingTable
		{
			anchors[] 	= {{-0.30,0,1000},{0,0,1000},{0.30,0,1000}};
		};

		//Used for wooden tables in armory.
		class ARMORY_WoodenTableSmall:Land_WoodenTable_small_F
		{
			anchors[] 	= {{0,-0.5,1000},{0,-0.2,1000},{0,0.2,1000},{0,0.5,1000}};

			addGroup[] 	= {"Weapons","Weapons","Weapons","Grenades"};
			remGroup[]	= {"Devices"};
			fixDir		= 0;
			useXtras	= 0;
			probability 	= 1;
			anchorMagnet	= 0;
			randomX		= 0;
			randomY		= 0.05;
		};
		class ARMORY_WoodenTable:ARMORY_WoodenTableSmall
		{
			anchors[] 	= {{0,-0.8,1000},{0,-0.5,1000},{0,-0.2,1000},{0,0.2,1000},{0,0.5,1000},{0,0.8,1000}};
		};

		//POI specific ---------------------------------------------------------------------
		class POI_SmugglerWeapons_CampingTable:ARMORY_CampingTable
		{
			addGroup[] 	= {"POI_SmugglerWeapons"};
			fixDir		= 270;
			remGroup[]	= {"Buckets","ToolsLarge","Tools","ToolsSmall","Cans","FoodSupplies","Office","OfficeSmall","Canisters","Devices","DevicesSmall","VIP","Weapons","Magazines","AmmoBoxes","Launchers","MedicalLarge","MedicalSmall","FirstAidKits","MediKits"};
		};
		class POI_SmugglerWeapons_CampingTableSmall:POI_SmugglerWeapons_CampingTable
		{
			anchors[] 	= {{-0.30,0,1000},{0,0,1000},{0.30,0,1000}};
		};

		class POI_SmugglerWeapons_WoodenTableSmall:ARMORY_WoodenTableSmall
		{
			addGroup[] 	= {"POI_SmugglerWeapons"};
			fixDir		= 180;
			remGroup[]	= {"Buckets","ToolsLarge","Tools","ToolsSmall","Cans","FoodSupplies","Office","OfficeSmall","Canisters","Devices","DevicesSmall","VIP","Weapons","Magazines","AmmoBoxes","Launchers","MedicalLarge","MedicalSmall","FirstAidKits","MediKits"};
		};
		class POI_SmugglerWeapons_WoodenTable:POI_SmugglerWeapons_WoodenTableSmall
		{
			anchors[] 	= {{0,-0.8,1000},{0,-0.5,1000},{0,-0.2,1000},{0,0.2,1000},{0,0.5,1000},{0,0.8,1000}};
		};
	};

	/*--------------------------------------------------------------------------------------------------

		OBJECT GROUPS

	--------------------------------------------------------------------------------------------------*/

	class Objects
	{
		class Default
		{
			fixDir = 0;
			fixPos[] = {0,0,0};
		};

		class Land_SatellitePhone_F:Default
		{
			fixDir = 180;
			fixPos[] = {0,0,0.005};
		};
		class Land_PortableLongRangeRadio_F:Default
		{
			fixDir = 180;
		};
		class Land_Notepad_F:Default
		{
			fixDir = 90;
		};
		class Land_Map_F:Default
		{
			fixDir = -90;
		};
		class Land_Map_unfolded_F:Default
		{
			fixDir = 180;
		};
		class Land_Suitcase_F:Default
		{
			size = 3.5;

			/*
			fixDir = 180;
			fixPitch = 90;
			fixPos[] = {0,0,-0.185};
			*/
		};

		class MediKits:Default
		{
			fixPos[] = {0,0,0.04};
		};
		class FirstAidKits:Default
		{
			fixPos[] = {0,0,0.04};
		};

		class launch_NLAW_F:Default
		{
			fixDir = -40;
			fixPos[] = {0,0,0.06};
			fixPitch = 0;
			fixBank = -2.6;
		};
		/*
		class launch_RPG32_F:Default
		{
			fixDir = -30;
			fixPos[] = {0,0,0.1};
		};
		class launch_I_Titan_F:Default
		{
			fixDir = -30;
			//fixPos[] = {-0.4,-0.4,-0.62};
			fixPos[] = {-0.5,-1.5,-0.62};
			fixPitch = -90;
			fixBank = 0;
		};
		class launch_I_Titan_short_F:launch_I_Titan_F
		{
		};
		*/
	};

	class ObjectGroups
	{
		class Default
		{
			rotationNoise[] = {-10,10};		//max allowed direction delta from the anchor direction

			fixPitch = 0;
			fixBank = 0;

			xGroups[] = {};
			xCount[] = {1,1};			//min / max count of the xtra objects
			xDirs[] = {60,300,100,260};		//possible direction offsets
			xConsistent = 0;			//shall xtra objects have same class as core object?
		};

		class Buckets:Default
		{
			size = 1.7;
			xGroups[] = {"ToolsSmall"};
			rotationNoise[] = {-180,180};

			class Pool
			{
				_0 = "Land_Bucket_F";
				_1 = "Land_Bucket_clean_F";
				_2 = "Land_BucketNavy_F";		//blue bucket
				_3 = "Land_Bucket_painted_F";		//old painted bucket
			};
		};
		class ToolsLarge:Default
		{
			size = 3;
			xGroups[] = {"ToolsSmall"};
			rotationNoise[] = {-15,15};

			class Pool
			{
				_0 = "Land_Axe_F";
				_1 = "Land_Axe_fire_F";
				_2 = "Land_Shovel_F";
			};
		};
		class Tools:Default
		{
			size = 2;
			xGroups[] = {"ToolsSmall"};
			rotationNoise[] = {-180,180};

			class Pool
			{
				_0 = "Land_DrillAku_F";			//aku dril
				_1 = "Land_ExtensionCord_F";
				_2 = "Land_Grinder_F";
				_3 = "Land_Saw_F";
				_4 = "Land_FireExtinguisher_F";
				_5 = "Land_MetalWire_F";
			};
		};
		class ToolsSmall:Default
		{
			size = 1;
			xGroups[] = {"ToolsSmall"};
			rotationNoise[] = {-180,180};

			class Pool
			{
				_00 = "Land_Gloves_F";			//working gloves
				_01 = "Land_Meter3m_F";
				_02 = "Land_MultiMeter_F";
				_03 = "Land_Pliers_F";
				_04 = "Land_Screwdriver_V1_F";
				_05 = "Land_Wrench_F";
				_06 = "Land_DuctTape_F";
				_07 = "Land_Battery_F";
				_08 = "Land_Matches_F";
				_09 = "Land_ButaneCanister_F";
				_10 = "Land_ButaneTorch_F";
				_11 = "Land_HeatPack_F";
				_12 = "Land_GasCooker_F";
				_13 = "Land_GasCanister_F";
			};
		};
		class Cans:Default
		{
			size = 0.7;
			xGroups[] = {};

			class Pool
			{
				_0 = "Land_Can_V1_F";
				_1 = "Land_Can_V2_F";
				_2 = "Land_Can_V3_F";
				_3 = "Land_Can_Rusty_F";
				_4 = "Land_Canteen_F";
				_5 = "Land_Canteen_F";
				_6 = "Land_BottlePlastic_V2_F";
				_7 = "Land_BottlePlastic_V2_F";
				_8 = "Land_BottlePlastic_V2_F";
				_9 = "Land_TinContainer_F";
			};
		};
		class FoodSupplies:Default
		{
			size = 1.0;
			xGroups[] = {};

			class Pool
			{
				_0 = "Land_BakedBeans_F";
				_1 = "Land_CerealsBox_F";
				_2 = "Land_PowderedMilk_F";
				_3 = "Land_RiceBox_F";
				_4 = "Land_CanOpener_F";
			};
		};
		class Office:Default
		{
			size = 1.7;
			xGroups[] = {"OfficeSmall","Cans","DevicesSmall"};
			xDirs[] = {60,300,80,280};

			class Pool
			{
				_0 = "Land_File1_F";			//documents
				_1 = "Land_FilePhotos_F";		//documents & photos
				_2 = "Land_File2_F";			//larger documents (top secret)
				_3 = "Land_Map_F";
				_4 = "Land_Map_unfolded_F";
				_5 = "Land_File1_F";
				_6 = "Land_Notepad_F";
			};
		};
		class OfficeSmall:Default
		{
			size = 0.7;

			class Pool
			{
				_00 = "Land_PenBlack_F";
				_01 = "Land_PenRed_F";
				_02 = "Land_PencilBlue_F";
				_03 = "Land_PencilGreen_F";
				_04 = "Land_PencilRed_F";
				_05 = "Land_PencilYellow_F";
				_06 = "Land_Compass_F";
				_07 = "Land_Compass_F";
				_08 = "Land_DuctTape_F";
				_09 = "Land_Battery_F";
				_10 = "Land_Matches_F";
			};
		};
		class Canisters:Default
		{
			size = 3;
			rotationNoise[] = {-180,180};

			class Pool
			{
				_0 = "Land_CanisterFuel_F";		//green metal canister
				_1 = "Land_CanisterPlastic_F";		//white plastic canister
			};
		};
		class Devices:Default
		{
			size = 2.2;
			xGroups[] = {"Cans","DevicesSmall"};
			xCount[] = {0,1};
			xDirs[] = {80,280};

			class Pool
			{
				_0 = "Land_Laptop_F";			//closed notebook - wrongly offset
				_1 = "Land_Laptop_unfolded_F";		//open notebook
				_2 = "Land_SatellitePhone_F";
			};
		};
		class DevicesSmall:Default
		{
			size = 0.8;
			xGroups[] = {"Cans"};

			class Pool
			{
				_0 = "Land_FMradio_F";			//radio
				_1 = "Land_HandyCam_F";			//handheld camera
				_2 = "Land_MobilePhone_smart_F";	//smartphone
				_3 = "Land_MobilePhone_old_F";		//old mobile phone
				_4 = "Land_PortableLongRangeRadio_F";
				_5 = "Land_MobilePhone_smart_F";
				_6 = "Land_MobilePhone_smart_F";
				_7 = "Land_PortableLongRangeRadio_F";
				_8 = "Land_PortableLongRangeRadio_F";
			};
		};
		class VIP:Default
		{
			size = 2;

			class Pool
			{
				_0 = "Land_Suitcase_F";			//silver suitcase
				_1 = "Land_Money_F";			//pile of money
				_2 = "Land_Suitcase_F";
				_3 = "Land_Suitcase_F";
			};
		};
		class Weapons:Default
		{
			size = 3;

			fixPos[] = {0,0,0.002};

			class Pool
			{
				_00 = "arifle_MX_SW_Hamr_pointer_F";
				_01 = "arifle_MX_SW_Hamr_pointer_F";
				_02 = "arifle_MX_SW_pointer_F";
				_03 = "arifle_MX_SW_pointer_F";
				_04 = "LMG_Mk200_MRCO_F";
				_05 = "LMG_Mk200_pointer_F";
				_06 = "LMG_Mk200_F";
				_07 = "arifle_MXM_SOS_pointer_F";
				_08 = "arifle_MXM_RCO_pointer_snds_F";
				_09 = "arifle_MXM_Hamr_pointer_F";
				_10 = "arifle_MXM_DMS_F";
				_11 = "arifle_MX_GL_Hamr_pointer_F";
				_12 = "arifle_Katiba_GL_ARCO_pointer_F";
				_13 = "arifle_Katiba_GL_Nstalker_pointer_F";
				_14 = "arifle_MX_GL_Holo_pointer_snds_F";
				_15 = "arifle_Katiba_GL_ACO_pointer_snds_F";
				_16 = "arifle_MX_GL_ACO_pointer_F";
				_17 = "arifle_Katiba_GL_ACO_pointer_F";
				_18 = "arifle_MX_GL_ACO_F";
				_19 = "arifle_Katiba_GL_ACO_F";
				_20 = "arifle_Mk20_GL_MRCO_pointer_F";
				_21 = "arifle_TRG21_GL_ACO_pointer_F";
				_22 = "arifle_TRG21_GL_MRCO_F";
				_23 = "arifle_Mk20_GL_ACO_F";
				_24 = "arifle_MX_GL_F";
				_25 = "arifle_Katiba_GL_F";
				_26 = "arifle_Mk20_GL_F";
				_27 = "arifle_TRG21_GL_F";
				_28 = "arifle_MXC_SOS_point_snds_F";
				_29 = "arifle_MX_ACO_pointer_snds_F";
				_30 = "arifle_Katiba_ARCO_pointer_snds_F";
				_31 = "arifle_Katiba_C_ACO_pointer_snds_F";
				_32 = "arifle_MX_ACO_pointer_F";
				_33 = "arifle_Katiba_ARCO_pointer_F";
				_34 = "arifle_Katiba_ARCO_F";
				_35 = "arifle_Katiba_C_ACO_pointer_F";
				_36 = "arifle_Katiba_C_ACO_F";
				_37 = "arifle_MX_ACO_F";
				_38 = "arifle_Katiba_ACO_F";
				_39 = "arifle_Katiba_C_ACO_F";
				_40 = "arifle_MXC_Holo_pointer_snds_F";
				_41 = "arifle_MXC_Holo_pointer_F";
				_42 = "arifle_Mk20_ACO_pointer_F";
				_43 = "arifle_TRG21_MRCO_F";
				_44 = "arifle_Mk20C_ACO_pointer_F";
				_45 = "arifle_TRG21_ACO_pointer_F";
				_46 = "arifle_TRG21_ARCO_pointer_F";
				_47 = "arifle_TRG20_ACO_F";
				_48 = "arifle_TRG20_ACO_Flash_F";
				_49 = "arifle_TRG20_ACO_pointer_F";
				_50 = "arifle_Mk20_ACO_F";
				_51 = "arifle_Mk20C_ACO_F";
				_52 = "arifle_Mk20_MRCO_F";
				_53 = "arifle_Mk20_MRCO_pointer_F";
				_54 = "arifle_Mk20_Holo_F";
				_55 = "arifle_TRG20_Holo_F";
				_56 = "arifle_MXM_F";
				_57 = "arifle_MX_F";
				_58 = "arifle_MXC_F";
				_59 = "arifle_Katiba_F";
				_60 = "arifle_Katiba_C_F";
				_61 = "arifle_Mk20_pointer_F";
				_62 = "arifle_Mk20C_F";
				_63 = "arifle_Mk20_F";
				_64 = "arifle_TRG20_F";
				_65 = "arifle_TRG21_F";
				_66 = "arifle_mx_gl_black_f";
				_67 = "arifle_mxm_black_f";
				_68 = "hgun_acpc2_f";
				_69 = "smg_02_f";
				_70 = "srifle_ebr_f";
			};
		};
		class POI_SmugglerWeapons:Weapons
		{
			class Pool
			{
				_0 = "arifle_MX_ACO_F";
				_1 = "arifle_MXM_F";
				_2 = "arifle_MX_F";
				_3 = "arifle_MX_GL_F";
				_4 = "arifle_MX_SW_F";
			};
		};
		class Magazines:Default
		{
			size = 0.5;
			rotationNoise[] = {-10,10};

			xGroups[] = {"Magazines"};
			xCount[] = {0,2};			//min / max count of the xtra objects
			xDirs[] = {90,270};			//possible direction offsets
			xConsistent = 1;			//shall xtra objects have same class as core object?

			class Pool
			{
				_0 = "Land_Magazine_rifle_F";
			};
		};
		class AmmoBoxes:Default
		{
			size = 0.8;
			rotationNoise[] = {-10,10};

			xGroups[] = {"AmmoBoxes"};
			xCount[] = {0,2};			//min / max count of the xtra objects
			xDirs[] = {90,270};			//possible direction offsets
			xConsistent = 1;			//shall xtra objects have same class as core object?

			class Pool
			{
				_0 = "Land_Ammobox_rounds_F";
			};
		};
		class Launchers:Default
		{
			size = 4;
			rotationNoise[] = {-10,10};

			class Pool
			{
				_0 = "launch_nlaw_f";

				/*
				_1 = "launch_i_titan_f";
				_7 = "launch_rpg32_f";
				_8 = "launch_i_titan_short_f";
				_9 = "launch_i_titan_f";
				*/
			};
		};
		class Grenades:Default
		{
			size = 0.6;
			rotationNoise[] = {-180,180};			//max allowed direction delta from the anchor direction

			xGroups[] = {"Grenades"};
			xConsistent = 1;
			xCount[] = {2,4};
			xDirs[] = {60,300,120,240};

			class Pool
			{
				_0 = "handgrenade";
				_1 = "handgrenade";
				_2 = "handgrenade";
				_3 = "smokeshell";
				_4 = "smokeshellblue";
				_5 = "smokeshellgreen";
			};
		};
		class MedicalLarge:Default
		{
			size = 1.5;
			rotationNoise[] = {-180,180};

			xGroups[] = {"MedicalSmall"};
			xCount[] = {0,1};
			xDirs[] = {80,280};

			class Pool
			{
				_0 = "Land_Defibrillator_F";
				_1 = "Land_BloodBag_F";
				_2 = "Land_DisinfectantSpray_F";
			};
		};
		class MedicalSmall:Default
		{
			size = 0.9;
			rotationNoise[] = {-180,180};			//max allowed direction delta from the anchor direction

			xGroups[] = {"MedicalSmall"};
			xConsistent = 0;
			xCount[] = {1,4};
			xDirs[] = {0,60,120,180,240,300};

			class Pool
			{
				_0 = "Land_Bandage_F";
				_1 = "Land_Antibiotic_F";
				_2 = "Land_PainKillers_F";
				_3 = "Land_VitaminBottle_F";
				_4 = "Land_WaterPurificationTablets_F";
			};
		};
		class FirstAidKits:Default
		{
			size = 0.7;
			rotationNoise[] = {-10,10};

			xGroups[] = {"FirstAidKits"};
			xConsistent = 1;
			xCount[] = {0,4};
			xDirs[] = {60,300,120,240};

			class Pool
			{
				_0 = "FirstAidKit";
			};
		};

		class MediKits:Default
		{
			size = 1.5;
			rotationNoise[] = {-20,20};

			class Pool
			{
				_0 = "MediKit";
			};
		};
	};

	/*--------------------------------------------------------------------------------------------------

		HUB SECTIONS

	--------------------------------------------------------------------------------------------------*/

	class HubSections
	{
		class Default
		{
			probability = 0.6;

			objGroups[] = {"DevicesSmall","Cans"};
		};

		class Infirmary:Default
		{
			objGroups[] = {"MedicalLarge","MedicalSmall","FirstAidKits","MediKits"};
		};
		class Office:Default
		{
			objGroups[] = {"Office","Office","Office","Office","Devices","Devices"};
		};
		class Canteen:Default
		{
			objGroups[] = {"Cans"};
		};
		class FoodStorage:Default
		{
			objGroups[] = {"FoodSupplies"};
		};
		class WeaponStash:Default
		{
			probability = 1;

			objGroups[] = {"Weapons","Weapons","Weapons","Grenades","Launchers"};
		};
		class Workshop:Default
		{
			probability = 0.5;

			objGroups[] = {"Tools","Tools","Tools","Buckets","Canisters"};
		};
		class Storage:Default
		{
			probability = 0.7;

			objGroups[] = {"Tools","Buckets","ToolsLarge","Canisters"};
		};

		//POI specific sections ------------------------------------------------------------
		class NoObjects:Default
		{
			probability = 0;

			objGroups[] = {};
		};
		class OfficeLowTech:Default
		{
			probability = 0.5;

			objGroups[] = {"Office","Office","Office","DevicesSmall"};
		};
		class InfirmaryKits:Default
		{
			probability = 0.8;

			objGroups[] = {"FirstAidKits","FirstAidKits","MediKits"};
		};
	};
};

/*
class Boxes
{
	box_nato_wps_f[] =
	{
		"arifle_mx_f",
		"arifle_mx_gl_f",
		"arifle_mx_sw_f",
		"arifle_mxc_f",
		"hgun_p07_f",
		"smg_01_f",
		"hgun_pistol_heavy_01_f"
	};

	box_nato_ammo_f[] =
	{
		"30rnd_65x39_caseless_mag",
		"16rnd_9x21_mag",
		"30rnd_45acp_mag_smg_01",
		"100rnd_65x39_caseless_mag_tracer",
		"11rnd_45acp_mag",
		"30rnd_65x39_caseless_mag",
		"16rnd_9x21_mag",
		"30rnd_45acp_mag_smg_01",
		"20rnd_762x51_mag",
		"100rnd_65x39_caseless_mag_tracer",
		"nlaw_f"
	};

	box_nato_grenades_f[] =
	{
		"1rnd_he_grenade_shell",
		"1rnd_smoke_grenade_shell",
		"1rnd_smokegreen_grenade_shell",
		"1rnd_smokered_grenade_shell",
		"1rnd_smokeyellow_grenade_shell",
		"1rnd_smokepurple_grenade_shell",
		"1rnd_smokeblue_grenade_shell",
		"1rnd_smokeorange_grenade_shell",
		"handgrenade",
		"minigrenade",
		"smokeshell",
		"smokeshellred",
		"smokeshellgreen",
		"smokeshellyellow",
		"smokeshellpurple",
		"smokeshellblue",
		"smokeshellorange"
	};
};
*/