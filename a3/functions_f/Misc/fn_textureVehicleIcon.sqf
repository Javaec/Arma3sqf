/*
	Author: Karel Moricky

	Description:
	Checks whether texture is defined in CfgVehicleIcons and if so, returns the icon.

	Parameter(s):
		0: STRING - texture

	Returns:
	STRING
*/

private ["_texture","_textureVehicleIcon"];
_texture = [_this,0,"",[""]] call bis_fnc_param;

_textureVehicleIcon = configfile >> "CfgVehicleIcons" >> _texture;
if (istext _textureVehicleIcon) then {
	_texture = gettext _textureVehicleIcon;
};

_texture