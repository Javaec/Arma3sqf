author = $STR_A3_Bohemia_Interactive;
allowSubordinatesTakeWeapons = 1;
enableCampaignSystems = 1;

#define SET_MISSION_META(_stage,_class,_version,_name,_text) \
	onLoadName = _name; \
	onLoadMission = _text; \
	stage = _stage; \
	name = _name; \
	loadScreen = \a3\Missions_F_EPB\data\img\##_class##_overview_CA.paa; \
	briefingName = _name; \
	overviewPicture = \a3\Missions_F_EPB\data\img\##_class##_overview_CA.paa; \
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

class CfgFunctions
{
	class A3_SplendidB
	{
		tag = "BIS";
		#include "\A3\Missions_F_EPA\Campaign_shared\cfgFunctions.hpp"

		//B_in
		class B_in {
			class B_in_aftermath		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_in.Altis\functions\fn_aftermath.sqf"; };
			class B_in_chopperReinforcements{ file = "A3\Missions_F_EPB\Campaign\Missions\B_in.Altis\functions\fn_chopperReinforcements.sqf"; };
			class B_in_vehicleTraffic	{ file = "A3\Missions_F_EPB\Campaign\Missions\B_in.Altis\functions\fn_vehicleTraffic.sqf"; };
			class B_in_firing		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_in.Altis\functions\fn_firing.sqf"; };
		};

		//B_m01
		class B_m01 {
			class B_m01_alarm		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m01.Altis\functions\fn_alarm.sqf"; };
			class B_m01_debugStage		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m01.Altis\functions\fn_debugStage.sqf"; };
			class B_m01_supplyAdd		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m01.Altis\functions\fn_supplyAdd.sqf"; };
			class B_m01_supplyGet		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m01.Altis\functions\fn_supplyGet.sqf"; };
			class B_m01_suppressiveFire	{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m01.Altis\functions\fn_suppressiveFire.sqf"; };
		};

		//B_m02_1
		class B_m02_1 {
			class B_m02_1_holder		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_1.Altis\functions\fn_holder.sqf"; };
			class B_m02_1_holderSpecial	{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_1.Altis\functions\fn_holderSpecial.sqf"; };
			class B_m02_1_take		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_1.Altis\functions\fn_take.sqf"; };
		};

		//B_m02_2
		class B_m02_2
		{
			class B_m02_2_alarm   		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_alarm.sqf"; };
			class B_m02_2_chaos   		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_chaos.sqf"; };
			class B_m02_2_flare   		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_flare.sqf"; };
			class B_m02_2_initGroup  	{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_initGroup.sqf"; };
			class B_m02_2_site   		{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_site.sqf"; };
			class B_m02_2_siteCleared  	{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_siteCleared.sqf"; };
			class B_m02_2_siteDetected 	{ file = "A3\Missions_F_EPB\Campaign\Missions\B_m02_2.Stratis\functions\fn_siteDetected.sqf"; };
		};
	};
};
