
/*
	File: fn_threat.sqf
	Author: Karel Moricky

	Description:
	Calculates threat values of given unit

	Parameter(s):
		_this: Given unit

	Returns:
	Number: Threat level in range from 0 to 3
*/
private ["_unit","_threat","_threatUnit","_threatVeh"];

_unit = _this;
_threat = 0;
_threatUnit = getarray(configfile >> "cfgvehicles" >> typeof _unit >> "threat");
{_threat = _threat + _x} foreach _threatUnit;

if (vehicle _unit != _unit && effectivecommander vehicle _unit == _unit) then {
	_unit = vehicle _unit;
	_threatVeh = getarray(configfile >> "cfgvehicles" >> typeof _unit >> "threat");
	{_threat = _threat + _x} foreach _threatVeh;
};

_threat;