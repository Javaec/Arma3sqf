/*
	Author: Karel Moricky

	Description:
	Align two columns divided by tabs

	Parameter(s):
		0: ARRAY in format
			[
				["left column 1","righ column 1"],
				["left column 2","righ column 2"],
				...
			]

	Returns:
	STRING
*/
private ["_input","_charsMax","_charsArray","_text","_br","_tabCount","_left","_right","_leftCount","_space","_spaceText"];

_input = [[_this],0,[],[[]]] call bis_fnc_param;
_charsMax = 0;
_charsArray = [];
{
	_left = [_x,0,"",[""]] call bis_fnc_paramin;
	_leftCount = count toarray _left;
	_charsMax = _charsMax max _leftCount;
	_charsArray set [count _charsArray,_leftCount];
} foreach _input;
_charsMax = _charsMax + 1;


_text = "";
_br = tostring [13,10];
_tabCount = 8;
{

	_left = [_x,0,"",[""]] call bis_fnc_paramin;
	_right = [_x,1,"",[""]] call bis_fnc_paramin;
	_leftCount = _charsArray select _foreachindex;

	_space = _charsMax - _leftCount;
	if (_leftCount % _tabCount == (_tabCount - 1)) then {_space = _space + 1};
	_spaceText = "";
	for "_s" from 1 to _space step _tabCount do {_spaceText = _spaceText + "	";};

	_text = _text + _left + _spaceText + _right + _br;
} foreach _input;

_text