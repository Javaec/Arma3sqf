
/************************************************************
	Rotate 2D Vector
	Author: Andrew Barron

Parameters: [[vector], angle]
Returns: [vector]

This function returns a 2D vector rotated a specified number
of degrees around the origin.
************************************************************/

private ["_v","_d","_x","_y"];

//extract parameters
_v = +(_this select 0); //we don't want to modify the originally passed vector
_d = _this select 1;

//extract old x/y values
_x = _v select 0;
_y = _v select 1;

//if vector is 3d, we don't want to mess up the last element
_v set [0, (cos _d)*_x - (sin _d)*_y];
_v set [1, (sin _d)*_x + (cos _d)*_y];

//return new vector
_v