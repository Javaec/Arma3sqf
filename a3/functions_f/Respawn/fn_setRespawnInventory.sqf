/*
	Author: Karel Moricky

	Description:
	Set respawn loadouts

	Parameter(s):
		0:
			NAMESPACE
			SIDE
			GROUP
			OBJECT
		1: ARRAY of STRINGs - CfgInventory or CfgVehicles classes

	Returns:
	ARRAY in format [target,ids] (used in BIS_fnc_removeRespawnInventory)
*/
private ["_targetOrig","_inventoryDataOrig","_varName","_target","_inventories","_inventoryID","_inventoryIDs","_inventryData"];

_targetOrig = [_this,0,missionnamespace,[missionnamespace,sideunknown,grpnull,objnull]] call bis_fnc_param;
_inventoryDataOrig = [_this,1,[],[[]]] call bis_fnc_param;

_varName = "BIS_fnc_getRespawnInventories_list";
_target = _targetOrig;
if (typename _target == typename sideunknown) then {
	_varName = _varName + str _target;
	_target = missionnamespace;
};
_inventories = _target getvariable [_varName,[-1,[],[]]];
_inventoryID = _inventories select 0;

_inventoryIDs = [];
_inventryData = [];
{
	_x = [_x,0,"",[""]] call bis_fnc_paramin;
	if (_x != "") then {
		_inventoryID = _inventoryID + 1;
		_inventoryIDs set [count _inventoryIDs,_inventoryID];
		_inventryData set [count _inventryData,_x];
	};
} foreach _inventoryDataOrig;
_inventories = [_inventoryID,_inventoryIDs,_inventryData];

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

[_targetOrig,_inventoryIDs]