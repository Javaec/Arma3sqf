scriptName "initPhasing.sqf";

if !(BIS_PhaseObjects) exitWith {};

private["_objects","_params"];

_objects = allMissionObjects "All";

{
	_params = [_x] + (_x getVariable ["BIS_phase",[0,1,2,3,4,5,6,7,8,9]]);
	_params call BIS_fnc_camp_phase;
}
forEach _objects;