_module = _this select 0;

if (typeName (_module getVariable "BIS_SUPP_limit_Artillery") != typeName 0) then {
	{
		_module setVariable [format ["BIS_SUPP_limit_%1", _x], parseNumber (_module getVariable format ["BIS_SUPP_limit_%1", _x]), TRUE];
		if ((_module getVariable format ["BIS_SUPP_limit_%1", _x]) == -1) then {
			_module setVariable [format ["BIS_SUPP_limit_%1", _x], 10e10, TRUE]
		}
	} forEach [
		"Artillery",
		"CAS_Heli",
		"CAS_Bombing",
		"UAV",
		"Drop",
		"Transport"
	];
};

if (isNil "BIS_SUPP_HQ_WEST") then {
	{
		createCenter _x;
		_HQGrp = createGroup _x;
		(["B_Soldier_F", "O_Soldier_F", "I_soldier_F"] select _forEachIndex) createUnit [[10,10,10], _HQGrp, format ["this setUnitRank ""MAJOR""; BIS_SUPP_HQ_%1 = this; this setVehicleVarName ""BIS_SUPP_HQ_%1""; publicVariable ""BIS_SUPP_HQ_%1""", _x]];
	} forEach [WEST, EAST, RESISTANCE];
	[] spawn {
		sleep 0.1;
		{
			_x stop TRUE;
			_x allowDamage FALSE;
			_x hideObject TRUE;
			if (!(_x kbHasTopic "BIS_SUPP_protocol")) then {_x kbAddTopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}]};
		} forEach [BIS_SUPP_HQ_WEST, BIS_SUPP_HQ_EAST, BIS_SUPP_HQ_GUER]
	};
};

if (isNil "BIS_SUPP_pickProvider") then {call compile preprocessFileLineNumbers "A3\modules_f\supports\init_common.sqf"};

if (side group player == CIVILIAN) exitWith {["[SUPPORTS] Warning: Requester unit %1 is civilian, skipping...", player] call BIS_fnc_logFormat;};

waitUntil {player in (synchronizedObjects _module)};

if (isNil "BIS_requesterFSM") then {
	{player setVariable [format ["BIS_SUPP_used_%1", _x], 0, TRUE]} forEach [
		"Artillery",
		"CAS_Heli",
		"CAS_Bombing",
		"UAV",
		"Drop",
		"Transport"
	];
	player setVariable ["BIS_SUPP_transmitting", FALSE];
	if (!(player kbHasTopic "BIS_SUPP_protocol")) then {player kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}]};
	if (isNil {player getVariable "BIS_SUPP_HQ"}) then {player setVariable ["BIS_SUPP_HQ", missionNamespace getVariable format ["BIS_SUPP_HQ_%1", side group player]]};
	if (!(isNil {_module getVariable "BIS_SUPP_custom_HQ"})) then {if ((_module getVariable "BIS_SUPP_custom_HQ") != "") then {player setVariable ["BIS_SUPP_HQ", call compile (_module getVariable "BIS_SUPP_custom_HQ")]}};
	(player getVariable "BIS_SUPP_HQ") kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
	BIS_requesterFSM = [] execFSM "A3\modules_f\supports\fsms\requester.fsm";
	["[SUPPORTS] Requester module initialized for %1", player] call BIS_fnc_logFormat;
};