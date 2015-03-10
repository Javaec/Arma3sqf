//Defines
#define ON 		0
#define OFF 		0.97
#define LIGHT 		"light_1_hitpoint"
#define DUMMY		"BIS_effectDummy"
#define DESTROYED	"BIS_lightDestroyed"
#define SAMPLE		"electricity_loop"
#define HELIPAD		"Land_HelipadEmpty_F"

//Parameters
private ["_position", "_type", "_timing", "_delay", "_condition"];
_position	= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_type		= [_this, 1, "Land_LampShabby_F", [""]] call BIS_fnc_param;
_timing		= [_this, 2, [0.25, 0.50], [[]]] call BIS_fnc_param;
_delay		= [_this, 3, [1, 2], [[]]] call BIS_fnc_param;
_condition	= [_this, 4, { true }, [{}]] call BIS_fnc_param;

//Find related objects
private "_object";
_object = nearestObject [_position, _type];

//Make sure we found an object
if (isNull _object) exitWith {
	["Object at position (%1), of type (%2) not found", _position, _type] call BIS_fnc_error;
};

//Light starts off
_object setHit [LIGHT, OFF];

//Hit event handler
_object addEventhandler ["Hit", { (_this select 0) setvariable [DESTROYED, true]; }];

//Effect
private "_setState";
_setState = {
	private ["_object", "_on"];
	_object	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_on 	= [_this, 1, true, [true]] call BIS_fnc_param;
	
	//The dummy object
	private "_dummy";
	_dummy = objNull;
	
	//Does the dummy object been created already
	if (isNil { _object getVariable DUMMY }) then {
		//Create dummy object
		private "_dummy";
		_dummy = createVehicle [HELIPAD, position _object, [], 0, "CAN_COLLIDE"];
		
		//Attach it to the light object
		_dummy attachTo [_object, [0,0,2]];
		
		//Store
		_object setVariable [DUMMY, _dummy];
	} else {
		_dummy = _object getVariable DUMMY;
	};
	
	//Effect on or off
	if (_on) then {
		//Play effect
		_dummy setDamage 0;
		_dummy say3D SAMPLE;
		_object setHit [LIGHT, ON];
	} else {
		//Destroy effect
		_dummy setDamage 1;
		_object setHit [LIGHT, OFF];
	};
};

//Flag
private "_lightOn";
_lightOn = false;

//Main loop
while _condition do {
	//Exit if destroyed
	if (!isNil { _object getvariable DESTROYED }) exitWith {
		//Light off
		_object setHit [LIGHT, OFF];
		
		//Log
		["Light object (%1) was destroyed", _object] call BIS_fnc_log;
	};
	
	//Blinking loop
	for "_i" from 0 to 5 do {
		//Set state
		if (_lightOn) then {
			[_object, false] call _setState;
			_lightOn = false;
		} else {
			[_object, true] call _setState;
			_lightOn = true;
		};
		
		//The timing
		sleep (_timing call BIS_fnc_randomNum);
	};
	
	//Sleep
	sleep (_delay call BIS_fnc_randomNum);
};

//Does it exist?
if (!isNil { _object getVariable DUMMY }) then {
	//The dummy
	private "_dummy";
	_dummy = _object getVariable DUMMY;
	
	//Detach and delete
	detach _dummy;
	deleteVehicle _dummy;
};

//Return
true;
