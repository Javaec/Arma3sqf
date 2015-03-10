private ["_curator","_addons","_placeableAddons","_addon","_cfgPatch"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_addons = [_this,1,[],[[]]] call bis_fnc_param;

_placeableAddons = _curator getvariable ["bis_fnc_curatorSystem_placeableAddons",[]];
{
	_addon = _x;
	if !(_addon in _placeableAddons) then {
		_cfgPatch = configfile >> "cfgpatches" >> _addon;
		if (isclass _cfgPatch) then {
			_placeableAddons set [count _placeableAddons,_addon];
		} else {
			["Class %1 not found in CfgPatches",_addon] call bis_fnc_error;
		};
	};
} foreach _addons;
_curator setvariable ["bis_fnc_curatorSystem_placeableAddons",_placeableAddons,true];

_placeableAddons