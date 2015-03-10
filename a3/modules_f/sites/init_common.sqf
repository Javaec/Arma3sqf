// ---------- register core procedures

// ---------- BIS_siteCoreInit: system core init
BIS_siteCoreInit = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\coreInit.sqf");

// ---------- BIS_siteCoreInit: system common init
BIS_siteCommonInit = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\commonInit.sqf");

// ---------- BIS_civilCheck: controls distance between player and site/civilian spot
BIS_civilCheck = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\civilCheck.sqf");

// ---------- BIS_createUnitsCiv: spawns disabled civilian units
BIS_createUnitsCiv = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\createUnitsCiv.sqf");

// ---------- BIS_deleteUnitsCiv: hide and disable civilian unit
BIS_deleteUnitsCiv = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\deleteUnitsCiv.sqf");

// ---------- BIS_selectUnitCiv: returns not used civilian unit
BIS_selectUnitCiv = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\selectUnitCiv.sqf");

// ---------- BIS_occupySiteBuilding: spawns garrison in a building
BIS_occupySiteBuilding = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\occupyBuilding.sqf");

// ---------- BIS_forcedFT: forced Fast Travel to a specified location
BIS_forcedFT = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\forcedFT.sqf");

// ---------- BIS_revealSite: reveal a site to player during mission
BIS_revealSites = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\reveal.sqf");

// ---------- BIS_siteEvent_visited: code executed after a site is visited
BIS_siteEvent_visited = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\event_visited.sqf");

// ---------- BIS_siteEvent_owned: code executed after a site is owned
BIS_siteEvent_owned = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\event_owned.sqf");

// ---------- BIS_siteEvent_owned: code executed after a site is lost
BIS_siteEvent_lost = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\event_lost.sqf");

// ---------- BIS_siteInteraction: sets up triggers to evaluate the status of a site
BIS_siteInteraction = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\interaction.sqf");

// ---------- BIS_pickSiteGroup: selects config entry for preferred group
BIS_pickSiteGroup = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\pickGroup.sqf");

// ---------- BIS_pickSiteUnit: selects classname for preferred unit type
BIS_pickSiteUnit = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\pickUnit.sqf");

// ---------- BIS_getCorrectSiteSide: returns typename Side based on input Site side string
BIS_getCorrectSiteSide = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\getCorrectSide.sqf");

// ---------- BIS_setCorrectSiteSide: assigns correct side string to a site
BIS_setCorrectSiteSide = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\setCorrectSide.sqf");

// ---------- BIS_setCorrectSiteFaction: assigns correct faction string to a site
BIS_setCorrectSiteFaction = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\setCorrectFaction.sqf");

// ---------- BIS_spawnSitePatrol: spawns patrols around a site
BIS_spawnSitePatrol = compile preprocessFileLineNumbers (BIS_scrPath + "procedures\spawnPatrol.sqf");

if (isNil {player getVariable "BIS_FTDestinations"}) then {player setVariable ["BIS_FTDestinations", [], TRUE]};	// ---------- sites available for fast travel
if (isNil {player getVariable "BIS_knownSites"}) then {player setVariable ["BIS_knownSites", [], TRUE]};	// ---------- sites revealed to player by design

// ---------- fast travel action
[] spawn {
	{if (_this select 1 && _this select 2 == "FastTravel" && leader player == player && count (player getVariable "BIS_FTDestinations") > 0) then {[] execVM (BIS_scrPath + "procedures\fastTravel.sqf")}} call bis_fnc_onDiaryChanged;
	waitUntil {leader player == player && count (player getVariable "BIS_FTDestinations") > 0};
	player createDiarySubject ["FastTravel", "Fast Travel"];
};

if (!isNull player) then {		// ---------- check for dedicated server
	player setVariable ["BIS_joinedGame", time];
	[] spawn {
		waitUntil {!isNil "BIS_initSitesCoreDone"};
		{
			_x call BIS_siteCommonInit;
		} forEach (BIS_missionScope getVariable "sites");
		if (isServer) then {BIS_initSitesDone = TRUE; publicVariable "BIS_initSitesDone"};
		while {count allSites > count (BIS_missionScope getVariable "sites")} do {
			_oldCnt = count (BIS_missionScope getVariable "sites");
			waitUntil {count (BIS_missionScope getVariable "sites") > _oldCnt};
			{
				if (isNil {_x getVariable "clientInitDone"}) then {
					if (isNil {_x getVariable "processed"}) then {
						sleep 1;
						_x setVariable ["processed", TRUE];
					};
					waitUntil {_x getVariable "processed"};
					_x call BIS_siteCommonInit;
				};
			} forEach (BIS_missionScope getVariable "sites");
		};
	};
} else {
	BIS_initSitesDone = TRUE; publicVariable "BIS_initSitesDone";
};