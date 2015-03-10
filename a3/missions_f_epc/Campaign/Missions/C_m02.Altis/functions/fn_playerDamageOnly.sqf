//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

//Action
switch (toLower _action) do {
	case toLower "on" : {
		//Parameters
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		//Add event handler
		private "_handleDamage";
		_handleDamage = _object addEventHandler ["HandleDamage", {
			["onDamageDetected", _this] call BIS_fnc_C_out1_playerDamageOnly;
		}];

		//Store handler
		_object setVariable ["BIS_playerDamageOnly", _handleDamage];
		
		//Log
		["Object (%1) state is ON", _object] call BIS_fnc_logFormat;
	};
	
	case toLower "off" : {
		//Parameters
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		//Make sure On is current state
		if (!isNil { _object getVariable "BIS_playerDamageOnly" }) then {
			//Remove event handler
			_object removeEventHandler ["HandleDamage", _object getVariable "BIS_playerDamageOnly"];
			
			//Log
			["Object (%1) state is OFF", _object] call BIS_fnc_logFormat;
		} else {
			//Error
			["Object (%1) state is already OFF", _object] call BIS_fnc_error;
		};
	};
	
	case toLower "onDamageDetected" : {
		private ["_object", "_selection", "_damage", "_source", "_projectile"];
		_object 	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_selection 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_damage 	= [_parameters, 2, 0, [0]] call BIS_fnc_param;
		_source 	= [_parameters, 3, objNull, [objNull]] call BIS_fnc_param;
		_projectile 	= [_parameters, 4, "", [""]] call BIS_fnc_param;
		
		//Player is the only object that can cause damage
		if (isPlayer _source) then {
			//Return damage
			_damage;
		} else {
			//Return no damage
			0;
		};
	};
	
	case DEFAULT {
		//Error
		["Invalid action (%1)", _action] call BIS_fnc_error;
	};
};
