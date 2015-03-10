author = $STR_A3_Bohemia_Interactive;
allowSubordinatesTakeWeapons = 1;
enableCampaignSystems = 0;

dev = "Warka";

onLoadMissionTime = 0;
briefing = 0;
debriefing = 0;

#define SET_MISSION_META(_stage,_class,_version,_name,_text) \
	onLoadName = _name; \
	onLoadMission = _text; \
	stage = _stage; \
	name = _name; \
	briefingName = _name; \
	overviewText = _text;

#include "\A3\Missions_F_EPA\Campaign_shared\cfgTimeline.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgWorldObjects.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgHubObjects.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgPOIs.hpp"
#include "\A3\Missions_F_EPA\Campaign_shared\cfgVehicles.hpp"

class CfgFunctions
{
	class A3_SplendidA
	{
		tag = "BIS";
		#include "\A3\Missions_F_EPA\Campaign_shared\cfgFunctions.hpp"
	};
};