/*
	Author: Nelson Duarte

	Description:
	Change the current Stage in Bootcamp MP Guided Mode

	Parameter(s):
	http://community.bistudio.com/wiki/Arma_3_Modules

	Returns:
	NONE
*/

// Parameters
private ["_logic", "_activated"];
_logic 		= _this select 0;
_activated 	= _this select 2;

if (_activated) then {
	// Validate, module must only have effect in MP Bootcamp
	if (isNil { BIS_fnc_flow } || { isNil { BIS_fnc_stage } }) exitWith {
		// Error
		"Training Stage module cannot be used outside MP Bootcamp" call BIS_fnc_error;
	};
};
