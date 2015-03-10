/*
	Author: Karel Moricky

	Description:
	Set side respawn tickets

	Parameter(s):
	NUMBER - respawn tickets

	Returns:
	BOOL
*/

private ["_tickets"];
_tickets = [_this,0,500,[0]] call bis_fnc_param;
if (_tickets >= 0) then {
	{
		if (playableslotsnumber _x > 0) then {
			[_x,_tickets] call bis_fnc_respawnTickets;
		};
	} foreach [east,west,resistance];
};
true