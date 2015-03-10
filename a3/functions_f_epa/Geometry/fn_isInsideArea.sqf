scriptName "fn_IsInsideArea.sqf";
/*******************************************************************************
	Author: Zozo

	Description:
	Checks if given coordinates are inside given area (center and size)

	Parameter(s):
	_this select 0: ARRAY - Area center position [x,y,z]
	_this select 1  ARRAY - Area size [sizex, sizey]
	_this select 2  ARRAY - position to test[x,y,z] 

	Returns:
	true if the given coordinates are inside the given area

*******************************************************************************/

private [ "_position", "_areapos", "_areasize", "_posX", "_posY", "_posXmin", "_posYmin", "_posXmax", "_posYmax", "_isInside" ];


_areapos 	= [_this, 0, [], [ [] ] ] call BIS_fnc_param;    
_areasize 	= [_this, 1, [], [ [] ] ] call BIS_fnc_param;   
_position 	= [_this, 2, [], [ [] ]] call BIS_fnc_param;
   
_isInside = false;
_posXmin = (_areapos select 0) - ((_areasize select 0));
_posYmin = (_areapos select 1) - ((_areasize select 1)); 
_posXmax = (_areapos select 0) + ((_areasize select 0));
_posYmax = (_areapos select 1) + ((_areasize select 1));
	
_posX = _position select 0;
_posY = _position select 1;
	
	
if( (_posX >= _posXmin && _posX <= _posXmax) && (_posY >= _posYmin && _posY <= _posYmax) ) then { _isInside = true };	

_isInside