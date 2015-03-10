with uinamespace do {
	_forced = [_this,0,false,[false]] call bis_fnc_param;
	_vars = ["X","Y","W","H"];

	_cfgUIGrids = configfile >> "CfgUIGrids";
	{
		_tag = _x;
		_tagName = configname _tag;
		_variables = (_tag >> "variables") call bis_fnc_subClasses;
		_presets = (_tag >> "presets") call bis_fnc_subClasses;

		_varPreset = _tagName + "preset";
		_varPresetDefault = _tagName + "presetDefault";
		_preset = profilenamespace getvariable [_varPreset,""];
		_presetDefault = profilenamespace getvariable [_varPresetDefault,_preset];
		_forcedLocal = getnumber (_tag >> "presets" >> _presetDefault >> "default") == 0 || (_preset == _presetDefault);
		{
			_preset = _x;
			_presetName = configname _preset;
			_default = getnumber (_preset >> "default");
			if (_default > 0) then {
				{
					_grid = _x;
					_gridName = configname _grid;
					_savetoprofile = getarray (_grid >> "savetoprofile");
					_position = getarray (_preset >> "variables" >> _gridName);
					_areaBase = _position select 0;
					_varBase = _tagName + "_" + _gridName + "_";
					{
						_index = [[_x],0,-1,[0]] call (uinamespace getvariable "bis_fnc_paramIn");
						if (_index >= 0 && _index < 4) then {
							_var = _varBase + (_vars select _index);
							_area = _areaBase select _index;
							_profile = profilenamespace getvariable _var;

							if (isnil "_profile" || _forced || _forcedLocal) then {
								//if (typename _area != typename "") then {_area = str _area;};
								_area = _area call bis_fnc_parsenumber;
								profilenamespace setvariable [_var,_area];
							};
						};
					} foreach _savetoprofile;
				} foreach _variables;
				if (isnil {profilenamespace getvariable _varPreset}) then {profilenamespace setvariable [_varPreset,_presetName];};
				profilenamespace setvariable [_varPresetDefault,_presetName];
			};
		} foreach _presets;

	} foreach ((configfile >> "CfgUIGrids") call bis_fnc_subClasses);
};