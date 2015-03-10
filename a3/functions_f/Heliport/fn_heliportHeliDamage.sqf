private ["_isStart","_heli","_heliObject","_heliHitPoints","_heliClass","_cfgHitpoints","_hitPoint","_hitPointName","_damage","_dbAdd"];

_isStart = [_this,0,false,[false]] call bis_fnc_param;
if (_isStart) then {

	_heli = [_this,1,"",[""]] call bis_fnc_param;
	_heliObject = missionnamespace getvariable [_heli,objnull];

	if (!isnull _heliObject) then {
		_cfgHitpoints = [hsim_heliportDB,[worldname,"Helicopters",_heli,"HitPoints"]] call bis_fnc_dbValueList;
		{
			_damage = [hsim_heliportDB,[worldname,"Helicopters",_heli,"HitPoints",_x],0] call bis_fnc_dbValueReturn;
			_heliObject sethitpointdamage [_x,_damage];
		} foreach _cfgHitpoints;
	};
} else {

	//--- Mission end - store all hitpoints
	_listHelis = [hsim_heliportDB,[worldname,"Helicopters"]] call bis_fnc_dbClassList;
	{
		_heli = _x;
		_heliObject = missionnamespace getvariable [_heli,objnull];
		_heliHitpoints = [];
		if (!isnull _heliObject) then {
	
			_parents = [configfile >> "cfgvehicles" >> typeof _heliObject] call bis_fnc_returnparents;
			{
				_heliClass = _x;
				_cfgHitPoints = _heliClass >> "hitpoints";
				for "_h" from 0 to (count _cfgHitpoints - 1) do {
					_hitPoint = _cfgHitpoints select _h;
					if (isclass _hitPoint) then {
						_hitPointName = configname _hitPoint;
						if !(_hitPointName in _heliHitpoints) then {
							_heliHitpoints set [count _heliHitpoints,_hitPointName];
							_damage = _heliObject gethitpointdamage _hitPointName;
							if (!isnil "_damage") then {
								_dbAdd = [hsim_heliportDB,[worldname,"Helicopters",_heli,"HitPoints",_hitPointName],_damage] call bis_fnc_dbValueSet;
							};
						};
					};
				};
			} foreach _parents;
		};
	} foreach _listHelis;
};