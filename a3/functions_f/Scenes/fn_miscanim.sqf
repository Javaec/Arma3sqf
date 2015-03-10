
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:		misc anim script
 *	description:	setting up the animations with correct positions for object - choose correct performance. For ex. fixingTowingTractor (read the description)
 *	author:		zozo
 *	parameters:	described bellow	
 *	return value:	nothing
 *	  
 ******************************************************************************/
//TODO: help to debuglog - list of anims and description
//TODO: waiting for animation done -> WaitUntil{_who, ["sitUnarm_R_idleLoop", "sitRfl_R_BidleLoop"] call _CheckIfAnimDone};

private["_animselect", "_who", "_vehicle", "_who2", "_onboard", "_offsetx", "_offsety", "_x", "_shipElevation", "_customElev", "_shipLevel", "_animDone", "_domove"];

_animselect 	= _this select 0;																									//which type of performance
_who		= _this select 1;																												//who it will perform
_vehicle	= _this select 2;																											//object (for ex.: helicopter)
_who2		= _this select 3;																												//second particiant of dialog
if((count _this) >= 5) then {_onboard	= _this select 4;};												//is on board or not (ship)
if((count _this) >= 6) then {_customElev	= _this select 5;};										//custom elevation for setpos
if((count _this) >= 7) then {_domove		= _this select 6};											//setpos or domove?

if(IsNil "_who2") then {_who2 = _who;};
if(IsNil "_onboard") then {_onboard = false; _shipLevel = -1} else {_shipLevel = 9999};


_offsetx = 0;		//using on ship
_offsety = 0;		//using on ship
_shipElevation = 15;

_who allowDamage false;
_who2 allowDamage false;


if(IsNil "_customElev") then {_customElev = 0;} else {_shipElevation = _customElev;};	//if custom elevation is used, dont use ship elev and use custom number
if(IsNil "_domove") then {_domove = false;} else {_domove = true;};	

if(!isNil"BIS_debugModules") then
{
	textLogFormat["miscanim: ---------------------- Anim:%1 ----------------------",_animselect];
	textLogFormat["miscanim: _who:%1", _who];
	textLogFormat["miscanim: _who2:%1", _who2];
	textLogFormat["miscanim: _vehicle:%1", _vehicle];
	textLogFormat["miscanim: _domove:%1", _domove];
	DEBUGLOG "miscanim:                             ";
};

private["_SetThePos"]; //private function for setposing on terrain or on the ship
_SetThePos =
{
	private["_who", "_x", "_onShip"];
	_who 		= _this select 0;
	_x 		= _this select 1;
	_onboard 	= _this select 2;
	
	if(_onboard) then 
	{
		//textLogFormat["miscanim:Object is on ship"];
		_who setPosASL _x; 	
	}
	else
	{
		//textLogFormat["miscanim:Object is NOT on ship"];
		_who setPos _x; 
	};
};

private["_SetThePosWithSetObjects"]; //using new sceneSetObjects functions (may create new objects)
_SetThePosWithSetObjects =
{
	private["_objectList", "_centrum", "_onboard", "_shipElevation"];
	_objectList 	= _this select 0;
	_centrum 			=	_this select 1;
	_onboard 			= _this select 2;
	_shipElevation = _this select 3;

	if(_shipElevation != 0) then
	{
		_objectList set [9, _shipElevation];
	};
		
	if(_onboard) then 
	{
		textLogFormat["miscanim:Object is on ship"];
		[_centrum, _objectList, true] call BIS_fnc_sceneSetObjects;
	}
	else
	{
		textLogFormat["miscanim:Object is NOT on ship"];
		[_centrum, _objectList, false] call BIS_fnc_sceneSetObjects; 
	};	
};

private["_CheckIfAnimDone"];
_CheckIfAnimDone = 
{
	private["_who", "_anim", "_animIsDone"];
	_who			= _this select 0;
	_anim			= _this select 1;
	_t = time;
	WaitUntil{((animationState _who) in _anim) || (time > _t + 5)};	//ANIMATION STARTED OR TIMEOUT;
	true
};


// temporary disabled becouse of news:gholjf$5a6$1@new-server.localdomain
//["disableAI", [_who,_who2],3] call BIS_fnc_sceneSetBehaviour;
//["disableAI", [_who],3] call BIS_fnc_sceneSetBehaviour;
	
switch(_animselect) do
{

	
	case "fixingTowingTractor":	//fixing the right front wheel of towing tractor 
	{
		// CAR FIXING STANDING
		
		if(primaryWeapon _who == "") then
		{
			_offsetx = -0.35;
			_offsety = -0.1;
			_x = [69, 2.39, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		}else
		{
			_offsetx = -0.35;
			_offsety = -0.1;
			_x = [70, 2.7, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
	
		}; 

		_who setformdir ((getdir _vehicle)-90);
		_nic = [nil, _who, rSETDIR, ((getdir _vehicle)-90)] call RE;
		 [_who, _x, _onboard] call _SetThePos; 
		_nic = [objNull, _who, rPLAYMOVENOW, "ActsPercSnonWnonDnon_carFixing2"] call RE;
	};
	
	case "sittingOnTheChair1":	//sitting on the foldChair (with geton from the the right side) 
	{
		_animDone = false;
		if(!_onboard) then
		{
			//_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) -0.08]; //get the foldchair lower
			_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) - 0.06]; //get the foldchair lower
		};
		if(primaryWeapon _who == "") then
		{
			_x = [253, 0.8, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [250, 0.9, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		
		_who setformdir ((getdir _vehicle)+90);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)+90] call RE;
		[_who, _x, _onboard] call _SetThePos;
			
		
		if(primaryWeapon _who == "") then
		{
			_nic = [objNull, _who, rPLAYMOVENOW, "sitUnarm_R_idleLoop"] call RE;
		}else
		{
			_nic = [objNull, _who, rPLAYMOVENOW, "sitRfl_R_BidleLoop"] call RE;
		};
		WaitUntil{[_who, ["sitUnarm_R_idleLoop", "sitRfl_R_BidleLoop"]] call _CheckIfAnimDone};
		if(!isNil"BIS_debugModules") then
		{
			textLogFormat["miscanim: ANIMATION ON %1 IS DONE", _who];
		};
		
	};
	
	case "sittingOnTheChair2":	//sitting-banded on the foldChair (with geton from the the right side) 
	{
		if(!_onboard) then
		{
			_vehicle enableSimulation false;
			_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) -0.06]; //get the foldchair lower
		};
		_who setformdir ((getdir _vehicle)+180);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)+180] call RE;

		if(primaryWeapon _who == "") then
		{
			_nic = [objNull, _who, rSWITCHMOVE, "CtsDoktor_Doktor_idleni0"] call RE;	//switchmove must be here becouse of bad positioning when use playmove 
		}else
		{
			_nic = [objNull, _who, rSWITCHMOVE, "CtsDoktor_Doktor_idleni0"] call RE;	//switchmove must be here becouse of bad positioning when use playmove
		};
		BIS_miscanimAnimDone = false;	
		//_xHandle = _who addEventHandler["AnimChanged",	{BIS_miscanimAnimDone = true; _who removeEventHandler["AnimChanged",0];}];
			if(primaryWeapon _who == "") then
			{
				_x = [180, 0.2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			}else
			{
				_x = [180, 0.2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			};
			if(!_onboard) then
			{
				_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) -0.08]; //get the foldchair lower
			};	
		
			[_who, _x, _onboard] call _SetThePos;
			_nic = [objNull, _who, rPLAYMOVE, "CtsDoktor_Doktor_idleni0"] call RE;	//must be here to start whole anim sequence			
		
	};
	
	case "sittingOnTheChair1L":	//sitting on the foldChair (with geton from the the LEFT side) 
	{
	
		if(!_onboard) then
		{
			_vehicle enableSimulation false;
			//_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) -0.08]; //get the foldchair lower
			_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) - 0.06]; //get the foldchair lower
		};
	
	
		if((typeof _who) == "FR_Sykes") then
		{
		
			if(primaryWeapon _who == "") then
			{
				_x = [112.082, 0.820805, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		
			}else
			{
				_x = [250, 0.9, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			};
		}
		else
		{
			if(primaryWeapon _who == "") then
			{
				_x = [117.073, 0.82594, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		
			}else
			{
				_x = [250, 0.9, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			};
		};
		
		
		_who setformdir ((getdir _vehicle)-90);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)-90] call RE;
		[_who, _x, _onboard] call _SetThePos; 
			
		if(primaryWeapon _who == "") then
		{
			_nic = [objNull, _who, rPLAYMOVENOW, "ErcUnarm_sitUnarm_L"] call RE;
		}else
		{
			_nic = [objNull, _who, rPLAYMOVENOW, "ErcUnarm_sitUnarm_L"] call RE;
		};
		
		WaitUntil{[_who, ["ErcUnarm_sitUnarm_L", "ErcUnarm_sitUnarm_L"]] call _CheckIfAnimDone};
		if(!isNil"BIS_debugModules") then
		{
			textLogFormat["miscanim: ANIMATION ON %1 IS DONE", _who];
		};
		
	};
	
	case "sittingOnTheChair3a":	//Sykes-like sitting  
	{
		if(!_onboard) then
		{
			_vehicle enableSimulation false;
			//_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) -0.08]; //get the foldchair lower
			_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) - 0.06]; //get the foldchair lower
			//_vehicle enableSimulation true;
		};
	
		["disableAI", [_who],2] call BIS_fnc_sceneSetBehaviour;
		_nic = [objNull, _who, rSWITCHMOVE, ""] call RE;
		//Sleep 1;
		_who enableSimulation false;
		_x = [];
		_objectsToPos = [
											(vehicleVarname _who), (typeOf _who), _who, 173.939,0.161065,183.063,[-2.15005e-010,8.93476e-011,1],[-0.923439,0.383745,-2.32831e-010],"sykes_c0briefing_loop",317.314,0.00140381
										];
				
		[_objectsToPos, _vehicle, _onboard, _shipElevation] call _SetThePosWithSetObjects;
		_who enableSimulation true;
		if(!isNil"BIS_debugModules") then
		{
			textLogFormat["miscanim: ANIMATION ON %1 IS DONE", _who];
		};	
	};
	
	case "sittingOnTheChair3b":	//Rodriguez-like sitting  
	{
		if(!_onboard) then
		{
			_vehicle enableSimulation false;
			//_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) -0.08]; //get the foldchair lower
			//_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) - 0.06]; //get the foldchair lower
			//_vehicle enableSimulation true;
		};
	
		["disableAI", [_who],2] call BIS_fnc_sceneSetBehaviour;
		_nic = [objNull, _who, rSWITCHMOVE, ""] call RE;
		//Sleep 1;
		_who enableSimulation false;
		_x = [];
		_objectsToPos = [
											(vehicleVarname _who), (typeOf _who), _who, 171.809,0.040728,173.993,[0,0,1],[-0.470573,0.882361,0],"rodriguez_c0briefing_loop",317.3,0.00143433
										];
				
		[_objectsToPos, _vehicle, _onboard, _shipElevation] call _SetThePosWithSetObjects;
		_who enableSimulation true;
		if(!isNil"BIS_debugModules") then
		{
			textLogFormat["miscanim: ANIMATION ON %1 IS DONE", _who];
		};	
	};		
		
		
		
		
	case "tableSupportTalking1":	//talking leaning on table - from front
	{
		_x = [];
		if(primaryWeapon _who == "") then
		{
			_x = [270, 1.9, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [270, 2.3, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		_who setformdir ((getdir _vehicle)+90);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)+90] call RE;
		[_who, _x, _onboard] call _SetThePos;
		
		_nic = [objNull, _who, rPLAYMOVENOW, "ActsPercSnonWnonDnon_tableSupport_TalkA"] call RE;
		
		
	};
	case "tableSupportTalking2":	//talking leaning on table - from side
	{
		_x = [];
		if(primaryWeapon _who == "") then
		{
			_x = [0, 1.3, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [0, 1.6, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		
		_who setformdir ((getdir _vehicle)-180);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)-180] call RE;
		[_who, _x, _onboard] call _SetThePos;
				
		_nic = [objNull, _who, rPLAYMOVENOW, "ActsPercSnonWnonDnon_tableSupport_TalkA"] call RE;
				
	};
	
	case "tableSittingOn1":	//sitting on the table - front
	{
		
		["disableAI", [_who]] call BIS_fnc_sceneSetBehaviour;
		 _x = [];
		if(primaryWeapon _who == "") then
		{
			_x = [0, 1.3, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [340.923, 1.739, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		
		//if(_onBoard) then {_x = _x + [_shipElevation];}; 			
		
		if(!isNil"BIS_debugModules") then
		{
			textLogFormat["scene: domove: %1", _domove];
		};
		if(!_domove) then
		{
			if(!_onboard) then
			{
				_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) - 0.152]; //get the table lower
			};
			_who setformdir ((getdir _vehicle)-180);
			_nic = [nil, _who, rSETDIR, (getdir _vehicle)-180] call RE;
			
			[_who, _x, _onboard] call _SetThePos;
			_nic = [objNull, _who, rPLAYMOVENOW, "sitTableRfl_listening"] call RE;
		}
		else
		{
			xxx=[_who, _vehicle, _x, _SetThePos, _onboard] spawn 
			{
				_who					= _this select 0;
				_vehicle			= _this select 1;
				_x						= _this select 2;
				_SetThePos 		= _this select 3; 
				_onboard 			= _this select 4;
				
				_who stop false;
				_who doMove _x;

				WaitUntil{(_who distance _vehicle) <= 1.75624};
				_who setformdir ((getdir _vehicle)-180);
				_nic = [nil, _who, rSETDIR, ((getdir _vehicle)-180)] call RE;
				/*
				textLogFormat ["miscanim: _who:%1",_who];
				textLogFormat ["miscanim: _x:%1",_x];
				textLogFormat ["miscanim: _onboard:%1",_onboard];
				textLogFormat ["miscanim: _SetThePos:%1",_SetThePos];
				*/
				[_who, _x, _onboard] call _SetThePos;
				_nic = [objNull, _who, rPLAYMOVENOW, "sitTableRfl_listening"] call RE;
				_who stop true;
			};
		};
		 
		
	};
	case "BagFenceSittingOn1":	//sitting on the bagfance - front
	{
		//TODO: lift character up instead of slide the object down
		if(!_onboard) then
		{
			_vehicle enableSimulation false;
			_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) - 0.188]; //get the sandbag lower
		}
		else
		{
			_vehicle enableSimulation false;
			_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, _shipElevation - 0.188]; //get the sandbag lower
		};
		
		["disableAI", [_who]] call BIS_fnc_sceneSetBehaviour;
		 _x = [];
		if(primaryWeapon _who == "") then
		{
			_x = [325.32,1.45897, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle; //TODO: change	
		}else
		{
			_x = [325.32,1.45897, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		
		_who setformdir ((getdir _vehicle)-195);
		_who setdir (getdir _vehicle)-195;
		[_who, _x, _onboard] call _SetThePos;
		[_who] spawn {
				_who = _this select 0;
				_nic = [objNull, _who, rPLAYMOVENOW, "sitTableRfl_listening"] call RE;
				Sleep 1;
			};
	};
	case "heliChecking1":	//checking, assembling helicopter - thermal rocket silo - VENOM
	{
		_x = [];
		if(primaryWeapon _who == "") then
		{
			_x = [170, 7.5, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [169, 7.5, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		//if(_onBoard) then {_x = _x + [_shipElevation];};
		
		/*if(_onboard) then
		{
			_who attachTo [_vehicle, [(_x select 0)-(getpos _vehicle select 0)+_offsetx, (_x select 1)-(getpos _vehicle select 1)+_offsety,-2]];
		}else
		{			
			_who setPos _x; 
		};
		*/ 
		_who setformdir ((getdir _vehicle)-90);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)-90] call RE;
		[_who, _x, _onboard] call _SetThePos;
		_nic = [objNull, _who, rPLAYMOVENOW, "ActsPercSnonWnonDnon_assembling"] call RE;
		
	};		
	
	case "heliChecking2":	//checking, assembling helicopter - ROTATEGUN
	{
		_x = [];
		
		if(primaryWeapon _who == "") then
		{
			_offsetx = -0.1;
			_offsety = -0.15;
			//_x = [152, 5.05, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			_x = [155, 5.05, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		}else
		{
			_offsetx = -0.35;
			_offsety = -0.1;
			_x = [149, 5.1, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			
		};
		_who setformdir ((getdir _vehicle)-90);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)-90] call RE;
		[_who, _x, _onboard] call _SetThePos;
		_nic = [objNull, _who, rPLAYMOVENOW, "ActsPercSnonWnonDnon_assembling"] call RE;
	};

	case "heliCleaning1":	//cleaning,checking, helicopter MH60 - cockpit outside
	{
		_x = [];
		_objectsToPos = [
											(vehicleVarname _who), (typeOf _who), _who,338.018,5.35682,90.174,[0,0,1],[-0.987038,-0.160484,0],"repairingerc",15.885,0.00141716,
											"","MetalBucket","",339.978,4.57588,-170.591,[0,-0.0100005,0.99995],[0,0.99995,0.0100005],"",18.9826,1.71661e-005
										];
				
		
		[_objectsToPos, _vehicle, _onboard, _shipElevation] call _SetThePosWithSetObjects;
	};	
	
	case "heliNavi1":	//navigating helicopter
	{
		_x = [];
		_objectsToPos = [
											(vehicleVarname _who), (typeOf _who), _who, 181.459,15.1246,4.33816,[0,0,1],[0.480044,0.877244,0],"navigationheli",15.8865,0.00143814
										];
				
		[_objectsToPos, _vehicle, _onboard, _shipElevation] call _SetThePosWithSetObjects;
	};	
	
	
	
	case "fixingHumwee1":	//fixing Hummwee - engine
	{
		_x = [];
		
		if(primaryWeapon _who == "") then
		{
			_x = [0, 3.8, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [0, 4, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		_who setformdir ((getdir _vehicle)-180);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)-180] call RE;
		[_who, _x, _onboard] call _SetThePos;
		_nic = [objNull, _who, rPLAYMOVENOW, "ActsPercSnonWnonDnon_carFixing"] call RE;
	};
	
	case "lyingAlongVehicle1":	//lying near the vehicle - LEFT
	{
		_x = [];
		
		if(primaryWeapon _who == "") then
		{
			_x = [270, 2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [270, 2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		_who setformdir (getdir _vehicle);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle)] call RE;
		[_who, _x, _onboard] call _SetThePos;
		_nic = [objNull, _who, rPLAYMOVENOW, "AidlPpneMstpSnonWnonDnon_SleepC_talk"] call RE;
	};
	
	case "lyingAlongVehicle1b":	//lying near the vehicle - RIGHT
	{
		_x = [];
		
		if(primaryWeapon _who == "") then
		{
			_x = [90, 2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;	
		}else
		{
			_x = [90, 2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		};
		_who setformdir ((getdir _vehicle) - 180);
		_nic = [nil, _who, rSETDIR, (getdir _vehicle) - 180] call RE;
		[_who, _x, _onboard] call _SetThePos;		
		_nic = [objNull, _who, rPLAYMOVENOW, "AidlPpneMstpSnonWnonDnon_SleepC_talk"] call RE;
	};
	
	case "twoTalking1":	//pair talking in front of the vehicle 0 degrees - NORMAL TALK
	{
		["disableAI", [_who,_who2]] call BIS_fnc_sceneSetBehaviour;
		_x = [];
		if(typeName _vehicle == "Object") then
		{
			_x = [0, 5, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		 	 _who setformdir (getdir _vehicle);
			 _nic = [nil, _who, rSETDIR, (getdir _vehicle)] call RE;
		}else
		{	
			_x = [0, 0.1, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			_markerdir = markerdir _vehicle;
			_who setformdir (_markerdir);
			_nic = [nil, _who, rSETDIR, (_markerdir)] call RE;
		};
		[_who, _x, _onboard] call _SetThePos;
		
		_nic = [objNull, _who, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkAS"] call RE;
		
		_x = [0, 2, _who, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		
		_who2 setformdir ((getdir _who) - 180);
		_nic = [nil, _who2, rSETDIR, (getdir _who)-180] call RE;
		[_who2, _x, _onboard] call _SetThePos; 
		_nic = [objNull, _who2, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkBS"] call RE;
		
	};
	
	case "twoTalking1a":	//pair talking in front of the vehicle 0 degrees but pair is ROTATED- NORMAL TALK
	{
		["disableAI", [_who,_who2]] call BIS_fnc_sceneSetBehaviour;
		_x = [];
		if(typeName _vehicle == "Object") then
		{
			_x = [0, 3.5, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		 	 _who setformdir ((getdir _vehicle) - 90);
			 
			 _who setdir (getdir _vehicle) - 90;
		}else
		{	
			_x = [0, 0.1, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			_markerdir = markerdir _vehicle;
			_who setformdir ((getdir _vehicle) - 90);
			_who setdir (_markerdir - 90);
		};
		[_who, _x, _onboard] call _SetThePos;
		
		_nic = [objNull, _who, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkAS"] call RE;
		
		_x = [0, 2, _who, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		_who2 setformdir ((getdir _who) - 180);
		_who2 setdir (getdir _who)-180;
		[_who2, _x, _onboard] call _SetThePos;
		_nic = [objNull, _who2, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkBS"] call RE;
	};
	
	case "twoTalking2":	//pair talking in side of the vehicle 90 degrees - NORMAL TALK
	{
		["disableAI", [_who,_who2]] call BIS_fnc_sceneSetBehaviour;
		_x = [];
		if(typeName _vehicle == "Object") then
		{
			_x = [90, 2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		 	 _who setformdir (getdir _vehicle);
		 	 _nic = [nil, _who, rSETDIR, (getdir _vehicle)] call RE;
		}else
		{	
			_x = [90, 0.1, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			_markerdir = markerdir _vehicle;
			_who setformdir (_markerdir);
			_nic = [nil, _who, rSETDIR, (_markerdir)] call RE;
		};
		[_who, _x, _onboard] call _SetThePos; 
		_nic = [objNull, _who, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkAS"] call RE;
		
		_x = [0, 2, _who, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		_who2 setformdir ((getdir _who) - 180);
		_nic = [nil, _who2, rSETDIR, (getdir _who)-180] call RE;
		[_who2, _x, _onboard] call _SetThePos; 
		_nic = [objNull, _who2, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkBS"] call RE;
	};
	
	case "twoTalking3":	//pair talking in side of the vehicle 270 degrees - NORMAL TALK
	{
		["disableAI", [_who,_who2]] call BIS_fnc_sceneSetBehaviour;
		_x = [];
		if(typeName _vehicle == "Object") then
		{
			//if we want to position pair regarding to OBJECT 
			_x = [270, 2, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		 	 _who setformdir (getdir _vehicle);
			 _nic = [nil, _who, rSETDIR, (getdir _vehicle)] call RE;
		}else
		{	
			//if we want to position pair regarding to MARKER
			_x = [270, 0.1, _vehicle, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
			_markerdir = markerdir _vehicle;
			_who setformdir _markerdir;
			_nic = [nil, _who, rSETDIR, (_markerdir)] call RE;
		};
		[_who, _x, _onboard] call _SetThePos; 
		_nic = [objNull, _who, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkAS"] call RE;
		_x = [0, 2, _who, nil, _shipLevel] call BIS_fnc_sceneGetPositionByAngle;
		_who2 setformdir ((getdir _who) - 180);
		_nic = [nil, _who2, rSETDIR, (getdir _who)-180] call RE;
		[_who2, _x, _onboard] call _SetThePos;
		
		_nic = [objNull, _who2, rPLAYMOVENOW, "AidlPercSnonWnonDnon_talkBS"] call RE;
	};
	
	
	
	default 
	{
		if(!isNil"BIS_debugModules") then
		{
			DEBUGLOG "miscanim: DEFAULT ANIM - DOING NOTHING";
		};
	};
	
};
//temporary - nez vyresime pozicovani na lodi

[_who,_who2] spawn 
{
	_who = _this select 0;
	_who2 = _this select 1;
	Sleep 1;
	_who allowDamage true;
	_who2 allowDamage true;	
};


true