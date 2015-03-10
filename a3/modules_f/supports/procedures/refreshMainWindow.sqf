_requesterModules = [];
_syncedToRMs = [];
_allProviderModules = [];

{if (typeOf _x == "SupportRequester") then {_requesterModules = _requesterModules + [_x]}} forEach synchronizedObjects player;
{_syncedToRMs = _syncedToRMs + synchronizedObjects _x} forEach _requesterModules;
{if (typeOf _x in BIS_SUPP_providerTypes) then {_allProviderModules = _allProviderModules + [_x]}} forEach _syncedToRMs;

player setVariable ["BIS_SUPP_allProviderModules", _allProviderModules];

if (isNil {player getVariable "BIS_SUPP_popup_pool"}) then {player setVariable ["BIS_SUPP_popup_pool", []]};

waitUntil {(!isNil "BIS_requesterFSM" || isServer) && !isNil "BIS_SUPP_cursor"};

if (!isNil "BIS_requesterFSM") then {

	{
		_total = 0;
		_type = _x;
		{
			_total = _total + (_x getVariable format ["BIS_SUPP_limit_%1", _type])
		} forEach _requesterModules;
		player setVariable [format ["BIS_SUPP_limit_%1_total", _type], _total]
	} forEach [
		"Artillery",
		"CAS_Heli",
		"CAS_Bombing",
		"UAV",
		"Drop",
		"Transport"
	];

	{
		_supportID = _x;
		if (({_mdl = _x; typeOf _mdl == format ["SupportProvider_%1", _supportID] && {!(_x isKindOf "Logic") && !(vehicle _x isKindOf "Man") && canMove vehicle _x && count crew vehicle _x > 0 && side group _x != CIVILIAN} count synchronizedObjects _mdl > 0} count _allProviderModules > 0 || ({typeOf _x == format ["SupportProvider_Virtual_%1", _supportID]} count _allProviderModules > 0 && (count (_supportID call BIS_SUPP_getEligibleClasses) > 0 || {typeOf _x == format ["SupportProvider_Virtual_%1", _supportID] && count (_x getVariable "BIS_SUPP_vehicles") > 0} count _allProviderModules > 0))) && ((player getVariable format ["BIS_SUPP_used_%1", _supportID]) < (player getVariable format ["BIS_SUPP_limit_%1_total", _supportID]))) then {
			if (!(_supportID in (player getVariable "BIS_SUPP_popup_pool"))) then {
				player setVariable ["BIS_SUPP_popup_pool", (player getVariable "BIS_SUPP_popup_pool") + [_supportID]];
				_handle = [player, format ["Support_Request_%1", _supportID]] call BIS_fnc_addCommMenuItem;
				player setVariable [format ["BIS_SUPP_popup_ID_%1", _supportID], _handle];
				[] spawn {
					_rnd = random 2;
					sleep _rnd;
					_index = [WEST, EAST, RESISTANCE] find side group player;
					_lastReportTime = BIS_SUPP_lastReport select _index;
					if (BIS_SUPP_reportNewSupports && time > 0 && time > (_lastReportTime + 10)) then {player kbTell [(player getVariable "BIS_SUPP_HQ"), "BIS_SUPP_protocol", "Ping_New_Available"]; BIS_SUPP_lastReport set [_index, time]; publicVariable "BIS_SUPP_lastReport"};
				};
			};
		} else {
			if (_supportID in (player getVariable "BIS_SUPP_popup_pool")) then {
				player setVariable ["BIS_SUPP_popup_pool", (player getVariable "BIS_SUPP_popup_pool") - [_supportID]];
				[player, player getVariable format ["BIS_SUPP_popup_ID_%1", _supportID]] call BIS_fnc_removeCommMenuItem;
			};
		};
	} forEach [
		"Artillery",
		"CAS_Heli",
		"CAS_Bombing",
		"UAV",
		"Drop",
		"Transport"
	];

	if (player getVariable "BIS_SUPP_supporting") then {
		if (!("Supporting" in (player getVariable "BIS_SUPP_popup_pool"))) then {
			player setVariable ["BIS_SUPP_popup_pool", (player getVariable "BIS_SUPP_popup_pool") + ["Supporting"]];
			[player, "Support_Report_Done"] call BIS_fnc_addCommMenuItem;
			[player, "Support_Report_Failed"] call BIS_fnc_addCommMenuItem;
		};
	} else {
		if ("Supporting" in (player getVariable "BIS_SUPP_popup_pool")) then {
			player setVariable ["BIS_SUPP_popup_pool", (player getVariable "BIS_SUPP_popup_pool") - ["Supporting"]];
			[player, "Support_Report_Done"] call BIS_fnc_removeCommMenuItem;
			[player, "Support_Report_Failed"] call BIS_fnc_removeCommMenuItem;
		};
	};

};