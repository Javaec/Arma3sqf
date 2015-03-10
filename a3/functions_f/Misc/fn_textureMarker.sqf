/*
	Author: Karel Moricky

	Description:
	Checks whether texture is defined in CfgMarkers and if so, returns the marker texture.

	Parameter(s):
		0: STRING - texture

	Returns:
	STRING
*/

private ["_texture","_textureMarker"];
_texture = [_this,0,"",[""]] call bis_fnc_param;

_textureMarker = configfile >> "CfgMarkers" >> _texture;
if (isclass _textureMarker) then {
	_texture = gettext (_textureMarker >> "icon");
};

_texture