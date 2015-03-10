_module = _this select 0;

if (isNil "BIS_SUPP_pickProvider") then {call compile preprocessFileLineNumbers "A3\modules_f\supports\init_common.sqf"};

if (count synchronizedObjects _module == 0) then {["[SUPPORTS] Warning: No units synced with provider module %1", _module] call BIS_fnc_logFormat};

_oldSynced = [];

if (!isServer) then {sleep 2};

while {TRUE} do {		// run the correct provider FSM for all newly-synchronized units
	if (count synchronizedObjects _module != count _oldSynced) then {call BIS_SUPP_refreshMainWindow};
	{
		if (!(_x in _oldSynced)) then {
			_oldSynced = _oldSynced + [_x];
			if ((local _x || isNil {_x getVariable "BIS_SUPP_supporting"}) && !(_x isKindOf "Logic") && side group _x != CIVILIAN) then {
				_x execFSM (switch (typeOf _module) do {
					case "SupportProvider_Artillery": {"A3\modules_f\supports\fsms\artillery.fsm"};
					case "SupportProvider_CAS_Heli": {"A3\modules_f\supports\fsms\cas_heli.fsm"};
					case "SupportProvider_CAS_Bombing": {"A3\modules_f\supports\fsms\cas_bombing.fsm"};
					case "SupportProvider_UAV": {"A3\modules_f\supports\fsms\uav.fsm"};
					case "SupportProvider_Drop": {"A3\modules_f\supports\fsms\drop.fsm"};
					case "SupportProvider_Transport": {"A3\modules_f\supports\fsms\transport.fsm"}
				});
				_x setVariable ["BIS_SUPP_supporting", FALSE, TRUE];
				_x setVariable ["BIS_SUPP_supportType", "", TRUE];
				if (!(_x kbHasTopic "BIS_SUPP_protocol")) then {_x kbAddTopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}]};
				["[SUPPORTS] Provider module initialized for %1", _x]  call BIS_fnc_logFormat;
			};
			call BIS_SUPP_refreshMainWindow;
		}
	} forEach synchronizedObjects _module;
	sleep 3;
};