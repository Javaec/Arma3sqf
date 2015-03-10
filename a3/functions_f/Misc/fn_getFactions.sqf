
/*
	File: getFactions.sqf
	Author: Karel Moricky

	Description:
	Gets list of current factions

	Parameter(s):
	_this: Nothing, Object or String
		Nothing - list of all factions is returned.
		Object - Index number of objects faction is returned.
		String - Index number of given faction is returned.
		Array - When empty, sides of all factions are returned, otherwise side of first element is returned.

*/
private ["_factionClasses","_factions","_element","_result","_object","_faction","_side","_sides","_sidelist","_factionsResult","_factionVariable"];

//--- Store variables on first execution
_factions = if (isnil {bis_functions_mainscope getvariable "getfactions_factions"}) then {
	_factionClasses = (configfile >> "CfgFactionClasses");
	_factions = [];
	_sides = [];
	_sidelist = [east,west,resistance,civilian,sideUnknown,sideEnemy,sideFriendly,sideLogic];

	for "_i" from 1 to (count _factionClasses - 1) do {
		_element = _factionClasses select _i;
		if (isclass _element) then {
			_side = getnumber(_element >> "side");
			if (_side >= 0) then {
				_factions = _factions + [configname _element];
				_sides = _sides + [_sidelist select _side];
			};
		};
	};
	bis_functions_mainscope setvariable ["getfactions_factions",_factions];
	bis_functions_mainscope setvariable ["getfactions_sides",_sides];
	_factions
} else {bis_functions_mainscope getvariable "getfactions_factions"};


//--- Get results
_result = if (count _this > 0) then {
	_input = _this select 0;


	switch (typename _input) do {
		//--- Input is Object
		case "OBJECT": {
			_factionVariable = _input getvariable "faction";
			_faction = if (isnil "_factionVariable") then {faction _input} else {_factionVariable};
			_factions find _faction
		};
		//--- Input is String
		case "STRING": {
			_factions find _input
		};
		//--- Input is Location (always civilian)
		case "LOCATION": {
			_factions find "CIV_F"
		};
		//--- Input is Array
		case "ARRAY": {
			if (count _input > 0) then {
				_element = _input select 0;
				_faction = [_element] call bis_fnc_getfactions;
				(bis_functions_mainscope getvariable "getfactions_sides") select _faction
			} else {
				bis_functions_mainscope getvariable "getfactions_sides"
			};
		};
		default {_factions};
	};

} else {
	_factions
};
_result;