_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _this));
_mrkrNameArea = ("BIS_siteArea_" + str ((BIS_missionScope getVariable "sites") find _this));
createMarkerLocal [_mrkrName, position _this];
createMarkerLocal [_mrkrNameArea, position _this];
_mrkrName setMarkerTypeLocal "Empty";
_mrkrNameArea setMarkerDirLocal direction _this;
_mrkrNameArea setMarkerTypeLocal "Empty";
if (!isNil {_this getVariable "axisA"}) then {
	_mrkrNameArea setMarkerShapeLocal (_this getVariable "shape");
	_mrkrNameArea setMarkerBrushLocal "Border";
	_mrkrNameArea setMarkerSizeLocal [0,0];
};
_mrkrName setMarkerTextLocal (_this getVariable "description");
_correctColor = switch (_this getVariable "side") do {
	case "BLUFOR": {"colorBLUFOR"};
	case "OPFOR": {"colorOPFOR"};
	case "Independent": {"colorIndependent"};
	case "Civilian": {"ColorOrange"};
	case "Animals": {"ColorOrange"};
	case "Empty": {"ColorWhite"};
};
_mrkrName setMarkerColorLocal _correctColor;
_mrkrNameArea setMarkerColorLocal _correctColor;
if (!isNil "PROC_debug") then {_mrkrName setMarkerTypeLocal "mil_dot"};

if (typeOf _this == "Site_Minefield") then {
	if ((_this getVariable "marked") == "Everyone" || ((_this getVariable "marked") == "Friendlies" && (side group player getFriend (_this call BIS_getCorrectSiteSide) == 1))) then {
		_mrkrName setMarkerTypeLocal "mil_warning";
		_mrkrName setMarkerSizeLocal [0.5,0.5];
		_mrkrNameArea setMarkerBrushLocal "DiagGrid";
		_mrkrNameArea setMarkerSizeLocal [parseNumber (_this getVariable "axisA"), parseNumber (_this getVariable "axisB")];
	};
};

if (!isNil {_this getVariable "visitedTrg"}) then {
	_axisA = parseNumber (_this getVariable "axisA");
	_axisB = parseNumber (_this getVariable "axisB");
	_dir = direction _this;
	_rect = FALSE;
	if ((_this getVariable "shape") == "rectangle") then {_rect = TRUE};
	
	(_this getVariable "visitedTrg") setTriggerArea [_axisA, _axisB, _dir, _rect];
	(_this getVariable "visitedTrg") triggerAttachVehicle [vehicle player];
	(_this getVariable "visitedTrg") setTriggerActivation ["MEMBER", "PRESENT", FALSE];
	(_this getVariable "visitedTrg") setTriggerStatements [
		"this || (thisTrigger getVariable 'site') in (player getVariable 'BIS_knownSites')",
		"(thisTrigger getVariable 'site') call BIS_siteEvent_visited",
		""
	];
	
	(_this getVariable "ownedTrgs") select 0 setTriggerArea [_axisA, _axisB, _dir, _rect];
	(_this getVariable "ownedTrgs") select 0 setTriggerActivation ["WEST SEIZED", "PRESENT", TRUE];
	(_this getVariable "ownedTrgs") select 0 setTriggerStatements [
		"this && WEST countSide thisList > 0 && {side group _x == WEST && !(vehicle _x isKindOf 'Air')} count thisList > 0 && (if (WEST getFriend RESISTANCE == 1) then {!(triggerActivated (((thisTrigger getVariable 'site') getVariable 'ownedTrgs') select 2))} else {TRUE})",
		"thisTrigger call BIS_siteEvent_owned",
		"thisTrigger call BIS_siteEvent_lost"
	]; 
	(_this getVariable "ownedTrgs") select 0 setTriggerTimeout [5, 10, 15, TRUE];
	
	(_this getVariable "ownedTrgs") select 1 setTriggerArea [_axisA, _axisB, _dir, _rect];
	(_this getVariable "ownedTrgs") select 1 setTriggerActivation ["EAST SEIZED", "PRESENT", TRUE];
	(_this getVariable "ownedTrgs") select 1 setTriggerStatements [
		"this && EAST countSide thisList > 0 && {side group _x == EAST && !(vehicle _x isKindOf 'Air')} count thisList > 0 && (if (EAST getFriend RESISTANCE == 1) then {!(triggerActivated (((thisTrigger getVariable 'site') getVariable 'ownedTrgs') select 2))} else {TRUE})",
		"thisTrigger call BIS_siteEvent_owned",
		"thisTrigger call BIS_siteEvent_lost"
	]; 
	(_this getVariable "ownedTrgs") select 1 setTriggerTimeout [5, 10, 15, TRUE];
	
	(_this getVariable "ownedTrgs") select 2 setTriggerArea [_axisA, _axisB, _dir, _rect];
	(_this getVariable "ownedTrgs") select 2 setTriggerActivation ["GUER SEIZED", "PRESENT", TRUE];
	(_this getVariable "ownedTrgs") select 2 setTriggerStatements [
		"this && RESISTANCE countSide thisList > 0 && {side group _x == RESISTANCE && !(vehicle _x isKindOf 'Air')} count thisList > 0 && (if (WEST getFriend RESISTANCE == 1) then {!(triggerActivated (((thisTrigger getVariable 'site') getVariable 'ownedTrgs') select 0))} else {TRUE}) && (if (EAST getFriend RESISTANCE == 1) then {!(triggerActivated (((thisTrigger getVariable 'site') getVariable 'ownedTrgs') select 1))} else {TRUE})",
		"thisTrigger call BIS_siteEvent_owned",
		"thisTrigger call BIS_siteEvent_lost"
	]; 
	(_this getVariable "ownedTrgs") select 2 setTriggerTimeout [5, 10, 15, TRUE];
};
_this setVariable ["clientInitDone", TRUE];