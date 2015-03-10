class WorldObjects
{
	class Stratis
	{
		class Default
		{
			classOk  	= "House";
			classRuin  	= "";
			position[] 	= {0,0,0};
			radius     	= 20;
			bruteForce	= 0;
		};

		// Radio tower (after A_in)
		class RadioTower1: Default
		{
			classOk = "Land_TTowerBig_2_F";
			classRuin = "Land_TTowerBig_2_ruins_F";
			position[] = {3497.47,4916.27,0.504089};
			radius = 0;
			bruteForce = 1;
		};

		// Girna buildings (after A_m02)
		class GirnaHouse1: Default
		{
			classOk = "Land_i_Stone_Shed_V1_F";
			classRuin = "Land_Stone_Shed_V1_ruins_F";
			position[] = {2077.706,2747.152,0.000};
			radius = 10;
		};

		class GirnaHouse2: Default
		{
			classOk = "Land_i_Stone_Shed_V1_F";
			classRuin = "Land_Stone_Shed_V1_ruins_F";
			position[] = {2044.161,2737.542,0.000};
			radius = 10;
		};

		class GirnaHouse3: Default
		{
			classOk = "Land_i_Stone_HouseSmall_V1_F";
			classRuin = "Land_Stone_HouseSmall_V1_ruins_F";
			position[] = {2042.714,2723.036,0.000};
			radius = 10;
		};

		class GirnaHouse4: Default
		{
			classOk = "Land_Slum_House03_F";
			classRuin = "Land_Slum_House03_ruins_F";
			position[] = {2035.023,2713.804,0.000};
			radius = 10;
		};

		class GirnaHouse5: Default
		{
			classOk = "Land_i_Stone_HouseBig_V1_F";
			classRuin = "Land_Stone_HouseBig_V1_ruins_F";
			position[] = {2040.271,2704.476,0.000};
			radius = 10;
		};

		// Mike-26 (after A_m03)
		class Mike26: Default
		{
			classOk  = "Land_Radar_F";
			classRuin = "Land_Radar_ruins_F";
			position[] = {4357.12,3893.8,-0.00242615};
			bruteForce = 1;
		};
	};

	class Altis
	{
		class Default
		{
			classOk  	= "House";
			classRuin  	= "";
			position[] 	= {0,0,0};
			radius     	= 20;
			bruteForce	= 0;
		};
	};
};