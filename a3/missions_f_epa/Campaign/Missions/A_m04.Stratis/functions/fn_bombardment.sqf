//Parameters
private ["_center", "_radius", "_projectiles", "_delay", "_condition"];
_center		= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_radius		= [_this, 1, 50, [0]] call BIS_fnc_param;
_projectiles	= [_this, 2, ["M_Titan_AT", "R_PG32V_F", "R_TBG32V_F"], ["", []]] call BIS_fnc_param;
_delay		= [_this, 3, [1, 5], [0, []]] call BIS_fnc_param;
_condition	= [_this, 4, { true }, [{}]] call BIS_fnc_param;

//Loop
while _condition do {
	//The position
	private "_position";
	_position = [_center, random _radius, random 360] call BIS_fnc_relPos;
	
	//The projectile
	private "_class";
	_class = if (typeName _projectiles != "ARRAY") then {
		_projectiles;
	} else {
		_projectiles call BIS_fnc_selectRandom;
	};
	
	//The delay between each shot
	private "_sleep";
	_sleep = if (typeName _delay != "ARRAY") then {
		_delay;
	} else {
		_delay call BIS_fnc_randomNum;
	};
	
	//The projectile
	private "_projectile";
	_projectile = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];
	
	//Delay
	sleep _sleep;
};

//Return
true;
