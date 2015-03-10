//Parameters
private ["_unit", "_mode"];
_unit 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_mode	= [_this, 1, 0, [0]] call BIS_fnc_param;

//Make sure unit is not inside a vehicle
if (vehicle _unit != _unit) exitWith {
	//Error
	["Unit is inside a vehicle", _unit] call BIS_fnc_error;
};

//The mode
if (_mode < 1) then {
	//Start
	_unit disableAi "MOVE";
	_unit disableAi "ANIM";
	_unit playMoveNow "Acts_listeningToRadio_In";
	_unit playMove "Acts_listeningToRadio_Loop";
	
	//Flag
	_unit setVariable ["BIS_talkingOnRadio", true];
} else {
	//Stop
	_unit playMoveNow "Acts_listeningToRadio_Out";
	_unit enableAi "MOVE";
	_unit enableAi "ANIM";
	
	//Flag
	_unit setVariable ["BIS_talkingOnRadio", nil];
};

//Return
_mode;
