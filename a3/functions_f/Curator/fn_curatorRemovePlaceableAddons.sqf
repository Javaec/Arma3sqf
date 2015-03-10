private ["_curator","_addons","_placeableAddons"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_addons = [_this,1,[],[[]]] call bis_fnc_param;

_placeableAddons = _curator getvariable ["bis_fnc_curatorSystem_placeableAddons",[]];
{
	_unitID = _placeableAddons find _x;
	if (_unitID >= 0) then {_placeableAddons set [_unitID,-1];}
} foreach _addons;
_placeableAddons = _placeableAddons - [-1];
_curator setvariable ["bis_fnc_curatorSystem_placeableAddons",_placeableAddons,true];
_placeableAddons