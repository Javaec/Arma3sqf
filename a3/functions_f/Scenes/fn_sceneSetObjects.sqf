
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:		sceneGetObjects	
 *	description:	part of S.C.E.N.E.S. This script set objects positions 
 *			and direction relative to the choosen object
 *			more info on: https://wiki.bistudio.com/index.php/SCENES    	
 *	author:		zozo
 *	paramater:	object or marker 
 *			(its position will be selected as a center of the scene)
 *			ARRAY_OF_PARAMETERS
 *			- parameters gained from sceneGetObject
 *
 *	return value:	nothing 	
 * 
 ******************************************************************************/
//_this spawn 
//{  
	private ["_centrum","_positions","_offset","_defaultGroup","_centrumDir", "_simulationDisableExceptions"];
	_centrum 		= _this select 0;
	_positions 		= _this select 1;
	_offset 		= _this select 2;
	if((count _this) == 4) then {_stopped	= _this select 3};
	 
	_centrumDir = 0;
	if(typeName _centrum == "Object") then
	{ 
		_centrumDir = getdir _centrum;
	}
	else
	{
		_centrumDir = markerDir _centrum;
	};
	
	_simulationDisableExceptions = ["FoldTable", "SmallTable", "Notebook", "SatPhone", "Can_small", "FoldChair", "SmallTV"];
	
	private ["_xLoop","_nameOfObject","_objectClass","_newObject","_angle","_distance","_dir", "_newposition", "_currentPos", "_animation"];
	_xLoop 			= ((count _positions)) - 1;
	
	if((count _this) < 3) then {_offset = false};
		
	while{_xLoop >= 0} do
	{
		_nameOfObject	= _positions select (_xLoop-10);
		_objectClass	= _positions select (_xLoop-9);
		_newObject 	= _positions select (_xLoop-8); 
		_angle		= _positions select (_xLoop-7);
		_distance	= _positions select (_xLoop-6);
		_dir		= _centrumDir + (_positions select (_xLoop-5));
		_vectorUp	= _positions select (_xLoop-4);
		_vectorDir	= _positions select (_xLoop-3);
		_animation	= _positions select (_xLoop-2);
		_elevASL	= _positions select (_xLoop-1);
		_elev		= _positions select (_xLoop);
		//if(isNil"BIS_defaultGroup") then
		//{
			
		//}; 
				
		_newposition 	= [_angle, _distance, _centrum] call BIS_fnc_sceneGetPositionByAngle;

		/*
		if(_offset != 0) then
		{
			_newposition set [2, _offset];
		};
  		*/
		_currentPos = nil;	
		if(_nameOfObject != "") then
		{
			_currentPos = getpos _newObject;
		};
															//check if  
		if(isNil "_currentPos") then										//object exist
		{
			if(!isNil"BIS_debugModules") then
			{
				textLogFormat["OBJECT doesnt exist", _newObject];
			};
													
			
			if(_objectClass isKindOf "man") then
			{
				if(!isNil"BIS_debugModules") then
				{
					textLogFormat["Creating UNIT: %1, which doesnt exist", _nameOfObject];
				};
				//_this = _objectClass createUnit [_newposition, _defaultGroup, "this setVariable [""BIS_noCoreConversations"", true, true]"];	//object doesnt exist - creating one - man
				BIS_defaultGroup = creategroup WEST; 
				_this = BIS_defaultGroup createUnit [_objectClass, _newposition, [], 0, "NONE"];	//object doesnt exist - creating one - man
			  
				_this setVariable ["BIS_noCoreConversations", true, true];
				if(!isnil"_stopped") then 
				{			
					if(!isNil"BIS_debugModules") then
					{
						debuglog str BIS_defaultGroup;
			  		debuglog str (units BIS_defaultGroup);
						_this stop true; DEBUGLOG "STOPPED--------------------------"
					};
				};
				_newObject = _this;
				[_newObject] joinSilent grpNull;
				deleteGroup BIS_defaultGroup;
			}
			else
			{
				_this = _objectClass createVehicle _newposition;					//object doesnt exist - creating one - vehicle
				_newObject = _this;
				if(!isNil"BIS_debugModules") then
				{
					textLogFormat["Creating VEHICLE: %1, which doesnt exist", _nameOfObject];
				};

				if(_objectClass in _simulationDisableExceptions) then
				{
					_newObject enableSimulation false;
					if(!isNil"BIS_debugModules") then
					{
						textLogFormat["VEHICLE: %1, exception simulation disabled ", _newObject];
					};
				};
				
			};	
			
			if(_nameOfObject != "") then
			{
				_newObject setVehicleVarName _nameOfObject;
				call compile format["%1 = _newObject", _nameOfObject];
			};
		};

		//if we dont want to move with objects which already exist. (place the global bool variable ex.: BIS_SChair_lock = true into the mission)
		private["_dontMoveInSceneSetup"];
		_dontMoveInSceneSetup = _newObject getVariable "dontMoveInSceneSetup";
		if(isNil"_dontMoveInSceneSetup") then 
		{
			//_newObject setdir _dir;
			_nic = [nil, _newObject, rSETDIR, _dir] call RE;
			if!(_offset) then
			{
				_newposition set [2, _elev];
				_newObject setpos _newposition;
			}
			else
			{
				_newposition set [2, _elevASL];
				_newObject setposASL _newposition;
			}; 
			//_newObject setVectorDirAndUp[_vectorDir, _vectorUp];
			if(!isNil"BIS_debugModules") then
			{
				textLogFormat["Object: %1 pos on: %2 and dir: %3", _newObject, _newposition, _dir];
				textLogFormat["Object: %1 vectorUp: %2 and vectorDir: %3", _newObject, _vectorUp, _vectorDir];
			};
			_nic = [objNull, _newObject, rSWITCHMOVE, _animation] call RE;
		}
		else
		{
			if(!isNil"BIS_debugModules") then
			{
				textLogFormat ["Object %1 is locked:%1_LOCK  - it has not been moving", _newObject];
			};	
		};

		_xLoop = _xLoop - 11;
		Sleep 0.00001;
	};
//};

true
