_supportType = _this select 0;
_targetPos = _this select 1;

_requesterModules = [];
_syncedToRMs = [];
_correctProviderModules = [];
_syncedToCPMs = [];
_correctProviders = [];
_availableProviders = [];
_pickedProvider = objNull;

{if (typeOf _x == "SupportRequester") then {_requesterModules = _requesterModules + [_x]}} forEach synchronizedObjects player;
{_syncedToRMs = _syncedToRMs + synchronizedObjects _x} forEach _requesterModules;
{if (typeOf _x == ("SupportProvider_" + _supportType) || typeOf _x == ("SupportProvider_Virtual_" + _supportType)) then {_correctProviderModules = _correctProviderModules + [_x]}} forEach _syncedToRMs;

if ({typeOf _x == ("SupportProvider_Virtual_" + _supportType)} count _correctProviderModules == 0) then {

	{_syncedToCPMs = _syncedToCPMs + synchronizedObjects _x} forEach _correctProviderModules;
	{if (!(_x isKindOf "Logic") && alive _x && side group _x != CIVILIAN) then {_correctProviders = _correctProviders + [_x]}} forEach _syncedToCPMs;

	if (count _correctProviders == 0) exitWith {hint localize "STR_A3_mdl_supp_hint_noProvs"};

	player setVariable ["BIS_SUPP_correctProviderModules", _correctProviderModules];
	player setVariable ["BIS_SUPP_providersPoolForPick", _correctProviders];
	player setVariable ["BIS_SUPP_selectedProvider", objNull];

	BIS_SUPP_commMenu = [
		[localize "STR_A3_mdl_supp_comm_provider" + (if ((player getVariable format ["BIS_SUPP_limit_%1_total", _supportType]) < 1000) then {format [" (%1 " + localize "STR_disp_left" + ")", ((player getVariable format ["BIS_SUPP_limit_%1_total", _supportType]) - (player getVariable format ["BIS_SUPP_used_%1", _supportType]))]} else {""}), TRUE]
	];

	{
		BIS_SUPP_commMenu = BIS_SUPP_commMenu + [
			[
				format ["%1 (%2)", getText (configFile >> "CfgVehicles" >> typeOf vehicle _x >> "displayName"), group _x],
				[_forEachIndex + 2],
				"",
				-5,
				[[
					"expression",
					format ["if (!((player getVariable 'BIS_SUPP_providersPoolForPick') select %1 getVariable 'BIS_SUPP_supporting') || !(alive ((player getVariable 'BIS_SUPP_providersPoolForPick') select %1))) then {player setVariable ['BIS_SUPP_selectedProvider', (player getVariable 'BIS_SUPP_providersPoolForPick') select %1]} else {hint localize 'STR_A3_mdl_supp_hint_provUnavail'}", _forEachIndex]
				]],
				"1",
				switch (_supportType) do {
					case "Artillery": {if ((_x getVariable "BIS_SUPP_supporting") || count (getArtilleryAmmo [vehicle _x]) == 0) then {"0"} else {"1"}};
					case "CAS_Heli": {if (vehicle _x == _x || (_x getVariable "BIS_SUPP_supporting") || !(someAmmo vehicle _x) || fuel vehicle _x < 0.1) then {"0"} else {"1"}};
					case "CAS_Bombing": {if (vehicle _x == _x || (_x getVariable "BIS_SUPP_supporting") || !((vehicle _x) call BIS_SUPP_checkBombs) || fuel vehicle _x < 0.1) then {"0"} else {"1"}};
					case "Drop": {if (vehicle _x == _x || (_x getVariable "BIS_SUPP_supporting") || fuel vehicle _x < 0.1) then {"0"} else {"1"}};
					case "Transport": {if (vehicle _x == _x || (_x getVariable "BIS_SUPP_supporting") || fuel vehicle _x < 0.1) then {"0"} else {"1"}};
					default {if (_x getVariable "BIS_SUPP_supporting") then {"0"} else {"1"}};
				},
				""
			]
		];
	} forEach _correctProviders;

	[] spawn {
		sleep 0.1;
		showCommandingMenu "#USER:BIS_SUPP_commMenu"
	}

}