/*
	Author: Karel Moricky

	Description:
	Initialize default postprocess effects

	Parameter(s):
	_this select 0:	STRING - world name (default: current world)
	_this select 1:	STRING or BOOL - post-process type or true for all of them (default: true)

	Returns:
	ARRAY - list of initialized effects with values
*/
private ["_worldname","_ppTypeDef","_cfgPP","_cfgType","_typename","_ppType","_pp","_condition","_adjust","_result"];

_worldname = [_this,0,worldname,[""]] call bis_fnc_param;
_ppTypeDef = [_this,1,true,["",true]] call bis_fnc_param;
_result = [];

_cfgPP = configfile >> "cfgWorlds" >> _worldname >> "PostProcess";
for "_t" from 0 to (count _cfgPP - 1) do {
	_cfgType = _cfgPP select _t;
	if (isclass _cfgType) then {
		_typeName = configname _cfgType;
		_ppType = if (typename _ppTypeDef == typename true) then {_typeName} else {_ppTypeDef};
		//--- Film grain disabled. ToDo: Add in patch
		if (_typeName == _ppType && _ppType != "filmGrain") then {

			for "_i" from 0 to (count _cfgType - 1) do {
				_pp = _cfgType select _i;
				if (isclass _pp) then {
					_condition = gettext (_pp >> "condition");
					if (call compile _condition) then {
						_adjust = [_pp,"adjust"] call bis_fnc_returnConfigEntry;
						switch (typename _adjust) do {
							case (typename ""): {
								_adjust = call compile _adjust;
								
							};
							case (typename 0): {
								_adjust = [_adjust];
							};
						};
						_ppType ppEffectAdjust _adjust;
						_ppType ppEffectCommit 0;
						_ppType ppEffectEnable true;
						_result set [count _result,[_ppType,_adjust]];
					};
				};
			};
		
		};
	};
};
_result