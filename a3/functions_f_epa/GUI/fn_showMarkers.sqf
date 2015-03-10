scriptName "fn_ShowHUBMarkers.sqf";
/*******************************************************************************
	Author: Zozo

	Description:
	Show or hide given markers using fade effect

	Parameter(s):
	_this select 0: STRING - "show" or "hide" 
	_this select 1 ARRAY - List of marker names (strings)

	Returns:
	none

*******************************************************************************/
private [ "_HUBMarkers", "_option", "_HUBMarkers",  "_speed" ];
_option		=  [_this, 0, "show" , [ "" ]] call BIS_fnc_param;  
_HUBMarkers	= [_this, 1, [] , [ [] ]] call BIS_fnc_param;

_speed = 0.005; 		
	
if ( _option == "show" ) then
{

	for "_alpha" from 0.0 to 1.0 step 0.03 do
	{
		{
			_x setMarkerAlpha _alpha;
		} forEach _HUBMarkers;
		Sleep _speed;
	};
};


if ( _option == "hide" ) then
{

	for "_alpha" from 1.0 to 0.0 step -0.03 do
	{
		{
			_x setMarkerAlpha _alpha;
		} forEach _HUBMarkers;
		Sleep _speed;
	};
};
