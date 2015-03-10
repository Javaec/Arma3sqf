[] spawn {
	waitUntil {time > 0};
	
	{
		if (!(_x getVariable ["BIS_fnc_initInsignias_exclude", false])) then {
			private ["_faction"];
			_faction = toUpper (faction _x);
			
			private ["_insignia"];
			_insignia = "";
			
			if (_faction in ["BLU_F", "IND_F"]) then {
				// Task Force Aegis
				_insignia = "TFAegis";
			} else {
				if (_faction == "OPF_F") then {
					// Gryffin Regiment
					_insignia = "GryffinRegiment";
				};
			};
			
			if (_insignia != "") then {
				[_x, _insignia] call BIS_fnc_setUnitInsignia;
				[_x, format ["[this, '%1'] call BIS_fnc_setUnitInsignia", _insignia]] call BIS_fnc_setSceneInit;
			};
		};
	} forEach allUnits;
};