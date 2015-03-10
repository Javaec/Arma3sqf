/*
	Author: Jiri Wainar

	Description:
	Loads global variable from campaign save.

	Example:
	["BIS_PER_POOL_weapon"] call BIS_fnc_camp_loadVar;
*/

private["_var","_value","_implicitValue"];

_var = [_this, 0, "", [""]] call bis_fnc_param;

if (_var == "") exitWith
{
	["[!] Required parameter <variable_name> is not defined!"] call BIS_fnc_error;
};

_implicitValue = _var call BIS_fnc_camp_getImplicitValue;

if (typeName(missionNamespace getVariable [_var, _implicitValue]) == typeName []) then
{
	_value =+ (missionNamespace getVariable [_var, _implicitValue]);
}
else
{
	_value = missionNamespace getVariable [_var, _implicitValue];
};

//create the gvar and fill-in the loaded value
//["[i] Variable |%1| loaded: %2",_var,_value] call BIS_fnc_logFormat;

missionNamespace setVariable [_var, _value];