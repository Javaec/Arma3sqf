// Parameters
private ["_object", "_movePositions", "_moveTimes", "_condition", "_resetMoveTime"];
_object		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_movePositions	= [_this, 1, [], [[]]] call BIS_fnc_param;
_moveTimes	= [_this, 2, [], [[]]] call BIS_fnc_param;
_condition	= [_this, 3, { true }, [{}]] call BIS_fnc_param;
_resetMoveTime	= [_this, 4, 1, [0]] call BIS_fnc_param;

// Make sure we have valid positions
if (count _movePositions < 1) exitWith {
	"No positions were given" call BIS_fnc_error;
};

// Make sure we have valid times
if (count _moveTimes < count _movePositions) exitWith {
	"MoveTimes does not match MovePositions" call BIS_fnc_error;
};

// The initial position
private "_initialPosition";
_initialPosition = getPosASL _object;

// The current index
private "_index";
_index = 0;

// Wait for condition to become true
waitUntil _condition;

// The main loop
while { !isNull _object && _condition } do {
	private ["_movePosition", "_moveTime"];
	_movePosition 	= _movePositions select _index;
	_moveTime 	= _moveTimes select _index;
	
	// The current position of the object
	private "_position";
	_position = getPosASL _object;
	
	// Store the start time of this translation
	private "_startTime";
	_startTime = time;

	while { time - _startTime <= _moveTime } do {
		private ["_x", "_y", "_z"];
		_x = linearConversion [_startTime, _startTime + _moveTime, time, _position select 0, _movePosition select 0];
		_y = linearConversion [_startTime, _startTime + _moveTime, time, _position select 1, _movePosition select 1];
		_z = linearConversion [_startTime, _startTime + _moveTime, time, _position select 2, _movePosition select 2];
		
		// Lerp
		_object setPosASL [_x, _y, _z];
		
		// Delay
		sleep 0.01;
	};
	
	// Prepare next index
	if ((count _movePositions) - 1 > _index) then {
		_index = _index + 1;
	} else {
		_index = 0;
	};
};

// We now want to reset the object's position back to the original position
private ["_position", "_startTime"];
_position 	= getPosASL _object;
_startTime 	= time;

while { time - _startTime <= _resetMoveTime } do {
	private ["_x", "_y", "_z"];
	_x = linearConversion [_startTime, _startTime + _resetMoveTime, time, _position select 0, _initialPosition select 0];
	_y = linearConversion [_startTime, _startTime + _resetMoveTime, time, _position select 1, _initialPosition select 1];
	_z = linearConversion [_startTime, _startTime + _resetMoveTime, time, _position select 2, _initialPosition select 2];
	
	// Lerp
	_object setPosASL [_x, _y, _z];
	
	// Delay
	sleep 0.01;
};

// Log
["Exited: %1, %2", _condition, _object] call BIS_fnc_logFormat;
