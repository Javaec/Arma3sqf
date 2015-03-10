scriptName "fn_IsInZoom.sqf";
/*******************************************************************************
	Author: Zozo

	Description:
	Checks if map is zoomed to given zoom level (min, max)

	Parameter(s):
	_this select 0: ARRAY - Interval of zoom we will be checking for
	
	Returns:
	true if zoom level is in the given interval

*******************************************************************************/
private [ "_zoom", "_currentZoom", "_isInZoom" ];
_zoom = [_this, 0, [0.001, 0.0255337], [ [ ] ]] call BIS_fnc_param;
_isInZoom = false;

_currentZoom = ctrlMapScale ((finddisplay 12) displayctrl 51);
if( _currentZoom >= _zoom select 0 && _currentZoom <= _zoom select 1 ) then { _isInZoom = true; };   
	
_isInZoom
