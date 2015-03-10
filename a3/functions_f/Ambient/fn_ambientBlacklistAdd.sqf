/*
	Author: Karel Moricky

	Description:
	Add a new ambient blacklist trigger

	Parameter(s):
	_this select 0:	OBJECT - trigger

	Returns:
	BOOL - true when added correctly
*/

_trigger = [_this,0,objnull,[objnull]] call bis_fnc_param;
if (typeof _trigger == "emptydetector") then {

	if (isnil "bis_ambientBlacklist") then {bis_ambientBlacklist = [];};
	if !(_trigger in bis_ambientBlacklist) then {
		for "_i" from 0 to 99 do {
			private ["_triggerName"];
			_triggerName = format ["bis_ambientBlacklist_%1",_i];
			if (isnil _triggerName) exitwith {
				missionnamespace setvariable [_triggerName,_trigger];
				bis_ambientBlacklist set [
					count bis_ambientBlacklist,
					_trigger
				];
				true
			};
		};
	};
} else {
	["Object '%1' is not a trigger"] call bis_fnc_error;
	false
};