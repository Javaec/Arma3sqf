//Parameters
private ["_vehicle", "_center", "_radius", "_rounds", "_delay", "_condition"];
_vehicle		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_center			= [_this, 1, [0,0,0], [[]]] call BIS_fnc_param;
_radius			= [_this, 2, 50, [0]] call BIS_fnc_param;
_rounds			= [_this, 3, 12, [0]] call BIS_fnc_param;
_delay			= [_this, 4, [5, 10], [0, []]] call BIS_fnc_param;
_weapon			= [_this, 5, "12Rnd_230mm_rockets", [""]] call BIS_fnc_param;
_condition		= [_this, 6, { true }, [{}]] call BIS_fnc_param;

//Loop
while { alive _vehicle && _condition } do {
	//The position
	private "_position";
	_position = [_center, random _radius, random 360] call BIS_fnc_relPos;

	//Rearm vehicle
	_vehicle setVehicleAmmo 1;

	//Fire
	_vehicle doWatch _position;
	_vehicle commandArtilleryFire [_position, _weapon, _rounds];

	//Delay between each mission
	sleep (if (typeName _delay != "ARRAY") then { _delay; } else { _delay call BIS_fnc_randomNum; });
};

//Log
["Vehicle (%1) has finished bombardment", _vehicle] call BIS_fnc_logFormat;
