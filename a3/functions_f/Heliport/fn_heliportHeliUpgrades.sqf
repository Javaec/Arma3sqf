private ["_heli","_resultIsConfig","_listResult","_cfgHeli","_category","_cfgCategory","_config"];

_heli =	[_this,0,"",[""]] call bis_fnc_param;
_resultIsConfig = [_this,1,false,[false]] call bis_fnc_param;
_listResult = [];

_cfgHeli = [hsim_heliportDB,[hsim_heliportCurrent,"Helicopters",_heli]] call BIS_fnc_dbClassList;
if (!isnil "_cfgHeli") then {
	{
		_category = _x;
		_cfgCategory = [hsim_heliportDB,[hsim_heliportCurrent,"Helicopters",_heli,_category]] call BIS_fnc_dbClassList;
		if (_resultIsConfig) then {

			//--- Add configs
			{
				_config = [hsim_heliportDB,[hsim_heliportCurrent,"Helicopters",_heli,_category,_x,"config"]] call BIS_fnc_dbValueReturn;
				if !(isnil "_config") then {
					_listResult set [count _listResult,_config];
				};
			} foreach _cfgCategory;
		} else {

			//--- Add class names
			_listResult = _listResult + _cfgCategory;
		};
		
	} foreach _cfgHeli;
};

_listResult