/*
	Author: Nelson Duarte

	Description:
	Show a hint to all players of side

	Parameter(s):
	http://community.bistudio.com/wiki/Arma_3_Modules

	Returns:
	NONE
*/

// Parameters
private ["_logic", "_units", "_activated"];
_logic 		= _this select 0;
_units 		= _this select 1;
_activated 	= _this select 2;

if (_activated) then {
	// Wait for parameters to be set
	if (_logic call bis_fnc_isCuratorEditable) then {
		waituntil {
			(
				!isNil { _logic getVariable "topic" }
				&&
				!isNil { _logic getVariable "hint" }
				&&
				!isNil { _logic getVariable "custom" }
				&&
				!isNil { _logic getVariable "RscAttributeSide" }
			)
			||
			isNull _logic
		};
	};
	
	// Exit if logic is null
	if (isNull _logic) exitwith {
		// Log
		"Module was probably deleted!" call BIS_fnc_log;
	};
	
	// Data
	private ["_sides", "_topic", "_hint", "_custom"];
	_sides 	= _logic getVariable "RscAttributeSide";
	_topic 	= _logic getVariable "topic";
	_hint 	= _logic getVariable "hint";
	_custom = _logic getVariable "custom";
	
	// Go through each connected player, check it's side and show hint if desired
	{
		if (side group _x in _sides && isPlayer _x) then {
			if (_custom != "") then {
				// Show custom hint
				[[[_custom], { hint (_this select 0); }], "BIS_fnc_spawn", _x, false] call BIS_fnc_mp;
			} else {
				// Show CfgHint
				[[[_topic, _hint], 15], "BIS_fnc_advHint", _x, false] call BIS_fnc_mp;
			};
		};
	} forEach playableUnits + switchableUnits;
	
	// Delete logic
	deleteVehicle _logic;
	
	// Log
	"Hint module finished" call BIS_fnc_log;
};
