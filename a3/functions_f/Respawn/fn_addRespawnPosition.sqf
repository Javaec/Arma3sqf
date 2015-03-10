/*
	Author: Karel Moricky

	Description:
	Add a respawn point.
	It's recommended to call the function on server only.
	When called on client during briefing, the position will broadcasted correctly.

	Parameter(s):
		0:
			NAMESPACE
			SIDE
			GROUP
			OBJECT
		1:
			STRING - marker
			GROUP - group leader
			OBJECT - object in which or around which players will be respawned
			ARRAY - precise position
		2 (Optional): STRING - respawn name, can be text or link to localization key

	Returns:
	ARRAY in format [target,id] (used in BIS_fnc_removeRespawnPosition)
*/

private ["_targetOrig","_target","_position","_name","_positionID","_varName","_positions","_positionIDs","_positionData","_positionNames"];

_targetOrig = [_this,0,missionnamespace,[missionnamespace,sideunknown,grpnull,objnull]] call bis_fnc_param;
_position = [_this,1,"",["",grpnull,objnull,[]]] call bis_fnc_param;
_name = [_this,2,"",[""]] call bis_fnc_param;
_positionID = [_this,3,-1,[0]] call bis_fnc_param;

if (!isserver && time == 0) then {["Warning! Calling the function on client at the mission start will result in data not being broadcasted correctly!"] call bis_fnc_error;};

_varName = "BIS_fnc_getRespawnPositions_list";
_target = _targetOrig;
if (typename _position == typename objnull) then {_position = _position call bis_fnc_objectVar;};

if (typename _target == typename sideunknown) then {
	_varName = _varName + str _target;
	_target = missionnamespace;
};
_positions = _target getvariable [_varName,[-1,[],[],[]]];
_positionIDs = _positions select 1;
_positionData = _positions select 2;
_positionNames = _positions select 3;
if (_positionID < 0) then {

	//--- Add
	if !(_position in _positionData) then {
		_positionID = (_positions select 0) + 1;
		_positions set [0,_positionID];
		_positionIDs pushback _positionID;
		_positionData pushback _position;
		_positionNames pushback _name;
	};
} else {

	//--- Remove
	private ["_positionItemID"];
	_positionItemID = if (_position == "") then {_positionIDs find _positionID} else {_positionData find _position};
	if (_positionItemID >= 0) then {
		_positionIDs set [_positionItemID,-1];
		_positionData set [_positionItemID,-1];
		_positionNames set [_positionItemID,-1];
		_positionIDs = _positionIDs - [-1];
		_positionData = _positionData - [-1];
		_positionNames = _positionNames - [-1];
		_positions set [1,_positionIDs];
		_positions set [2,_positionData];
		_positions set [3,_positionNames];
	};
};

//--- Commit
switch (typename _target) do {
	case (typename missionnamespace);
	case (typename sideunknown): {
		_target setvariable [_varName,_positions];
		publicvariable _varName;
	};
	case (typename grpnull);
	case (typename objnull): {
		_target setvariable [_varName,_positions,true];
	};
};

[_targetOrig,_positionID]