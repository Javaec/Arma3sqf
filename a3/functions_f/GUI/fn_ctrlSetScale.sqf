/*
	Author: Karel Moricky
	
	Description:
	Scale a control while maintaining its centering
	
	Parameters:
		0: CONTROL
		1: NUMBER - scale (default is 1)
		2: NUMBER - commit time (default is 0)
	
	Returns:
	ARRAY - final position
*/


private ["_control","_scale","_commit","_controlPos","_controlPosX","_controlPosY","_controlPosW","_controlPosH","_controlPosCenterX","_controlPosCenterY","_controlPos"];

_control = [_this,0,controlnull,[controlnull]] call bis_fnc_param;
_scale = [_this,1,1,[1]] call bis_fnc_param;
_commit = [_this,2,0,[0]] call bis_fnc_param;

//--- Get current position
_controlPos = ctrlposition _control;
_controlPosX = _controlPos select 0;
_controlPosY = _controlPos select 1;
_controlPosW = (_controlPos select 2) * 0.5;
_controlPosH = (_controlPos select 3) * 0.5;

//--- Calculate center
_controlScale = ctrlscale _control;
_controlPosCenterX = _controlPosX + _controlPosW * _controlScale;
_controlPosCenterY = _controlPosY + _controlPosH * _controlScale;

//--- Apply the changes
_controlPos = [
	_controlPosCenterX - _controlPosW * _scale,
	_controlPosCenterY - _controlPosH * _scale,
	_controlPosW * 2,
	_controlPosH * 2
];
_control ctrlsetposition _controlPos;
_control ctrlsetscale _scale;
_control ctrlcommit _commit;
_controlPos