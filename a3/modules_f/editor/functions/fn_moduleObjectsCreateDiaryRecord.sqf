private ["_logic","_units","_subject","_subject","_subjectID","_title","_description"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;

//--- Extract module params
_subject = _logic getvariable ["Subject",""];
_subjectID = if (_subject == "") then {"Diary"} else {_subject};
_title = _logic getvariable ["PresetTitle",""];
if (_title == "") then {_title = _logic getvariable ["Title",""];};
_description = _logic getvariable ["Description",""];

//--- Check for localization
if (_subject call bis_fnc_islocalized) then {_subject = localize _subject;};
if (_title call bis_fnc_islocalized) then {_title = localize _title;};
if (_description call bis_fnc_islocalized) then {_description = localize _description;};

//--- Add to units
{
	if (_subject != "Diary") then {_x creatediarysubject [_subjectID,_subject];};
	_x creatediaryrecord [_subjectID,[_title,_description]];
} foreach _units;

true