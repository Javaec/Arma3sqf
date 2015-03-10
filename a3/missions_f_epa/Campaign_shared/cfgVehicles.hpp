class Vehicles
{
	class Matrix
	{
		B_G_Offroad_01_F[] = {"B_G_Offroad_01_F_1","B_G_Offroad_01_F_2","B_G_Offroad_01_F_3"};
		O_G_Offroad_01_F[] = {"B_G_Offroad_01_F_1","B_G_Offroad_01_F_2","B_G_Offroad_01_F_3"};
		I_G_Offroad_01_F[] = {"B_G_Offroad_01_F_1","B_G_Offroad_01_F_2","B_G_Offroad_01_F_3"};

		C_Offroad_01_F[] =
		{
			"C_Offroad_01_F_RedCivil",
			"C_Offroad_01_F_RedTerrain",
			"C_Offroad_01_F_YellowCivil",
			"C_Offroad_01_F_YellowTerrain",
			"C_Offroad_01_F_WhiteCivil",
			"C_Offroad_01_F_WhiteTerrain",
			"C_Offroad_01_F_BlueCivil",
			"C_Offroad_01_F_BlueTerrain",
			"C_Offroad_01_F_PurpleCivil",
			"C_Offroad_01_F_SexyCivil"
		};

		C_Hatchback_01_F[] =
		{
			"C_Hatchback_01_F_01",
			"C_Hatchback_01_F_02",
			"C_Hatchback_01_F_03",
			"C_Hatchback_01_F_04",
			"C_Hatchback_01_F_05",
			"C_Hatchback_01_F_06",
			"C_Hatchback_01_F_07",
			"C_Hatchback_01_F_08",
			"C_Hatchback_01_F_09",
			"C_Hatchback_01_F_10"
		};

		C_Hatchback_01_sport_F[] =
		{
			"C_Hatchback_01_sport_F_01",
			"C_Hatchback_01_sport_F_02",
			"C_Hatchback_01_sport_F_03",
			"C_Hatchback_01_sport_F_04",
			"C_Hatchback_01_sport_F_05",
			"C_Hatchback_01_sport_F_06"
		};

		C_SUV_01_F[] = {"C_SUV_01_F_1","C_SUV_01_F_2","C_SUV_01_F_3","C_SUV_01_F_4"};

		C_Van_01_transport_F[] = {"C_Van_01_F_1","C_Van_01_F_2"};
		C_Van_01_box_F[] = {"C_Van_01_F_1","C_Van_01_F_2"};
		C_Van_01_fuel_F[] = {"C_Van_01_F_1","C_Van_01_F_2"};

		C_Quadbike_01_F[] =
		{
			"C_Quadbike_01_F_Black",
			"C_Quadbike_01_F_Blue",
			"C_Quadbike_01_F_Red",
			"C_Quadbike_01_F_White"
		};
	};


	class Variants
	{
		/*----------------------------------------------------------------------------------

			QUADBIKE - CIVIL

		------------------------------------------------------------------------------------*/
		class C_Quadbike_01_F_Black
		{
			all[]	 = {};
			texture1 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa";
			texture2 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa";

			hide[]	 = {};
		};
		class C_Quadbike_01_F_Blue:C_Quadbike_01_F_Black
		{
			texture1 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLUE_CO.paa";
			texture2 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa";
		};
		class C_Quadbike_01_F_Red:C_Quadbike_01_F_Black
		{
			texture1 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa";
			texture2 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVRED_CO.paa";
		};
		class C_Quadbike_01_F_White:C_Quadbike_01_F_Black
		{
			texture1 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa";
			texture2 = "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa";
		};

		/*----------------------------------------------------------------------------------

			VAN - TRANSPORT

		------------------------------------------------------------------------------------*/
		class C_Van_01_F_1
		{
			all[]	 = {};
			texture1 = "\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa";
			texture2 = "\A3\soft_f_gamma\van_01\Data\van_01_tank_CO.paa";

			hide[]	 = {};
		};
		class C_Van_01_F_2:C_Van_01_F_1
		{
			texture1 = "\A3\soft_f_gamma\van_01\Data\van_01_ext_red_CO.paa";
			texture2 = "\A3\soft_f_gamma\van_01\Data\van_01_tank_red_CO.paa";
		};

		/*----------------------------------------------------------------------------------

			SUV - CIVIL

		------------------------------------------------------------------------------------*/
		class C_SUV_01_F_1
		{
			all[]	 = {};
			texture1 = "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa";
			texture2 = "";

			hide[]	 = {};
		};
		class C_SUV_01_F_2:C_SUV_01_F_1
		{
			texture1 = "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa";
		};
		class C_SUV_01_F_3:C_SUV_01_F_1
		{
			texture1 = "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa";
		};
		class C_SUV_01_F_4:C_SUV_01_F_1
		{
			texture1 = "\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa";
		};

		/*----------------------------------------------------------------------------------

			HATCHBACK - CIVIL

		------------------------------------------------------------------------------------*/
		class C_Hatchback_01_F_01
		{
			all[]	 = {};
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa";
			texture2 = "";

			hide[]	 = {};
		};
		class C_Hatchback_01_F_02:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa";
		};
		class C_Hatchback_01_F_03:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa";
		};
		class C_Hatchback_01_F_04:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa";
		};
		class C_Hatchback_01_F_05:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa";
		};
		class C_Hatchback_01_F_06:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa";
		};
		class C_Hatchback_01_F_07:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa";
		};
		class C_Hatchback_01_F_08:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa";
		};
		class C_Hatchback_01_F_09:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa";
		};
		class C_Hatchback_01_F_10:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa";
		};

		/*----------------------------------------------------------------------------------

			HATCHBACK - SPORTS

		------------------------------------------------------------------------------------*/
		class C_Hatchback_01_sport_F_01:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa";
		};
		class C_Hatchback_01_sport_F_02:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa";
		};
		class C_Hatchback_01_sport_F_03:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa";
		};
		class C_Hatchback_01_sport_F_04:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa";
		};
		class C_Hatchback_01_sport_F_05:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa";
		};
		class C_Hatchback_01_sport_F_06:C_Hatchback_01_F_01
		{
			texture1 = "\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa";
		};

		/*----------------------------------------------------------------------------------

			OFFROAD - MILITARY

		------------------------------------------------------------------------------------*/
		class B_G_Offroad_01_F_1	//default skirmish vehicle
		{
			all[]	 = {"HidePolice","HideServices","HideBackpacks","HideBumper1","HideBumper2","HideConstruction","HideDoor1","HideDoor2","HideDoor3","HideGlass2"};
			texture1 = "\A3\soft_f_gamma\Offroad_01\Data\Offroad_01_ext_IG01_CO.paa";
			texture2 = "\A3\soft_f_gamma\Offroad_01\Data\Offroad_01_ext_IG01_CO.paa";

			hide[]	 = {"HidePolice","HideServices","HideDoor1","HideDoor2","HideDoor3","HideGlass2"};
		};
		class B_G_Offroad_01_F_2:B_G_Offroad_01_F_1
		{
			hide[]  = {"HidePolice","HideServices","HideDoor3"};
		};
		class B_G_Offroad_01_F_3:B_G_Offroad_01_F_1
		{
			hide[]  = {"HidePolice","HideServices"};
		};

		/*----------------------------------------------------------------------------------

			OFFROAD - CIVIL

		------------------------------------------------------------------------------------*/
		//RED
		class C_Offroad_01_F_RedCivil
		{
			all[]	 = {"HidePolice","HideServices","HideBackpacks","HideBumper1","HideBumper2","HideConstruction","HideDoor1","HideDoor2","HideDoor3","HideGlass2"};
			texture1 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_co.paa";
			texture2 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_co.paa";

			hide[]	 = {"HidePolice","HideServices","HideConstruction","HideBackpacks","HideBumper1","HideBumper2"};
		};
		class C_Offroad_01_F_RedTerrain:C_Offroad_01_F_RedCivil
		{
			hide[]	 = {"HidePolice","HideServices","HideBackpacks"};
		};
		//YELLOW
		class C_Offroad_01_F_YellowCivil:C_Offroad_01_F_RedCivil
		{
			texture1 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa";
			texture2 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa";

			hide[]	 = {"HidePolice","HideServices","HideConstruction","HideBackpacks","HideBumper1","HideBumper2","HideDoor3"};
		};
		class C_Offroad_01_F_YellowTerrain:C_Offroad_01_F_YellowCivil
		{
			hide[]  = {"HidePolice","HideServices","HideDoor1","HideDoor2","HideGlass2","HideDoor3","HideBackpacks"};
		};
		//WHITE
		class C_Offroad_01_F_WhiteCivil:C_Offroad_01_F_RedCivil
		{
			texture1 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa";
			texture2 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa";

			hide[]	 = {"HidePolice","HideServices","HideConstruction","HideBackpacks","HideBumper1","HideBumper2","HideDoor3"};
		};
		class C_Offroad_01_F_WhiteTerrain:C_Offroad_01_F_WhiteCivil
		{
			hide[]	 = {"HidePolice","HideServices","HideBackpacks","HideDoor3"};
		};
		//BLUE
		class C_Offroad_01_F_BlueCivil:C_Offroad_01_F_RedCivil
		{
			texture1 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa";
			texture2 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa";

			hide[]	 = {"HidePolice","HideServices","HideConstruction","HideBackpacks","HideBumper1","HideBumper2","HideDoor3"};
		};
		class C_Offroad_01_F_BlueTerrain:C_Offroad_01_F_BlueCivil
		{
			hide[]	 = {"HidePolice","HideServices","HideBackpacks","HideDoor3"};
		};
		//PURPLE
		class C_Offroad_01_F_PurpleCivil:C_Offroad_01_F_RedCivil
		{
			texture1 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE04_CO.paa";
			texture2 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE04_CO.paa";

			hide[]	 = {"HidePolice","HideServices","HideConstruction","HideBackpacks","HideBumper1","HideBumper2"};
		};
		class C_Offroad_01_F_SexyCivil:C_Offroad_01_F_RedCivil
		{
			texture1 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE05_CO.paa";
			texture2 = "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE05_CO.paa";

			hide[]	 = {"HidePolice","HideServices","HideConstruction","HideBackpacks","HideBumper1","HideBumper2"};
		};
	};
};

