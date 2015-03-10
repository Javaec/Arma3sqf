/*
	Author: Karel Moricky

	Description:
	Halts current function and all it's parents and shows an error message.

	Parameter(s):
	_this select 0: STRING - Formatted message
	_this select n (Optional): ANY - additional parameters

	Returns:
	NOTHING
*/

//--- Display log message
private ["_msg","_fnc_error_exit"];
_fnc_error_exit = true;
_msg = _this;//[_this,0,""] call bis_fnc_param;
_msg call bis_fnc_errorMsg;


//--- Display script map
if !(isnil "_fnc_scriptMap") then {
	private "_fnc_scriptMapText";
	_fnc_scriptMapText = "EXIT";
	{
		_fnc_scriptMapText = _fnc_scriptMapText + " >> " + _x;
	} foreach _fnc_scriptMap;
	["%1",_fnc_scriptMapText] call bis_fnc_error;
};


//--- Disable all functions
/*
{
	missionnamespace setvariable [_x,{}];
} foreach (uinamespace getvariable "BIS_functions_list");
*/


//--- End loading sceen to prevent freezing the game
endloadingscreen;


//--- Terminate EVERYTHING
//--- (breaking out from non-existing scope does the trick)
breakout "#all";