/*
	Author: Karel Moricky

	Description:
	Exports config macros.

	Parameter(s):
		0: CONFIG or ARRAY - config container to be searched (e.g. configFile >> "CfgVehicles") or list of classes or classnames
		1: ARRAY - list of macro names to be used (e.g. ["MAPSIZE","NAMESOUND"])
		2 (Optional): STRING - macro category name (when param 0 is CONFIG, its classname is used by default - e.g. "CfgVehicles")

	Returns:
	STRING
*/

startloadingscreen [""];
_cfg = [_this,0,configfile,[configfile,[]]] call bis_fnc_param;
_macros = [_this,1,[],[[]]] call bis_fnc_param;
_cfgName = [_this,2,"",[""]] call bis_fnc_param;
{
	_macros set [_foreachindex,toupper _x];
} foreach _macros;

_br = tostring [13,10];
_result = "";
_macrosCount = count _macros - 1;
if (_cfgName == "" && typename _cfg == typename configfile) then {_cfgName = toupper configname _cfg;};
_cfgCount = count _cfg - 1;
for "_c" from 0 to _cfgCount do {
	_class = _cfg select _c;
	[_class,0,"",["",configfile]] call bis_fnc_paramIn;
	if (typename _class == typename "") then {_class = configfile >> "CfgVehicles" >> _class;};

	if (isclass _class) then {
		_classname = configname _class;
		_result = _result + "// " + _className + _br;

		{
			_classMacro = _cfgName + "_" + _x + "_" + _classname;
			_result = _result + "#ifndef " + _classMacro + _br +
			"	#define " + _classMacro + _br +
			"#endif" + _br;
		} foreach _macros;

		_result = _result + "#define " + _cfgName + "_" + _classname + "\" + _br;
		{
			_classMacro = _cfgName + "_" + _x + "_" + _classname;
			_result = _result + "	" + _classMacro + "\";
			//if (_foreachindex < _macrosCount) then {_result = _result + "\";};
			_result = _result + _br;
		} foreach _macros;
		_result = _result + "	_generalMacro = " + str _classname + ";" + _br;
		_result = _result + _br;

		progressloadingscreen (_c / (_cfgCount max 1));
	};
};
copytoclipboard _result;
endloadingscreen;
_result