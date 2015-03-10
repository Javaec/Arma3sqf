//--- Campaign specific functions, are available only in campaign missions

class Campaign
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions";
	description = "Campaign specific functions.";

	//generic campaign functions
	class camp_onMissionInit		{description = "Code executed on every campaign mission init."; preInit = 1;};
	class camp_onMissionExit		{description = "Code executed on every campaign mission exit.";};
	class camp_getMissionMeta		{description = "Return mission tags from campaign fsm.";};
	class camp_getMissionDesc		{description = "Return config path to the given mission's description.ext.";};
	class camp_getMissionDescData		{description = "Get data from description.ext of given campaign mission.";};
	class camp_getLinkedMissions		{description = "Get missions linked to the given mission.";};
	class camp_nextMission			{description = "Return class name of the mission that is suggested to play as next.";};
	class camp_sortMissions			{description = "Sorts array of campaign missions to the order they are preffered to be played.";};
	class camp_campaignConfig		{};

	class camp_loadVar			{};
	class camp_saveVar			{};
	class camp_getImplicitValue		{};
	class camp_hasImplicitValue		{};
	class camp_setImplicitValue		{};

	//saving & retrieving persistency info
	class camp_saveMissionIntel		{description = "Gathers mission intel data and stores them into presistent gvar.";};
	class camp_loadMissionIntel		{description = "Restores mission intel setting from data stored in presistent gvar.";};
};

class POI
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\POI";
	description = "Functions for skirmish POIs.";

	class camp_poiInit                      {};
	class camp_poiDisable			{};
	class camp_poiDrawMarker                {};
	class camp_poiGetLinked              	{};
	class camp_poiReveal              	{};
	class camp_poiComplete              	{};
	class camp_poiSave              	{};
	class camp_poiGetStatus              	{};
	class camp_poiSetStatus              	{};
	class camp_poiAddTask			{};
	class camp_poiCompleteTask		{};
	class camp_poiGetVar			{};
};

class Skirmish
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\Skirmish";
	description = "Functions for creating persistency between hubs and skirmishes.";

	class camp_createSkirmishSquadUnit	{};
	class camp_setupVehicle			{};
};

class Xtra
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\Xtra";
	description = "Xtra campaing specific stuff like spacialy handled map markers.";

	class camp_showHubMarkers		{description = "Shows detail HUB markers only if map is zoomed enough";};
	class camp_createAlphaORBAT		{};
	class camp_setPPeffect			{description = "Sets PP effect based on the current time of day";};
	class camp_setFatigue			{};
};

class Characters
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\Characters";
	description = "Functions for setting and handling campaign characters.";

	class camp_getCharacters		{description = "Returns an array of all units that use the weapon pool mechanics. Units need to be defined in the mission's description.ext.";};
	class camp_loadCharacters		{description = "Loads the equipment for all participating units.";};
	class camp_saveCharacters		{description = "Stores the equipment for all participating units.";};
	class camp_setupCharacter		{description = "Loads equipment for given unit. Equipment is checked against the equipment pool content and ev. adjusted.";};
	class camp_getCharacterByIdentity	{};
	class camp_addRequiredGear		{};
	class camp_getRequiredGear		{};

	class camp_addEquipment			{description = "Adds a particular piece of equipment.";};
	class camp_removeEquipment		{description = "Removes a particular piece of equipment.";};
	class camp_fixUnitBackpack		{description = "Checks if unit has a backpack with special equipment and ev. replaces it empty backpack.";};

	class camp_getEquipType			{description = "Return equipment category (eg. weapon, magazine, item).";};
	class camp_getEquipClass		{description = "Return equipment class.";};
	class camp_getEquipCount		{description = "Return number of pieces of equipment of given class in unit's possession.";};
	class camp_getEquipAttribute		{description = "Read appropriate config for given piece of equipment and return attribute value.";};

	class camp_poolAdd			{};
	class camp_poolCount			{};
	class camp_poolAvailable		{};

	class camp_unitAmmo			{};
	class camp_unitAttachments		{};
	class camp_unitItems			{};
	class camp_unitMagazines		{};
	class camp_unitOutfit			{};
	class camp_unitWeapons			{};

	class camp_containerAmmo		{};
	class camp_containerAttachments		{};
	class camp_containerItems		{};
	class camp_containerMagazines		{};
	class camp_containerOutfit		{};
	class camp_containerWeapons		{};

	class camp_poolAddCharacter		{};
	class camp_poolRemoveCharacter		{};

	class camp_setIdentity			{};
	class camp_setIdentityInit		{};

	class camp_saveStatus			{};
	class camp_loadStatus			{};

	class camp_getVehicleCargo		{};
	class camp_setVehicleCargo		{};
	class camp_poolAddVehicleCargo		{};
};

class Timeline
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\Timeline";
	description = "Campaign timeline related functions and linked functions.";

	//main functions
	class camp_getTimelineMeta		{description = "Return data about timeline phase.";};
	class camp_getTimelinePhaseDate		{};
	class camp_getTimelinePhaseTravelTimes	{};
	class camp_getTimelinePhaseWeather	{};
	class camp_getTimelinePhaseMissions	{};
	class camp_getTimelinePhase		{description = "Search timeline and return phase of the 1st mission occurance.";};
	class camp_getWeatherInterpolationData	{description = "Get the weather settings from timeline.";};

	//linked & supporting functions
	class camp_setTimeWeather		{description = "Changes current time and weather.";};
	class camp_showOSD			{description = "Display OSD with location, time and possibly some other campaign related info.";};
	class camp_dateToTime			{description = "Converts date to time.";};
	class camp_timeToDate			{description = "Converts time to date.";};
};

class AmbientLife
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\AmbientLife";
	description = "Function for creating of the ambient life on the base.";

	class camp_createWalkingBots		{description = "Detect and create a walking soldier for every set of waypoint helpers.";};
	class camp_patrol			{};
	class camp_ambientAnim			{};
	class camp_ambientTalk			{};
	class camp_phase			{};
	class camp_thunder			{};
	class camp_playWoundedSounds		{description = "Plays random sounds of a wounded soldier.";};
	class camp_ambientCombatSounds		{};
};

class AmbientObjects
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\AmbientObjects";
	description = "Functions handling the auto-spawning of ambient objects on bases (and other possible places).";

	//"front-end" functions
	class camp_getSurfaceObjects
	{
		description = "Returns all objects with surfaces that can be populated by the ambient objects and weapon holders.";
	};
	class camp_setupSurfaceObject
	{
		description = "Detects all anchor points on given surface object and tries to populate them by appropriate ambient objects.";
	};

	//"private" functions
	class camp_getAnchors
	{
		description = "Returns array of all anchors for given object.";
	};
	class camp_adjustAnchor
	{
		description = "Adjust and randomizes the anchor data according to the situation (eg. soldiers nearby).";
	};
	class camp_createObjectsAtAnchor
	{
		description = "Creates a core object on an anchor and child object(s) around it.";
	};
	class camp_getCompositionData
	{
		description = "Generates the composition content - number of objects and their classnames.";
	};
	class camp_getObjectParam
	{
		description = "Returns parameter defined for the object. When parameter is not found, the value from the object group is taken.";
	};
	class camp_getTheme
	{
		description = "Auto-selects the hub section / object theme.";
	};
};

class WorldObjects
{
	file = "a3\Missions_F_EPA\Campaign_shared\Functions\WorldObjects";
	description = "Functions for persistent destruction state of world objects / buildings.";

	//"front-end" functions
	class camp_saveWorldObjects {};
	class camp_loadWorldObjects {};

	//"private" functions
	class camp_getWorldObject {};
	class camp_destroyWorldObject {};
};