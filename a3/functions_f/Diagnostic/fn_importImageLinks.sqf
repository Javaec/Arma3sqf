/*
	Author: Karel Moricky

	Description:
	Imports CfgVehicles image links from Community Wiki (https://community.bistudio.com/)

	1) Run the script. It will copy a text into clipboard
	2) Start a new Community Wiki page and paste the text into edit field
	3) Preview the page (don't save it)
	4) Copy the resulting text and use it in your scripts

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

startloadingscreen [""];
_br = tostring [13,10];
_text = " _imagesCfgVehicles = [" + _br;
_productShort = productversion select 1;
{
	_scope = getnumber (_x >> "scope");
	_side = getnumber (_x >> "side");
	_model = gettext (_x >> "model");
	if (_scope > 0 && _side in [0,1,2,3,4] && _model != "") then {
		_class = configname _x;
		_text = _text + format [" 	""%3"",""{{filepath:%1 CfgVehicles %2.jpg}}"",",_productShort,_class,tolower _class] + _br;
	};
} foreach ((configfile >> "cfgvehicles") call bis_fnc_returnchildren);
_text = _text + " 	"""",""""" + _br;
_text = _text + " ];";

copytoclipboard _text;
endloadingscreen;
true