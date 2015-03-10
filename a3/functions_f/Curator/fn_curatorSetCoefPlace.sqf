private ["_curator","_input","_coef","_enable"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_input = [_this,1,[],[0,[]]] call bis_fnc_param;

_coef = [_input,0,-1,[0]] call bis_fnc_paramin;
_enable = [_input,1,true,[true]] call bis_fnc_paramin;

_curator setvariable ["bis_fnc_curatorSystem_coefPlace",[_coef,_enable],true];
[_coef,_enable]