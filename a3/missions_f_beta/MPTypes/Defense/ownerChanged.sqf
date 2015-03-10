_sector = _this select 0;
_owner = _this select 1;
_ownerOld = _this select 2;

_logic = _sector getvariable ["BIS_fnc_moduleMPTypeDefense_logic",objnull];
_playerSides = _logic getvariable ["playerSides",[]];
_enemySides = _logic getvariable ["enemySides",[]];

if (_ownerOld in _playerSides) then {

	//--- Play an alarm (different sample for each side)
	_ownerOldID = _ownerOld call bis_fnc_sideID;
	if (_ownerOldID in [0,1,2]) then {
		_sound = ["Alarm_OPFOR","Alarm_BLUFOR","Alarm_Independent"] select _ownerOldID;
		{_x say _sound;} foreach (_sector getvariable ["sectors",[]]);
	};

	//--- Play warning sentence (only the first time)
	if (isserver) then {
		_var = "BIS_fnc_moduleMPTypeDefense_alarmWarned" + str _ownerOld;
		if !(missionnamespace getvariable [_var,false]) then {
			["BIS_inBase",[_logic,_ownerOld],BIS_fnc_moduleMPTypeDefense_missionConversations] call bis_fnc_missionConversations;
			missionnamespace setvariable [_var,true];
		};
	};
};