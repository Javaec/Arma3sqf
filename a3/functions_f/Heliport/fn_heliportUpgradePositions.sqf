private ["_listUpgradePositions","_cfgUpgrades","_categoryName","_category","_itemName","_item","_position"];
_listUpgradePositions = [];
_cfgUpgrades = [hsim_heliportDB,[_this,"Upgrades"]] call BIS_fnc_dbClassReturn;

for "_u" from 0 to (count _cfgUpgrades - 1) step 2 do {
	_categoryName = _cfgUpgrades select _u;
	if (_categoryName call BIS_fnc_dbIsClass) then {
		_category = [hsim_heliportDB,[worldname,"Upgrades",_categoryName]] call BIS_fnc_dbClassReturn;
		for "_i" from 0 to (count _category - 1) step 2 do {
			_itemName = _category select _i;
			if (_itemName call BIS_fnc_dbIsClass) then {
				_position = [hsim_heliportDB,[_this,"Upgrades",_categoryName,_itemName,"position"]] call BIS_fnc_dbValueReturn;
				_listUpgradePositions = _listUpgradePositions + [_position];
			};
		};
	};
};
_listUpgradePositions