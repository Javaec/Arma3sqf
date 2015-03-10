private ["_class","_listTypesRequired","_classConfig","_listTypes"];

_class =		[_this,0,configfile,[configfile,[]]] call bis_fnc_param;
_listTypesRequired =	[_this,1,[],[[],""]] call bis_fnc_param;

//--- Get class types
_classConfig = _class;
if (typename _class == typename []) then {
	_classConfig = [hsim_heliportDB,_class + ["config"]] call bis_fnc_dbvaluereturn;
};

//--- No config found - terminate
if (isnil "_classConfig") exitwith {["No config found for %1",_class] call bis_fnc_error; false};

//--- Convert required types to array
if (typename _listTypesRequired != typename []) then {
	_listTypesRequired = [_listTypesRequired];
};

//--- Nothing is required
if (count _listTypesRequired == 0) exitwith {true};

//--- Compare
_listTypes = getarray (_classConfig >> "types");
{
	_typeRequired = _x;
	if (typename _typeRequired != typename []) then {_typeRequired = [_typeRequired];};
	{
		private ["_type"];
		_type = _x;

		{_x == _type} count _listTypes > 0
	} count _typeRequired > 0
} count _listTypesRequired > 0;