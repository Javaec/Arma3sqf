////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Tue Mar 10 00:08:15 2015 : Source 'file' date Tue Mar 10 00:08:15 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class functions_f_epa : config.bin{
class CfgPatches
{
	class A3_Functions_F_EPA
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
			class blackOut
			{
				file = "\A3\Functions_F_EPA\Misc\fn_blackOut.sqf";
			};
			class blackIn
			{
				file = "\A3\Functions_F_EPA\Misc\fn_blackIn.sqf";
			};
			class buildingPositions
			{
				file = "\A3\Functions_F_EPA\Misc\fn_buildingPositions.sqf";
			};
			class isBuildingEnterable
			{
				file = "\A3\Functions_F_EPA\Misc\fn_isBuildingEnterable.sqf";
			};
			class addStackedEventHandler
			{
				file = "\A3\Functions_F_EPA\Misc\fn_addStackedEventHandler.sqf";
			};
			class executeStackedEventHandler
			{
				file = "\A3\Functions_F_EPA\Misc\fn_executeStackedEventHandler.sqf";
			};
			class removeStackedEventHandler
			{
				file = "\A3\Functions_F_EPA\Misc\fn_removeStackedEventHandler.sqf";
			};
			class initExpo
			{
				file = "\a3\Functions_F_EPA\Misc\fn_initExpo.sqf";
			};
			class enableSaving
			{
				file = "\A3\Functions_F_EPA\Misc\fn_enableSaving.sqf";
			};
			class disableSaving
			{
				file = "\A3\Functions_F_EPA\Misc\fn_disableSaving.sqf";
			};
		};
		class Spawning
		{
			class prepareAO
			{
				file = "\A3\Functions_F_EPA\Spawning\fn_prepareAO.sqf";
			};
		};
		class GUI
		{
			class quotations
			{
				file = "\A3\Functions_F_EPA\GUI\fn_quotations.sqf";
			};
			class showMarkers
			{
				file = "\A3\Functions_F_EPA\GUI\fn_showMarkers.sqf";
			};
			class isInZoom
			{
				file = "\A3\Functions_F_EPA\GUI\fn_isInZoom.sqf";
			};
		};
		class Geometry
		{
			class isInsideArea
			{
				file = "\A3\Functions_F_EPA\Geometry\fn_isInsideArea.sqf";
			};
			class relPosObject
			{
				file = "\A3\Functions_F_EPA\Geometry\fn_relPosObject.sqf";
			};
		};
	};
};
//};
