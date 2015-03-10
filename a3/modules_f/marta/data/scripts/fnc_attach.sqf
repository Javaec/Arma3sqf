scriptName "Marta\data\scripts\fnc_attach.sqf";
private ["_mode","_logic","_markers","_markerCenter","_markerAttach","_markerDetach","_id"];

_mode = _this select 0;

switch (_mode) do {
	case "ATTACH": {
		_logic = BIS_Marta_mainscope;
		_markers = _logic getvariable "MARTA_ATTACHEDMARKERS";
		_markerCenter = _this select 1;
		_markerAttach = _this select 2;

		if !(_markerCenter in _markers) then {
			_markers = _markers + [_markerCenter,[_markerAttach]];
		} else {
			_id = 1 + (_markers find _markerCenter);
			_array = _markers select _id;
			if !(_markerAttach in _array) then {_markers set [_id,_array + [_markerAttach]]};
		};
		_logic setvariable ["MARTA_ATTACHEDMARKERS",_markers];
	};

	case "DETACH": {
		_logic = BIS_Marta_mainscope;
		_markers = _logic getvariable "MARTA_ATTACHEDMARKERS";
		_markerCenter = _this select 1;
		_markerDetach = _this select 2;

		if (_markerCenter in _markers) then {
			_id = 1 + (_markers find _markerCenter);
			_array = _markers select _id;
			_array = _array - [_markerDetach];
			if (count _array > 0) then {
				_markers set [_id,_array];
			} else {
				_markers set [_id,"<DELETE>"];
				_markers set [_id-1,"<DELETE>"];
				_markers = _markers - ["<DELETE>"];
			};
		};
		_logic setvariable ["MARTA_ATTACHEDMARKERS",_markers];
	};

	default {};
};

true;