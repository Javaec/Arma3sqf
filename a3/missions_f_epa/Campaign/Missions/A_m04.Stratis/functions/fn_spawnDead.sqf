//Parameters
private ["_position", "_direction", "_class", "_group"];
_position	= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_direction	= [_this, 1, random 360, [0]] call BIS_fnc_param;
_class		= [_this, 2, typeOf player, [""]] call BIS_fnc_param;
_group		= [_this, 3, createGroup WEST, [grpNull]] call BIS_fnc_param;

//Create the unit
private "_unit";
_unit = _group createUnit [_class, _position, [], 0, "NONE"];

//Set direction
_unit setDir _direction;

//Add velocity, so bodies don't end up always on same rag doll pose
_unit setVelocity [random 10, random 10, random 10];

//Kill unit
_unit setDamage 1;

//Return
true;
