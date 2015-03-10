////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Tue Mar 10 00:08:15 2015 : Source 'file' date Tue Mar 10 00:08:15 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class functions_f_epc : config.bin{
class CfgPatches
{
	class A3_Functions_F_EPC
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Functions_F"};
	};
};
class CfgFunctions
{
	class A3
	{
		class Misc
		{
			class earthquake
			{
				file = "\A3\Functions_F_EPC\Misc\fn_earthquake.sqf";
			};
		};
	};
};
//};
