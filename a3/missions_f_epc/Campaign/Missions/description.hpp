author = $STR_A3_Bohemia_Interactive;
allowSubordinatesTakeWeapons = 1;
enableCampaignSystems = 1;

#define SET_MISSION_META(_stage,_class,_version,_name,_text) \
	onLoadName = _name; \
	onLoadMission = _text; \
	stage = _stage; \
	name = _name; \
	loadScreen = \a3\Missions_F_EPC\data\img\##_class##_overview_CA.paa; \
	briefingName = _name; \
	overviewPicture = \a3\Missions_F_EPC\data\img\##_class##_overview_CA.paa; \
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
	class A3_SplendidC
	{
		tag = "BIS";
		#include "\A3\Missions_F_EPA\Campaign_shared\cfgFunctions.hpp"

		class C_m02
		{
			class C_m02_convoy				{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_convoy.sqf"; };
			class C_m02_groupManager			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_groupManager.sqf"; };
			class C_m02_bombardment				{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_bombardment.sqf"; };
			class C_m02_fakeFiring				{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_fakeFiring.sqf"; };
			class C_m02_suppressiveFireVehicle		{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_suppressiveFireVehicle.sqf"; };
			class C_m02_fireFromCover			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_fireFromCover.sqf"; };
			class C_m02_medicHealingWounded			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_medicHealingWounded.sqf"; };
			class C_m02_fogInterpolate			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_fogInterpolate.sqf"; };
			class C_m02_support				{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_support.sqf"; };
			class C_m02_musicQueue				{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_musicQueue.sqf"; };
			class C_m02_talkOnRadio				{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_talkOnRadio.sqf"; };
			class C_m02_vehicleWheels			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_vehicleWheels.sqf"; };
			class C_m02_playerDamageOnly			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_m02.Altis\functions\fn_playerDamageOnly.sqf"; };
		};

		class C_out1
		{
			class C_out1_playerDamageOnly			{ file = "A3\Missions_F_EPC\Campaign\Missions\C_out1.Altis\functions\fn_playerDamageOnly.sqf"; };
			class C_out1_suppressiveFireVehicle		{ file = "A3\Missions_F_EPC\Campaign\Missions\C_out1.Altis\functions\fn_suppressiveFireVehicle.sqf"; };
		};
	};
};
