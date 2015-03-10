/*
	Author: Karel Moricky

	Description:
	Returns side color in RGBA format.

	Parameter(s):
	0: SIDE or NUMBER - either side or side ID
	1 (Optional) - true to return marker color

	Returns:
	ARRAY or STRING
*/

private ["_sideID","_returnMarkerColor","_sideColorArray","_sideColor"];
_sideID = [_this,0,sidelogic,[sidelogic,0]] call bis_fnc_param;
_returnMarkerColor = [_this,1,false,[false]] call bis_fnc_param;

if (typename _sideID != typename 0) then {_sideID = _sideID call bis_fnc_sideID;};

_sideColorArray = uinamespace getvariable "BIS_fnc_sideColor_array";
if (isnil {_sideColorArray}) then {
	_sideColorArray = [
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorEnemy") call bis_fnc_colorConfigToRGBA,		"ColorEAST"],		//--- 0: OFPOR
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorCivilian") call bis_fnc_colorConfigToRGBA,	"ColorWEST"],		//--- 1: BLUFOR
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorFriendly") call bis_fnc_colorConfigToRGBA,	"ColorGUER"],		//--- 2: INDEPENDENT
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorNeutral") call bis_fnc_colorConfigToRGBA,		"ColorCIV"],		//--- 3: CIVILIAN
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorUnknown") call bis_fnc_colorConfigToRGBA,		"ColorUnknown"],	//--- 4: UNKNOWN
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorUnknown") call bis_fnc_colorConfigToRGBA,		"ColorUnknown"],	//--- 5: ENEMY
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorUnknown") call bis_fnc_colorConfigToRGBA,		"ColorUnknown"],	//--- 6: FRIENDLY
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorCivilian") call bis_fnc_colorConfigToRGBA,	"ColorWEST"],		//--- 7: LOGIC
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorUnknown") call bis_fnc_colorConfigToRGBA,		"ColorUnknown"],	//--- 8: EMPTY
		[(configfile >> "cfgingameui" >> "islandmap" >> "colorCivilian") call bis_fnc_colorConfigToRGBA,	"ColorCIV"]		//--- 9: AMBIENT
	];
	uinamespace setvariable ["BIS_fnc_sideColor_array",_sideColorArray];
};

(+(_sideColorArray select _sideID) select _returnMarkerColor)