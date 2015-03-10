/*
	Author: Karel Moricky

	Description:
	Sort an array of strings alphabetically

	Parameter(s):
	ARRAY ot STRINGs

	Returns:
	ARRAY ot STRINGs
*/

#define CONTROL	((finddisplay 0) displayctrl 1555)

private ["_input","_output"];
_input = [[_this],0,[],[[]]] call bis_fnc_param;
lbclear CONTROL;
{
	private ["_item"];
	_item = [_x,0,str _x,[""]] call bis_fnc_paramIn;
	CONTROL lbadd _item;
} foreach _input;

lbsort CONTROL;
_output = [];
for "_i" from 0 to (lbsize CONTROL - 1) do {
	_output set [count _output,CONTROL lbtext _i];
};
lbclear CONTROL;
_output