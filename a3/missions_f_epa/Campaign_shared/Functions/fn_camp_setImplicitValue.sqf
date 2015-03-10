/*
	Author: Jiri Wainar

	Description:
	Set implicit value to given persistent variable.

	Example:
	[_variableName:string(,_onlyNil:bool|true)] call BIS_fnc_camp_setImplicitValue;
*/

private["_varNames","_varName","_onlyNil","_implicitValue"];

_varNames = [_this, 0, [], ["",[]]] call BIS_fnc_param;
_onlyNil  = [_this, 1, false, [false]] call BIS_fnc_param;

if (typeName _varNames == typeName "") then
{
	_varNames = [_varNames];
};

{
	if (true) then
	{
		_varName = toLower _x;

		_implicitValue = [_varName] call BIS_fnc_camp_getImplicitValue;

		if (isNil "_implicitValue") exitWith {};

		if (_onlyNil && !(isNil _varName)) exitWith
		{
			["[i] Persistent variable |%1| not modified, current value is |%2|.",_varName,missionNamespace getVariable _varName] call BIS_fnc_logFormat;
		};

		missionNamespace setVariable [_varName,_implicitValue];

		["[i] Persistent variable |%1| set to |%2|.",_varName,_implicitValue] call BIS_fnc_logFormat;
	};
}
forEach _varNames;