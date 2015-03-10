BIS_fnc_initFF_terminate = false;
BIS_fnc_initFF_punish = false;

// Friendly fire eventhandler
BIS_fnc_initFF_eventhandler = {
	private ["_killer"];
	_killer = _this select 1;
	
	// Proceed if killed by player
	if (_killer in [vehicle BIS_lacey, BIS_lacey]) then {
		BIS_fnc_initFF_punish = true;
	};
};

private ["_side"];
_side = BIS_lacey call BIS_fnc_objectSide;

{
	if (!(isPlayer _x) && (_side getFriend (_x call BIS_fnc_objectSide) == 1) && !(_x getVariable ["BIS_fnc_initFF_exclude", false])) then {
		// Add eventhandlers
		_x addEventHandler ["Killed", {_this call BIS_fnc_initFF_eventhandler}];
		[_x, {this addEventHandler ["Killed", {_this call BIS_fnc_initFF_eventhandler}]}] call BIS_fnc_setSceneInit;
	};
} forEach (allUnits + vehicles);

[] spawn {
	scriptName "BIS_fnc_initFF: punish control";
	
	// Wait for friendly fire or for the system to be terminated
	waitUntil {BIS_fnc_initFF_punish || side BIS_lacey == sideEnemy || BIS_fnc_initFF_terminate};
	
	// Proceed only if the system wasn't terminated
	if (!(BIS_fnc_initFF_terminate)) then {
		BIS_fnc_initFF_punish = true;
		
		// End mission
		playMusic "";
		0 fadeMusic 0.5;
		["friendlyFire", false, true, true, true] call BIS_fnc_endMission;
	};
};

true