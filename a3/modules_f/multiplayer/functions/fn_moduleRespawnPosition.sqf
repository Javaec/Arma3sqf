_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Add
	_name = _logic getvariable ["Name",""];
	_name = _name call bis_fnc_localize;
	_typeID = (_logic getvariable ["Type","0"]) call bis_fnc_parsenumber;
	_sideID = (_logic getvariable ["Side","-1"]) call bis_fnc_parsenumber;

	//--- Detect the leading side
	if (_sideID < 0) then {
		if (ismultiplayer) then {
			_maxScore = -1;
			{
				_score = scoreside _x;
				if (_score > _maxScore) then {
					_maxScore = _score;
					_sideID = _x call bis_fnc_sideID;
				} else {
					if (_score == _maxScore) then {
						_sideID = -1;
					};
				};
			} foreach [opfor,blufor,independent,civilian];
		} else {
			_sideID = (player call bis_fnc_objectSide) call bis_fnc_sideID;
		};
	};

	if (_sideID >= 0) then {
		_side = _sideID call bis_fnc_sideType;
		_pos = position _logic;
		_markerPrefix = "respawn_";
		_markerType = ["respawn_inf","respawn_unknown","respawn_motor","respawn_armor","respawn_air","respawn_plane","respawn_naval"] select _typeID;
		_respawnPositions = [];

		if (_typeID > 0) then {
			_markerPrefix = "respawn_vehicle_";
		} else {
			{
				if (_x iskindof "AllVehicles") then {
					_respawn = [_side,_x] call bis_fnc_addRespawnPosition;
					_respawnPositions set [count _respawnPositions,_respawn];
				};
			} foreach (synchronizedobjects _logic);
		};

		if (count _respawnPositions == 0) then {

			//--- Respawn on position (marker)
			_markerSide = ["east","west","guerrila","civilian"] select _sideID;
			_markerPrefix = _markerPrefix + _markerSide;

			_respawn = createmarker [_markerPrefix + str _logic,_pos];
			_respawn setmarkerdir ((round direction _logic) * 360);
			_respawn setmarkersize [1,1];
			_respawn setmarkercolor ([_side,true] call bis_fnc_sidecolor);
			_respawn setmarkertype _markerType;
			_respawn setmarkertext _name;
			_respawnPositions set [count _respawnPositions,_respawn];
		};
		_logic setvariable ["respawn",_respawnPositions];

		_type = gettext (configfile >> "cfgmarkers" >> _markerType >> "name");
		if (_name == "") then {_name = format [localize "str_a3_bis_fnc_respawnmenuposition_grid",mapgridposition _pos];};
		[["RespawnAdded",[_type,_name,_markerType call bis_fnc_textureMarker]],"BIS_fnc_showNotification",_side] call bis_fnc_mp;
	} else {
		["Respawn %1 not added, all sides have the same score.",_logic] call bis_fnc_logFormat;
	};
} else {

	//--- Remove
	_respawn = _logic getvariable ["respawn",[]];
	[_respawn,0,[],[[],""]] call bis_fnc_paramin;
	if (typename _respawn == typename []) then {
		if (count _respawn == 2) then {
			_respawn call bis_fnc_removeRespawnPosition;
		};
	} else {
		deletemarker _respawn;
	};
};