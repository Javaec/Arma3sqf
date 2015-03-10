private ["_curator","_logic","_curators"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];

_curators = _logic getvariable ["bis_fnc_curatorInterface_curators",[]];
_curator in _curators