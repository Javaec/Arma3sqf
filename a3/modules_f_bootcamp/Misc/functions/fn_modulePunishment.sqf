/*
	Author: Nelson Duarte

	Description:
	Make a unit play a punishment animation

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
				!isNil { _logic getVariable "punishment" }
				&&
				{ !isNull attachedTo _logic }
				&&
				{ attachedTo _logic isKindOf "Man" }
			)
			||
			isNull _logic
		};
	};

	// Exit if logic is null
	if (isNull _logic) exitwith {
		// Log
		"Punishment module was probably deleted!" call BIS_fnc_log;
	};

	// The unit this module is attached to
	private "_unit";
	_unit = attachedTo _logic;

	// The punishment animation
	private "_animation";
	_animation = _logic getVariable "punishment";

	// Force unit to play animation
	[[[_unit, _animation], { (_this select 0) playMove (_this select 1); }], "BIS_fnc_spawn", _unit, false] call BIS_fnc_mp;

	// Delete logic
	deleteVehicle _logic;

	// Log
	"Punishment module finished" call BIS_fnc_log;
};
