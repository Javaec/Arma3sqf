/*
	Author: Karel Moricky

	Description:
	Set object rotation

	Parameter(s):
		0: OBJECT
		1: ARRAY - vector in format:
			0: NUMBER - Yaw
			1: NUMBER - Pitch
			2: NUMBER - Roll

	Returns:
	NOTHING
*/


//extract parameters
private ["_obj","_rotation","_pitch","_roll","_yaw","_vdir","_vup","_sign"];

_obj = [_this,0,objnull,[objnull]] call bis_fnc_param;
_rotation = [_this,1,[],[[]]] call bis_fnc_param;
_yaw = [_rotation,0,0,[0]] call bis_fnc_paramin;
_pitch = [_rotation,1,0,[0]] call bis_fnc_paramin;
_roll = [_rotation,2,0,[0]] call bis_fnc_paramin;

_yaw = 360 - _yaw;

//----------------------------
//find vector dir (pitch)
//----------------------------

//find sign of pitch
_sign = [1,-1] select (_pitch < 0);

//cut off numbers above 180
while {abs _pitch > 180} do {_pitch = _sign*(abs _pitch - 180)};

//we can't use pitch that is exactly equal to 90, because then the engine doesn't know what 2d compass direction the object is facing
if(abs _pitch == 90) then {_pitch = _sign*(89.9)};

//we can't pitch beyond 90 degrees without changing the facing of our object
//(pitching beyond 90 degrees means that the object's eyes will point in the 2d compass direction that its back used to point)
if(abs _pitch > 90) then
{
	//we are rolling upside down; flip our direction (yaw)
	_obj setdir (getdir _obj)-180;
	_yaw = 360-(getdir _obj);

	//use bank to flip upside down
	_roll = _roll + 180;

	//and adjust our original pitch
	_pitch = (180 - abs _pitch)*_sign;
};

//find appropriate vdir according to our pitch, as if we were facing north
_vdir = [0, cos _pitch, sin _pitch];

//then rotate around the origin according to object's yaw (direction)
_vdir = [_vdir, _yaw] call BIS_fnc_rotateVector2D;


//----------------------------
//find vector up (bank)
//----------------------------

//find sign of bank
_sign = [1,-1] select (_roll < 0);

//cut off numbers above 360
while {abs _roll > 360} do {_roll = _sign*(abs _roll - 360)};

//reflect numbers above 180
if(abs _roll > 180) then {_sign = -1*_sign; _roll = (360-_roll)*_sign};

//find appropriate vup according to our bank, as if we were facing north
_vup  = [sin _roll, 0, cos _roll];

//rotate around origin
_vup =  [_vup,  _yaw] call BIS_fnc_rotateVector2D;


//----------------------------
//apply the vectors
//----------------------------

_obj setVectorDirAndUp [_vdir, _vup];