//returns an object closest to the screen-center and it's distance from the screen-center
//takes in account dimensions of the object -> counts distance from the object center
//[_object,_distance] = [_object1,_object1,.._objectN] call BIS_getObjectClosestToScreenCenter;
BIS_getObjectClosestToScreenCenter = {
	private["_closestObject","_closestDistance","_distance","_centerOffset","_pos"];

	_closestObject = objNull;
	_closestDistance = 0.5;

	{
		_centerOffset = (((boundingBox _x) select 1) select 2) * 0.4;

		_pos = [getPosATL _x, _centerOffset] call BIS_offsetPosVert;

		_distance = [_pos] call BIS_getScreenDistance;

		if (_distance < _closestDistance) then
		{
			_closestObject = _x;
			_closestDistance = _distance;
		};

	} forEach _this;

	[_closestObject,_closestDistance]
};

//_distance:number = [_object/_positionATL/_point,_object/_positionATL/_pointOnScreen] call BIS_getScreenDistance;
BIS_getScreenDistance = {
	private["_a","_b","_getPoint","_distance","_max"];

	_a = [_this,0,nil] call BIS_fnc_param;
	_b = [_this,1,[0.5,0.5]] call BIS_fnc_param;		//default is screen center

	_max = 0.5;	//max. screen distance

	_getPoint = {
		//convert to object
		if (typeName _this == "OBJECT") then
		{
			_this = [getPosATL _this, (((boundingBox _this) select 1) select 2) * 0.4] call BIS_offsetPosVert;
		};

		//convert to (screen) point
		if (count _this == 3) then
		{
			_this = worldToScreen _this;
		};

		_this
	};

	_a = _a call _getPoint;
	_b = _b call _getPoint;

	//both objects are on screen
	if (count _a == 2 && count _b == 2) then
	{
		_a = _a + [0];
		_b = _b + [0];

		_distance = _a distance _b;
	}
	else
	{
		_distance = _max;
	};

	if (_distance > _max) then {_distance = _max};

	_distance
};

//returns closest object (to the "observer") from the array of objects
//example: [_location,_distance] = [[BIS_OBJ_Emerge_A,BIS_OBJ_Emerge_B],player] call BIS_getNearestObjectAndDistance;
BIS_getNearestObjectAndDistance = {
	private["_watcher","_locations","_storedLoc","_storedDist","_distance"];

	_locations 	= [_this,0,[]] call BIS_fnc_param;
	_watcher 	= [_this,1,player] call BIS_fnc_param;

	if (count _locations == 0) exitWith {[objNull,1e9]};

	_storedLoc = _locations select 0;
	_storedDist = _watcher distance _storedLoc;

	//find closest location
	{
		_distance = _watcher distance _x;

		if (_distance < _storedDist) then
		{
			_storedLoc = _x;
			_storedDist = _distance;
		};

	} forEach _locations;

	[_storedLoc,_storedDist]
};

//detects & returns closest object (to the "observer") withing given distance
//example: _object = [player,"house",5] call BIS_getNearestObject;
BIS_getNearestObject = {
	private["_point","_type","_maxDist","_pos2d","_object","_distance2d"];

	_point   = [_this, 0, player] call BIS_fnc_param;
	_type    = [_this, 1, "all"] call BIS_fnc_param;
	_maxDist = [_this, 2, 10] call BIS_fnc_param;

	_pos2d = getPos _point;
	_pos2d set [2,0];

	_object = nearestObject [_pos2d,_type];

	if (isNull _object) exitWith {objNull};

	_distance2d = [_pos2d,_object] call BIS_getDistance2D;

	if (_distance2d > _maxDist) then
	{
		_object = objNull;
	};

	_object
};

BIS_offsetPosVert = {
	private["_pos","_vertoffset"];

	_pos		= [_this,0,[100,100,100]] call BIS_fnc_param;
	_vertoffset	= [_this,1,10] call BIS_fnc_param;

	[_pos select 0, _pos select 1, (_pos select 2) + _vertoffset]
};

//example: [_a:location/object,_b:location/object] call BIS_getDistance2D;
BIS_getDistance2D = {
	private["_a","_b","_distance"];

	_a = _this select 0;
	_b = _this select 1;

	if(typeName _a == "OBJECT") then {
		_a = getPosASL _a;
	};
	if(typeName _b == "OBJECT") then {
		_b = getPosASL _b;
	};

	_a = [_a select 0, _a select 1, 0];
	_b = [_b select 0, _b select 1, 0];

	_distance = _a distance _b;

	_distance
};

//returns objects that breaks LOS from point A -> B
//if A is player it takes in account his stance
//example: [_a:object,_b:object] call BIS_getLosObstacles;
BIS_getLosObstacles = {
	private["_startObj","_startOffset","_startPosASL","_startPos","_startOffset"];
	private["_endObj","_endOffset","_endPosASL","_endPos","_endOffset"];
	private["_fn_getOffset","_losObjects","_ignored","_terrainIntersect"];

	//_offset = _object call _fn_getOffset;
	_fn_getOffset = {
		private["_offset","_anim","_stance"];

		//default value
		_offset = 1.8;

		if (_this iskindOf "man") then
		{
			//adjust start-pos offset according to player stance
			_anim = (animationState _this) call BIS_fnc_animType;
			_stance = (_anim select 1) select 1;

			switch (_stance) do
			{
				case "Kneel":
				{
					_offset = 1.0;
				};
				case "Crouch":
				{
					_offset = 1.0;
				};
				case "Prone":
				{
					_offset = 0.4;
				};

				default
				{
					_offset = 1.8;
				};
			};
		};

		_offset
	};

	//get both points
	_startObj		= [_this, 0, objNull] call BIS_fnc_param;
	_endObj			= [_this, 1, objNull] call BIS_fnc_param;

	//get offsets
	_startOffset	= [_this, 2, _startObj call _fn_getOffset] call BIS_fnc_param;
	_endOffset		= [_this, 3, _endObj call _fn_getOffset] call BIS_fnc_param;

	//get positions
	_startPosASL = getPosASL _startObj;
	_startPos 	 = getPos _startObj;
	_endPosASL   = getPosASL _endObj;
	_endPos      = getPos _endObj;

	//offset positions
	_startPosASL = [_startPosASL, _startOffset] call BIS_offsetPosVert;
	_startPos 	 = [_startPos, _startOffset] call BIS_offsetPosVert;
	_endPosASL   = [_endPosASL, _endOffset] call BIS_offsetPosVert;
	_endPos 	 = [_endPos, _endOffset] call BIS_offsetPosVert;

	//check for terrain intersect
	_terrainIntersect = terrainIntersect [_startPos, _endPos];

	if !(_terrainIntersect) then
	{
		//_ignored = _endObj getVariable ["linked_object",objNull];

		_ignored = objNull;

		_losObjects = lineIntersectsWith[_startPosASL,_endPosASL,_ignored,_ignored,true];
	}
	else
	{
		_losObjects = [objNull];
	};

	_losObjects
};

//returns position that is offset in given direction and distance
//example: _pos = [_pos,_offsetDirection,_offsetDistance] call BIS_offsetPosDirDist;
//example: _pos = [getPos player,0,-1] call BIS_offsetPosDirDist;
BIS_offsetPosDirDist = {
	private["_pos","_dir","_distance","_pos2","_vector"];

	_pos	  = [_this,0,[100,100,100]] call BIS_fnc_param;
	_dir 	  = [_this,1,random 360] call BIS_fnc_param;
	_distance = [_this,2,50] call BIS_fnc_param;

	//convert from math axis to arma axis system
	//where 0 degrees is North, increasing clockwise (not East & counter-clockwise)

	_dir = (90 - _dir) % 360; if (_dir < 0) then {_dir = _dir + 360};

	_vector = [_distance,0,0];

	_vector = [_vector,_dir] call BIS_fnc_rotateVector2D;

	_pos2 = [_pos, _vector] call BIS_offsetPos;

	_pos2
};

//[_pos:vector/position, _offset:vector/position] call BIS_offsetPos
//offsets position relative to ROADWAY (used for getPos/setPos)
BIS_offsetPos = {
	private["_pos","_offset","_mode","_output"];

	_pos	= [_this,0,[100,100,100]] call BIS_fnc_param;
	_offset	= [_this,1,[100,100,100]] call BIS_fnc_param;

	_mode	= [_this,2,"ADD"] call BIS_fnc_param;

	if (_mode == "ADD") then
	{
		_output = [(_pos select 0) + (_offset select 0), (_pos select 1) + (_offset select 1), (_pos select 2) + (_offset select 2)];
	}
	else
	{
		_output = [(_pos select 0) - (_offset select 0), (_pos select 1) - (_offset select 1), (_pos select 2) - (_offset select 2)];
	};

	_output
};

//example: [_object:object, _vertoffset:number] call BIS_offsetObjectVert;
BIS_offsetObjectVert = {
	private["_object","_vertoffset","_pos"];

	_object		= [_this,0,nil] call BIS_fnc_param;
	_vertoffset	= [_this,1,10] call BIS_fnc_param;

	_pos = getPosASL _object;
	_pos = [_pos select 0, _pos select 1, (_pos select 2) + _vertoffset];

	_object setPosASL _pos;
};

//example: [_object:object, _vector:array] call BIS_offsetObject;
BIS_offsetObject = {
	private["_object","_offset","_pos"];

	_object	= [_this,0,nil] call BIS_fnc_param;
	_offset	= [_this,1,[10,10,10]] call BIS_fnc_param;

	_pos = getPosASL _object;
	_pos = [(_pos select 0) + (_offset select 0), (_pos select 1) + (_offset select 1), (_pos select 2) + (_offset select 2)];

	_object setPosASL _pos;
};


//example: [OBSERVER,WATCHED] call BIS_relativeDirTo;
/*
OBSERVER can be defined either as:
- OBJECT
- VECTOR with 2 positions or objects defining start & end

WATCHED can be defined either as:
- OBJECT
- POSITION
*/
BIS_relativeDirTo = {
	private["_observer","_watched","_observerDir","_observerPos","_watchedPos","_watchedDir","_relativeDir"];

	_observer = [_this,0,player] call BIS_fnc_param;
	_watched  = [_this,1,objNull] call BIS_fnc_param;

	//get observer info
	if (typeName _observer == "OBJECT") then
	{
		_observerPos = getPos _observer;
		_observerDir = getDir _observer;
	}
	else
	{
		private["_a","_b","_vector"];

		_a = _observer select 0;
		_b = _observer select 1;

		if (typeName _a == "OBJECT") then {_a = getPos _a};
		if (typeName _b == "OBJECT") then {_b = getPos _b};

		_vector = [_b, _a, "SUBTRACT"] call BIS_offsetPos;

		_observerPos = _a;
		_observerDir = _vector call BIS_getVectorDir;
	};

	//get watched info
	if (typeName _watched == "OBJECT") then
	{
		_watchedPos = getPos _watched;
	}
	else
	{
		_watchedPos = _watched;
	};

	_watchedDir = [_observerPos,_watchedPos] call BIS_fnc_dirTo;     //get direction to target

	//convert negative dir to watched object to positive value
	_watchedDir = _watchedDir % 360; if (_watchedDir < 0) then {_watchedDir = _watchedDir + 360};

	_relativeDir = _watchedDir - _observerDir; //subtract direction of unit

	//ensure return is between 0-360
	if (_relativeDir < 0) then {_relativeDir = _relativeDir + 360};
	if (_relativeDir > 360) then {_relativeDir = _relativeDir - 360};

	//["relative dir", _relativeDir] call BIS_debugLog;

	_relativeDir
};

BIS_getVectorDir = {
	private["_x","_y","_dir"];

	_x = [_this,0,100] call BIS_fnc_param;
	_y = [_this,1,100] call BIS_fnc_param;

	if (_x > 0 && _y > 0) then {
		_dir = atan(abs _x/abs _y);
	};

	if (_x > 0 && _y < 0) then {
		_dir = 90 + atan(abs _y/abs _x);
	};

	if (_x < 0 && _y < 0) then {
		_dir = 180 + atan(abs _x/abs _y);
	};
	if (_x < 0 && _y > 0) then {
		_dir = 270 + atan(abs _y/abs _x);
	};

	_dir
};

//_number = [] call BIS_getViewZoom;
BIS_getViewZoom = {
	private["_pos","_distance","_scale","_zoom"];

	_pos = screenToWorld [0.5,0.5];
	_distance = player distance _pos;

	_scale = _pos call
	{
		private["_pos0","_pos1","_scale"];

		_pos0 = _this;
		_pos1 = [_pos0, 1] call BIS_offsetPosVert;

		_scale = [_pos0,_pos1] call BIS_getScreenDistance;

		_scale
	};

	_zoom = _distance * _scale;

	//["[SQF] Scale: %1",_scale] call BIS_debugLogF;
	//["[SQF] Distance: %1",_distance] call BIS_debugLogF;
	//["[SQF] Zoom: %1",_zoom] call BIS_debugLogF;

	_zoom
};

//example: _hasLos:bool = [_a:object,_b:object] call BIS_getHasLos;
BIS_getHasLos = {
	private["_obstacles","_hasLos"];

	_hasLos = false;

	_obstacles = _this call BIS_getLosObstacles;
	_obstacles = _obstacles - _this;

	if (count _obstacles == 0) then
	{
		_hasLos = true;
	};

	_hasLos
};

//[_pointA:object/location,_pointB:object/location,_distance:number] call BIS_getPosInDistance;
BIS_getPosInDistance = {
	private["_a","_b","_distance","_vector","_pos"];

	_a			= [_this,0,[100,100,0]] call BIS_fnc_param;
	_b			= [_this,1,[200,200,0]] call BIS_fnc_param;
	_distance 	= [_this,2,100] call BIS_fnc_param;

	if(typeName _a == "OBJECT") then {
		_a = getPosASL _a;
	};
	if(typeName _b == "OBJECT") then {
		_b = getPosASL _b;
	};

	_vector = [_a,_b] call BIS_getDirectionVector;

	//["_vector",_vector] call BIS_debugLog;

	_vector = [_vector, _distance] call BIS_scaleVector;

	//["_vector",_vector] call BIS_debugLog;

	_pos = [_a, _vector] call BIS_offsetPos;

	_pos
};

//[_vector:vector, _scale:number] call BIS_scaleVector
BIS_scaleVector = {
	private["_vector","_scale"];

	_vector = [_this,0,[100,100,0]] call BIS_fnc_param;
	_scale  = [_this,1,1] call BIS_fnc_param;

	[(_vector select 0) * _scale, (_vector select 1) * _scale, (_vector select 2) * _scale]
};

//[_a:object/position, _b:object/position] call BIS_getDirectionVector
BIS_getDirectionVector = {
	private["_a","_b","_distanceAB","_vectorx","_vectory","_vectorz"];

	_a = [_this,0,[100,100,100]] call BIS_fnc_param;
	_b = [_this,1,[200,200,200]] call BIS_fnc_param;

	if(typeName _a == "OBJECT") then {
		_a = getPosASL _a;
	};
	if(typeName _b == "OBJECT") then {
		_b = getPosASL _b;
	};

	_distanceAB = _a distance _b;

	_vectorx = ((_b select 0) - (_a select 0))/_distanceAB;
	_vectory = ((_b select 1) - (_a select 1))/_distanceAB;
	_vectorz = ((_b select 2) - (_a select 2))/_distanceAB;

	[_vectorx,_vectory,_vectorz]
};
