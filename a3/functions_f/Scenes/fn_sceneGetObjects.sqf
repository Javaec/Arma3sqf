
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:		sceneGetObjects	
 *	description:	part of S.C.E.N.E.S. This script gets objects positions 
 *			and direction relative to the choosen object
 *			more info on: https://wiki.bistudio.com/index.php/SCENES    	
 *	author:		zozo
 *	paramater:	object or marker 
 *			(its position will be selected as a center of the scene)
 *			optional: x, y - size of the area which objects will be 
 *			exported from 	
 *	return value:	nothing 	
 * 
 ******************************************************************************/ 

private["_TRIGX", "_arrayOfObjectsType"];

_TRIGX = 20;			//trigger
_TRIGY = 20;			//area

_arrayOfObjectsType = [];
_centrum = _this select 0;

if((count _this) == 2) then
{
	_TRIGX = _this select 1;
};
if((count _this) == 3) then
{
	_arrayOfObjectsType = _this select 2;
	_TRIGX = _this select 1;
}
else
{
	_arrayOfObjectsType = ["All"];	//only type objects we will need
};


textLogFormat ["Pole objektu je: %1", _arrayOfObjectsType];
[_centrum, _TRIGX, _arrayOfObjectsType]spawn
{
	_centrum = _this select 0;
	_TRIGX = _this select 1;	
	_arrayOfObjectsType = _this select 2;
	
	_centrumPos = [];
	_centerAngle = 0;
	
	if(typeName _centrum == "Object") then
	{
		_centrumPos = getpos _centrum; 
		_centerAngle = getdir _centrum;
	}
	else
	{
		_centrumPos = getmarkerpos _centrum; 
		_centerAngle = markerdir _centrum;
	};

	Sleep 0.1;
	_listOfObjects = (nearestObjects [_centrumPos, ["All"], _TRIGX]) - [centrum];
	_xLoop = (count _listOfObjects) - 1;
	textLogFormat["Objects included to export: %1", str _listOfObjects];
	DEBUGLOG "[SIFL]: SCRIPTED EXPORT START----------------------------------------";
	_positions = [];
	while{_xLoop >= 0} do
	{
		_objectToGet = _listOfObjects select _xLoop;
		
		_type = typeOf _objectToGet;
		_sim = getText (configFile >> "CfgVehicles" >> _type >> "simulation");
	
		if !(_sim in _arrayOfObjectsType) then
		{
			_computedAbsAngle = [_centrumPos, getpos _objectToGet] call bis_fnc_dirTo;
			
			if(_computedAbsAngle < 0) then
			{
				_computedAbsAngle = 360+_computedAbsAngle;
			};
			
			_computedAngle = _computedAbsAngle - _centerAngle;
			
			if(_computedAngle < 0) then
			{
				_computedAngle = 360+_computedAngle;
			};
			 
			_distance 	=  (getpos _objectToGet) distance (_centrumPos);
			//_distance	= [_centrumPos, _objectToGet] call BIS_fnc_distance2D;
			//_distance 	=  (_objectToGet modelToWorld [0,0,0]) distance (_centrumPos);
			_newDir 	= (getdir _objectToGet - _centerAngle);
			_objectClass 	= typeOf _objectToGet;
			_nameOfObject	= VehicleVarName _objectToGet;
			_vectorDir	= vectorDir _objectToGet;
			_vectorUp	= vectorUp _objectToGet;
			_animation	= animationState _objectToGet;
			_elevASL	= getposASL _objectToGet select 2;
			_elev		= getpos _objectToGet select 2;
			
			if(_nameOfObject == "") then
			{
				_objectToGet = "";	
			};
			_positions = _positions + [_nameOfObject, _objectClass, _objectToGet, _computedAngle, _distance, _newDir, _vectorUp, _vectorDir, _animation, _elevASL, _elev];
			
					 	
			//	hint format["Vypocteny abs. uhel: %1\nRelativni uhel: %2\nVzdalenost: %3\nNewdir: %4",_computedAbsAngle, _computedAngle ,_distance, _newDir];
			//	textLogFormat["newpos = [%1, %2, ""%3"", ""%3""] call BIS_fnc_sceneGetPositionByAngle;", _computedAngle, _distance, _centrum];
			//	textLogFormat["%1 setpos newpos; %1 setdir (%2 + markerdir ""%3"");", _objectToGet, _newDir, _centrum];
			//	textLogFormat["%1, %2, %3, %4", _objectToGet, _computedAngle, _distance, _newDir];
		};		
		_xLoop = _xLoop - 1;
		Sleep 0.0001;
	};  
	copyToClipboard str _positions;
	textLogFormat ["_positions = %1", _positions];
	
	DEBUGLOG "[SIFL]: SCRIPTED EXPORT END------------------------------------------";
};

