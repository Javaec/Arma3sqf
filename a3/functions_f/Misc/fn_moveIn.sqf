/*
	Author: Karel Moricky

	Description:
	Moves a unit into vehicle. Compatible with assignedVehicleRole output.

	Parameter(s):
	_this select 0: OBJECT - vehicle
	_this select 1: OBJECT - unit
	_this select 2: ARRAY - role in format [name] or [name,position]

	Returns:
	BOOL - true if moved in succesfully
*/
#define BIS_FNC_MOVEIN_ERROR_NOSPACE \
	["No positions of type '%1' empty in %2",_roleName,_veh] call bis_fnc_error; \
	false


private ["_veh","_unit","_roleName"];
_veh = [_this,0,objnull,[objnull]] call bis_fnc_param;
_unit = [_this,1,objnull,[objnull]] call bis_fnc_param;
_role = [_this,2,[],[[]]] call bis_fnc_param;
_roleName = [_role,0,"",[""]] call bis_fnc_paramIn;

//--- Select role (cannot use switch-do because it's case sensitive)
if (_roleName == "cargo") then {

	//--- Cargo
	if (_veh emptypositions _roleName > 0) then {_unit moveincargo _veh; true} else {BIS_FNC_MOVEIN_ERROR_NOSPACE};
} else {
	if (_roleName == "driver") then {

		//--- Driver
		if (_veh emptypositions _roleName > 0) then {_unit moveindriver _veh; true} else {BIS_FNC_MOVEIN_ERROR_NOSPACE};
	} else {
		if (_roleName == "commander") then {

			//--- Commander
			if (_veh emptypositions _roleName > 0) then {_unit moveincommander _veh; true} else {BIS_FNC_MOVEIN_ERROR_NOSPACE};
		} else {
			if (_roleName == "turret") then {

				//--- Turret
				private ["_rolePos"];
				_rolePos = [_role,1,[],[[]]] call bis_fnc_paramIn;
				_unit moveinturret [_veh,_rolePos];
				_unit in _veh
			} else {

				//--- Error
				["'%1' is not a vehicle role, must be one of 'CARGO', 'COMMANDER', 'DRIVER' or 'TURRET'",_roleName] call bis_fnc_error;
				false
			};
		};
	};
};