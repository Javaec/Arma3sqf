if (typeOf _this == "Site_Minefield") then {
	_this setVariable ["description", "Minefield", TRUE];
	_initSite = _this execVM (BIS_scrPath + "site_inits\minefield.sqf");
	["[SITES] Processing Minefield (%1 of %2)", _i, count (BIS_missionScope getVariable "sites")] call BIS_fnc_logFormat;
} else {
	if (typeOf _this == "Site_Patrol") then {
		_initSite = _this execVM (BIS_scrPath + "site_inits\patrol.sqf");
		["[SITES] Processing Patrol (%1 of %2)", _i, count (BIS_missionScope getVariable "sites")] call BIS_fnc_logFormat;
	} else {
		_this setVariable ["side", (["BLUFOR", "OPFOR", "Independent", "Civilian", "Empty", "Animals"] select (["Site_BLUFOR", "Site_OPFOR", "Site_Independent", "Site_Civilian", "Site_Empty", "Site_Ambient"] find typeOf _this)), TRUE];
		_siteType = _this getVariable "siteType";
		if ((_this getVariable "description") == "") then {_this setVariable ["description", getText (configFile >> "CfgVehicles" >> typeOf _this >> "Arguments" >> "siteType" >> "values" >> (_this getVariable "SiteType") >> "name"), TRUE]};
		if (isNil {_this getVariable "interactive"}) then {_this setVariable ["interactive", "No", TRUE]};
		if ((_this getVariable "interactive") != "No") then {_this call BIS_siteInteraction};
		_initSite = _this execVM (BIS_scrPath + format ["site_inits\%1.sqf", _siteType]);
		["[SITES] Processing %1 (%2 of %3)", (_this getVariable "description"), _i, count (BIS_missionScope getVariable "sites")] call BIS_fnc_logFormat;
		waitUntil {scriptDone _initSite};
		if (!((_this getVariable "side") in ["Empty", "Animals"])) then {_this call BIS_siteEvent_owned};
		if ((_this getVariable "fastTravel") == "Enabled") then {
			player setVariable ["BIS_FTDestinations", (player getVariable "BIS_FTDestinations") + [_this]];
			[_this] call BIS_revealSites;
		};
	};
};

_this setVariable ["processed", TRUE];