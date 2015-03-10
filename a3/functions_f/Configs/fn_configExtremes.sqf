/*
	Author: Karel Moricky

	Description:
	Scan config paths and return min and max values for each property.
	Can be used only for properties of type number and array (value is geometric mean of all numbers in the array)

	Parameter(s):
		0: ARRAY of CONFIGs - scanned paths. Most often result of configClasses command
		1: ARRAY or STRINGs - properties, e.g., ["maxRange","reloadTime"]
		2 (Optional): ARRAY of BOOLs - property types. False for normal number, true for logarithmic)
		2 (Optional): ARRAY of NUMBERs - default values in case a property is not found

	Returns:
		ARRAY in format [minValues,maxValues]
		Number of items in each array is the same as number of properties
*/

private ["_paths","_properties","_propertyTypes","_propertyDefaults","_propertiesMax","_propertiesMin","_result"];
_paths = [_this,0,[],[[]]] call bis_fnc_param;
_properties = [_this,1,[],[[]]] call bis_fnc_param;
_propertyTypes = [_this,2,[],[[]]] call bis_fnc_param;
_propertyDefaults = [_this,3,[],[[]]] call bis_fnc_param;
{
	_propertyTypes set [_foreachindex,[_propertyTypes,_foreachindex,false,[false]] call bis_fnc_paramin];
	_propertyDefaults set [_foreachindex,[_propertyDefaults,_foreachindex,0,[0]] call bis_fnc_paramin];
} foreach _properties;

_propertiesMax = [];
_propertiesMin = [];
_propertiesMax resize (count _properties);
_propertiesMin resize (count _properties);

_result = [];
{
	private ["_cfgRoot","_cfgs","_isWeapon"];
	_cfgRoot = _x;
	_cfgs = [_cfgRoot];
	_isWeapon = isnumber (_cfgRoot >> "reloadTime");
	_isEquipment = istext (_cfgRoot >> "ItemInfo" >> "uniformModel");

	if (_isEquipment) then {
		_cfgs pushback (_cfgRoot >> "ItemInfo");
		_cfgs pushback (configfile >> "cfgvehicles" >> gettext (_cfgRoot >> "ItemInfo" >> "uniformclass") >> "hitpoints" >> "hitbody");
		//_cfgs  = _cfgs + (configproperties [configfile >> "cfgvehicles" >> gettext (_cfgRoot >> "ItemInfo" >> "uniformclass") >> "hitpoints","isclass _x",true]);
		//_cfgs pushback (configfile >> "cfgvehicles" >> gettext (_cfgRoot >> "ItemInfo" >> "containerClass"));
	} else {
		if (_isWeapon) then {
			_cfgs = [];
			{
				if (_x == "this") then {
					_cfgs pushback _cfgRoot;
				} else {
					private ["_mode"];
					_mode = _cfgRoot >> _x;
					if (getnumber (_mode >> "showtoplayer") == 1 || true) then {_cfgs pushback _mode;};
				};
			} foreach getarray (_x >> "modes");
			{
				_cfgs pushback (configfile >> "cfgmagazines" >> _x);
				_cfgs pushback (configfile >> "cfgammo" >> gettext (configfile >> "cfgmagazines" >> _x >> "ammo"));
			} foreach getarray (_x >> "magazines");
			_cfgs pushback (_cfgRoot >> "weaponslotsinfo");
		};
	};

	//--- Extract values
	{
		private ["_cfg"];
		_cfg = _x;
		{
			_cfgProperty = _cfg >> _x;
			if (_isEquipment && {_x == "maximumLoad"}) then {_cfgProperty = configfile >> "cfgvehicles" >> gettext (_cfg >> "ItemInfo" >> "containerClass") >> _x;};
			if (isnumber _cfgProperty || isarray _cfgProperty) then {
				private ["_value"];
				_value = if (isarray _cfgProperty) then {
					_value = 1;
					{_value = _value * (_x call bis_fnc_parsenumber);} foreach getarray _cfgProperty;
					sqrt _value
				} else {
					getnumber _cfgProperty
				};
				if (_propertyTypes select _foreachindex) then {_value = log _value;};
				if (_value != log 0) then {
					private ["_valueMax","_valueMin"];
					_valueMax = _propertiesMax select _foreachindex;
					_valueMin = _propertiesMin select _foreachindex;
					_propertiesMax set [_foreachindex,if (isnil "_valueMax") then {_value} else {_value max _valueMax}];
					_propertiesMin set [_foreachindex,if (isnil "_valueMin") then {_value} else {_value min _valueMin}];
				};
			};
		} foreach _properties;
	} foreach _cfgs;

	//--- When undefined, use root values
	{
		if (isnil {_propertiesMin select _foreachindex}) then {
			if (isnumber (_cfgRoot >> _x) || isarray (_cfgRoot >> _x)) then {
				private ["_value"];
				_value = if (isarray (_cfg >> _x)) then {
					_value = 1;
					{_value = _value * (_x call bis_fnc_parsenumber);} foreach getarray (_cfg >> _x);
					sqrt _value
				} else {
					getnumber (_cfg >> _x)
				};
				if (_propertyTypes select _foreachindex) then {_value = log _value;};
				if (_value == log 0) then {_value = _propertyDefaults select _foreachindex;};
				_propertiesMin set [_foreachindex,_value];
				_propertiesMax set [_foreachindex,_value];
			};
		};
		if (isnil {_propertiesMin select _foreachindex}) then {
			private ["_value"];
			_value = _propertyDefaults select _foreachindex;
			_propertiesMin set [_foreachindex,_value];
			_propertiesMax set [_foreachindex,_value];
		};
	} foreach _properties;
} foreach _paths;
[_propertiesMin,_propertiesMax]