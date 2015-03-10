private ["_pole", "_color"];
_pole = _this select 0;
_color = _pole getVariable ["color", ""];
if (_color == "") then {_color = missionNamespace getVariable ["BIS_FD_colorName", ""];};
if (_color == "") then {_color = "orange";};

[_pole modelToWorld (_pole selectionPosition "skeet"), [0, 0, 0], _color] spawn BIS_fnc_moduleFDSkeetDestruction;

_pole animate ["Skeet_Hide", 1];

true