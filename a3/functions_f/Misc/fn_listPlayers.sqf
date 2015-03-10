/*
	Author: Karel Moricky

	Description:
	Returns list of playable units

	Returns:
	ARRAY - list of units
*/

private ["_players"];

//--- Search in allUnits, otherwise dead players are ignored
_players = [];
{
	if (isplayer _x) then {_players set [count _players,_x];};
} foreach (allunits + alldead);

_players
