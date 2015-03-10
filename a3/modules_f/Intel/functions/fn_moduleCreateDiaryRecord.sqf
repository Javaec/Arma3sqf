private ["_logic","_units","_subject","_subject","_subjectID","_title","_description","_diaryUnits"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract module params
	_owner = _logic getVariable ["Owner", 0];
	_subject = _logic getvariable ["Subject",""];
	_subjectID = if (_subject == "") then {"Diary"} else {_subject};
	_title = _logic getvariable ["Title",""];
	if (_title == "") then {_title = _logic getvariable ["PresetTitle",""];};
	_description = _logic getvariable ["Description",""];

	//--- Identify owner
	_diaryUnits = [];
	switch _owner do {
		case 0: {
			_diaryUnits = _units;
		};
		case 1: {
			{
				_diaryUnits = _diaryUnits - _units;
				_diaryUnits = _diaryUnits + _units;
			} foreach _units;
		};
		case 2: {
			_sides = [];
			{
				_sides = _sides - [side _x];
				_sides = _sides + [side _x];
			} foreach _units;
			{
				if (side _x in _sides) then {_diaryUnits set [count _diaryUnits,_x];};
			} foreach allunits;
		};
		case 3: {
			_diaryUnits = _diaryUnits + playableunits + switchableunits;
		};
	};

	//--- Check for localization
	if (_subject call bis_fnc_islocalized) then {_subject = localize _subject;};
	if (_title call bis_fnc_islocalized) then {_title = localize _title;};
	if (_description call bis_fnc_islocalized) then {_description = localize _description;};

	//--- Add to units
	{
		if (_subject != "Diary") then {_x creatediarysubject [_subjectID,_subject];};
		_x creatediaryrecord [_subjectID,[_title,_description]];
	} foreach _diaryUnits;
};

true