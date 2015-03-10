private ["_curator","_logic","_curators"];

_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];

_curators = _logic getvariable ["bis_fnc_curatorInterface_curators",[]];
if !(_curator in _curators) then {_curators set [count _curators,_curator];};
_logic setvariable ["bis_fnc_curatorInterface_curators",_curators,true];

true