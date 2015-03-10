#define START_TIME time
#define MOVE_TIME 5.0
#define WANTED_SPEED 50.0

private ["_bobcat", "_wreck", "_groupLogistics"];
_bobcat		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_wreck		= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_groupLogistics	= [_this, 2, grpNull, [grpNull]] call BIS_fnc_param;

private ["_positionBobcat", "_positionWreck"];
_positionBobcat	= position _bobcat;
_positionWreck	= position _wreck;

_bobcat allowDamage false;
_wreck allowDamage false;

sleep 18.5;

//Engine start
_bobcat say3D "bobcat_engine_start";
_bobcat engineOn true;

sleep 2;

//Enable AI
driver _bobcat enableAi "MOVE";

//Create dummies InvisibleH
private ["_dummyDragging", "_dummyEngine"];
_dummyDragging = createVehicle ["Land_HelipadEmpty_F", position _wreck, [], 0, "CAN_COLLIDE"];
_dummyEngine	= createVehicle ["Land_HelipadEmpty_F", position _bobcat, [], 0, "CAN_COLLIDE"];

//Attach invisibleHs
_dummyDragging attachTo [_wreck, [0, 0, 1]];
_dummyEngine attachTo [_bobcat, [0, 0, 1]];

//Dragging sound loop
[_wreck, _dummyDragging, _bobcat] spawn {
	waitUntil { (_this select 0) distance (_this select 2) < 5.6 };
	
	addCamShake [50 / (player distance (_this select 2)), 1, 15];
	(_this select 1) say3D "vehicle_collision";
	sleep 0.5;
	(_this select 1) say3D "vehicle_dragging";
};

//Engine start/loop sounds
_dummyEngine say3D "bobcat_engine_loop";
_dummyEngine spawn { sleep 7.5; _this say3D "bobcat_engine_loop"; };
_dummyEngine spawn { sleep 15; _this say3D "bobcat_engine_loop"; };

// The current position of the object
private ["_position", "_movePosition", "_distanceBetween"];
_position = getPosASL _bobcat;
_movePosition = [_bobcat, 32.5, [_bobcat, _wreck] call BIS_fnc_dirTo] call BIS_fnc_relPos;
_distanceBetween = _bobcat distance _wreck;

// Store the start time of this translation
private ["_startTime", "_moveTime"];
_startTime = time;
_moveTime = 50.0;

while { time - _startTime <= _moveTime } do {
	private ["_x", "_y", "_z"];
	_x = linearConversion [_startTime, _startTime + _moveTime, time, _position select 0, _movePosition select 0];
	_y = linearConversion [_startTime, _startTime + _moveTime, time, _position select 1, _movePosition select 1];
	_z = (_position select 2) + 0.15;
	
	// Lerp
	_bobcat setDir ([_bobcat, _movePosition] call BIS_fnc_dirTo);
	_bobcat setPosASL [_x, _y, _z];
	
	if (_moveTime > 15) then {
		_moveTime = _moveTime - 0.05;
	};
	
	// Delay
	sleep 0.01;
};

//Delete sound objects
detach _dummyDragging;
detach _dummyEngine;
deleteVehicle _dummyDragging;
deleteVehicle _dummyEngine;

//Drag end sound
_wreck say3D "vehicle_drag_end";

//Disable AI
driver _bobcat disableAi "MOVE";

//Add waypoint to logistics convoy
[_groupLogistics, getMarkerPos "BIS_base", "MOVE", "CARELESS", "BLUE", "LIMITED"] call BIS_fnc_saa_addWaypoint;
