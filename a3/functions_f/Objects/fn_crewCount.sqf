/*
	Author: Karel Moricky

	Description:
	Return number of crew positions in vehicle

	Parameter(s):
		0: STRING - vehicle class
		1 (Optional): BOOL - true to include also cargo positions

	Returns:
	NUMBER
*/


private ["_class","_includeCargo","_cfg","_personTurret","_crewCount"];
_class = [_this,0,"",[""]] call bis_fnc_param;
_includeCargo = [_this,1,false,[false]] call bis_fnc_param;
_cfg = configfile >> "CfgVehicles" >> _class;
_personTurret = if (_includeCargo) then {1} else {0};

if (isclass _cfg) then {
	_crewCount = getnumber (_cfg >> "hasDriver");
	_crewCount = _crewCount + (
		{
			getnumber (_x >> "hasGunner") > 0 && getnumber (_x >> "isPersonTurret") <= _personTurret
		} count (_class call bis_fnc_getTurrets)
	);
	if (_includeCargo) then {_crewCount = _crewCount + getnumber (_cfg >> "transportSoldier");};
	_crewCount
} else {
	["Class '%1' doesn't exist",_class] call bis_fnc_error;
	-1
};

