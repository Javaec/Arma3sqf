_site = nearestObject [_this, "Logic"];
_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _site));
_mrkrNameArea = ("BIS_siteArea_" + str ((BIS_missionScope getVariable "sites") find _site));

_checkedSide = switch ((triggerActivation _this) select 0) do {
	case "WEST SEIZED": {WEST};
	case "EAST SEIZED": {EAST};
	case "GUER SEIZED": {RESISTANCE}
};

_site setVariable ["side", "Empty", TRUE];

if ((_site getVariable "fastTravel") == "Enabled when owned") then {
	player setVariable ["BIS_FTDestinations", (player getVariable "BIS_FTDestinations") - [_this]]
};

if ((_checkedSide getFriend side group player) == 1 || count list (_site getVariable "visitedTrg") > 0) then {
	_mrkrName setMarkerColorLocal "ColorWhite";
	_mrkrNameArea setMarkerColorLocal "ColorWhite";
};
if ((_checkedSide getFriend side group player) == 1) then {
	if ((_site getVariable "interactive") == "Yes_Feedback" && time > 10 && time > (player getVariable "BIS_joinedGame") + 10) then {hint format ["%1: %2", localize "STR_A3_mdl_sites_hint_lost", _site getVariable "description"]}
};