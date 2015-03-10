//Parameters
private ["_car", "_alarm", "_duration", "_lights", "_logic"];
_car		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_alarm		= [_this, 1, "AlarmCar", [""]] call BIS_fnc_param;
_duration	= [_this, 2, 30, [0]] call BIS_fnc_param;
_lights		= [_this, 3, true, [true]] call BIS_fnc_param;
_logic		= [_this, 4, BIS_cars, [objNull]] call BIS_fnc_param;

//Calculate timeout
private "_timeout";
_timeout = time + _duration;

//Loop
while { alive _car && canMove _car && time < _timeout } do {
	//Play sample
	_car say3D _alarm;
	
	if (isServer) then {
		for "_i" from 1 to 4 do {
			_logic action ["LightOn", _car];
			sleep 0.25;
			_logic action ["LightOff", _car];
			sleep 0.25;
		};
	} else {
		sleep 2;
	};
};
