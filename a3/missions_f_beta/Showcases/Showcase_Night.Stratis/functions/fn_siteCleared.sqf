//Params
private "_logic";
_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Validate logic object
if (isNull _logic) exitWith {
	"Logic object must not be null" call BIS_fnc_error;
};

//Site related variables
private ["_id", "_statement", "_chaos"];
_id 		= _logic getVariable "BIS_id";
_statement 	= _logic getVariable "BIS_clearedStatement";
_chaos 		= _logic getVariable "BIS_chaos";

//Flag
_logic setVariable ["BIS_cleared", true];

//Execute statement
_logic call _statement;

//Add chaos
[_chaos] call BIS_fnc_sn_chaos;

//Log
[
	"%1 as been cleared",
	_id
] call BIS_fnc_logFormat;

//Return value
true;
