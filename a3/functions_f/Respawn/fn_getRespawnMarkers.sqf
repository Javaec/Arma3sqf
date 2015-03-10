/*
	Author: Karel Moricky

	Description:
	Return all respawn markers

	Parameter(s):
		0: SIDE - side to which markers belongs to
		1: BOOL - true to return vehicle respawn markers

	Returns:
	ARRAY
*/

private ["_side","_sideID"];
_side = [_this,0,player call bis_fnc_objectside,[sideunknown]] call bis_fnc_param;
_sideID = _side call bis_fnc_sideID;

if (_sideID >= 0 && _sideID < 4) then {
	private ["_isVehicleRespawn","_sideMarker","_sideMarkerArray","_sideMarkerArrayCount","_xArray","_xRespawn","_respawns"];
	_isVehicleRespawn = [_this,1,false,[false]] call bis_fnc_param;
	_sideMarker = ["east","west","guerrila","civilian"] select _sideID;
	_sideMarker = if (_isVehicleRespawn) then {"respawn_vehicle_" + _sideMarker} else {"respawn_" + _sideMarker};
	_sideMarkerArray = toarray _sideMarker;
	_sideMarkerArrayCount = count _sideMarkerArray;
	_respawns = [];
	{
		_xArray = toarray _x;
		_xArray resize _sideMarkerArrayCount;
		_xRespawn = tostring _xArray;
		if (_xRespawn == _sideMarker) then {
			_respawns set [count _respawns,_x];
		};
	} foreach allmapmarkers;
	_respawns
} else {
	["Base respawn for %1 is not supported",_side] call bis_fnc_error;
	[]
};