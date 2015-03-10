private ["_site", "_checkedSide"];			// ----------  trigger or site can be passed
if (_this isKindOf "Logic") then {
	_site = _this;
	_checkedSide = switch (_site getVariable "side") do {
		case "BLUFOR": {WEST};
		case "OPFOR": {EAST};
		case "Independent": {RESISTANCE};
		case "Civilian": {CIVILIAN}
	}
} else {
	_site = nearestObject [_this, "Logic"];
	_checkedSide = switch ((triggerActivation _this) select 0) do {
		case "WEST SEIZED": {WEST};
		case "EAST SEIZED": {EAST};
		case "GUER SEIZED": {RESISTANCE}
	}
};

[_site, _checkedSide] call BIS_setCorrectSiteSide;

if ((((_checkedSide getFriend side group player) == 1 && _checkedSide != CIVILIAN) || _checkedSide == side group player || count list (_site getVariable "visitedTrg") > 0) && (if (isNil {_site getVariable "cutOff"}) then {TRUE} else {triggerActivated (_site getVariable "visitedTrg")})) then {
	_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _site));
	_mrkrNameArea = ("BIS_siteArea_" + str ((BIS_missionScope getVariable "sites") find _site));
	
	{if (side group _x getFriend side group player == 1 && !(_site in (_x getVariable "BIS_knownSites"))) then {_x setVariable ["BIS_knownSites", (_x getVariable "BIS_knownSites") + [_site], TRUE]}} forEach (switchableUnits);
	
	_mrkrName setMarkerShapeLocal "ICON";
	_mrkrName setMarkerTypeLocal "mil_box";
	_mrkrName setMarkerSizeLocal [1, 1];
	_mrkrNameArea setMarkerSizeLocal [parseNumber (_site getVariable "axisA"), parseNumber (_site getVariable "axisB")];
	_correctColor = switch (_checkedSide) do {
		case WEST: {"colorBLUFOR"};
		case EAST: {"colorOPFOR"};
		case RESISTANCE: {"colorIndependent"};
		case CIVILIAN: {"ColorOrange"};
	};
	_mrkrName setMarkerColorLocal _correctColor;
	_mrkrNameArea setMarkerColorLocal _correctColor;

	if ((_site getVariable "fastTravel") == "Enabled when owned" || (_site in (player getVariable 'BIS_knownSites') && (_site getVariable "fastTravel") == "Enabled when visited")) then {
		player setVariable ["BIS_FTDestinations", (player getVariable "BIS_FTDestinations") + [_site]];
		if ((_site getVariable "interactive") == "Yes_Feedback" && time > 10 && time > (player getVariable "BIS_joinedGame") + 10) then {hint format ["%2: %1\n\n%3", _site getVariable "description", localize "STR_A3_mdl_sites_hint_owned", localize "STR_A3_mdl_sites_hint_FT_avail"]}
	} else {
		if ((_site getVariable "interactive") == "Yes_Feedback" && time > 10 && time > (player getVariable "BIS_joinedGame") + 10) then {hint format ["%2: %1", _site getVariable "description", localize "STR_A3_mdl_sites_hint_owned"]}
	}
};