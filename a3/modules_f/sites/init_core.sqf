"sites_init_core" call bis_fnc_startloadingscreen;

['[SITES] Initializing server...'] call BIS_fnc_logFormat;

BIS_scrPath = "\A3\modules_f\sites" + toString [92];	// ---------- using "\" messes up syntax highlight
publicVariable "BIS_scrPath";

createCenter WEST; WEST setFriend [EAST, 0]; if (WEST getFriend RESISTANCE == -1) then {WEST setFriend [RESISTANCE, 1]};
createCenter EAST; EAST setFriend [WEST, 0]; if (EAST getFriend RESISTANCE == -1) then {EAST setFriend [RESISTANCE, 0]};
createCenter RESISTANCE; RESISTANCE setFriend [WEST, WEST getFriend RESISTANCE]; RESISTANCE setFriend [EAST, EAST getFriend RESISTANCE];
createCenter CIVILIAN;

// ---------- make sure both the mission scope and the functions module are ready
createCenter sideLogic;

if (isNil "BIS_missionScope") then {
	_missionScopeGroup = createGroup sideLogic;
	"Logic" createUnit [[10,10,0], _missionScopeGroup, "BIS_missionScope = this"];
	publicVariable "BIS_missionScope"
};

// ---------- separate the sites that are supposed to be initialized later from the rest
_sites = +allSites;
_lateSites = [];
{
	_x setVariable ["processed", FALSE];
	if (isNil {_x getVariable "conditionOfPresence"}) then {_x setVariable ["conditionOfPresence", "TRUE", TRUE]};
	if (toUpper (_x getVariable "conditionOfPresence") != "TRUE") then {_x setVariable ["conditionOfPresence", compile (_x getVariable "conditionOfPresence")];_lateSites = (_lateSites + [_x])};
} forEach _sites;
_sites = (_sites - _lateSites);

// ---------- save all sites initialized at the mission start to mission scope
BIS_missionScope setVariable ["sites", _sites, TRUE];

{if (!isPlayer _x) then {_x setVariable ["BIS_FTDestinations", [], TRUE]; _x setVariable ["BIS_knownSites", [], TRUE]}} forEach switchableUnits;		// ---------- details in init_common.sqf

call compile preprocessFileLineNumbers (BIS_scrPath + "init_common.sqf");

// ---------- initialize the sites; run site-specific scripts
_i = 1;
{
	_x call BIS_siteCoreInit;
	_i = _i + 1
} forEach _sites;

// ---------- initialize the later sites
[_lateSites, _i] spawn {
	_lateSites = _this select 0;
	_i = _this select 1;
	while {count _lateSites > 0} do {
		{
			if (_x call (_x getVariable "conditionOfPresence")) then {
				_lateSites = (_lateSites - [_x]);
				BIS_missionScope setVariable ["sites", (BIS_missionScope getVariable "sites") + [_x], TRUE];
				_x call BIS_siteCoreInit;
				[] spawn {sleep 5; BIS_fps_rescanNewObjects = TRUE};
				_i = _i + 1;
			};
		} forEach _lateSites;
		sleep 1;
	};
};

BIS_initSitesCoreDone = TRUE;
publicVariable "BIS_initSitesCoreDone";

waitUntil {!isNil "BIS_initSitesDone"};		// ---------- init finishes in init_common.sqf

["[SITES] Server initialized"] call BIS_fnc_logFormat;

"sites_init_core" call bis_fnc_endloadingscreen;