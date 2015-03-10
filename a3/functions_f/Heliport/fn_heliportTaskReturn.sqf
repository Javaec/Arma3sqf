_heli = if (count _this > 0) then {_this select 0} else {vehicle player/*hsim_heli*/};

//--- Find helipad
_listHelipads = [hsim_heliportDB,[worldname,"Upgrades","Helipads"]] call BIS_fnc_dbClassList;
_helipadName = _listHelipads call bis_fnc_selectrandom;
_helipad = missionnamespace getvariable ("hsim_" + _helipadName);

["RTB",_helipad] call BIS_fnc_missionTasks;

[
	_heli,
	[0,0,0],
	nil,
	_helipad
] call BIS_fnc_wpLand;

["RTB"] call BIS_fnc_missionTasks;