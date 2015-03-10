/*
	Author: Karel Moricky

	Description:
	Converts RGBA color format to HTML color format
	[0,0,0,1] became "#ff000000"
	Alpha value in field will be ignored.

	Returns:
	String
*/


private ["_colorRGB","_colorHTML","_color","_color1","_color2","_colorHTML1","_colorHTML2"];

_colorRGB = [[_this],0,[0,0,0,0],[[]],[4]] call bis_fnc_param;
_colorHTML = "";

for "_i" from 0 to 3 do {
	_color = _colorRGB select _i;
	_color = round (_color * 255);
	_color2 = _color % 16;
	_color1 = (_color - _color2) / 16;
	_colorHTML1 = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"] select _color1;
	_colorHTML2 = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"] select _color2;
	_colorHTML = if (_i == 3) then {_colorHTML1 + _colorHTML2 + _colorHTML} else {_colorHTML + _colorHTML1 + _colorHTML2};
};
_colorHTML = "#" + _colorHTML;
_colorHTML;