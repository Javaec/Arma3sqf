private ["_vehicle", "_newInit"];
_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_newInit = [_this, 1, "", ["", {}]] call BIS_fnc_param;

private ["_oldInit"];
_oldInit = _x getVariable ["BIS_fnc_saveScene_init", []];
if (typeName _oldInit != typeName []) then {_oldInit = [_oldInit]};

// Compile new init
private ["_init"];
_init = _oldInit + [_newInit];

// Change init
_vehicle setVariable ["BIS_fnc_saveScene_init", _init];