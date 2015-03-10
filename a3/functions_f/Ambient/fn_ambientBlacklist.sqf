/*
	Author: Karel Moricky

	Description:
	Check if area is blacklisted.
	Blacklist triggers are to be named 'bis_ambientBlacklist_#', where # is number from 0 to 99.

	Parameter(s):
	_this select 0:	BIS_fnc_position compatible position - check if position is blacklisted
			NUMBER - initialize blacklisted areas

	Returns:
	BOOL - true when in blacklisted area
*/

if (typename _this != typename 0) then {

	//--- Check if pos is in blacklist areas
	_pos = _this call bis_fnc_position;
	bis_ambientBlacklist = bis_ambientBlacklist - [objnull]; //--- Remove deleted triggers
	{
		[_x,_pos] call bis_fnc_intrigger
	} count bis_ambientBlacklist > 0
} else {

	//--- Register blacklist areas
	if (isnil "bis_ambientBlacklist") then {bis_ambientBlacklist = [];};
	for "_i" from 0 to 99 do {
		private ["_triggerName"];
		_triggerName = format ["bis_ambientBlacklist_%1",_i];
		if (!isnil _triggerName) then {
			if !((missionnamespace getvariable _triggerName) in bis_ambientBlacklist) then {
				bis_ambientBlacklist set [
					count bis_ambientBlacklist,
					missionnamespace getvariable _triggerName
				];
			};
		};
	};
};