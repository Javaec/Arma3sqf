scriptName "initMissionFast.sqf";

private["_objects","_vehicles","_units","_group"];

_units	  = allMissionObjects "man";
_vehicles = (allMissionObjects "Car") + (allMissionObjects "Air") + (allMissionObjects "Tank");
_objects  = (allMissionObjects "All") - _units - _vehicles;

{
	_x lock true;
	clearWeaponCargo _x; clearMagazineCargo _x; clearItemCargo _x;

	_x setVariable ["BIS_enableRandomization",false];
}
forEach _vehicles;