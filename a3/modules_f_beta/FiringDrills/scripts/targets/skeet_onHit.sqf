private ["_skeet", "_color"];
_skeet = _this select 0;
_color = _skeet getVariable ["color", ""];
if (_color == "") then {_color = missionNamespace getVariable ["BIS_FD_colorName", ""];};
if (_color == "") then {_color = "orange";};

[position _skeet, velocity _skeet, _color] spawn BIS_fnc_moduleFDSkeetDestruction;

_skeet hideObject true;

true