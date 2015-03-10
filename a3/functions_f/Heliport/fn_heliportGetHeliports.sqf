private ["_listHeliports","_cfgMissions","_item","_itemName","_isHeliport","_configName","_dbAdd"];

_listHeliports = [];

if (isclass (campaignconfigfile >> "campaign")) then {

	//--- Campaign mode
	_cfgMissions = campaignconfigfile >> "campaign" >> "missions";
	for "_i" from 0 to (count _cfgMissions -1) do {
		_item = _cfgMissions select _i;
		if (isclass _item) then {
			_itemName = configname _item;

			//--- CfgMissions entry exists
			_isHeliport = getnumber (_item >> "heliport");
			if (_isHeliport == 1) then {
				_show = [_item,"show",true] call bis_fnc_heliportCondition;

				if (!(_itemName in _listHeliports) && call compile _show) then {
					_listHeliports = _listHeliports + [_itemName];
					_dbAdd = [hsim_heliportDB,[_itemName]] call BIS_fnc_dbClassSet;
				};
			};
		};
	};
} else {

	//--- Debug mode
	_cfgBase = configfile >> "cfgBase";

	for "_i" from 0 to (count _cfgBase - 1) do {
		_item = _cfgBase select _i;
		if (isclass _item) then {
			_itemName = configname _item;
			if !(_itemName in _listHeliports) then {
				_listHeliports = _listHeliports + [_itemName];
				_dbAdd = [hsim_heliportDB,[_itemName]] call BIS_fnc_dbClassSet;
			};
		};
	};
 };
_listHeliports