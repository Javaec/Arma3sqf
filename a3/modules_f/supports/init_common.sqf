BIS_SUPP_providerTypes = [
	"SupportProvider_Artillery",
	"SupportProvider_Virtual_Artillery",
	"SupportProvider_CAS_Heli",
	"SupportProvider_Virtual_CAS_Heli",
	"SupportProvider_CAS_Bombing",
	"SupportProvider_Virtual_CAS_Bombing",
	"SupportProvider_UAV",
	"SupportProvider_Virtual_UAV",
	"SupportProvider_Drop",
	"SupportProvider_Virtual_Drop",
	"SupportProvider_Transport",
	"SupportProvider_Virtual_Transport"
];
BIS_SUPP_pickProvider = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\pickProvider.sqf";
BIS_SUPP_pickProviderVirtual = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\pickProviderVirtual.sqf";
BIS_SUPP_checkBombs = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\checkBombs.sqf";
BIS_SUPP_calculateAmmo = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\calculateAmmo.sqf";
BIS_SUPP_distributeRounds = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\distributeRounds.sqf";
BIS_SUPP_getEligibleClasses = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\getEligibleClasses.sqf";
BIS_SUPP_refreshMainWindow = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\refreshMainWindow.sqf";
BIS_SUPP_landingFailsafe = compile preprocessFileLineNumbers "A3\modules_f\supports\procedures\landingFailsafe.sqf";

BIS_SUPP_cursor = getText (configFile >> "CfgIngameUI" >> "Cursor" >> "iconCursorSupport");
BIS_SUPP_channels = ["", "", ""];
if (isNil "BIS_SUPP_lastReport") then {BIS_SUPP_lastReport = [-20, -20, -20]; publicVariable "BIS_SUPP_lastReport"};
if (isNil "BIS_SUPP_reportNewSupports") then {BIS_SUPP_reportNewSupports = TRUE; publicVariable "BIS_SUPP_reportNewSupports"};

[] spawn {
	sleep 1;
	{(group _x) setGroupID [localize "STR_A3_cfgmarkers_nato_hq"]} forEach [BIS_SUPP_HQ_WEST, BIS_SUPP_HQ_EAST, BIS_SUPP_HQ_GUER];
};

BIS_supp_refresh = FALSE;

[] spawn {
	while {TRUE} do {
		waitUntil {BIS_supp_refresh};
		call BIS_SUPP_refreshMainWindow;
		BIS_supp_refresh = FALSE;
	};
};

{
	missionNamespace setVariable ["BIS_SUPP_eligible_" + _x, []]
} forEach [
	"Artillery",
	"CAS_Heli",
	"CAS_Bombing",
	"UAV",
	"Drop",
	"Transport"
];

_allVehs = configFile >> "CfgVehicles";

for [{_x = 0}, {_x < count _allVehs}, {_x = _x + 1}] do {
	_item = _allVehs select _x;
	_name = configName _item;

	if (isClass _item) then {
  		if (configName _item isKindOf "AllVehicles" && getNumber (_item >> "scope") > 1 && count getArray (_item >> "availableForSupportTypes") > 0) then {
  			{
  				missionNamespace setVariable ["BIS_SUPP_eligible_" + _x, (missionNamespace getVariable ("BIS_SUPP_eligible_" + _x)) + [_name]]
  			} forEach getArray (_item >> "availableForSupportTypes")
  		}
  	}

};