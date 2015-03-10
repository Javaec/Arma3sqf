#define CONTROL	(_control)

private ["_control","_default","_listHeliports","_class","_displayname","_lbId","_result"];
disableserialization;
_control = _this;
_default = if (typename _control == typename []) then {
	_default = _control select 1;
	_control = _control select 0;
	_default
} else {
	hsim_heliportCurrent
};
_result = 0;
_listHeliports = [] call BIS_fnc_heliportGetHeliports;
{
	_class = _x;
	//_displayname = gettext (configfile >> "CfgBase" >> _class >> "displayName");
	_displayname = gettext (campaignconfigfile >> "Campaign" >> "Missions" >> _class >> "displayName");
	_lbId = CONTROL lbadd _displayname;
	CONTROL lbsetdata [_lbId,_x];
	if (_class == hsim_heliportCurrent) then {CONTROL lbsetcursel _lbId; _result = _lbId};
} foreach _listHeliports;

if (count _listHeliports == 1) then {
	CONTROL ctrlenable false;
};

_result