/*
	Author: Josef Zemanek

	Description:
	Spawns the Course selector (used primarily for VR missions).

	Parameter(s):
		0: ARRAY - position
		1: STRING (Optional) - selector variant ("default", "incomplete", "complete", "exit")

	Returns:
	Selector object
*/

private ["_pos", "_variant", "_type", "_mrkr"];

_pos = [_this,0,position player,[[]]] call BIS_fnc_param;
_pos set [2, (_pos select 2) + 0.15];
_variant = [_this,1,"default",[""]] call BIS_fnc_param;

_variant = toLower _variant;

_type = switch (_variant) do {
	case "default": {"VR_3DSelector_01_default_F"};
	case "incomplete": {"VR_3DSelector_01_incomplete_F"};
	case "complete": {"VR_3DSelector_01_complete_F"};
	case "exit": {"VR_3DSelector_01_exit_F"};
	default {"VR_3DSelector_01_default_F"};
};

_mrkr = _type createVehicle _pos;
_mrkr setPos _pos;
_mrkr setVariable ["BIS_VR_speed", 1];

player reveal [_mrkr, 4];

_mrkr spawn {
	while {!isNull _this} do {
		_this setDir (direction _this + (_this getVariable "BIS_VR_speed"));
		sleep 0.025;
	};
};

_mrkr