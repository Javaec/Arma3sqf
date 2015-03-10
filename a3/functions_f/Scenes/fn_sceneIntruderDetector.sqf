
/**************************************************************************************************************************
	Version:	1.0
	Name:		Intruder detector during scene
	DESCRIPTION:	Checks if there are intruders during scene. All intruders during scene will be disabled if they 
			will get into the detector trigger. Position of trigger is default on player, and default radius is [60,60] 
			Checking is deactivated by passing BIS_sceneIntruderDetectorLogic setVariable ["_detectInProgress", false]
	PARAMETERS:	_centerOfScene: POSITION - trigger position
			_Radius: ARRAY: [_xRadius, _yRadius] - size of trigger		
	RETURNED VALUE:	nothing
****************************************************************************************************************************/

if(BIS_debugModules) then {textLogFormat ["sceneIntruderDetector: Running"]};
private["_wantedUnits","_unwantedUnits","_unitsInTrigger","_unwantedUnitsDisabled", "_unwantedUnitsDisabledLogic", "_centerOfScene", "_xRadius", "_yRadius"];
private["_excludedObjectsExtra", "_radius"];
if((count _this) > 0) then
{
	_centerOfScene = _this select 0;
	if(isNil "_centerOfScene") then 
	{
		_centerOfScene = getpos player;					//Default
	};
}
else
{
		_centerOfScene = getpos player;					//Default	
};
if((count _this) > 1) then
{
	_radius = (_this select 1);
	_xRadius = _radius select 0;
	_yRadius = _radius select 1;
	if(isNil "_xRadius" || isNil "_yRadius") then 
	{
		_xRadius = 180;
		_yRadius = 180;							//Default
	};
}
else
{
	_xRadius = 180;
	_yRadius = 180;
};
if((count _this) > 2) then
{
	_excludedObjectsExtra = _this select 2;
	if(isNil "_centerOfScene") then 
	{
		_excludedObjectsExtra = [];					//Default
	};
}
else
{
	_excludedObjectsExtra = [];
};

textLogFormat ["_excludedObjectsExtra: %1",_excludedObjectsExtra]; 

if(isNil "BIS_sceneIntruderDetectorLogic") then
{
	BIS_sceneIntruderDetectorGroup = createGroup sideLogic;
	"Logic" createUnit [[1000,10,0], BIS_sceneIntruderDetectorGroup, "BIS_sceneIntruderDetectorLogic = this"];
	PublicVariable "BIS_sceneIntruderDetectorLogic";
	_mode = "setup";
};

_this = createTrigger ["EmptyDetector", _centerOfScene];
_this setTriggerArea [_xRadius, _yRadius, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", true];
BIS_sceneIntruderDetector = _this;
WaitUntil{!isNull BIS_sceneIntruderDetector};
WaitUntil{(count (list BIS_sceneIntruderDetector)) != 0};

BIS_sceneIntruderDetectorLogic setVariable ["_detectInProgress", true];
BIS_sceneIntruderDetectorLogic setVariable ["_unwantedUnitsDisabledLogic", _unwantedUnitsDisabled];	//here will be saved all disabled units 

_wantedUnits = [];
_unwantedUnits = [];
_unitsInTrigger = [];
_unwantedUnitsDisabled = [];

_wantedUnits = +(list BIS_sceneIntruderDetector);

{
	if((side _x != WEST) && (side _x != CIVILIAN) && (side _x != RESISTANCE)) then			//assign as unwanted all the enemies which are on start of triggerring 
	{
		if(!(_x in _excludedObjectsExtra)) then
		{
			_unwantedUnits = _unwantedUnits + [_x];
		}
		else
		{
			textLogFormat["Vyjmut: %1", _x];	
		};
		
	};
} forEach (list BIS_sceneIntruderDetector);

if(BIS_debugModules) then {textLogFormat["_unwantedUnitsOnStart %1", str _unwantedUnits]};

while{(BIS_sceneIntruderDetectorLogic getVariable "_detectInProgress")} do
{
	if(triggerActivated BIS_sceneIntruderDetector) then
	{
		_unitsInTrigger = list BIS_sceneIntruderDetector;
		_unwantedUnits = _unwantedUnits + (_unitsInTrigger - _wantedUnits - _unwantedUnitsDisabled - _excludedObjectsExtra);

		if((count _unwantedUnits) > 0) then
		{
			{_x enableSimulation false} forEach _unwantedUnits;
			_unwantedUnitsDisabled = _unwantedUnitsDisabled + _unwantedUnits; 		
			if(BIS_debugModules) then {textLogFormat["sceneIntruderDetector: Disabling %1", str _unwantedUnits]};
			_unwantedUnits = [];	
		};
	};
	_t = time;
	WaitUntil{time > _t + 0.2};
};
BIS_sceneIntruderDetectorLogic setVariable ["_unwantedUnitsDisabledLogic", _unwantedUnitsDisabled];
_t = time;
WaitUntil{time > _t + 4}; 
{_x enableSimulation true} forEach _unwantedUnitsDisabled;

deleteVehicle BIS_sceneIntruderDetectorLogic;
BIS_sceneIntruderDetectorLogic = nil;
deleteGroup BIS_sceneIntruderDetectorGroup;
deleteVehicle BIS_sceneIntruderDetector;
BIS_sceneIntruderDetector = nil;

true
