//Defines
#define WHEELS ["wheel_1_1_steering", "wheel_1_2_steering", "wheel_1_3_steering", "wheel_1_4_steering", "wheel_2_1_steering", "wheel_2_2_steering", "wheel_2_3_steering", "wheel_2_4_steering"]

//Parameters
private ["_action", "_parameters"];
_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

//Sub-functions
switch (toLower _action) do {
	case (toLower "initialize") : {
		//Parameters
		private ["_vehicle"];
		_vehicle = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		//Add handle damage event handler
		private "_handler";
		_handler = _vehicle addEventHandler ["HandleDamage", {
			["handleDamage", _this] call BIS_fnc_C_m02_vehicleWheels;
		}];
		
		//Store stuff
		_vehicle setVariable ["BIS_vehicleWheels_initialized", true];
		_vehicle setVariable ["BIS_vehicleWheels_handleDamage", _handler];
		_vehicle setVariable ["BIS_vehicleWheels_brokenWheels", []];
		_vehicle setVariable ["BIS_vehicleWheels_onBrokenWheel", nil];
		
		//Log
		["Vehicle (%1) initialized", _vehicle] call BIS_fnc_logFormat;
	};
	
	case (toLower "terminate") : {
		//Parameters
		private ["_vehicle"];
		_vehicle = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		//Remove handle damage event handler
		_vehicle removeEventHandler ["HandleDamage", _vehicle getVariable "BIS_vehicleWheels_handleDamage"];
		
		//Store stuff
		_vehicle setVariable ["BIS_vehicleWheels_initialized", nil];
		_vehicle setVariable ["BIS_vehicleWheels_handleDamage", nil];
		_vehicle setVariable ["BIS_vehicleWheels_brokenWheels", nil];
		_vehicle setVariable ["BIS_vehicleWheels_onBrokenWheel", nil];
		
		//Log
		["Vehicle (%1) terminated", _vehicle] call BIS_fnc_logFormat;
	};
	
	case (toLower "isInitialized") : {
		//Parameters
		private ["_vehicle"];
		_vehicle = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		//Return
		!isNil { _vehicle getVariable "BIS_vehicleWheels_initialized" };
	};
	
	case (toLower "handleDamage") : {
		//Parameters
		private ["_vehicle", "_damage", "_selection", "_source"];
		_vehicle 	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_selection	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_damage		= [_parameters, 2, 0, [0]] call BIS_fnc_param;
		_source		= [_parameters, 3, objNull, [objNull]] call BIS_fnc_param;
		
		//Make selection name lower case
		private "_selectionLowerCase";
		_selectionLowerCase = toLower _selection;
		
		//The broken wheels
		private "_brokenWheels";
		_brokenWheels = _vehicle getVariable ["BIS_vehicleWheels_brokenWheels", []];
		
		//If damage was done on a wheel and it is high enough, we flag the tire as flat
		if (_selectionLowerCase in WHEELS && { _damage >= 0.9 } && { !(_selectionLowerCase in _brokenWheels) }) then {
			//Store broken wheel
			_brokenWheels set [count _brokenWheels, _selectionLowerCase];
			
			//Trigger event if handler was added
			if (!isNil { _vehicle getVariable "BIS_vehicleWheels_onBrokenWheel" }) then {
				//Execute code
				[_vehicle] call (_vehicle getVariable "BIS_vehicleWheels_onBrokenWheel");
			};
			
			//Log
			["Vehicle (%1) wheel (%2) broken", _vehicle, _selectionLowerCase] call BIS_fnc_logFormat;
		};
		
		//Store
		_vehicle setVariable ["BIS_vehicleWheels_brokenWheels", _brokenWheels];
		
		//Allow damage only if inflicted by the player
		if (_source == player) then {
			_damage;
		} else {
			0;
		};
	};
	
	case (toLower "getBrokenWheels") : {
		//Parameters
		private ["_vehicle"];
		_vehicle = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		//Return
		_vehicle getVariable ["BIS_vehicleWheels_brokenWheels", []];
	};
	
	case (toLower "onBrokenWheel") : {
		//Parameters
		private ["_vehicle", "_code"];
		_vehicle 	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_code		= [_parameters, 1, {}, [{}]] call BIS_fnc_param;
		
		//Store
		_vehicle setVariable ["BIS_vehicleWheels_onBrokenWheel", _code];
	};
	
	case DEFAULT {
		//Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
