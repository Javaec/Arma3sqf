author = $STR_A3_Bohemia_Interactive;
allowSubordinatesTakeWeapons = 1;
enableCampaignSystems = 1;

#define SET_MISSION_META(_stage,_class,_version,_name,_text) \
	onLoadName = _name; \
	onLoadMission = _text; \
	stage = _stage; \
	name = _name; \
	loadScreen = \a3\Missions_F_EPA\data\img\##_class##_overview_CA.paa; \
	briefingName = _name; \
	overviewPicture = \a3\Missions_F_EPA\data\img\##_class##_overview_CA.paa; \
	overviewText = _text;

#ifndef _CAMPAIGN
#include "\A3\Missions_F_EPA\Campaign_shared\cfgHubs.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgMissions.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgTimeline.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgWorldObjects.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgHubObjects.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgPOIs.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgHints.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgVehicles.hpp"
#endif

// Hotfix to disable loading/restarting if required by BIS_fnc_cinemaBorder
onPauseScript[] = {BIS_fnc_disableLoading};

class CfgFunctions
{
	class A3_SplendidA
	{
		tag = "BIS";
		#include "\A3\Missions_F_EPA\Campaign_shared\cfgFunctions.hpp"

		class A_m04
		{
			class a_m04_addWaypoints		{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_addWaypoints.sqf"; };
			class a_m04_handleDamage		{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_handleDamage.sqf"; };
			class a_m04_spawnDead			{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_spawnDead.sqf"; };
			class a_m04_bombardment			{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_bombardment.sqf"; };
			class a_m04_firing			{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_firing.sqf"; };
			class a_m04_flare			{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_flare.sqf"; };
			class a_m04_nikosScenePrepare		{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_nikosScenePrepare.sqf"; };
			class a_m04_particleEffect		{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_particleEffect.sqf"; };
			class a_m04_spawnGroupInBuilding	{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_spawnGroupInBuilding.sqf"; };
			class a_m04_streetLightsBlinking	{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_streetLightsBlinking.sqf"; };
			class a_m04_updateTriggerPosition	{ file = "A3\Missions_F_EPA\Campaign\Missions\A_m04.Stratis\functions\fn_updateTriggerPosition.sqf"; };
		};
	};
};