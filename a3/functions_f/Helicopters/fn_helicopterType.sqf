/*
	Author: Karel Moricky

	Description:
	Returns helicopter type

	Parameter(s):
	_this: OBJECT - Helicopter

	Returns:
	NUMBER
		-1 - Not recognized
		0 - Light
		1 - Medium
		2 - Heavy
*/

private ["_heli","_returnType"];
_heli = vehicle ([_this,0,objnull,[objnull]] call bis_fnc_param);
_returnType = [_this,1,[-1,0,1,2],[[]],[4]] call bis_fnc_param;;

if (_heli iskindof "Heli_Light01_Base_H") then {
	_returnType select 1
} else {
	if (_heli iskindof "Heli_Medium01_Base_H") then {;
		_returnType select 2
	} else {
		if (_heli iskindof "Heli_Heavy_Base_H") then {
			_returnType select 3
		} else {
			_returnType select 0
		};
	};
};