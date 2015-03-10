/*
	Author: Karel Moricky

	Description:
	Show group tooltip.

	Parameter(s):
		0:
			CONFIG - group from CfgORBAT
			ARRAY - group params returned by BIS_fnc_ORBATGetGroupParams
		1: CONTROL - tooltip control
		2: ARRAY - mouse position in format [x,y]

	Returns:
	BOOL
*/
disableserialization;
private ["_classParams","_display","_tooltip"];
_classParams = [_this,0,[],[configfile,[]]] call bis_fnc_param;
_display = [_this,1,displaynull,[displaynull]] call bis_fnc_param;
_tooltip = _display displayctrl 2350;
if (count _classParams == 0) exitwith {
	//--- Hide the tooltip
	_tooltip ctrlsetposition [0,0,0,0];
	_tooltip ctrlcommit 0;
	false
};
private ["_tooltipText","_tooltipPicture","_mousepos","_configname","_subClassesCount","_text","_texture","_size","_color","_textureSize","_infoText","_infoPosX","_infoPosY","_infoPosW","_infoPosH"];
_mousepos = [_this,2,[0.5,0.5],[[]]] call bis_fnc_param;

_tooltipBackground = _display displayctrl 235000;
_tooltipInfoBackground = _display displayctrl 235001;
_tooltipText = _display displayctrl 235002;
_tooltipAssetsBackground = _display displayctrl 235003;
_tooltipAssets = _display displayctrl 235004;
_tooltipPictureBackground = _display displayctrl 235005;
_tooltipPicture = _display displayctrl 235006;
_tooltipPictureCoef = 0.95;
_marginTop = 0.005;

//--- Extract specific params
if (typename _classParams == typename configfile) then {_classParams = _classParams call BIS_fnc_ORBATGetGroupParams;};
_text = [_classParams,"text" call bis_fnc_ORBATGetGroupParams,"",[""]] call bis_fnc_paramIn;
_picture = [_classParams,"insignia" call bis_fnc_ORBATGetGroupParams,"",[""]] call bis_fnc_paramIn;
_infoText = [_classParams,"infoText" call bis_fnc_ORBATGetGroupParams,"",[""]] call bis_fnc_paramIn;
_assets = [_classParams,"assetsText" call bis_fnc_ORBATGetGroupParams,"",[""]] call bis_fnc_paramIn;

//--- Set text so height can be calculated
_tooltipInfoBackground ctrlsetstructuredtext parsetext ("<t color='#00000000'>" + _text + "</t>");
_tooltipText ctrlsetstructuredtext parsetext _infoText;
_tooltipAssets ctrlsetstructuredtext parsetext _assets;

//--- Calculate position
_infoPosX = (_mousePos select 0);
_infoPosY = (_mousePos select 1) + 0.04;
_infoPosW = 0.35;
_infoPosH = ctrltextheight _tooltipText + _marginTop;// + 0.01;
if (((safezoneX + safezoneW) - _infoPosX) < _infoPosW) then {_infoPosX = (_mousePos select 0) - _infoPosW};
if (((safezoneY + safezoneH) - _infoPosY) < _infoPosH) then {_infoPosY = (_mousePos select 1) - _infoPosH};
_assetsH = if (_assets != "") then {ctrltextheight _tooltipAssets + 0.01;} else {0};
_pictureH = if (_picture != "") then {(_infoPosW / 2) * 4/3} else {0};

//--- Do not display tooltip on first try to prevent size mismatch
//if ((ctrltext _tooltipText) != str parsetext _infoText) then {_infoPosY = -1;};

//--- Set whole group
_tooltip ctrlsetposition [
	_infoPosX,
	_infoPosY,
	_infoPosW,
	_infoPosH + (_marginTop * 3 + _assetsH) + (_marginTop + _pictureH + (_infoPosW * ((1 - _tooltipPictureCoef) / 2)) * 4/3)
];
_tooltip ctrlshow true;
_tooltip ctrlcommit 0;

//--- Set text
_tooltipText ctrlsetposition [
	0,
	0,
	_infoPosW,
	_infoPosH
];
_tooltipText ctrlcommit 0;

_tooltipBackground ctrlsetposition [
	0,
	0,
	_infoPosW,
	_infoPosH
];
_tooltipBackground ctrlcommit 0;

//--- Set title background
_tooltipInfoBackground ctrlsetposition [
	0,
	0,
	_infoPosW,
	ctrltextheight _tooltipInfoBackground + _marginTop
];
_tooltipInfoBackground ctrlcommit 0;

//--- Set assets
if (_assetsH > 0) then {
	_tooltipAssetsBackground ctrlsetposition [
		0,
		_infoPosH + _marginTop,
		_infoPosW,
		_assetsH + _marginTop * 2
	];
	_tooltipAssetsBackground ctrlcommit 0;
	_tooltipAssets ctrlsetposition [
		0,
		_infoPosH + _marginTop * 3,
		_infoPosW,
		_assetsH
	];
	_tooltipAssets ctrlcommit 0;
	_assetsH = _assetsH + _marginTop * 3;
} else {
	_tooltipAssetsBackground ctrlsetposition [0,0,0,1];
	_tooltipAssetsBackground ctrlcommit 0;
	_tooltipAssets ctrlsetposition [1,1,1,1];
	_tooltipAssets ctrlcommit 0;
};

//--- Set picture
if (_pictureH > 0) then {
	_tooltipPictureBackground ctrlsetposition [
		0,
		_infoPosH + _assetsH + _marginTop,
		_infoPosW,
		_pictureH * (1 / _tooltipPictureCoef)
	];
	_tooltipPictureBackground ctrlcommit 0;

	_tooltipPicture ctrlsetposition [
		_infoPosW * ((1 - _tooltipPictureCoef) / 2),
		_infoPosH + _assetsH + (_marginTop + (_infoPosW * ((1 - _tooltipPictureCoef) / 2)) * 4/3),
		_infoPosW * _tooltipPictureCoef,
		_pictureH * _tooltipPictureCoef
	];
	_tooltipPicture ctrlcommit 0;
	_tooltipPicture ctrlsettext _picture;
} else {
	_tooltipPictureBackground ctrlsetposition [1,1,1,1];
	_tooltipPictureBackground ctrlcommit 0;
	_tooltipPicture ctrlsettext "";
};

true