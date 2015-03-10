private ["_pole"];
_pole = (_this select 0) select 0;

if ("skeet" in ((_this select 0) select 5)) then 
{
	[_pole modelToWorld (_pole selectionPosition "skeet"), [0, 0, 0], _pole getVariable ["color", "orange"]] spawn BIS_fnc_moduleFDSkeetDestruction;

	_pole animate ["Skeet_Hide", 1];
};

true