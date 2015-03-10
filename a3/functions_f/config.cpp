////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Tue Mar 10 00:08:13 2015 : Source 'file' date Tue Mar 10 00:08:13 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class functions_f : config.bin{
class CfgPatches
{
	class A3_Functions_F
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_BaseConfig_F"};
	};
};
class cfgFunctions
{
	version = 3.0;
	init = "A3\functions_f\initFunctions.sqf";
	createShortcuts = 1;
	class A3
	{
		tag = "BIS";
		project = "arma3";
		class Actions
		{
			file = "A3\functions_f\Actions";
			class packStaticWeapon
			{
				description = "Used in Large-Scale multiplayer to have a group pack a static weapon";
			};
			class unpackStaticWeapon
			{
				description = "Used in Large-Scale multiplayer to have a group unpack a static weapon";
			};
		};
		class Ambient
		{
			file = "A3\functions_f\ambient";
			class ambientFlyby{};
			class ambientAnim
			{
				description = "Lock unit into predefined ambient animation set.";
			};
			class ambientAnimCombat
			{
				description = "Simmilar to 'BIS_fnc_ambientAnim', however unit can be freed from the anim loop! Drawback, less animsets are available and it's slightly more CPU intense.";
			};
			class ambientAnimGetParams{};
			class animalBehaviour
			{
				description = "Animal behaviour control. Called by Animals_F\Data\Scripts\main.fsm.";
				headerType = 1;
			};
		};
		class Arrays
		{
			file = "A3\functions_f\Arrays";
			class sortBy
			{
				description = "Sorts an array according to given algorithm.";
			};
			class arrayShuffle{};
			class updatePlayerArray{};
			class consolidateArray{};
			class findInPairs{};
			class getFromPairs{};
			class addToPairs{};
			class removeFromPairs{};
			class setToPairs{};
			class sortAlphabetically{};
		};
		class Briefing
		{
			file = "A3\functions_f\Briefing";
			class briefingAnimate
			{
				description = "Animate briefing markers.";
			};
			class briefingInit
			{
				description = "Initialize animated briefing markers.";
			};
		};
		class Combat
		{
			file = "A3\functions_f\Combat";
			class enemyTargets
			{
				description = "Return list of enemy targets for given unit.";
			};
			class enemyDetected
			{
				description = "Return true if unit knows about nearby enemy unit or driven vehicle.";
			};
		};
		class Configs
		{
			file = "A3\functions_f\Configs";
			class configPath
			{
				description = "Return config path to given entry.";
			};
			class subClasses{};
			class uniqueClasses{};
			class loadClass{};
			class loadEntry{};
			class unitAddon{};
			class weaponAddon{};
			class returnChildren{};
			class configExtremes{};
			class getCfgIsClass
			{
				description = "Return true if it's a class.";
			};
			class getCfgSubClasses
			{
				description = "Return all child classes of given class.";
			};
			class getCfgDataArray
			{
				description = "Get an array from cfg. If the retrieved value is not an array, retype it to an array.";
			};
			class getCfgDataObject
			{
				description = "Get a mission object defined in cfg by its name (a global variable).";
			};
			class getCfgDataBool
			{
				description = "Get a number defined in cfg and retype it into a bool.";
			};
			class getCfgData
			{
				description = "Smart-return number, text or array value from a config.";
			};
			class getCfgDataPool
			{
				description = "Get array of attribute values out of the parent config class. Attributes need to be in this format: '_n', where n is an index number (starting from 0). If any discrepancy in indexing is detected, loading will stop and only the correctly indexed values will be returned.";
			};
		};
		class CuratorLite
		{
			file = "A3\functions_f\Curator";
			class addCurator{};
			class removeCurator{};
			class isCurator{};
			class curatorSetCoefPlace{};
			class curatorSetCoefMove{};
			class curatorSetCoefDelete{};
			class curatorSetCoefDestroy{};
			class curatorCoefPlace{};
			class curatorCoefMove{};
			class curatorCoefDelete{};
			class curatorCoefDestroy{};
			class curatorAddPlaceableAddons{};
			class curatorRemovePlaceableAddons{};
			class curatorPlaceableAddons{};
			class onCuratorObjectRegistered{};
			class curatorAddPoints{};
			class curatorPoints{};
			class curatorAddEditableObjects{};
			class curatorRemoveEditableObjects{};
			class curatorEditableObjects{};
			class curatorAddEditingArea{};
			class curatorRemoveEditingArea{};
			class curatorEditingArea{};
			class curatorAddPlayers{};
			class curatorRemovePlayers{};
			class curatorPlayers{};
			class curatorAutomatic{};
			class curatorAutomaticPositions{};
		};
		class Debug
		{
			file = "A3\functions_f\Debug";
			class functionMeta{};
			class camera{};
			class cameraOld{};
			class isDemo{};
			class animViewer{};
			class logFormat
			{
				headerType = 1;
			};
			class preload{};
		};
		class Diagnostic
		{
			file = "A3\functions_f\Diagnostic";
			class diagAAR
			{
				description = "Play After Action Review.";
			};
			class diagAARrecord
			{
				description = "Record After Action Review.";
				ext = ".fsm";
				preInit = 1;
			};
			class diagHit
			{
				description = "Record player's hits";
				cheatsEnabled = 1;
			};
			class diagKey
			{
				description = "Record pressed keys";
				preInit = 1;
				cheatsEnabled = 1;
			};
			class diagRadio
			{
				description = "Record radio protocol";
				cheatsEnabled = 1;
			};
			class diagMissionWeapons
			{
				description = "Lists all weapons and magazines available in a mission.";
			};
			class diagMissionPositions
			{
				description = "Display units in all missions.";
				cheatsEnabled = 1;
			};
			class diagPreview
			{
				description = "Previews config items.";
			};
			class diagPreviewVehicleCrew
			{
				description = "Previews vehicles with crew.";
			};
			class diagPreviewCycle{};
			class diagKeyLayout
			{
				description = "Exports default key layout to wiki template.";
			};
			class diagKeyTest
			{
				description = "Outputs key settings anf checks for inconsistencies.";
			};
			class diagWiki
			{
				description = "Scans specific config folder and outputs the values in wiki format.";
			};
			class diagVehicleIcons
			{
				description = "Previews vehicle icons";
			};
			class diagConfig
			{
				description = "Prints config entries.";
			};
			class diagLoop
			{
				description = "Runs the code in a loop.";
			};
			class locWeaponInfo
			{
				description = "Checks length of weapon info texts";
			};
			class diagKnownTargets
			{
				description = "Visualize profile which units one specific unit knows about and how much.";
			};
			class diagKnownAsTarget
			{
				description = "Visualize profile which units know about one specific unit and how much they do.";
			};
			class diagBulletCam{};
			class diagMacros{};
			class diagMacrosVerify{};
			class diagMacrosMapSize{};
			class diagMacrosNameSound{};
			class diagMacrosAuthor{};
			class diagFindMissingAuthors{};
			class exportGroupFormations{};
			class exportCfgVehicles{};
			class exportCfgWeapons{};
			class exportCfgMagazines{};
			class exportCfgPatches{};
			class exportCfgHints{};
			class importImageLinks{};
			class exportFunctionsToWiki{};
			class diagJIRAlink
			{
				cheatsEnabled = 1;
			};
		};
		class Effects
		{
			file = "A3\functions_f\Effects";
			class effectFired
			{
				description = "Fired Effect.";
				headerType = -1;
			};
			class effectKilled
			{
				description = "Killed Effect.";
				headerType = -1;
			};
			class effectPlankton
			{
				description = "Plakton Effect.";
				headerType = -1;
			};
			class effectFiredLongSmoke
			{
				description = "";
				headerType = -1;
			};
			class effectFiredRifle
			{
				description = "";
				headerType = -1;
			};
			class effectFiredArtillery
			{
				description = "";
				headerType = -1;
			};
			class effectFiredRocket
			{
				description = "";
				headerType = -1;
			};
			class effectFiredSmokeLauncher
			{
				description = "";
				headerType = -1;
			};
			class effectFiredSmokeLauncher_boat
			{
				description = "";
				headerType = -1;
			};
			class effectFiredFlares
			{
				description = "";
				headerType = -1;
			};
			class effectFiredHeliRocket
			{
				description = "";
				headerType = -1;
			};
			class effectKilledAirDestruction
			{
				description = "";
				headerType = -1;
			};
			class effectKilledAirDestructionStage2
			{
				description = "";
				headerType = -1;
			};
			class effectKilledSecondaries
			{
				description = "";
				headerType = -1;
			};
		};
		class Environment
		{
			file = "A3\functions_f\Environment";
			class setPPeffectTemplate{};
		};
		class Feedback
		{
			file = "A3\functions_f\Feedback";
			class feedbackMain
			{
				ext = ".fsm";
				preInit = 1;
			};
			class bloodEffect
			{
				description = "Blood splash (texture) postprocess.";
			};
			class damageChanged
			{
				description = "Handle effects caused by changing of damage.";
			};
			class damagePulsing
			{
				description = "Pulsing damage effect.";
			};
			class dirtEffect
			{
				description = "Dirt (texture) postprocess.";
			};
			class fatigueEffect
			{
				description = "Effects for high fatigue values.";
			};
			class feedbackInit
			{
				description = "Init function for feedback system. Declaration of variables, eventhandlers, etc.";
			};
			class flamesEffect
			{
				description = "Flames (texture) postprocess.";
			};
			class healing
			{
				description = "Healing postprocess.";
			};
			class incapacitatedEffect
			{
				description = "WIP";
			};
			class indicateBleeding
			{
				description = "WIP";
			};
			class radialRed
			{
				description = "Red radial postprocess (hit damage, fire damage).";
			};
			class radialRedOut
			{
				description = "Red radial postprocess (fire damage) is removed.";
			};
		};
		class Geometry
		{
			file = "A3\functions_f\Geometry";
			class relScaledDist
			{
				description = "Return relative scaled distance to the center of a trigger.";
			};
			class terrainGradAngle
			{
				description = "Return gradient angle of the terrain at a specified position and a compass direction.";
			};
		};
		class GUI
		{
			file = "A3\functions_f\GUI";
			class groupIndicator
			{
				description = "Display group indicator.";
			};
			class rscLayer
			{
				description = "Register a new RSC layer.";
			};
			class guiEffectTiles
			{
				description = "GUI Effects";
			};
			class cinemaBorder
			{
				description = "Moves camera borders";
			};
			class textTiles
			{
				description = "";
			};
			class titlecard
			{
				description = "Display a mission-specific titlecard before the mission begins.";
			};
			class liveFeed
			{
				description = "Display a live feed.";
			};
			class liveFeedEffects
			{
				description = "Add effects to a live feed.";
			};
			class liveFeedSetSource
			{
				description = "Set the source of a live feed.";
			};
			class liveFeedSetTarget
			{
				description = "Set the target of a live feed.";
			};
			class liveFeedTerminate
			{
				description = "Terminate a live feed.";
			};
			class establishingShot
			{
				description = "Play a fake UAV observational sequence which serves as an establishing shot.";
			};
			class showNotification{};
			class ctrlFitToTextHeight{};
			class setIDCStreamFriendly
			{
				description = "Shows or hides UI control according to state of the Stream Friendly UI switch in Game Options.";
			};
			class typeText
			{
				description = "Types a structured text on the screen, letter by letter, cursor blinking.";
			};
			class typeText2{};
			class ctrlSetScale{};
			class credits_movie
			{
				description = "Movie credits";
			};
			class credits_movieConfig
			{
				description = "Movie credits config preprocessor";
			};
			class credits_movieSupport
			{
				description = "Movie credits supporters preprocessor";
			};
			class showUnitInfo
			{
				description = "Hide or show unit info";
			};
			class toUpperDisplayTexts
			{
				description = "Converts text of selected classes in one display to upper-case.";
			};
			class createLogRecord{};
			class showMissionStatus{};
			class setMissionStatusSlot{};
			class openFieldManual
			{
				description = "Opens Field Manual on the selected topic and hint.";
			};
			class initDisplays
			{
				preStart = 1;
			};
			class initDisplay{};
			class versionInfo
			{
				description = "Displays version info in Pause and other Menus.";
			};
		};
		class Hints
		{
			file = "A3\functions_f\Hints";
			class advHint
			{
				description = "Advanced hint system";
			};
			class advHintArg
			{
				description = "Advanced hint argument preprocess (used by BIS_fnc_advHint)";
			};
			class advHintCall
			{
				description = "Advanced hint call (used by BIS_fnc_advHint)";
			};
			class advHintCredits
			{
				description = "Advanced hint credits preprocessor";
			};
		};
		class Inventory
		{
			file = "A3\functions_f\inventory";
			class addWeapon
			{
				description = "Add a weapon to a unit with the right magazines.";
			};
			class itemType{};
			class basicBackpack{};
			class loadInventory{};
		};
		class Map
		{
			file = "A3\functions_f\Map";
			class markWaypoints
			{
				description = "Creates a marker on each uncompleted waypoint and marks it checked after completing that WP.";
			};
			class mapSize
			{
				description = "Returns map size.";
			};
			class markerToTrigger
			{
				description = "Makes an existing or new trigger cover a marker area.";
			};
			class triggerToMarker
			{
				description = "Makes an existing or new marker cover a trigger area.";
			};
			class exportMapToBiTXT{};
		};
		class Missions
		{
			file = "A3\functions_f\Missions";
			class basicTask
			{
				description = "Predefined tasks";
			};
			class missionTasks
			{
				description = "Mission tasks";
			};
			class missionTasksLocal
			{
				description = "Mission tasks (local file)";
				file = "missionTasks.sqf";
				recompile = 1;
				headerType = 1;
			};
			class missionConversations
			{
				description = "Mission conversation";
			};
			class missionConversationsLocal
			{
				description = "Mission conversation (local file)";
				file = "missionConversations.sqf";
				recompile = 1;
				headerType = 1;
			};
			class missionFlow
			{
				description = "Mission flow";
				file = "missionFlow.fsm";
				ext = ".fsm";
				postInit = 1;
				recompile = 1;
			};
			class isCampaign
			{
				description = "Check to see if a mission is being run in a campaign.";
			};
			class missionHandlers
			{
				preInit = 1;
			};
			class trackMissionTime{};
			class forceEnd{};
		};
		class Misc
		{
			file = "A3\functions_f\Misc";
			class fadeEffect
			{
				description = "Easily carry out complex fading. Default values will be used if parameters aren't defined or set to nil.";
			};
			class findOverwatch
			{
				description = "Finds a position that provides overwatch on another position";
			};
			class onDiaryChanged
			{
				description = "Register code to be executed when diary item changes.";
			};
			class colorRGBAtoHTML
			{
				description = "Converts RGBA color format to HTML color format";
			};
			class rankParams
			{
				description = "Return information about military rank.";
			};
			class colorRGBAtoTexture
			{
				description = "Converts RGB color format to procedural texture.";
			};
			class healthEffects
			{
				description = "Health system effects.";
			};
			class textureMarker
			{
				description = "Loads texture from CfgMarkers.";
			};
			class textureVehicleIcon
			{
				description = "Loads texture from CfgVehicleIcons.";
			};
			class localize
			{
				description = "Checks if text is localization key and if so, return the localized text.";
			};
			class colorConfigToRGBA
			{
				description = "Converts config color format to RGBA array of numbers.";
			};
			class keyCode{};
			class addScriptedEventHandler{};
			class removeScriptedEventHandler{};
			class removeAllScriptedEventHandlers{};
			class callScriptedEventHandler{};
			class startLoadingScreen{};
			class endLoadingScreen{};
			class progressLoadingScreen{};
			class groupVehicles{};
			class nearestRoad{};
			class addCommMenuItem{};
			class removeCommMenuItem{};
			class refreshCommMenu{};
			class interpolateWeather
			{
				description = "Interpolate weather in time.";
			};
			class weaponComponents
			{
				description = "Get a list of weapon components - weapon and all attachment classes.";
			};
			class jukebox{};
			class loop{};
			class runLater{};
			class fixDate{};
			class isLeapYear{};
			class monthDays{};
			class disableLoading{};
			class gridToPos{};
		};
		class Modules
		{
			file = "A3\functions_f\Modules";
			class initModules{};
			class moduleInit{};
			class moduleHandle
			{
				ext = ".fsm";
			};
			class moduleModules{};
			class moduleTriggers{};
			class moduleUnits{};
			class moduleExecute{};
		};
		class MP
		{
			file = "A3\functions_f\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
			class deleteVehicleCrew{};
		};
		class Numbers
		{
			file = "A3\functions_f\Numbers";
			class countdown{};
		};
		class Strings
		{
			file = "A3\functions_f\Strings";
			class filterString
			{
				description = "Removes characters from a string based on the list of allowed characters.";
			};
			class inString
			{
				description = "Find a string within a string.";
			};
			class ordinalNumber{};
			class romanNumeral{};
			class phoneticalWord{};
			class teamColor{};
			class alignTabs{};
			class splitString{};
			class trimString
			{
				description = "Get a substring out of the source string, using start and end indexes.";
			};
		};
		class Supports
		{
			file = "A3\functions_f\Supports";
			class addSupportLink{};
			class changeSupportRadioChannel{};
			class limitSupport{};
			class removeSupportLink{};
		};
		class Objects
		{
			file = "A3\functions_f\Objects";
			class getTurrets{};
			class objectVar{};
			class allSynchronizedObjects{};
			class setRank{};
			class spawnObjects{};
			class objectHeight{};
			class objectType{};
			class crewCount{};
			class setIdentity{};
			class setObjectRotation{};
			class cargoTurretIndex{};
		};
		class OO
		{
			file = "A3\functions_f\OO";
			class addClassOO
			{
				description = "Registering a class for the OO scripting shell.";
			};
			class createObjectOO
			{
				description = "Instantiating an object of a certain class.";
			};
			class validateParametersOO
			{
				description = "Validating the parameters of a certain method in a class.";
			};
		};
		class Params
		{
			file = "A3\functions_f\Params";
			class initParams
			{
				postInit = 1;
			};
			class getParamValue{};
			class paramDaytime{};
			class paramWeather{};
			class paramCountdown{};
			class paramRespawnTickets{};
			class paramGuerFriendly{};
		};
		class Strategic
		{
			file = "A3\functions_f\Strategic";
			class ORBATOpen
			{
				description = "Open ORBAT (Order of Battle) viewer.";
			};
			class ORBATAnimate
			{
				description = "Animate ORBAT (Order of Battle) viewer.";
			};
			class ORBATTooltip
			{
				description = "Display group tooltip.";
			};
			class ORBATSetGroupFade
			{
				description = "Set fade value of CfgORBAT group and all groups below it.";
			};
			class ORBATSetGroupParams
			{
				description = "Override group params from CfgORBAT.";
			};
			class ORBATGetGroupParams
			{
				description = "Return group params from CfgORBAT.";
			};
			class ORBATAddGroupOverlay
			{
				description = "Register texture(s) to be displayed over CfgORBAT group.";
			};
			class ORBATRemoveGroupOverlay
			{
				description = "Unregister texture(s) to be displayed over CfgORBAT group.";
			};
			class ORBATConfigPreview
			{
				description = "";
			};
			class StrategicMapOpen
			{
				description = "Open Strategic Map.";
			};
			class StrategicMapAnimate
			{
				description = "Animate Strategic Map.";
			};
			class StrategicMapMouseButtonClick{};
			class setUnitInsignia{};
			class getUnitInsignia{};
		};
		class Respawn
		{
			file = "A3\functions_f\respawn";
			class selectRespawnTemplate{};
			class initRespawn
			{
				postInit = 1;
			};
			class showRespawnMenu{};
			class setRespawnInventory{};
			class addRespawnInventory{};
			class removeRespawnInventory{};
			class getRespawnInventories{};
			class addRespawnPosition{};
			class removeRespawnPosition{};
			class getRespawnPositions{};
			class getRespawnMarkers{};
			class missionRespawnType{};
			class moveToRespawnPosition{};
			class respawnNone{};
			class respawnSpectator{};
			class respawnInstant{};
			class respawnBase{};
			class respawnGroup{};
			class respawnSide{};
			class respawnEndMission{};
			class respawnSeagull{};
			class respawnTimePenalty{};
			class respawnWave{};
			class respawnCounter{};
			class respawnConfirm{};
			class respawnTickets{};
			class respawnMenuPosition{};
			class respawnMenuInventory{};
		};
		class Sides
		{
			file = "A3\functions_f\sides";
			class enemySides{};
			class friendlySides{};
			class areFriendly{};
			class sideID{};
			class sideColor{};
			class sideName{};
			class sideType{};
			class objectSide{};
			class playerSideFaction{};
		};
		class Systems
		{
			file = "A3\functions_f\systems";
			class InstructorFigure
			{
				description = "System for playing Instructive Figures";
			};
			class bleedTickets{};
		};
		class Tasks
		{
			file = "A3\functions_f\Tasks";
			class setTask{};
			class setTaskLocal{};
			class taskVar{};
			class deleteTask{};
			class taskChildren
			{
				description = "Return a task's sub-tasks.";
			};
			class taskCompleted
			{
				description = "Return if a task has been completed.";
			};
			class taskCreate
			{
				description = "Create a task.";
			};
			class taskCurrent
			{
				description = "Return a unit's current task.";
			};
			class taskDescription
			{
				description = "Return a task's description.";
			};
			class taskDestination
			{
				description = "Return a task's destination.";
			};
			class taskExists
			{
				description = "Return if a task exists.";
			};
			class taskHint
			{
				description = "Display a task hint.";
			};
			class taskParent
			{
				description = "Return a sub-task's parent task.";
			};
			class taskReal
			{
				description = "Find the actual task associated with a task name assigned to a unit.";
			};
			class tasksUnit
			{
				description = "Grab all tasks currently created for a given unit.";
			};
			class taskSetCurrent
			{
				description = "Set a task to current.";
			};
			class taskSetDescription
			{
				description = "Set a task's description.";
			};
			class taskSetDestination
			{
				description = "Set a task's destination.";
			};
			class taskSetState
			{
				description = "Set a task's state.";
			};
			class taskState
			{
				description = "Return a task's state.";
			};
		};
		class Vehicles
		{
			file = "A3\functions_f\Vehicles";
			class vehicleRoles{};
			class missileLaunchPositionFix
			{
				description = "Fix ATGM/SAM launch position.";
			};
		};
		class Variables
		{
			file = "A3\functions_f\Variables";
			class loadFunctions{};
		};
		class Waypoints
		{
			file = "A3\functions_f\Waypoints";
			class scriptedWaypointType{};
			class wpLand{};
			class wpPatrol{};
			class wpRelax{};
			class wpArtillery{};
			class wpSuppress{};
		};
	};
	class HSim
	{
		tag = "BIS";
		project = "tkoh";
		class Ambient
		{
			file = "A3\functions_f\ambient";
			class ambientBoats
			{
				description = "Ambient boats";
				ext = ".fsm";
			};
			class ambientHelicopters
			{
				description = "Ambient helicopters";
				ext = ".fsm";
			};
			class ambientPlanes
			{
				description = "Ambient planes";
				ext = ".fsm";
			};
			class ambientBlacklist
			{
				description = "Register blacklisted areas in mission for ambient environment";
			};
			class ambientBlacklistAdd
			{
				description = "Register blacklisted area for ambient environment";
			};
			class ambientPostprocess
			{
				description = "Ambient postprocess";
			};
		};
		class Conversations
		{
			file = "A3\functions_f\Conversations";
			class kbTell
			{
				description = "Start the conversation";
			};
			class kbTellLocal{};
			class kbMenu
			{
				description = "Opens conversation menu";
			};
			class kbSentence
			{
				description = "Returns sentence name";
			};
			class kbTopicConfig
			{
				description = "Returns topic config";
			};
			class kbPriority
			{
				description = "Set conversations priority";
			};
			class kbCanSpeak
			{
				description = "Returns conversation availability of given person";
			};
			class kbSkip
			{
				description = "Skip conversation";
			};
			class kbCreateDummy
			{
				description = "Creates dummy speaker";
			};
			class kbIsSpeaking
			{
				description = "Check if speaker is locked for different conversation";
			};
			class genericSentence
			{
				description = "Play generic sentence";
			};
			class genericSentenceInit
			{
				description = "Init generic sentence settings";
			};
		};
		class Database
		{
			file = "A3\functions_f\database";
			class dbSymbolClass
			{
				description = "Returns database specific symbol for class";
			};
			class dbSymbolValue
			{
				description = "Returns database specific symbol for value";
			};
			class dbisClass
			{
				description = "Check if item is class";
			};
			class dbisValue
			{
				description = "Check if item is value";
			};
			class dbClassId
			{
				description = "Set class name";
			};
			class dbClassSet
			{
				description = "Add database container";
			};
			class dbClassCheck
			{
				description = "Check if container exists in database";
			};
			class dbClassIndex
			{
				description = "Returns index path to database container";
			};
			class dbClassRemove
			{
				description = "Remove database container";
			};
			class dbClassReturn
			{
				description = "Returns all values in database container.";
			};
			class dbClassList
			{
				description = "Returns classes in given class";
			};
			class dbValueId
			{
				description = "Set value name";
			};
			class dbValueSet
			{
				description = "Add a value to database";
			};
			class dbValueCheck
			{
				description = "Check if value exists in database";
			};
			class dbValueIndex
			{
				description = "Returns index path to database value";
			};
			class dbValueRemove
			{
				description = "Remove a value from database";
			};
			class dbValueReturn
			{
				description = "Returns value";
			};
			class dbValueList
			{
				description = "Returns values in given class";
			};
			class dbImportConfig
			{
				description = "Add database containers based on config containers";
			};
			class dbImportXML
			{
				description = "Add database containers based on XML file";
			};
			class dbConfigPath
			{
				description = "Returns config path with the same address as DB path";
			};
			class dbPrint
			{
				description = "Print a database";
			};
		};
		class Debug
		{
			file = "A3\functions_f\Debug";
			class error
			{
				description = "Display debug error";
				headerType = 1;
			};
			class errorMsg
			{
				description = "Display dialog error";
				headerType = 1;
			};
			class halt
			{
				description = "Terminate script";
				headerType = 1;
			};
			class param
			{
				description = "Define script param";
				headerType = 1;
			};
			class paramIn
			{
				description = "Define script param without overload ability";
				headerType = 1;
			};
			class log
			{
				description = "Debug message";
				headerType = 1;
			};
			class functionsDebug
			{
				description = "Set Functions debug mode";
			};
			class functionPath
			{
				description = "Return path to the given function";
			};
			class codePerformance
			{
				description = "Measures how much time it takes to execute given expression";
			};
			class GC
			{
				description = "Garbage Collector";
			};
			class GCinit
			{
				description = "Garbage Collector Init";
				ext = ".fsm";
			};
			class shutdown
			{
				description = "Shut downs the game.";
			};
		};
		class GUI
		{
			file = "A3\functions_f\GUI";
			class getIDD
			{
				description = "Return dialog IDD";
			};
			class getIDC
			{
				description = "Return control IDC";
			};
			class GUIeditor
			{
				description = "GUI editor.";
			};
			class GUIbackground
			{
				description = "Create message background.";
			};
			class GUImessage
			{
				description = "Create message window.";
			};
			class GUIhint
			{
				description = "Create hint window.";
			};
			class GUIgrid
			{
				description = "Return grid size";
			};
			class GUIgridToProfile
			{
				description = "Search for grids and store them into profileNameSpace";
			};
			class GUInewsfeed
			{
				description = "Load newsfeed";
			};
			class PIP
			{
				description = "Picture In Picture.";
			};
			class camFollow
			{
				description = "Camera follows target.";
			};
			class displayColorSet
			{
				description = "Set menu colors";
			};
			class displayColorGet
			{
				description = "Get menu color defaults";
			};
			class displayControls
			{
				description = "Return all controls of given display class";
			};
			class displayResize
			{
				description = "Resize display to full screen";
			};
			class displayClouds
			{
				description = "Show background moving clouds";
			};
			class displayLoading
			{
				description = "Loading screen init";
			};
			class displayMission
			{
				description = "Returns main display of current mission/intro/outro";
			};
			class overviewTimeTrial
			{
				description = "Returns the dynamically composed overview text for Time Trial scenarios.";
			};
			class overviewMission
			{
				description = "Display mission overview.";
			};
			class overviewAuthor
			{
				description = "Display mission author.";
			};
			class overviewTerrain
			{
				description = "Display terrain overview.";
			};
			class overviewDifficulty
			{
				description = "Display difficulty overview";
			};
			class diaryHints
			{
				description = "Add loading hints to diary";
			};
			class diaryMaps
			{
				description = "Add lcustom maps to diary";
			};
			class HUDLimits
			{
				description = "Set HUD limits";
			};
			class credits
			{
				description = "Show game's credits";
			};
			class titleText
			{
				description = "Display structured titleText";
			};
			class ctrlTextHeight
			{
				description = "Set control height according to text";
			};
			class shakeGauges
			{
				description = "Shake analogue gauges";
			};
		};
		class Helicopters
		{
			file = "A3\functions_f\helicopters";
			class helicopterDamage
			{
				description = "Handle forms of helicopter damage.";
			};
			class helicopterCanFly
			{
				description = "Checks if helicopter is capable of flight.";
				ext = ".fsm";
			};
			class helicopterSeat
			{
				description = "Check on which side units sits";
			};
			class helicopterSeatMove
			{
				description = "Plays cockpit animation";
			};
			class helicopterType
			{
				description = "Returns helicopter type (Light, Medium, Heavy)";
			};
			class helicopterGetHitpoints
			{
				description = "Return all hitpoints for a helicopter.";
			};
		};
		class Map
		{
			file = "A3\functions_f\Map";
			class KMLimport
			{
				description = "Imports and marks positions from KLM file.";
			};
			class noFlyZonesCreate
			{
				description = "Create no-fly zones";
			};
			class noFlyZonesExport
			{
				description = "Export no-fly zones";
			};
			class noFlyZone
			{
				description = "Check if object is in no fly zone";
			};
			class keypointsExport
			{
				description = "Export keypoints";
			};
			class keypointsExportFromKML
			{
				description = "Export keypoints from KML file";
			};
			class worldArea
			{
				description = "Set world area trigger";
			};
			class randomPos
			{
				description = "Selects random position";
			};
			class randomPosTrigger
			{
				description = "Selects random position in trigger area";
			};
			class markerCreate
			{
				description = "Create marker";
			};
			class markerParams
			{
				description = "Return marker params";
			};
			class markerPath
			{
				description = "Create marker path";
			};
			class posDegtoUTM
			{
				description = "Convert latitude/longtitude position to UTM format";
			};
			class posDegToWorld
			{
				description = "Convert latitude/longtitude position to game format";
			};
			class posUTMToDeg
			{
				description = "Convert UTM format position to latitude/longtitude";
			};
			class nearestHelipad
			{
				description = "Find nearest helipad to given position";
			};
		};
		class Misc
		{
			file = "A3\functions_f\Misc";
			class endMission
			{
				description = "Ends mission with specific ending";
			};
			class onLoad
			{
				description = "Add/Remove an onLoad code";
			};
			class onEnd
			{
				description = "Add/Remove an onEnd code";
			};
			class displayName
			{
				description = "Returns config item's displayName";
			};
			class counter
			{
				description = "Adds values to counter";
			};
			class isLocalized
			{
				description = "Checks if given key name exists in ingame localisation database";
			};
			class roundDir
			{
				description = "Round direction to nearest limit";
			};
			class saveGame
			{
				description = "Save game when proper conditions are met";
			};
			class animType
			{
				description = "Recognizes animation name";
			};
			class position
			{
				description = "Returns position";
			};
			class assignPlayerRole
			{
				description = "Ensures the player can only get in the specific vehicle role";
			};
			class convertUnits
			{
				description = "Converts values to a target system of units.";
			};
			class moveIn
			{
				description = "Move a unit info vehicle on specific role.";
			};
			class setHeight
			{
				description = "Set a unit's height.";
			};
			class playerName
			{
				description = "Return current profile's name";
			};
		};
		class Missions
		{
			file = "A3\functions_f\Missions";
			class singleMissionName
			{
				description = "Returns name of currently selected single mission";
			};
			class singleMissionConfig
			{
				description = "Returns config of current single mission";
			};
			class singleMissionKeys
			{
				description = "Activate mission related keys";
			};
		};
		class MP
		{
			file = "A3\functions_f\MP";
			class MP
			{
				description = "Sends function for remote execution";
			};
			class MPexec
			{
				description = "Execute received function";
			};
		};
		class Numbers
		{
			file = "A3\functions_f\Numbers";
			class numberDigits
			{
				description = "Break a number into single digits";
			};
			class numberText
			{
				description = "Write number as a text (not in scientific notation)";
			};
		};
		class Radio
		{
			file = "A3\functions_f\radio";
			class radioSetChannel
			{
				description = "Set a specific or random music channel.";
			};
			class radioSetPlaylist
			{
				description = "Set a specific or random music playlist.";
			};
			class radioSetTrack
			{
				description = "Set a specific or random music track.";
			};
		};
		class Strings
		{
			file = "A3\functions_f\Strings";
			class secondsToString
			{
				description = "Convert amount of seconds to desired format.";
			};
		};
	};
	class A2PMC
	{
		tag = "BIS";
		project = "arma2oa";
		class GUI
		{
			file = "A3\functions_f\GUI";
			class customGPS
			{
				description = "Custom GPS frame.";
			};
			class customGPSVideo
			{
				description = "Plays video in GPS frame.";
			};
			class 3Dcredits
			{
				description = "3D credits.";
			};
			class dirIndicator
			{
				description = "Direction indicator.";
			};
			class playVideo
			{
				description = "Plays ingame video.";
			};
		};
		class Environment
		{
			file = "A3\functions_f\Environment";
			class sandstorm
			{
				description = "Sandstorm particle effects.";
			};
			class crows
			{
				description = "Flock of crows.";
			};
			class destroyCity
			{
				description = "Destroys building in given area based on input seed.";
			};
			class flies
			{
				description = "Flies around dead bodies.";
			};
		};
		class Spawning
		{
			file = "A3\functions_f\Spawning";
			class spawnEnemy
			{
				description = "Spawn enemies around players.";
			};
		};
	};
	class A2OA
	{
		tag = "BIS";
		project = "arma2oa";
		class Arrays
		{
			file = "A3\functions_f\arrays";
			class findExtreme
			{
				description = "Returns the minimum or maximum value in an Array.";
			};
		};
		class Debug
		{
			file = "A3\functions_f\debug";
			class configviewer
			{
				description = "Config Viewer";
			};
		};
		class GUI
		{
			file = "A3\functions_f\GUI";
			class AAN
			{
				description = "AAN overlay";
			};
			class infoText
			{
				description = "Text in bottom right corner";
			};
			class dynamicText
			{
				description = "Dynamic credits";
			};
		};
		class Misc
		{
			file = "A3\functions_f\misc";
			class halo
			{
				description = "High Altitude Low Opening";
			};
			class music
			{
				description = "Jukebox";
			};
			class scriptedMove
			{
				description = "Scripted move";
			};
		};
		class Objects
		{
			file = "A3\functions_f\objects";
			class boundingBoxCorner
			{
				description = "Returns all bounding box corners. If position is given as second param, nearest one is returned.";
			};
			class boundingBoxMarker
			{
				description = "Creates marker on object with size of objects' bounding box.";
			};
			class boundingBoxDimensions
			{
				description = "Returns the sizes of the three dimension of an object's bounding box.";
			};
			class boundingCircle
			{
				description = "Returns size of bounding circle (similar to bounding sphere, but in x and y coordinates only).";
			};
		};
		class Scenes
		{
			file = "A3\functions_f\scenes";
			class UnitCapture
			{
				description = "Records movement data of input unit over a specified period of time. If the 4th parameter set to true, will record weapons fire data as well.";
			};
			class UnitCaptureFiring
			{
				description = "Records weapon fire data of input unit over a specified period of time.";
			};
			class UnitCaptureSimple
			{
				description = "(Simplified) Records only movement and dir data of input unit over a specified period of time. If the 4th parameter set to true, will record weapons fire data as well.";
			};
			class UnitPlay
			{
				description = "Plays back input movement data on input unit. The data can be pre-recorded using the UnitCapture script.";
			};
			class UnitPlaySimple
			{
				description = "(Simplified) Plays back input movement and dir data on input unit. The data can be pre-recorded using the UnitCaptureSimple script.";
			};
			class UnitPlayFiring
			{
				description = "Plays back input weapon fire data on input unit. The data can be pre-recorded using the UnitCapture or UnitCaptureFiring script.";
			};
		};
		class Systems
		{
			file = "A3\functions_f\systems";
			class FTLmanager
			{
				description = "FTL tracks relationship between player and civilian side. Depending on players actions the FTL value increases or decreases";
			};
			class RespawnManager
			{
				description = "Manages CHECKPOINTS in a mission. Returns the nearest checkpoint in the time AI/player was killed.";
			};
			class spotter
			{
				description = "Spotter giving sniper info about distance.";
			};
		};
		class Numbers
		{
			file = "A3\functions_f\numbers";
			class linearConversion
			{
				description = "Linear conversion of a value from one set to another.";
			};
		};
	};
	class A2
	{
		tag = "BIS";
		project = "arma2";
		class Arrays
		{
			file = "A3\functions_f\arrays";
			class selectRandomWeighted
			{
				description = "Randomly select an item from an array, considering item weights.";
			};
			class findNestedElement
			{
				description = "Return the path to an element in an (nested) array.";
			};
			class returnNestedElement
			{
				description = "Return an item at a path in an (nested) array.";
			};
			class setNestedElement
			{
				description = "Set an item in an (nested) array using a path.";
			};
			class removeNestedElement
			{
				description = "Remove an item in an (nested) array.";
			};
			class maxDiffArray
			{
				description = "Return the maximum difference between all values in an array.";
			};
			class removeIndex
			{
				description = "Takes an array, and returns a new array with the specified index(es) removed";
			};
			class selectRandom
			{
				description = "Returns a randomly selected element from an array";
			};
			class randomIndex
			{
				description = "Returns a random integer representing an index in the passed array";
			};
			class arrayPush
			{
				description = "Adds an element to the end of an array and returns the array";
			};
			class arrayPushStack
			{
				description = "Pushes a stack (array) of elements onto the end of an array";
			};
			class arrayPop
			{
				description = "Removes the last (rightmost) element of an array and returns it";
			};
			class arrayShift
			{
				description = "Removes the first (leftmost) element of an array and returns it";
			};
			class arrayUnShift
			{
				description = "Adds an element to the beginning of an array and returns the array";
			};
			class arrayCompare
			{
				description = "Checks whether two arrays are exactly the same (note this can also be checked via BIS_fnc_areEqual)";
			};
			class arrayFindDeep
			{
				description = "Searches an element in an array and returns the first occurrence";
			};
			class conditionalSelect
			{
				description = "Returns a sub-array of elements that satisfy a specific condition";
			};
			class subSelect
			{
				description = "Returns a sub-selection of the passed array. There are various methods the sub-array can be determined";
			};
			class arrayInsert
			{
				description = "Inserts the elements of one array into another, at a specified index";
			};
		};
		class Configs
		{
			file = "A3\functions_f\configs";
			class classWeapon
			{
				description = "Returns class of weapon given by string";
			};
			class classMagazine
			{
				description = "Returns class of magazine given by string";
			};
			class returnConfigEntry
			{
				description = "Explores parent classes in the run-time config for the value of a config entry";
			};
			class returnParents
			{
				description = "Returns list of all parent classes";
			};
		};
		class Debug
		{
			file = "A3\functions_f\debug";
			class help
			{
				description = "List of all available functions";
			};
			class recompile
			{
				description = "Recompiles all functions.";
			};
		};
		class Diagnostic
		{
			file = "A3\functions_f\diagnostic";
			class diagAnim
			{
				description = "Animation diagnostic function - displays or logs animation states.";
			};
			class fps
			{
				description = "Measures FPS";
			};
		};
		class Geometry
		{
			file = "A3\functions_f\geometry";
			class dirTo
			{
				description = "Returns the compass direction from one object/postion to another";
			};
			class relativeDirTo
			{
				description = "Returns the relative direction from one object to another object/position";
			};
			class relPos
			{
				description = "Returns a position that is a specified distance and compass direction from the passed position or object";
			};
			class distance2D
			{
				description = "Returns the distance between the two objects or positions 'as the crow flies' (ignoring elevation)";
			};
			class distance2Dsqr
			{
				description = "Same as fn_distance2D, but returns the SQUARED distance. This function is a little faster than fn_distance2D";
			};
			class getLineDist
			{
				description = "Returns the distance between two sections of a straight line";
			};
			class inAngleSector
			{
				description = "Use this function to determine if a position lies within a certain angle from another position";
			};
		};
		class Inventory
		{
			file = "A3\functions_f\inventory";
			class inv
			{
				description = "Returns inventory contents of unit - item classes";
			};
			class invAdd
			{
				description = "Adds item to inventory of unit if there is place for it";
			};
			class invRemove
			{
				description = "Removes item(s). Returns number of removed items.";
			};
			class invCodeToArray
			{
				description = "Converts config inventory code to array with numbers for respective slots.";
			};
			class invString
			{
				description = "Returns inventory contents of unit - item names";
			};
			class invSlots
			{
				description = "Returns total inventory slots for unit";
			};
			class invSlotsEmpty
			{
				description = "Returns empty slots for unit";
			};
			class invSlotType
			{
				description = "Returns type of inventory slot for given item";
			};
		};
		class Misc
		{
			file = "A3\functions_f\misc";
			class findSafePos
			{
				description = "Returns safe pos according to input params";
			};
			class getFactions
			{
				description = "Get list of factions or their IDs";
			};
			class inTrigger
			{
				description = "Returns if objects is in trigger area";
			};
			class isPosBlacklisted
			{
				description = "Returns if position is blacklisted";
			};
			class listPlayers
			{
				description = "Returns an array of all players and playable units";
			};
			class PosToGrid
			{
				description = "Converts world coordinates into map grid coordinates";
			};
			class nearestPosition
			{
				description = "Returns nearest Object or position compared to the position of a given Object or position";
			};
			class createmenu
			{
				description = "Create commanding menu (with pages)";
			};
			class colorRGBtoHTML
			{
				description = "Converts RGB color format to HTML color format";
			};
			class addEvidence
			{
				description = "Add an evidnce value to global campaign variable";
			};
			class taskHandler
			{
				description = "Automatically sets tasks as current";
			};
			class threat
			{
				description = "Calculates threat level of given unit.";
			};
			class commsMenuCreate
			{
				description = "Creates the global communications menu, if it's not already created.";
			};
			class commsMenuToggleVisibility
			{
				description = "Shows or hides certain sections of the global communications menu.";
			};
			class commsMenuToggleAvailability
			{
				description = "Enables or disables certain sections of the global communications menu.";
			};
			class version
			{
				description = "Identifies available expansions.";
			};
		};
		class Numbers
		{
			file = "A3\functions_f\numbers";
			class randomNum
			{
				description = "Returns a random number between two endpoints";
			};
			class randomInt
			{
				description = "Returns a random integer between two endpoints";
			};
			class arithmeticMean
			{
				description = "Returns the arithmetic mean (average) of an array of numbers";
			};
			class geometricMean
			{
				description = "Returns the geometric mean (weighted average) of an array of numbers";
			};
			class cutDecimals
			{
				description = "Returns the rounded number with given amount of decimal places";
			};
			class greatestNum
			{
				description = "Returns the highest number out of the passed set";
			};
			class lowestNum
			{
				description = "Returns the lowest number out of the passed set";
			};
			class nearestNum
			{
				description = "Returns the number out of the set which is closest to the target number";
			};
			class sortNum
			{
				description = "Sorts an array of numbers from lowest (left) to highest (right)";
			};
			class roundNum
			{
				description = "Round a number to the provided factor";
			};
			class parseNumber
			{
				description = "Return number from expression";
			};
		};
		class Objects
		{
			file = "A3\functions_f\objects";
			class isInFrontOf
			{
				description = "Checks, if a object is in front of another object";
			};
			class setPitchBank
			{
				description = "Rotates an object, giving it the specified pitch and bank, in degrees";
			};
			class getPitchBank
			{
				description = "Returns the pitch and bank of an object, in degrees";
			};
		};
		class Scenes
		{
			file = "A3\functions_f\scenes";
			class sceneGetParticipants
			{
				description = "Returns all units from group which are in specified range";
			};
			class sceneGetPositionByAngle
			{
				description = "Returns coordinates calculated from given angle and distance from specified object";
			};
			class sceneSetPosFormation
			{
				description = "Sets formation for a group (circle, halfcircle, line), (uses BIS_fnc_sceneGetPositionByAngle)";
			};
			class sceneSetAnimationsForGroup
			{
				description = "Runs animations on units of group by given animation and group array  ";
			};
			class sceneSetBehaviour
			{
				description = "Enables/disables AI (move, target, etc...) - usefull for scenes ";
			};
			class sceneCreateSceneTrigger
			{
				description = "Create trigger for scene which can interrupt scene with name passed during creating the trigger";
			};
			class miscanim
			{
				description = "Library animations";
			};
			class sceneRotate
			{
				description = "Compute new object coordinates from given center and angle from MOTION BUILDER - rotates object around the center";
			};
			class sceneSetObjects
			{
				description = "1. part of s.c.e.n.e";
			};
			class sceneGetObjects
			{
				description = "2. part of s.c.e.n.e";
			};
			class sceneMiscStuff
			{
				description = "Does the basic minor scenes stuff like activating cinema borders, disallowing map, etc";
			};
			class zzRotate
			{
				description = "Rotates objects around given center about given angle ";
			};
			class sceneCheckWeapons
			{
				description = "Checks if participants have the correct weapons for scene";
			};
			class sceneCreateSoundEntities
			{
				description = "creates sound logig entities and attaches them to a characters";
			};
			class sceneAreaClearance
			{
				description = "Clearing scene area from unwanted objects";
			};
			class sceneIntruderDetector
			{
				description = "Checks if there are intruders during scene. If yes, script disables them.";
			};
		};
		class Strings
		{
			file = "A3\functions_f\strings";
			class timeToString
			{
				description = "Passed the results of the 'daytime' command, returns time formatted as a string";
			};
		};
		class Systems
		{
			file = "A3\functions_f\systems";
			class transportService
			{
				description = "Transportation system";
			};
			class supplydropService
			{
				description = "Supply drop system. Controls behavior of air vehicle - approaching and leaving drop zone.";
			};
			class supplydrop
			{
				description = "Drops object from air vehicle. Parachute size depends on dropped class.";
			};
			class respect
			{
				description = "RESpect - The Effective Calculation Process.";
			};
			class showTime
			{
				description = "Shows time gap between two dates";
			};
			class locations
			{
				description = "Spawns location game logics on locations (map-baked / created with createLocation). Locations are local on network. Game logics global.";
			};
		};
		class Variables
		{
			file = "A3\functions_f\variables";
			class areEqual
			{
				description = "Returns true if all of the passed data are identical. This function can safely compare all data types, even if data types are mixed or nil";
			};
			class swapVars
			{
				description = "Swaps the values of two variables, passed in quotes";
			};
			class variableSpaceAdd
			{
				description = "Add element to variable from someone's variable space.";
			};
			class variableSpaceRemove
			{
				description = "Remove element to variable from someone's variable space.";
			};
		};
		class Vectors
		{
			file = "A3\functions_f\vectors";
			class crossProduct
			{
				description = "Returns cross product between two 3d vectors";
			};
			class dotProduct
			{
				description = "Returns the dot product of two vectors of any dimension";
			};
			class magnitude
			{
				description = "Returns the magnitude of a vector of any dimension";
			};
			class magnitudeSqr
			{
				description = "Same as BIS_fnc_magnitude, but returns the SQUARED magnitude. This function is a little faster than BIS_fnc_magnitude";
			};
			class unitVector
			{
				description = "Returns the unit vector for the passed vector of any dimension";
			};
			class vectorMultiply
			{
				description = "Returns the unit vector for the passed vector of any dimension";
			};
			class vectorDiff
			{
				description = "Returns <vector> multiplied by <scalar>";
			};
			class vectorAdd
			{
				description = "Returns a vector that is the sum of <vector1> and <vector2>";
			};
			class vectorFromXToY
			{
				description = "Returns a unit vector that 'points' from <vector1> to <vector2>";
			};
			class rotateVector2D
			{
				description = "Returns a 2D vector rotated a specified number of degrees around the origin";
			};
		};
		class Vehicles
		{
			file = "A3\functions_f\vehicles";
			class absSpeed
			{
				description = "Returns the absolute speed of a vehicle in 3D (km/h)";
			};
		};
		class Spawning
		{
			file = "A3\functions_f\spawning";
			class spawnGroup
			{
				description = "Handles the spawning of a dynamic group of characters";
			};
			class returnGroupComposition
			{
				description = "Returns a logical group composition based on a number of parameters";
			};
			class spawnVehicle
			{
				description = "Spawn a certain vehicle type with all crew (including turrets)";
			};
			class spawnCrew
			{
				description = "Fill all crew positions in a vehicle, including turrets";
			};
			class selectCrew
			{
				description = "Return an appropriate crew type for a certain vehicle";
			};
			class taskPatrol
			{
				description = "Create a random patrol of several waypoints around a given position";
			};
			class taskDefend
			{
				description = "Group will man nearby static defenses and guard the position";
			};
			class taskAttack
			{
				description = "Group will attack the position";
			};
			class returnVehicleTurrets
			{
				description = "Returns path to all turrets and sub-turrets in a vehicle";
			};
			class ObjectsMapper
			{
				description = "Dynamic Objects Mapper";
			};
			class ObjectsGrabber
			{
				description = "Dynamic Objects Grabber";
			};
		};
	};
};
class CfgRespawnTemplates
{
	respawnTemplatesNone[] = {"None"};
	respawnTemplatesBird[] = {"Spectator","EndMission"};
	respawnTemplatesInstant[] = {"Instant","Counter"};
	respawnTemplatesBase[] = {"Base","Counter"};
	respawnTemplatesGroup[] = {"Group","EndMission"};
	respawnTemplatesSide[] = {"Side","EndMission"};
	class None
	{
		onPlayerKilled = "BIS_fnc_respawnNone";
	};
	class Spectator
	{
		onPlayerKilled = "BIS_fnc_respawnSpectator";
		onPlayerRespawn = "BIS_fnc_respawnSpectator";
	};
	class Instant
	{
		onPlayerKilled = "BIS_fnc_respawnInstant";
		onPlayerRespawn = "BIS_fnc_respawnInstant";
	};
	class Base
	{
		onPlayerKilled = "BIS_fnc_respawnBase";
		onPlayerRespawn = "BIS_fnc_respawnBase";
	};
	class Group
	{
		onPlayerRespawn = "BIS_fnc_respawnGroup";
	};
	class Side
	{
		onPlayerRespawn = "BIS_fnc_respawnSide";
	};
	class EndMission
	{
		onPlayerKilled = "BIS_fnc_respawnEndMission";
		onPlayerRespawn = "BIS_fnc_respawnEndMission";
	};
	class Seagull
	{
		onPlayerRespawn = "BIS_fnc_respawnSeagull";
	};
	class Wave
	{
		onPlayerKilled = "BIS_fnc_respawnWave";
		onPlayerRespawn = "BIS_fnc_respawnWave";
	};
	class TimePenalty
	{
		onPlayerKilled = "BIS_fnc_respawnTimePenalty";
		onPlayerRespawn = "BIS_fnc_respawnTimePenalty";
	};
	class Counter
	{
		onPlayerKilled = "BIS_fnc_respawnCounter";
		onPlayerRespawn = "BIS_fnc_respawnCounter";
	};
	class Confirm
	{
		onPlayerKilled = "BIS_fnc_respawnConfirm";
		onPlayerRespawn = "BIS_fnc_respawnConfirm";
	};
	class Tickets
	{
		onPlayerKilled = "BIS_fnc_respawnTickets";
		onPlayerRespawn = "BIS_fnc_respawnTickets";
	};
	class MenuPosition
	{
		onPlayerKilled = "BIS_fnc_respawnMenuPosition";
		onPlayerRespawn = "BIS_fnc_respawnMenuPosition";
	};
	class MenuInventory
	{
		onPlayerKilled = "BIS_fnc_respawnMenuInventory";
		onPlayerRespawn = "BIS_fnc_respawnMenuInventory";
	};
};
class CfgPostProcessTemplates
{
	class Default
	{
		colorCorrections[] = {1,1,0,{ 0,0,0,0 },{ 1,1,1,1 },{ 0,0,0,0 }};
		filmGrain[] = {0,0,0,0,0};
	};
	class EastWind
	{
		colorCorrections[] = {1,1.08,-0.06,{ 0.5,0.5,0.5,0 },{ 1.0,1.0,1.0,1.21 },{ 0.09,0.09,0.09,0.0 }};
	};
};
class cfgWaypoints
{
	class A3
	{
		displayName = "$STR_A3_WAYPOINTS_WAYPOINT";
		class Land
		{
			displayName = "$STR_A3_CfgWaypoints_Land";
			displayNameDebug = "Land";
			file = "A3\functions_f\waypoints\fn_wpLand.sqf";
		};
		class Artillery
		{
			displayName = "$STR_A3_CfgWaypoints_Artillery";
			displayNameDebug = "Artillery";
			file = "A3\functions_f\waypoints\fn_wpArtillery.sqf";
		};
	};
};
class CfgRemoteExecCommands
{
	class action{};
	class addAction{};
	class addBackpack{};
	class addCamShake{};
	class addMagazine{};
	class addMagazineCargo{};
	class addMagazines{};
	class addRating{};
	class addVehicle{};
	class addWeapon{};
	class addWeaponCargo{};
	class allowDamage{};
	class allowFleeing{};
	class assignTeam{};
	class clearMagazineCargo{};
	class clearRadio{};
	class clearWeaponCargo{};
	class closeDialog{};
	class commandFire{};
	class commandFollow{};
	class commandGetOut{};
	class commandMove{};
	class commandTarget{};
	class commandWatch{};
	class createDialog{};
	class createLocation{};
	class createMarkerLocal{};
	class createSimpleTask{};
	class cutObj{};
	class cutRsc{};
	class cutText{};
	class deleteGroup{};
	class deleteIdentity{};
	class deleteMarkerLocal{};
	class disableAI{};
	class dissolveTeam{};
	class doFire{};
	class doFollow{};
	class doGetOut{};
	class doMove{};
	class doTarget{};
	class doWatch{};
	class drop{};
	class enableAttack{};
	class enableCopilot{};
	class enableRadio{};
	class endLoadingScreen{};
	class endMission{};
	class engineOn{};
	class fadeMusic{};
	class fadeSound{};
	class fire{};
	class flyInHeight{};
	class forceEnd{};
	class forceMap{};
	class forceWeaponFire{};
	class globalChat{};
	class globalRadio{};
	class groupChat{};
	class groupRadio{};
	class hint{};
	class hintC{};
	class hintCadet{};
	class hintSilent{};
	class land{};
	class leaveVehicle{};
	class lightAttachObject{};
	class lock{};
	class lockCargo{};
	class lockDriver{};
	class lockTurret{};
	class lockWP{};
	class move{};
	class moveInAny{};
	class moveInCargo{};
	class moveInCommander{};
	class moveInDriver{};
	class moveInGunner{};
	class moveInTurret{};
	class orderGetIn{};
	class playAction{};
	class playActionNow{};
	class playMove{};
	class playMoveNow{};
	class playMusic{};
	class playSound{};
	class ppEffectAdjust{};
	class removeAction{};
	class removeAllActions{};
	class removeAllAssignedItems{};
	class removeAllWeapons{};
	class removeBackpack{};
	class removeMagazine{};
	class removeMagazines{};
	class removeMagazinesTurret{};
	class removeMagazineTurret{};
	class removeTeamMember{};
	class removeWeapon{};
	class removeWeaponTurret{};
	class saveGame{};
	class say{};
	class say2D{};
	class say3D{};
	class selectLeader{};
	class selectWeapon{};
	class setAmmo{};
	class setCaptive{};
	class setCollisionLight{};
	class setCurrentWaypoint{};
	class setDate{};
	class setDir{};
	class setFace{};
	class setFatigue{};
	class setFlagSide{};
	class setFlagTexture{};
	class setFog{};
	class setFuel{};
	class setGroupId{};
	class setGusts{};
	class setHit{};
	class setHitPointDamage{};
	class setLeader{};
	class setLightAmbient{};
	class setLightAttenuation{};
	class setLightBrightness{};
	class setLightColor{};
	class setLightDayLight{};
	class setLightFlareMaxDistance{};
	class setLightFlareSize{};
	class setLightIntensity{};
	class setLightUseFlare{};
	class setMarkerBrushLocal{};
	class setMarkerDirLocal{};
	class setMarkerShapeLocal{};
	class setMarkerSizeLocal{};
	class setMarkerTextLocal{};
	class setMarkerTypeLocal{};
	class setMimic{};
	class setName{};
	class setPilotLight{};
	class setPitch{};
	class setPlayerRespawnTime{};
	class setRadioMsg{};
	class setSpeaker{};
	class setTimeMultiplier{};
	class setTriggerActivation{};
	class setTriggerArea{};
	class setTriggerStatements{};
	class setTriggerText{};
	class setTriggerTimeout{};
	class setTriggerType{};
	class setUnconscious{};
	class setUnitPos{};
	class setUnitPosWeak{};
	class setUserActionText{};
	class setVectorDir{};
	class setVectorDirAndUp{};
	class setVectorUp{};
	class setVehicleAmmo{};
	class setVehicleAmmoDef{};
	class setVehicleArmor{};
	class setVelocity{};
	class setWPPos{};
	class showHUD{};
	class sideChat{};
	class sideRadio{};
	class switchMove{};
	class systemChat{};
	class titleText{};
	class unassignTeam{};
	class unassignVehicle{};
};
scriptsPath = "A3\Functions_F\Scripts\";
startupScript = "startupScript.sqs";
teamSwitchScript = "teamSwitchScript.sqs";
playerKilledScript = "playerKilledScript.sqs";
playerRespawnScript = "playerRespawnScript.sqs";
playerRespawnSeagullScript = "playerRespawnSeagullScript.sqs";
playerRespawnOtherUnitScript = "playerRespawnOtherUnitScript.sqs";
playerResurrectScript = "playerResurrectScript.sqs";
class CfgORBATDefault
{
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	text = "Wrong CfgORBAT definition";
	textShort = "ERROR";
	color[] = {1,0,0,1};
};
//};
