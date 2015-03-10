
/*********************************************************************
	Version:	1.0
	Name:		sceneRotate 
	DESCRIPTION:	Compute new object coordinates from given center and angle from MOTION BUILDER  
	PARAMETERS:	center: [x,y,z]; angle: number; init pos [x, y, z]
	RETURNED VALUE:	coordinates
**********************************************************************/

private["_center", "_angle", "_coord"];

_center 		= _this select 0;				//center
_centerAngle		= _this select 1;				//rotation of center
_angle 			= _this select 2;				//rotation
_coord	 		= _this select 3;				//init position

private["_centerX", "_centerZ", "_centerY", "_angleOffset", "_coordX", "_coordZ", "_coordY", "_eye", "_newCoord", "_coordAndAngle"];

_centerX = (_center select 0);
_centerZ = (_center select 1);
_centerY = (_center select 2);

_angleOffset = 360 - _centerAngle;

_coordX 		= (_coord select 0)/100;						//motion builder has coordinates in milimeters
_coordZ 		= ((_coord select 1)/100)*(-1);						//and has reversed Z-axis
_coordY 		= ((_coord select 2)/100);
_eye			= (180 - _angle) - _angleOffset;					//and rotated origin about 180 degree
		
_newCoord = [0, 0, 0];		
_newCoord set [0, _centerX + (_coordX * cos(_angleOffset) - _coordZ * sin(_angleOffset))];	//compute rotated 
_newCoord set [1, _centerZ + (_coordX * sin(_angleOffset) + _coordZ * cos(_angleOffset))];	//coordinates
_newCoord set [2, _coordY];									//vertical axis leave untouched

_coordAndAngle = [[],0];

_coordAndAngle set [0, _newCoord];
_coordAndAngle set [1, _eye];

_coordAndAngle
