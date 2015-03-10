private ["_heli","_class","_cfgBaseItem","_canSetActive","_canSetComponents","_cfgHeli","_dbPath","_weightTotal","_listConfig","_componentsAll","_listComponents","_listTextures"];

_heli = [_this,0,objnull,[objnull,""]] call bis_fnc_param;
_class = [_this,1,"",[""]] call bis_fnc_param;
_cfgBaseItem = [_this,2,configfile,[configfile]] call bis_fnc_param;
_canSetActive = [_this,3,true,[true]] call bis_fnc_param;
_canSetComponents = [_this,4,true,[true]] call bis_fnc_param;

//--- ToDo: Variable heliport
_dbPath = [worldname,"helicopters",_class];

//--- Search for owned items
_weightTotal = 0;
_listConfig = [];
_listVehicles = [];
_listVehiclesCount = 0;
_listTypes = getarray (_cfgBaseItem >> "types");
{
	private ["_dbCategory"];
	_dbCategory = _x;
	{
		private ["_config","_active"];
		_config = [hsim_heliportDB,_dbPath + [_dbCategory,_x,"config"]] call bis_fnc_dbvaluereturn;
		_active = [hsim_heliportDB,_dbPath + [_dbCategory,_x,"active"],true] call bis_fnc_dbvaluereturn;

		if (!isnil "_config" && !isnil "_active") then {
			private ["_types"];
			_types = getarray (_config >> "types");
			_typesCollision = if (count _listTypes > 0) then {[_config,_listTypes] call bis_fnc_heliportTypesRequired} else {false};

			if (_typesCollision && _cfgBaseItem != _config) then {
				_active = false;
				if (_canSetActive) then {
					[hsim_heliportDB,_dbPath + [_dbCategory,_x,"active"],_active] call BIS_fnc_dbValueSet;
				};
			} else {
				if (_active) then {_listTypes = _listTypes + _types};
			};

			//--- Elements is active
			if (_active) then {

				//--- Add weight
				_weight = getnumber (_config >> "weight");
				_weightTotal = _weightTotal + _weight;

				//--- Add to config list
				_listConfig set [count _listConfig,_config];

				//--- Add to vehicles list
				_vehicle = gettext (_config >> "vehicle");
				if (_vehicle == "") then {
					_vehicle = getarray (_config >> "vehicle");
				} else {
					_vehicle = [_vehicle];
				};
				if (count _vehicle > 0) then {
					_listVehicles = _listVehicles + _vehicle;
					_listVehiclesCount = _listVehiclesCount + 1;
				};
			};
		};

	} foreach ([hsim_heliportDB,_dbPath + [_dbCategory]] call bis_fnc_dbclasslist);
} foreach ([hsim_heliportDB,_dbPath] call bis_fnc_dbclasslist);


//--- Create helicopter object
if (typename _heli == typename "") then {
	_heliClass = _heli;
	_heliClassCandidates = [];
	{
		_xheliClass = _x;
		if ({_x == _xheliClass} count _listVehicles == _listVehiclesCount) exitwith {
			_heliClassCandidates set [count _heliClassCandidates,_x];
		};
	} foreach _listVehicles;

	if (count _heliClassCandidates == 0 && _listVehiclesCount > 0) then {["'vehicle' params in components of '%1' doesn't match. Default vehicle '%2' used instead.",_class,_heliClass] call bis_fnc_error;};
	if (count _heliClassCandidates > 1) then {["Multiple 'vehicle' params in components of '%1' found. '%2' used",_class,_heliClassCandidates select 0] call bis_fnc_error;};
	if (count _heliClassCandidates == 0) then {_heliClassCandidates = [_heliClass];};

	_heliClass = _heliClassCandidates select 0;
	_heli = createvehicle [_heliClass,[99,99,99],[],0,"none"];
};


if (_canSetComponents) then {

	_cfgHeli = configfile >> "cfgvehicles" >> typeof _heli;

	//--- Disable all components
	_componentsAll = _heli getvariable "BIS_componentsAll";
	if (isnil "_componentsAll") then {
		private ["_cfgHeliComponents"];
		_componentsAll = [];
		_cfgHeliComponents = _cfgHeli >> "animationsources";

		//--- Search also class parents
		while {isclass _cfgHeliComponents} do {
			for "_i" from 0 to (count _cfgHeliComponents - 1) do {
			private ["_components"];
					_component = _cfgHeliComponents select _i;
				if (isclass _component) then {
					private ["_isComponent"];
					_isComponent = getnumber (_component >> "isComponent");
					if (_isComponent > 0) then {
						private ["_configName"];
						_configName = configname _component;
						if !(_configName in _componentsAll) then {
							_heli animate [_configName,0];
							_componentsAll set [count _componentsAll,_configName];
						};
					};
				};
			};
			_cfgHeliComponents = inheritsfrom _cfgHeliComponents;
		};
		_heli setvariable ["BIS_componentsAll",_componentsAll];
	} else {
		{
			_heli animate [_x,0];
		} foreach _componentsAll;
	};

	//--- Enable owned components
	_listComponents = [];
	_listTextures = [];
	{
		private ["_item","_components","_textures"];
		_item = _x;
		_components = getarray (_item >> "components");
		_textures = getarray (_item >> "textures");
		_showColor = getnumber (_item >> "showColor");
		{
			_heli animate [_x,1];
		} foreach _components;
		{
			_heli setobjecttexture [_foreachindex,_x];
		} foreach _textures;

		if (_showColor > 0) then {
			private ["_colorR","_colorG","_colorB","_color"];
			_colorR = [hsim_heliportDB,_dbPath + ["colorR"],0.42] call BIS_fnc_dbValueReturn;
			_colorG = [hsim_heliportDB,_dbPath + ["colorG"],0.42] call BIS_fnc_dbValueReturn;
			_colorB = [hsim_heliportDB,_dbPath + ["colorB"],0.35] call BIS_fnc_dbValueReturn;
			_color = format ["#(argb,8,8,3)color(%1,%2,%3,1)",_colorR,_colorG,_colorB];
			for "_t" from 0 to 10 do {
				_heli setobjecttexture [_t,_color];
			};
		};

		_listComponents = _listComponents + _components;
		_listTextures set  [count _listTextures,_textures];
	} foreach _listConfig;
};

//--- Add custom weight
_heli setCustomWeightRTD _weightTotal;

//--- Save variables
_heli setvariable ["BIS_components",_listComponents];
_heli setvariable ["BIS_textures",_listTextures];
_heli setvariable ["BIS_weight",_weightTotal];
_heli setvariable ["BIS_item",_dbPath];
_heli