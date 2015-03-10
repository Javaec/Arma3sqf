/*
	Author: Karel Moricky

	Description:
	Check if unit sits on right or left seat

	Parameter(s):
	_this: OBJECT - Unit

	Returns:
	NUMBER
		-1 - not in a vehicle
		0 - left
		1 - right
*/

private ["_unit","_unitVeh"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_unitVeh = vehicle _unit;

if (_unit != _unitVeh) then {

	//--- Left (0) or right (1)?
	(
		180 - (
			[
				[0,0,0],
				_unitVeh worldToModel (position _unit)
			] call bis_fnc_dirto
		)
	)
	max 0
	min 1

} else {

	//--- Not in a vehicle
	-1
};