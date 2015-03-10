[] spawn {
	// Build list of zone restriction triggers
	private ["_triggers", "_i"];
	_triggers = [];
	_i = 1;
	
	while {!(isNull (missionNamespace getVariable [format ["BIS_AO%1", _i], objNull]))} do {
		private ["_trigger"];
		_trigger = missionNamespace getVariable (format ["BIS_AO%1", _i]);
		_triggers = _triggers + [_trigger];
		
		_i = _i + 1;
	};
	
	// Don't proceed if there are no triggers
	if (count _triggers == 0) exitWith {};
	
	private ["_punish"];
	_punish = false;
	
	while {alive player && !(_punish)} do {
		// Wait for any trigger to activate
		waitUntil {{triggerActivated _x} count _triggers > 0 || !(alive player)};
		
		if (alive player) then {
			// Warn the player
			[] call BIS_fnc_ZRWarn;
			
			// 10 second timeout
			private ["_timeout"];
			_timeout = time + 10;
			
			// Wait for the timeout or for the player to get back
			waitUntil {time > _timeout || {triggerActivated _x} count _triggers == 0 || !(alive player)};
			
			if (alive player) then {
				if ({triggerActivated _x} count _triggers > 0) then {
					if (time > _timeout) then {
						// Punish the player
						[] call BIS_fnc_ZRPunish;
						_punish = true;
					};
				};
			};
		};
	};
};