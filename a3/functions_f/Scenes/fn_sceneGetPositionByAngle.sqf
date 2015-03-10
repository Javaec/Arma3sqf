
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:		sceneGetPositionByAngle
 *	description:	returns new calculated position of object from angle and distance from specified object   
 *	author:		zozo
 *	parameters:	described bellow	
 *	return value:	array of new coordinates [x, y]
 *	  
 ******************************************************************************/ 


private["_levels"];
//here we define elevation offsets for decks levels on ship
_levels = 	[
			09.1294,		//level 0 - large hall
			12.3988,		//level 1
			14.5369,		//level 2
			15.8865,		//level 3 - main deck
			19.4589,		//level 4 - firing deck
			27.41			//level 5 - higher deck
		];

private["_uhelNew", "_uhel", "_vzdalenost", "_who", "_unit", "_newCoordinates","_LeaderX","_LeaderY","_uhelNew","_unitX","_unitY","_tempPos"];

_uhel 		= _this select 0;		//angle from object or marker
_vzdalenost 	= _this select 1;		//distance from object or marker
_who 		= _this select 2;		//from who (what object, marker)
//_unit 		= _this select 3;		//who (not needed) - OBSOLETE, use nil

_shipLevel = -1;
if((count _this) == 5) then 
{
	_shipLevel	= _this select 4;
};		//set the name of level(deck) on ship

if(!isNil"BIS_debugModules") then
{
	textLogFormat["_shipLevel = %1",_shipLevel];
};

_tempPos = [0,0,0];
if(typeName _who == "Object") then
{
	
	if(_shipLevel == -1) then
	{
		_tempPos = getpos _who;
	}
	else
	{
		_tempPos = getposASL _who;
	};
	
	_uhelNew = 90 - ((getdir _who) + _uhel);
}
else
{
	_tempPos = getMarkerpos _who;
	_uhelNew = 90 - ((markerDir _who) + _uhel);
};


if(!isNil"BIS_debugModules") then
{
	textLogFormat["tempPos = %1",_tempPos];
};
_LeaderX = _tempPos select 0;
_LeaderZ = _tempPos select 1;
_LeaderY = _tempPos select 2;

_unitX = _LeaderX + _vzdalenost*cos(_uhelNew);
_unitZ = _LeaderZ + _vzdalenost*sin(_uhelNew);
_unitY = _LeaderY;
//_unit setpos [_unitX, _unitY, 0];
//_unit doMove [_unitX, _unitY, 0];

_newCoordinates = [];
_newCoordinates = _newCoordinates + [_unitX];
_newCoordinates = _newCoordinates + [_unitZ];

if(_shipLevel != -1) then
{
	//adjust elevation of deck if it is in range of decks or _shipLevel is not -1
	if((_shipLevel <= ((count _levels) - 1)) && (_shipLevel != -1)) then
	{
		_unitY 	= _levels select _shipLevel;
	};	 
};
_newCoordinates = _newCoordinates + [_unitY];

//VRAT SOURADNICE
_newCoordinates


