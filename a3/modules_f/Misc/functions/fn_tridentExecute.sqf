/*
	Author: Karel Moricky

	Description:
	Execute a code based on Trident relationship.
		
	Parameter(s):
		0: SIDE
		1: SIDE
		2: CODE - code executed when the sides are friendly
		3: CODE - code executed when the sides are enemies

	Arguments passed to the code are:
		0: SIDE - side with higher score (when the score is even, side from param 0 is used)
		1: SIDE - side with lower score (when the score is even, side from param 1 is used)
		2: BOOL - true when the sides are allied

	Returns:
	BOOL - true when the sides are allied
*/

private ["_sideA","_sideB"];

_sideA = [_this,0,sideUnknown,[sideUnknown]] call bis_fnc_param;
_sideB = [_this,1,sideUnknown,[sideUnknown]] call bis_fnc_param;
_codeAllies = [_this,2,{},[{},""]] call bis_fnc_param;
_codeEnemies = [_this,3,_codeAllies,[{},""]] call bis_fnc_param;

if (typename _codeAllies == typename "") then {_codeAllies = compile preprocessfilelinenumbers _codeAllies;};
if (typename _codeEnemies == typename "") then {_codeEnemies = compile preprocessfilelinenumbers _codeEnemies;};

if ([_sideA,_sideB] call bis_fnc_areFriendly) then {
	[_sideA,_sideB,true] call _codeAllies;
	true
} else {
	_sideAscore = scoreside _sideA;
	_sideBscore = scoreside _sideB;

	switch (true) do {
		case (_sideAscore > _sideBscore): {
			[_sideA,_sideB,false] call _codeEnemies;
		};
		case (_sideAscore < _sideBscore): {
			[_sideB,_sideB,false] call _codeEnemies;
		};	
		default {
			//--- Tie - execute the code for allies
			[_sideA,_sideB,true] call _codeAllies;
		};
	};
	false
};