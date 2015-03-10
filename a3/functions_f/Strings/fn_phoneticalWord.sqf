/*
	Author: Karel Moricky

	Description:
	Convert number to NATO phonetical alphabet word (e.g. 2 becomes "Bravo")

	Parameter(s):
		0: NUMBER

	Returns:
	STRING
*/

private ["_number","_short","_words"];

_number = [_this,0,0] call bis_fnc_param;
_number = _number call bis_fnc_parsenumber;
_short = [_this,1,false,[false]] call bis_fnc_param;

if (_number < 1 || _number > 26) exitwith {["Number is %1, must be in range <1,26>",_number] call bis_fnc_error; ""};

_words = if (_short) then {
	["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
} else {
	[
		localize "STR_A3_RADIO_A",
		localize "STR_A3_RADIO_B",
		localize "STR_A3_RADIO_C",
		localize "STR_A3_RADIO_D",
		localize "STR_A3_RADIO_E",
		localize "STR_A3_RADIO_F",
		localize "STR_A3_RADIO_G",
		localize "STR_A3_RADIO_H",
		localize "STR_A3_RADIO_I",
		localize "STR_A3_RADIO_J",
		localize "STR_A3_RADIO_K",
		localize "STR_A3_RADIO_L",
		localize "STR_A3_RADIO_M",
		localize "STR_A3_RADIO_N",
		localize "STR_A3_RADIO_O",
		localize "STR_A3_RADIO_P",
		localize "STR_A3_RADIO_Q",
		localize "STR_A3_RADIO_R",
		localize "STR_A3_RADIO_S",
		localize "STR_A3_RADIO_T",
		localize "STR_A3_RADIO_U",
		localize "STR_A3_RADIO_V",
		localize "STR_A3_RADIO_W",
		localize "STR_A3_RADIO_X",
		localize "STR_A3_RADIO_Y",
		localize "STR_A3_RADIO_Z"
	]
};
_words select (_number - 1)