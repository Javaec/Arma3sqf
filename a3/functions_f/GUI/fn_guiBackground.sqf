/*
	Author: Karel Moricky

	Description:
	Creates GUI background

	Parameter(s):
	_this select 0: ARRAY - background position in format [x,y,w,h]

	Returns:
	DISPLAY
*/

#define DISPLAY_CLASS	"RscCommonBackground"
#define DISPLAY		_display
#define DISPLAY_UI	(uinamespace getvariable DISPLAY_CLASS)
#define CONTROL		(DISPLAY displayctrl _idc)

disableserialization;
private ["_pos","_layer","_posX","_posY","_posW","_posH"];

_pos = [_this,0,[0,0,0,0],[[]]] call bis_fnc_param;
_layer = [_this,1,-1,[0]] call bis_fnc_param;

_posX = ([_pos,0,0,[0]] call bis_fnc_paramIn) call bis_fnc_parsenumber;
_posY = ([_pos,1,0,[0]] call bis_fnc_paramIn) call bis_fnc_parsenumber;
_posW = ([_pos,2,0,[0]] call bis_fnc_paramIn) call bis_fnc_parsenumber;
_posH = ([_pos,3,0,[0]] call bis_fnc_paramIn) call bis_fnc_parsenumber;

uinamespace setvariable ["RscBackground_X",_posX];
uinamespace setvariable ["RscBackground_Y",_posY];
uinamespace setvariable ["RscBackground_W",_posW];
uinamespace setvariable ["RscBackground_H",_posH];

if (_layer > 0) then {
	if ([_posW,_posH] distance [0,0] > 0) then {

		//--- Show
		_layer cutrsc [DISPLAY_CLASS,"plain"];
	} else {

		//--- Hide
		_layer cuttext ["","plain"];
	};
};