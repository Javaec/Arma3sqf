/*
	Author: Jiri Wainar

	Description:
	Returns if variable has the implicit value or not. If variable is not defined then implicit value is forced and true is returned.

	Example:
	[_variableName:string] call BIS_fnc_camp_hasImplicitValue;
*/

private["_varName","_implicitValue","_var","_hasImplicitValue"];

_varName 	= [_this, 0, "", [""]] call BIS_fnc_param;
_implicitValue 	= [_varName] call BIS_fnc_camp_getImplicitValue;

if (isNil "_implicitValue") exitWith
{
	false
};

if (isNil _varName) then
{
	missionNamespace setVariable [_varName,_implicitValue];
};

if (typeName(missionNamespace getVariable [_varName,_implicitValue]) != typeName _implicitValue) then
{
	["[x] Persistent variable |%1| retyped and reset to |%2|!",_varName,_implicitValue] call BIS_fnc_logFormat;

	missionNamespace setVariable [_varName,_implicitValue];
};

_var = missionNamespace getVariable [_varName,_implicitValue];

_hasImplicitValue = false;

switch (typeName _implicitValue) do
{
	case (typeName []):
	{
		if (count _var == 1) then
		{
			if (typeName(_var select 0) == typeName "") then
			{
				if (_var select 0 == _implicitValue select 0) then
				{
					_hasImplicitValue = true;
				};
			};
		};
	};
	case (typeName "");
	case (typeName 123):
	{
		if (_var == _implicitValue) then {_hasImplicitValue = true};
	};
	default
	{
	};
};

_hasImplicitValue