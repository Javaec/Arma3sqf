_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _this));
_mrkrNameArea = ("BIS_siteArea_" + str ((BIS_missionScope getVariable "sites") find _this));

_mrkrName setMarkerShapeLocal "ICON";
_mrkrName setMarkerTypeLocal "mil_box";
_mrkrName setMarkerSizeLocal [1, 1];
_mrkrNameArea setMarkerSizeLocal [parseNumber (_this getVariable "axisA"), parseNumber (_this getVariable "axisB")];
_correctColor = switch (_this getVariable "side") do {
	case "BLUFOR": {"colorBLUFOR"};
	case "OPFOR": {"colorOPFOR"};
	case "Independent": {"colorIndependent"};
	case "Civilian": {"ColorOrange"};
	case "Empty": {"ColorWhite"};
};
_mrkrName setMarkerColorLocal _correctColor;
_mrkrNameArea setMarkerColorLocal _correctColor;

if ((_this getVariable "fastTravel") == "Enabled when visited") then {
	player setVariable ["BIS_FTDestinations", (player getVariable "BIS_FTDestinations") + [_this]];
	if ((_this getVariable "interactive") == "Yes_Feedback" && time > 10 && time > (player getVariable "BIS_joinedGame") + 10 && !(_this in (player getVariable "BIS_knownSites"))) then {hint format ["%2: %1\n\n%3", _this getVariable "description", localize "STR_A3_mdl_sites_hint_discovered", localize "STR_A3_mdl_sites_hint_FT_avail"]}
} else {
	if ((_this getVariable "interactive") == "Yes_Feedback" && time > 10 && time > (player getVariable "BIS_joinedGame") + 10 && !(_this in (player getVariable "BIS_knownSites")) && !(_this in (player getVariable "BIS_FTDestinations"))) then {hint format ["%1: %2", localize "STR_A3_mdl_sites_hint_discovered", _this getVariable "description"]}
};

{if (side group _x getFriend side group player == 1 && !(_this in (_x getVariable "BIS_knownSites"))) then {_x setVariable ["BIS_knownSites", (_x getVariable "BIS_knownSites") + [_this], TRUE]}} forEach (switchableUnits);

if ((_this call BIS_getCorrectSiteSide) == side group player && !(isNil {_this getVariable "cutOff"})) then {_this call BIS_siteEvent_owned};