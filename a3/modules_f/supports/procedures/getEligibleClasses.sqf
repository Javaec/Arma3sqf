_supportType = _this;
_wantedSideID = [EAST,WEST,RESISTANCE,CIVILIAN] find side group player;

_factionOnly = TRUE;

{
	if (!(isNil {_x getVariable "BIS_SUPP_filter"})) then {
		if ((_x getVariable "BIS_SUPP_filter") == "Side") then {
			_factionOnly = FALSE
		}
	}
} forEach (player getVariable "BIS_SUPP_allProviderModules");

_pool = missionNameSpace getVariable ("BIS_SUPP_eligible_" + _supportType);

_result = [];

{
  	if (_wantedSideID == getNumber (configFile >> "CfgVehicles" >> _x >> "side") && (if (_factionOnly) then {faction player == getText (configFile >> "CfgVehicles" >> _x >> "faction")} else {TRUE})) then {
  		_result = _result + [_x]
  	}
} forEach _pool;

_result