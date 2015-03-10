
/************************************************************
	List Players
	Author: Andrew Barron

Returns an array of all objects that are players at this time.
************************************************************/

private ["_players","_x"];

_players = [];
{
	if(isplayer _x) then
	{
		[_players, _x] call BIS_fnc_arrayPush;
	}
} foreach allunits;

_players
