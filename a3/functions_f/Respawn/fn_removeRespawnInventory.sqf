/*
	Author: Karel Moricky

	Description:
	Remove a respawn inventory

	Parameter(s):
		0:
			NAMESPACE
			SIDE
			GROUP
			OBJECT
		1: NUMBER - id or class from CfgInventories of CfgVehicles
	(both parameters were returned by BIS_fnc_addRespawnInventory)

	Returns:
	BOOL
*/

private ["_target","_inventory","_inventoryID"];

_target = [_this,0,missionnamespace,[missionnamespace,sideunknown,grpnull,objnull]] call bis_fnc_param;
_inventoryID = [_this,1,-1,[0,""]] call bis_fnc_param;
_inventory = "";
if (typename _inventoryID == typename "") then {
	_inventory = _inventoryID;
	_inventoryID = 0;
};
[_target,_inventory,_inventoryID] call bis_fnc_addRespawnInventory;

true