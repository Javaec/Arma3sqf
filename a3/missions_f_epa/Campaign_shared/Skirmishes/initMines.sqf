//--------------------------------------------------------------------------------------------------
//
// 	SPAWN MINES ON SPECIFIC HELPERS
//
//--------------------------------------------------------------------------------------------------
private["_helpers","_class","_dir","_pos","_mine"];

_helpers = allMissionObjects "Sign_Arrow_Direction_Pink_F";

{
	if (true) then
	{
		_pos = getPosASL _x;
		_dir = getDir _x;
		_class = _x getVariable ["BIS_mine",""];

		if (_class == "") exitWith {};

		_mine = createMine [_class, _pos, [], 0];

		_mine setPosASL _pos;
		_mine setDir _dir;
	};
}
forEach _helpers;