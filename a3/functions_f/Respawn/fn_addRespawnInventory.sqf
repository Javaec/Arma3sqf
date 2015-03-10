/*
	Author: Karel Moricky

	Description:
	Add a respawn loadout

	Parameter(s):
		0:
			NAMESPACE
			SIDE
			GROUP
			OBJECT
		1: STRING - CfgRespawnInventory or CfgVehicles class

	Returns:
	ARRAY in format [target,id] (used in BIS_fnc_removeRespawnInventory)
*/

private ["_targetOrig","_target","_inventory","_varName","_inventoryData"];

_targetOrig = [_this,0,missionnamespace,[missionnamespace,sideunknown,grpnull,objnull]] call bis_fnc_param;
_inventory = [_this,1,"",[""]] call bis_fnc_param;
_inventoryID = [_this,2,-1,[0]] call bis_fnc_param;

if (
	!isclass (missionconfigfile >> "cfgrespawninventory" >> _inventory)
	&&
	!isclass (configfile >> "cfgvehicles" >> _inventory)
	&&
	_inventory != ""
) exitwith {["'%1' not found in CfgRespawnInventory or CfgVehicles",_inventory] call bis_fnc_error; [_targetOrig,-1]};

_varName = "BIS_fnc_getRespawnInventories_list";
_target = _targetOrig;

if (typename _target == typename sideunknown) then {
	_varName = _varName + str _target;
	_target = missionnamespace;
};
_inventories = _target getvariable [_varName,[-1,[],[]]];
_inventoryIDs = _inventories select 1;
_inventoryData = _inventories select 2;
if (_inventoryID < 0) then {

	//--- Add
	if !(_inventory in _inventoryData) then {
		_inventoryID = (_inventories select 0) + 1;
		_inventories set [0,_inventoryID];
		_inventoryIDs set [count _inventoryData,_inventoryID];
		_inventoryData set [count _inventoryData,_inventory];
	};
} else {

	//--- Remove
	private ["_inventoryItemID"];
	_inventoryItemID = if (_inventory == "") then {_inventoryIDs find _inventoryID} else {_inventoryData find _inventory};
	if (_inventoryItemID >= 0) then {
		_inventoryIDs set [_inventoryItemID,-1];
		_inventoryData set [_inventoryItemID,-1];
		_inventoryIDs = _inventoryIDs - [-1];
		_inventoryData = _inventoryData - [-1];
		_inventories set [1,_inventoryIDs];
		_inventories set [2,_inventoryData];
	};
};

//--- Commit
switch (typename _target) do {
	case (typename missionnamespace);
	case (typename sideunknown): {
		_target setvariable [_varName,_inventories];
		publicvariable _varName;
	};
	case (typename grpnull);
	case (typename objnull): {
		_target setvariable [_varName,_inventories,true];
	};
};

[_targetOrig,_inventoryID]