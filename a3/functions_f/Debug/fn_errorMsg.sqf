/*
	Author: Karel Moricky

	Description:
	Display error window

	Parameter(s):
	_this select 0: STRING - Formatted message
	_this select n (Optional): ANY - additional parameters

	Returns:
	NOTHING
*/

disableserialization;

//--- End loading sceen to prevent freezing the game
endloadingscreen;

//--- Display message
private ["_this","_scriptName","_displays","_classes"];
_this = _this call bis_fnc_error;
_scriptName = if (isnil "_fnc_scriptName") then {""} else {format ["%1 ",_fnc_scriptName]};

//--- Select a display for the pop-up message (no map or debug console)
_displays = +(uinamespace getvariable ["gui_displays",[]]);
_classes = +(uinamespace getvariable ["gui_classes",[]]);
{
	if ((_classes select _foreachindex) in ["RscDisplayDebug"] || _x in [finddisplay 12]) then {
		_displays set [_foreachindex,displaynull];
	};
} foreach _displays;
_displays = _displays - [displaynull];

//--- Show pop-up message
[
	format _this,
	"ERROR: " + _scriptName,
	nil,
	nil,
	if (count _displays > 0) then {_displays select (count _displays - 1)} else {nil}
] spawn BIS_fnc_guiMessage;