

/*
	Author: Konrad Szumiec

	Description:
	Workaround fix for ATGM/SAM launch positions

	Parameter(s):
		0: OBJECT - vehicle
		1: OBJECT - projectile
		2: STRING - selection to adjust missile's position to
		3: STRING - type of projectile that should be adjusted

	Returns:
		BOOL - success
		
	Example:
		[_vehicle,_missile,"missile_move","MissileBase"] call BIS_fnc_missileLaunchPositionFix
*/



private ["_vehicle","_missile","_selection","_type"];

_vehicle = _this select 0;
_missile = _this select 1; if !(local _missile) exitWith {false};
_selection = _this select 2;
_type = _this select 3; if !(_missile isKindOf _type) exitWith {false};

private ["_localPosition","_logic","_globalPosition"];
_localPosition = _vehicle selectionPosition _selection;

if (_localPosition call BIS_fnc_magnitudeSqr == 0) exitWith {false};

// Workaround for missing modelToWorldASL scripting command
_logic = "Logic" createVehicleLocal [0,0,0];
_logic attachTo [_vehicle,_localPosition];
_globalPosition = visiblePositionASL _logic;
deleteVehicle _logic;

_missile setPosASL _globalPosition;

true