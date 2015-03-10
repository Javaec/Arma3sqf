/*
	Author: Karel Moricky

	Description:
	Display debug message

	Parameter(s):
	_this select 0: STRING - Formatted message or first param
	_this select n (Optional): ANY - additional parameters

	Returns:
	BOOL - true when done
*/

private["_omit"];

if (isNil "_fnc_log_disable") then 
{
	_omit = false;
}
else
{
	_omit = _fnc_log_disable;
};

if (_omit) exitWith {false};

if (
	//--- Dev version
	cheatsEnabled
	||
	//--- Editor
	((uinamespace getvariable ["gui_displays",[]]) find (finddisplay 26) == 1)
	||
	//--- Manual toggle
	getnumber (missionconfigfile >> "allowFunctionsLog") > 0
) then {
	private ["_scriptName","_text"];

	//--- Insert function name where available
	_scriptName = if (isnil "_fnc_scriptName"/* || isnil "_fnc_scriptNameParent"*/) then {
		""
	} else {
		_fnc_scriptName
	};
	_scriptName = if (_scriptName != "") then {" [" + _scriptName + "] "} else {" "};

	//--- Show
	_text = profilename + "/BIS_fnc_log:" + _scriptName + str _this;
	diag_log _text;
	true
} else {
	false
};