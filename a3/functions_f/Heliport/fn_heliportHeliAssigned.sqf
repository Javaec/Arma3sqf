private ["_mode","_return"];

_mode = [_this,0,0,[0]] call bis_fnc_param;
_return = [];
scopename "main";

switch _mode do {

	//--- Pilot assigned to helicopter
	case 0: {
		private ["_helicopterPath","_heliport","_helicopter","_listCategories","_category","_config","_type","_listPilots","_pilotPath","_pilotHeli"];
		_helicopterPath = [_this,1,[],[[]]] call bis_fnc_param;
		if (count _helicopterPath == 0) exitwith {};
		_heliport = _helicopterPath select 0;
		_helicopter = _helicopterPath select (count _helicopterPath - 1);
		_listCategories = [hsim_heliportDB,[_heliport,"Staff"]] call BIS_fnc_dbClassList;
		{
			_category = _x;
			_config = [hsim_heliportDB,[_heliport,"Staff",_category,"config"]] call BIS_fnc_dbValueReturn;
			if (!isnil "_config") then {
				_type = getnumber (_config >> "type");
				if (_type == 1) then {
					_listPilots = [hsim_heliportDB,[_heliport,"Staff",_category]] call BIS_fnc_dbClassList;
					{
						_pilotPath = [_heliport,"Staff",_category,_x];
						_pilotHeli = [hsim_heliportDB,_pilotPath + ["helicopter"]] call BIS_fnc_dbValueReturn;
						if (!isnil "_pilotHeli") then {
							if (_pilotHeli == _helicopter) then {
								_return = _pilotPath;
								breakto "main";
							};
						};
					} foreach _listPilots;
				};
			};
		} foreach _listCategories;
		
	};

	//--- Helicopter assigned to pilot
	case 1: {
		private ["_pilot","_heliport","_helicopter","_helicopterPath"];
		_pilot = [_this,1,[],[[]]] call bis_fnc_param;
		if (count _pilot == 0) exitwith {};
		_heliport = _pilot select 0;
		_helicopter = [hsim_heliportDB,_pilot + ["helicopter"]] call BIS_fnc_dbValueReturn;
		if (!isnil "_helicopter") then {
			_helicopterPath = [_heliport,"Helicopters",_helicopter];
			if ([hsim_heliportDB,_helicopterPath] call BIS_fnc_dbClassCheck) then {
				_return = _helicopterPath;
			};
		};
	};
};

_return