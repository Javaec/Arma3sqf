/*
	Author: Karel Moricky

	Description:
	Convert number to color team name or color

	Parameter(s):
		0: NUMBER
		1: BOOL - true to return RGBA color, otherwise name is returned (default)

	Returns:
	STRING or ARRAY
*/

private ["_number","_isColor","_words"];

_number = [_this,0,0] call bis_fnc_param;
_number = _number call bis_fnc_parsenumber;
_isColor = [_this,1,false,[false]] call bis_fnc_param;

if (_number < 1 || _number > 5) exitwith {["Number is %1, must be in range <1,5>",_number] call bis_fnc_error; ""};

_words = if (_isColor) then {
	[
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorRedTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorBlueTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorGreenTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorYellowTeam") call bis_fnc_colorConfigToRGBA,
		(configfile >> "CfgIngameUI" >> "CommandBar" >> "colorWhiteTeam") call bis_fnc_colorConfigToRGBA
	]
} else {
	[
		localize "str_team_red",
		localize "str_team_blue",
		localize "str_team_green",
		localize "str_team_yellow",
		localize "str_team_main"
	]
};
_words select (_number - 1)