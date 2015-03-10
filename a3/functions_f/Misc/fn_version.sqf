
/*
	File: fn_version.sqf
	Author: Karel Moricky

	Description:
	Detects are available expansions and addons.

	Returns:
	Array -	list ov expansions
		0 - ARMA 2
		1 - Operation Arrowhead
		2 - BAF
		3 - ...
		4 - PMC
*/
private ["_result","_isA2","_isEP1","_isBAF","_isPMC"];
_result = [];

_isA2 = isclass (configfile >> "CfgPatches" >> "Chernarus");
_isEP1 = isclass (configfile >> "CfgPatches" >> "ca_E");
_isBAF = isclass (configfile >> "CfgMods" >> "BAF") && getnumber (configfile >> "CfgMods" >> "BAF" >> "isLite") == 0;
_isPMC = isclass (configfile >> "CfgMods" >> "BIS_PMC") && getnumber (configfile >> "CfgMods" >> "BIS_PMC" >> "isLite") == 0;

if (_isA2) then {_result = _result + [0]};
if (_isEP1) then {_result = _result + [1]};
if (_isBAF) then {_result = _result + [2]};
if (_isPMC) then {_result = _result + [4]};

_result