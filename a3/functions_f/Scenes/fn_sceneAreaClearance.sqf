
/*********************************************************************************************************
 *
 *	version: 	1.0
 *	name:		Scene Area Clearance
 *	description:	removes all unwanted objects from area, except objects passed in parameter
 *	author:		zozo
 *	parameters:	_areaCenter: name of TRIGGER (should be set as ACTIVATION BY ANYBODY, PRESENT) - default trigger: BIS_sceneTrigger
 *			_excludedObjects: ARRAY of object wanted in scene
 *			_unwantedObjectsTempPosition: POSITION - where to move(hide) all unwanted objects
 *	return value:	nothing
 *	  
 *********************************************************************************************************/

private["_mode", "_excludedObjects", "_area", "_unwantedObjectsTempPosition"];

_mode = "restore";
if(count _this > 0) then
{
	_excludedObjects = _this select 0;
	_mode = "clear";
};
if(count _this > 1) then
{
	_area = _this select 1;							//defines area (trigger)
};
if(count _this > 2) then
{
	_unwantedObjectsTempPosition = _this select 2;				//where to move all unwanted objects
};
if(_mode == "clear") then
{
	if(isNil "_area") then {_area = BIS_sceneTrigger};				//setting default
	if(isNil "_unwantedObjectsTempPosition") then 
	{
		_unwantedObjectsTempPosition = [-5000, 10000, 0];
		//_unwantedObjectsTempPosition = getMarkerPos "BIS_sceneClearingWarez"	//setting default
	};
};

if(isNil "BIS_debugModules") then {BIS_debugModules = false};

if((!isNil "BIS_sceneClearanceLogic") && (_mode == "clear")) then
{
	deleteVehicle BIS_sceneClearanceLogic;
	BIS_sceneClearanceLogic = nil;
	deleteGroup BIS_sceneAreaClearanceGroup;
	DEBUGLOG "Too many parameters in RESTORE mode! Next mode will be CLEAR!";
}	
else
{
	switch(_mode) do
	{
		case "clear":
		{
			private["_objectsToRemoveFromSceneArea", "_objectsInsideSceneArea", "_unwantedObjectsOriginPosition", "_deadObjectsInsideSceneArea", "_AREA_FOR_DEAD_OBJECTS","_savePos"];
			if(BIS_debugModules) then{DEBUGLOG "sceneAreaClearance: Started in mode CLEAR"};
			BIS_sceneAreaClearanceGroup = createGroup sideLogic;
			"Logic" createUnit [[1000,10,0], BIS_sceneAreaClearanceGroup, "BIS_sceneClearanceLogic = this"];
			PublicVariable "BIS_sceneClearanceLogic";
	
			_AREA_FOR_DEAD_OBJECTS = 30;
			_objectsInsideSceneArea = (list _area);
			_deadObjectsInsideSceneArea = [];
			  
			 {
				if(damage _x > 0.9) then
			 	{
				 	_deadObjectsInsideSceneArea = _deadObjectsInsideSceneArea + [_x]
				};
			 }foreach (nearestObjects[_area, ["all"], _AREA_FOR_DEAD_OBJECTS]);
			if(BIS_debugModules) then{textLogFormat ["_deadObjectsInsideSceneArea: %1",_deadObjectsInsideSceneArea];};
			_objectsToRemoveFromSceneArea = (_objectsInsideSceneArea + _deadObjectsInsideSceneArea - _excludedObjects);
			/*
			textLogFormat ["inside %2: %1", _objectsInsideSceneArea, _area];
			textLogFormat ["exclude: %1", _excludedObjects];
			textLogFormat ["Prunik: %1", _objectsToRemoveFromSceneArea];
			*/
			_unwantedObjectsOriginPosition = [];
			if((count _objectsToRemoveFromSceneArea) != 0) then
			{
				_serialNumber = 1;
				{
					if((typeOf _x) != "Logic") then
					{
						_tmpPosAndDir = [];
						if((VehicleVarName _x) == "") then							//If unit has no name, 
						{											//than we will name it
							call compile format[
							"_x setVehicleVarName ""tmpName%1""; tmpName%1 = _x",
							_serialNumber]; 
							_serialNumber = _serialNumber + 1;
						};
						_tmpPosAndDir = [_x];									//Add the name
						_tmpPosAndDir = _tmpPosAndDir  + [(getpos _x)];						//position
						_tmpPosAndDir = _tmpPosAndDir + [(getdir _x)];						//and dir
						_unwantedObjectsOriginPosition = _unwantedObjectsOriginPosition + [_tmpPosAndDir];	//to the array for further reference
						[objNull, _x, rENABLESIMULATION, false] call RE;
						_x allowDamage false;
						_x stop true;
						_savepos = [_unwantedObjectsTempPosition, 0, 100, 20, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
						if((_savepos distance (getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"))) == 0) then
						{
							_savepos = _unwantedObjectsTempPosition;
						};
						_x setpos _savepos;									//and move them out from scene
						
					};
				} forEach _objectsToRemoveFromSceneArea;							//for each object which will be removed from area
				if(BIS_debugModules) then 
				{
					if(BIS_debugModules) then{textLogFormat["sceneAreaClearance: _unwantedObjOriginPos: %1", _unwantedObjectsOriginPosition]};
				};
			}
			else
			{
				if(BIS_debugModules) then{DEBUGLOG "sceneAreaClearance: Nothing to clearance - script ends"};
			};
			BIS_sceneClearanceLogic setVariable ["_objectsToRemoveFromSceneArea", _unwantedObjectsOriginPosition];
		};
		
		case "restore":
		{
			if(BIS_debugModules) then{DEBUGLOG "sceneAreaClearance: Started in mode RESTORE"};
			_unwantedObjectsOriginPosition = BIS_sceneClearanceLogic getVariable "_objectsToRemoveFromSceneArea";
			if((count _unwantedObjectsOriginPosition) != 0) then
			{
				_nrOfObjects = (count _unwantedObjectsOriginPosition) - 1;
				while{_nrOfObjects >= 0} do
				{
					_who = (_unwantedObjectsOriginPosition select _nrOfObjects) select 0;
					_pos = (_unwantedObjectsOriginPosition select _nrOfObjects) select 1;
					_dir = (_unwantedObjectsOriginPosition select _nrOfObjects) select 2;
					 _who setpos _pos;
					_nic = [nil, _who, rSETDIR, _dir] call RE;
					_who allowDamage true;
					_who stop false;
					[objNull, _who, rENABLESIMULATION, true] call RE;
					_nrOfObjects = _nrOfObjects - 1;
				};
			}
			else
			{
				if(BIS_debugModules) then{DEBUGLOG "sceneAreaClearance: Nothing to restore - script ends"};
			};
			deleteVehicle BIS_sceneClearanceLogic;
			BIS_sceneClearanceLogic = nil;
			deleteGroup BIS_sceneAreaClearanceGroup;
		};
		default {DEBUGLOG "Bad mode"};
	};
};
