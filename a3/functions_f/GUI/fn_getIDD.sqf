/*
	Author: Karel Moricky

	Description:
	Returns IDD of given display

	Parameter(s):
	_this select 0: CONFIG - config path to display

	Returns:
	NUMBER - IDD
*/

private ["_configDisplay"];
_configDisplay = [_this,0,configfile,[configfile]] call (uinamespace getvariable "bis_fnc_param");
getnumber (_configDisplay >> "idd")