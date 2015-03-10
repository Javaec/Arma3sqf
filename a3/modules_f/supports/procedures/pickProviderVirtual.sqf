_supportType = _this select 1;
_targetPos = _this select 2;
_this = _this select 0;

_correctProviders = [];

_allProvierModules = _this getVariable "BIS_SUPP_allProviderModules";
_correctModules = [];

{if (typeOf _x == ("SupportProvider_Virtual_" + _supportType)) then {_correctModules = _correctModules + [_x]}} forEach _allProvierModules;

_module = _correctModules select 0;
{
	if (isNil {_x getVariable "BIS_SUPP_cooldown"}) then {
		_x setVariable ["BIS_SUPP_cooldown", 0, TRUE];
	};

	if (isNil {_x getVariable "BIS_SUPP_lastCall"}) then {
		_x setVariable ["BIS_SUPP_lastCall", -1e6, TRUE];
	};
	if (((_x getVariable "BIS_SUPP_lastCall") + (_x getVariable "BIS_SUPP_cooldown")) < ((_module getVariable "BIS_SUPP_lastCall") + (_module getVariable "BIS_SUPP_cooldown"))) then {_module = _x};
} forEach _correctModules;
player setVariable ["BIS_SUPP_selectedModule", _module, TRUE];

_usableVehs = [];

{
	if (!(_x isKindOf "Logic") && !((typeOf vehicle _x) in _usableVehs) && side group _x != CIVILIAN) then {_usableVehs = _usableVehs + [typeOf vehicle _x]}
} forEach synchronizedObjects _module;

{
	if (!(_x in _usableVehs)) then {_usableVehs = _usableVehs + [_x]}
} forEach (_module getVariable "BIS_SUPP_vehicles");

if (count _usableVehs == 0) then {
	_usableVehs = _supportType call BIS_SUPP_getEligibleClasses
};

if (count _usableVehs > 9) then {_usableVehs resize 9};

player setVariable ["BIS_SUPP_providersPoolForPick", _usableVehs];
player setVariable ["BIS_SUPP_selectedProviderVeh", ""];

_cooldown = time - (_module getVariable "BIS_SUPP_lastCall") - (_module getVariable "BIS_SUPP_cooldown");

BIS_SUPP_commMenu = [
	[localize "STR_A3_mdl_supp_comm_provider" + (if ((player getVariable format ["BIS_SUPP_limit_%1_total", _supportType]) < 1000) then {format [" (%1 " + localize "STR_disp_left" + ")", ((player getVariable format ["BIS_SUPP_limit_%1_total", _supportType]) - (player getVariable format ["BIS_SUPP_used_%1", _supportType]))]} else {""}) + (if (_cooldown < 0) then {" (" + toLower localize "STR_state_expect" + ")"} else {""}), TRUE]
];

{
	BIS_SUPP_commMenu = BIS_SUPP_commMenu + [
		[
			getText (configFile >> "CfgVehicles" >> _x >> "displayName"),
			[_forEachIndex + 2],
			"",
			-5,
			[[
				"expression",
				format ["player setVariable ['BIS_SUPP_selectedProviderVeh', (player getVariable 'BIS_SUPP_providersPoolForPick') select %1]", _forEachIndex]
			]],
			"1",
			if (time > (((player getVariable "BIS_SUPP_selectedModule") getVariable "BIS_SUPP_cooldown") + ((player getVariable "BIS_SUPP_selectedModule") getVariable "BIS_SUPP_lastCall"))) then {"1"} else {"0"},
			""
		]
	];
} forEach _usableVehs;

[] spawn {
	sleep 0.1;
	showCommandingMenu "#USER:BIS_SUPP_commMenu"
};