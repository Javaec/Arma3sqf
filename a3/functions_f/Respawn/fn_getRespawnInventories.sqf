/*
	Author: Karel Moricky

	Description:
	Return respawn inventories available for the given unit

	Parameter(s):
		0: OBJECT, GROUP, SIDE or NAMESPACE
		1 (Optional): BOOL - true to show even inventories disabled by curator

	Returns:
	ARRAY
*/

private ["_target","_ignoreCuratorBlacklist","_varName","_inventories","_default","_objectInventories","_groupInventories","_sideInventories","_globalInventories","_side"];

_target = [_this,0,player,[objnull,grpnull,sideunknown,missionnamespace]] call bis_fnc_param;
_ignoreCuratorBlacklist = [_this,1,false,[false]] call bis_fnc_param;

_varName = "BIS_fnc_getRespawnInventories_list";
_inventories = [];

_default = [-1,[],[]];
_objectInventories = _default;
_groupInventories = _default;
_sideInventories = _default;
_globalInventories = missionnamespace getvariable [_varName,_default];
_side = sideunknown;

switch (typename _target) do {
	case (typename objnull): {
		_side = _target call bis_fnc_objectSide;
		_objectInventories = if (isnull _target) then {_default} else {_target getvariable [_varName,_default]};
		_groupInventories = if (isnull group _target) then {_default} else {(group _target) getvariable [_varName,_default]};
		_sideInventories = missionnamespace getvariable [_varName + str _side,_default];
	};
	case (typename grpnull): {
		_side = _target call bis_fnc_objectSide;
		_groupInventories = if (isnull _target) then {_default} else {(_target) getvariable [_varName,_default]};
		_sideInventories = missionnamespace getvariable [_varName + str _side,_default];
	};
	case (typename sideunknown): {
		_side = _target;
		_sideInventories = missionnamespace getvariable [_varName + str (_side),_default];
	};
	case (typename namespace): {
	};
};

//--- Combine all available inventories
{
	_inventories = _inventories - (_x select 2) + (_x select 2);
} foreach [_objectInventories,_groupInventories,_sideInventories,_globalInventories];

_inventories = _inventories - [""];
_inventories