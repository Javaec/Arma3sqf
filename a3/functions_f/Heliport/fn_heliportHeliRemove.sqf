_path = "Helicopters";
_item = [_this,0,"",[""]] call bis_fnc_param;

_config = [hsim_heliportDB,[worldname,_path,_item,"config"]] call BIS_fnc_dbValueReturn;
if (!isnil "_config") then {
	
	_heli = missionnamespace getvariable (configname _config);

	//--- Remove from DB
	[hsim_heliportDB,[worldname,_path,_item]] call bis_fnc_dbclassremove;

	//--- Free helispot
	_listHelislots = -1 call bis_fnc_heliportHelislots;
	{ 
		if (_heli in _x) exitwith {
			_x resize 3;
		};
	} foreach _listHelislots;

	//--- Remove from world
	deletevehicle _heli;
	missionnamespace setvariable [configname _config,nil];

	//--- Unassign from pilot
	_pilotAssigned = [
		0,
		[_heliport,MENU_PATH,_item]
	] call bis_fnc_heliportHeliAssigned;
	[hsim_heliportDB,_pilotAssigned + ["helicopter"],""] call bis_fnc_dbvalueset;
};