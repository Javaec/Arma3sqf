//Parameters
private ["_object", "_selectionName", "_damage", "_source", "_projectile"];
_object		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_selectionName	= [_this, 1, "", [""]] call BIS_fnc_param;
_damage		= [_this, 2, 0, [0]] call BIS_fnc_param;
_source		= [_this, 3, objNull, [objNull]] call BIS_fnc_param;
_projectile	= [_this, 4, "", [""]] call BIS_fnc_param;

//Only allow damage if caused by the player
if (_source == player || _source == vehicle player) then {
	_damage;
} else {
	0;
};
