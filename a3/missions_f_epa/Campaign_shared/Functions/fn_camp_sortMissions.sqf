/*
	Author: Jiri Wainar

	Description:
	Sorts array of campaign missions to the order they are preffered to be played.

	Parameter(s):
	_this select 0: array - unsorted array of missions from a stage

	Example:
	_sortedMissions:array = _unsortedMissions:array call BIS_fnc_camp_sortMissions;

	Returns:
	Sorted array of missions according to the preference they should be played.
*/

private["_unsorted","_sorted","_stage","_pool","_sequence"];

_unsorted = _this;
_stage 	  = ["stage"] call BIS_fnc_getCfgData;
_stage	  = format["Stage%1",_stage];

_sorted   = [];
_sequence = [];
_pool 	  = ["Timeline",_stage] call BIS_fnc_getCfgDataPool;

private["_missions"];

{
	_missions = _x select 3;

	{
		if !(_x in _sequence) then
		{
			_sequence set [count _sequence,_x];
		};
	}
	forEach _missions;
}
forEach _pool;

_sequence = _sequence - ["A_hub01","A_hub02","B_hub01","B_hub02","B_hub03"];

{
	if (_x in _unsorted) then
	{
		_sorted set [count _sorted, _x];
	};
}
forEach _sequence;

_sorted