/*
	Author: Karel Moricky

	Description:
	Convert number to roman numeral (e.g. 42 becomes "XLII")

	Parameter(s):
		0: NUMBER

	Returns:
	STRING
*/

private ["_number","_romanNumbers","_mods","_result","_mod","_numberLocal","_digits"];

_number = [_this,0,0] call bis_fnc_param;
_number = _number call bis_fnc_parsenumber;

if (_number < 1 || _number > 3999) exitwith {["Number is %1, must be in range <1,3999>",_number] call bis_fnc_error; ""};

_romanNumbers = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
_mods = [1000,900,500,400,100,90,50,40,10,9,5,4,1];

_result = "";
for "_i" from 0 to (count _mods - 1) do {
	_mod = _mods select _i;
	_numberLocal = _number;
	_number = _number % _mod;
	_digits = (_numberLocal - _number) / _mod;
	for "_d" from 1 to _digits do {
		_result = _result + (_romanNumbers select _i);
	};
};
_result