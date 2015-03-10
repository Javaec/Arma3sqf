_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_units = [_this, 1, [], [[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_company = _logic getvariable ["company","CompanyAlpha"];
	_platoon = _logic getvariable ["platoon","Platoon1"];
	_squad = _logic getvariable ["squad","Squad1"];
	_custom = _logic getvariable ["custom",""];

	_groups = [];
	while {count _units > 0} do {
		_unit = _units select 0;
		_group = group _unit;
		_groups set [count _groups,_group];
		_units = _units - units _group - [_unit];
	};
	_groupID = if (_custom == "") then {
		[gettext (configfile >> "CfgWorlds" >> "groupNameFormat"),_company,_platoon,_squad]
	} else {
		if (islocalized _custom) then {_custom = localize _custom;};
		[_custom]
	};
	{_x setgroupid _groupID;} foreach _groups;
};