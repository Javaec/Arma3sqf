scriptName "Marta\data\scripts\system_artyradar.sqf";
/*
	File: system_artyradar.sqf
	Author: Karel Moricky

	Description:
	Artillery radar system using MARTA system

	Parameter(s):
	_this select 0: String - Mode

		* INIT - Inicialize subsystem
			o _this select 1: Object - Radar dome
			o _this select 2: Array or Side or String - Faction(s) or Side(s) of radar
			o _this select 3: Number - Maximal size of circle which displays assumed location of artillery.
			o _this select 4: Number - Minimal size of circle (maximal precision).
			o _this select 5: Code - Code executed every scan (1 second period)
			o _this select 6: Code - Code executed after new artillery was detected.

		* FIRED - Code executed after aftillery shot
			o _this select 1: Array - FIRED event handler output array
*/

_logic = BIS_marta_mainscope;

switch (_this select 0) do {

	//-----------------------------------------------------------------------------------------------	
	//--- INIT --------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "INIT": {
		_radar = _this select 1;
		_sides = _this select 2;
		if (typename _sides == "SIDE") then {_sides = [_sides]};
		_maxRange = if (count _this > 3) then {_this select 3} else {300};
		_minRange = if (count _this > 4) then {_this select 4} else {30};
		_code = if (count _this > 5) then {_this select 5} else {{}};
		_detectcode = if (count _this > 6) then {_this select 6} else {{}};
		_artys = [];

		_logic setvariable ["artycenters",[],true];

		if !(isnil {_radar getvariable "radar"}) exitwith {};
		_radar setvariable ["radar",1];
		_usedIDs = [];

		//--- Main loop
		while {alive _radar} do {

			//--- Execute custom code
			_item call _code;

			//--- Detect artillery batteries
			{
				_unit = vehicle _x;
				if ({_unit iskindof _x} count ["StaticCannon","StaticMortar"] > 0 && !(_unit in _artys)) then {
					_unit addeventhandler ["FIRED",{["FIRED",_this] execvm BIS_marta_sys_artyradar}];
					_artys = _artys + [_unit];
				};
			} foreach allunits;

			_centers = _logic getvariable "artycenters";
			if (count _centers > 0) then {
				//--- Update marker params
				for "_i" from 0 to (count _centers - 1) do {
					_item = _centers select _i;
					_id = _item select 0;
					_pos = _item select 1;
					_grp = _item select 2;
					_side = side _grp;
					_precision = _item select 3;
					_time = _item select 4;
					_timeLimit = 10;

					//--- Was artillery already revealed?
					_revealed = markeralpha (["MARKER",_grp] call BIS_Marta_getParams);


					if (!(_side in _sides) && _revealed == 0) then {

						_disRadar = 1 - 1000 / (_pos distance _radar);

						//--- New artillery battery detected
						if !(_id in _usedIDs) then {
							_usedIDs = _usedIDs + [_id];

							_posX = _pos select 0;
							_posY = _pos select 1;
							_dir = _posX % 360;
							_dis = _posY % _maxRange;
							_offsetX = cos _dir * _dis * _disRadar;
							_offsetY = sin _dir * _dis * _disRadar;
							_pos = [_posX + _offsetX,_posY + _offsetY];

							_typeCanon = {vehicle _x iskindof "staticcanon"} count units _grp;
							_typeMortar = {vehicle _x iskindof "staticmorat"} count units _grp;
							_type = "x_art";
							if (_typeMortar > _typeCanon) then {_type = "x_mortar"};

							_markerD = createmarkerlocal [format ["BIS_marta_sys_artyradar_dot_%1",_id],_pos];
							_markerD setmarkercolorlocal "colorred";
							_markerD setmarkertypelocal _type;
							_markerD setmarkerdirlocal 45;
							_markerB = createmarkerlocal [format ["BIS_marta_sys_artyradar_zone_%1",_id],_pos];
							_markerB setmarkercolorlocal "colorred";
							_markerB setmarkershapelocal "ellipse";
							_markerB setmarkerbrushlocal "border";

							//["SIZE",_markerB,[_maxRange * _disRadar,_maxRange * _disRadar]] spawn BIS_marta_effect;
							["FADE IN",_markerD] spawn BIS_marta_effect;
							["FADE IN",_markerB] spawn BIS_marta_effect;
							["POS",_markerD,[_posX + _offsetX,_posY + _offsetY]] spawn BIS_marta_effect;
							["POS",_markerB,[_posX + _offsetX,_posY + _offsetY]] spawn BIS_marta_effect;

							//--- Execute custom detect code
							_item call _detectcode;
						};

						//--- Calculate size
						_markerD = format ["BIS_marta_sys_artyradar_dot_%1",_id];
						_markerB = format ["BIS_marta_sys_artyradar_zone_%1",_id];
						_range = (_maxRange - _minRange);
						_sizeP = if (_precision > _range) then {_maxRange - _minRange} else {_precision};
						_item set [3,_sizeP];
						_size = (_maxRange - _precision) * _disRadar;
						if (_size < _minRange) then {_size = _minRange};
						if (_size > _maxRange) then {_size = _maxRange};

						//--- Anything changed?
						if ((_radar getvariable "radar") != 1) then {_time = _timelimit + 1};
						_msize = (markersize _markerB select 0);

						if ((_size != _msize || _precision > _range) && _time != -1) then {

							//--- Calculate position
							_posX = _pos select 0;
							_posY = _pos select 1;
							_dir = _posX % 360;
							_dis = _posY % _size;
							_offsetX = cos _dir * _dis * _disRadar;
							_offsetY = sin _dir * _dis * _disRadar;
							["POS",_markerD,[_posX + _offsetX,_posY + _offsetY]] spawn BIS_marta_effect;
							["POS",_markerB,[_posX + _offsetX,_posY + _offsetY]] spawn BIS_marta_effect;
							["SIZE",_markerB,[_size,_size]] spawn BIS_marta_effect;
							_markerD setmarkeralphalocal 1;
							_markerB setmarkeralphalocal 1;

							//--- Reset counter
							_time = 0;
							_item set [4,_time];
							_fadelist = _logic getvariable "effect_fade";
							if (_markerB in _fadelist) then {
								_logic setvariable ["effect_fade",_fadelist - [_markerD,_markerB]];
							};
						} else {
							if (_time > _timelimit) then {

								//--- Fade out
								_duration = _logic getvariable "duration";
								if (markeralpha _markerB == 1) then {
									{_x setmarkeralphalocal 0.5} foreach [_markerD,_markerB];
									["FADE OUT",_markerD,_duration] spawn BIS_marta_effect;
									["FADE OUT",_markerB,_duration] spawn BIS_marta_effect;
								};

								//--- Artillery center expired
								if (markeralpha _markerB == 0) then {
									_usedIDs = _usedIDs - [_id];
									_centers set [_i,"X"];
									deletemarker _markerD;
									deletemarker _markerB;
								};
							} else {
								//--- Rise counter
								_time = _time + 1;
								_item set [4,_time];
							};
						};
					} else {
						//--- Artillery battery spotted - now we have exact position
						if (_revealed != 0) then {
							_usedIDs = _usedIDs - [_id];
							_centers set [_i,"X"];
							_markerD = format ["BIS_marta_sys_artyradar_dot_%1",_id];
							_markerB = format ["BIS_marta_sys_artyradar_zone_%1",_id];
							deletemarker _markerD;
							deletemarker _markerB;
						};
					};
				};
				_centers = _centers - ["X"];
				_logic setvariable ["artycenters",_centers];
			};
			sleep 1;
		};
	};


	//-----------------------------------------------------------------------------------------------	
	//--- FIRED -------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "FIRED": {
		_array = _this select 1;
		_gun = _array select 0;
		_pos = position _gun;
		_logic = BIS_marta_mainscope;
		_centers = _logic getvariable "artycenters";
		_center = [0,[0,0,0]];
		_limit = 600;
		_limitupdate = 100;
		_step = 10;
		_n = 0;

		//--- Find near fire center
		for "_i" from 0 to (count _centers - 1) do {
			_element = _centers select _i;
			_cpos = _element select 1;
			_dis = _pos distance _cpos;
			if (_dis < _limit && (_dis < (_center select 1) distance _cpos)) then {
				_center = _element;
				_n = _i;
			};
		};		

		//--- No near center found - create new one
		if ((_center select 1) distance [0,0,0] < 1) then {
			_id = if (count _centers == 0) then {0} else {((_centers select (count _centers - 1)) select 0) + 1};
			_centers = _centers + [[_id,_pos,group _gun,0,0]];
		} else {
			_cpos = _center select 1;
			_precision = _center select 3;

			//--- Verify position
			if (_pos distance _cpos > limitupdate) then {
				_center set [1,_pos];
			};

			//--- Rise precision
			_precision = _precision + _step;
			_center set [3,_precision];
			_centers set [_n,_center];

		};
		_logic setvariable ["artycenters",_centers,true];
	};

	//-----------------------------------------------------------------------------------------------	
	//--- DEFAULT -----------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	default {hintc format ["Error in system_artyradar.sqf - %1",_this]};

};

