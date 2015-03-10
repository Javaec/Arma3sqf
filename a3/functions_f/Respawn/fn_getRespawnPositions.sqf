/*
	Author: Karel Moricky

	Description:
	Return scripted respawn positions available for the given unit

	Parameter(s):
		0: OBJECT, GROUP, SIDE or NAMESPACE
		1 (Optional): BOOL - false to return positions, true to their names (default: false)

	Returns:
	ARRAY
*/

private ["_target","_returnNames","_varName","_positions","_default","_objectPositions","_groupPositions","_sidePositions","_globalPositions"];

_target = [_this,0,player,[objnull,grpnull,sideunknown,missionnamespace]] call bis_fnc_param;
_returnNames = [_this,1,false,[false]] call bis_fnc_param;

_varName = "BIS_fnc_getRespawnPositions_list";
_positions = [];

_default = [-1,[],[],[]];
_objectPositions = _default;
_groupPositions = _default;
_sidePositions = _default;
_globalPositions = missionnamespace getvariable [_varName,_default];

switch (typename _target) do {
	case (typename objnull): {
		_objectPositions = if (isnull _target) then {_default} else {_target getvariable [_varName,_default]};
		_groupPositions = if (isnull group _target) then {_default} else {(group _target) getvariable [_varName,_default]};
		_sidePositions = missionnamespace getvariable [_varName + str (_target call bis_fnc_objectSide),_default];
	};
	case (typename grpnull): {
		_groupPositions = if (isnull _target) then {_default} else {(_target) getvariable [_varName,_default]};
		_sidePositions = missionnamespace getvariable [_varName + str (_target call bis_fnc_objectSide),_default];
	};
	case (typename sideunknown): {
		_sidePositions = missionnamespace getvariable [_varName + str (_target),_default];
	};
	case (typename namespace): {
	};
};

if (_returnNames) then {
	{
		{
			_positions pushback (_x call bis_fnc_localize);
		} foreach (_x select 3);
	} foreach [_objectPositions,_groupPositions,_sidePositions,_globalPositions];
} else {
	{
		{
			private ["_pos"];
			_positions = _positions - [_x];
			_pos = if (typename _x == typename "") then {
				private ["_xObj"];
				_xObj = missionnamespace getvariable _x;

				//--- Check if the string points to an object or marker
				if !(isnil {_xObj}) then {
					private ["_sideObj","_sidePlayer"];
					_sideObj = side group _xObj;
					_sidePlayer = if (_target in [player]) then {side group player} else {_sideObj};
					if (alive _xObj && simulationenabled _xObj && canmove _xObj && (_sideObj == sideunknown || {[_sideObj,_sidePlayer] call bis_fnc_areFriendly})) then {
						//--- If the object is alive, use it instead
						_xObj;
					};
				} else {
					if (markertype _x != "") then {_x};
				};
			} else {
				_x;
			};
			if !(isnil "_pos") then {
				_positions pushback _pos;
			};
		} foreach (_x select 2);
	} foreach [_objectPositions,_groupPositions,_sidePositions,_globalPositions];
	_positions = _positions - [""];
};
_positions