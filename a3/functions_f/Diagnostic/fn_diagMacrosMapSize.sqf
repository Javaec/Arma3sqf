/*
	Author: Karel Moricky

	Description:
	Prints mapSize values based on real object size and copies it to clipboard.
	Mission has to be running on order to get the values.

	Parameter(s):
		0: CONFIG or ARRAY - either config container, or list of classes or classnames
		1: STRING - output mode, can be on of following:
			"wiki" - wiki table
			"config" - #define macros with model dimension values
			"config_current" - #define macros with current config values
		2: ARRAY - list of classnames which will be excluded from the scan

	Returns:
	STRING
*/

_cfg = [_this,0,configfile >> "CfgVehicles",[configfile,[]]] call bis_fnc_param;
_mode = [_this,1,"config",[""]] call bis_fnc_param;
_exclude = [_this,2,[],[[]]] call bis_fnc_param;
_macroName = "CFGVEHICLES_MAPSIZE_";

startloadingscreen [""];
_result = [];
_br = tostring [13,10];

if (time == 0) exitwith {"'CfgVehicles_mapSize' can be executed only in a running mission" call bis_fnc_error;};
_cfgCount = count _cfg - 1;
_pos = [100,100,100];

_classNames = [];
_classChildren = [];
_classChildrenAll = [];
_classSizes = [];
for "_c" from 0 to (count _cfg - 1) do {
//for "_c" from 0 to 1000 do {
	_class = _cfg select _c;
	[_class,0,"",["",configfile]] call bis_fnc_paramIn;
	if (typename _class == typename "") then {_class = configfile >> "CfgVehicles" >> _class;};

	if (isclass _class) then {

		if ({(configname _class) iskindof _x} count _exclude == 0) then {

			_classname = configname _class;
			//_classname call bis_fnc_log;
			_parents = [_class,true] call bis_fnc_returnparents;
			{
				_parentID = _classNames find _x;
				if (_parentID < 0) then {
					_id = count _classNames;
					_classNames set [_id,_x];
					_classChildren set [_id,[]];
					_classChildrenAll set [_id,[_classname]];
				} else {
					_parentArray = _classChildrenAll select (_parentID);
					_parentArray set [count _parentArray,_classname];
					if (_foreachindex == 1) then {
						_parentArray = _classChildren select (_parentID);
						_parentArray set [count _parentArray,_classname];
					};
				};
			} foreach _parents;

			_scope = getnumber (_class >> "scope");
			_classID = _classNames find _classname;
			if (_scope > 0) then {
				_side = getnumber (_class >> "side");
				if (_side == 7) then {
					//--- Always use 1 for logics
					_classSizes set [_classID,1];
				} else {
					_obj = createvehicle [configname _class,_pos,[],0,"none"];

					_bbox = boundingboxreal _obj;
					_bboxX = abs((_bbox select 0) select 0) + abs((_bbox select 1) select 0);
					_bboxY = abs((_bbox select 0) select 1) + abs((_bbox select 1) select 1);
					_size = _bboxX max _bboxY;
					_size = (round (_size * 100)) / 100;

					//_sizeNames set [count _sizeNames,configname _class];
					_classSizes set [_classID,_size];
					deletevehicle _obj;
				};
			} else {
				//_sizeNames set [count _sizeNames,configname _class];
				_classSizes set [_classID,0];
			};
		};
	};
	progressloadingscreen (_c / (_cfgCount max 1) / 2);
};

_classSizesLinks = +_classSizes;
_classCount = count _classNames;

_fnc_mapSize = {
	private ["_class","_classID","_size","_children","_childrenAll"];
	_class = _this select 0;
	_classID = _classNames find _class;
	_size = _classSizes select _classID;
	_sizeLink = _classSizesLinks select _classID;
	_sizeDef = _size;
	_children = _classChildren select _classID;
	_childrenAll = _classChildrenAll select _classID;

	//--- Get size
	if (_size <= 0) then {
		_childSizes = [];
		{
			_childID = _classNames find _x;
			if (_childID >= 0) then {	
				_childSize = _classSizes select _childID;
				if (_childSize > 0) then {_childSizes = _childSizes + [_childSize]};
			};
			//if (_size < 0) exitwith {};
		} foreach _childrenAll;

		_countArray = [];
		{
			_n = _x;
			_occurence = {_n == _x} count _childSizes;
			_countArray set [_occurence,_x];
		} foreach _childSizes;
		if (count _countArray > 0) then {
			_size = _countArray select (count _countArray - 1);
			_classSizes set [_classID,_size];
		};
	};

	//--- Apply the size for all children with the same size
	{
		_childID = _classNames find _x;
		_childSize = _classSizes select _childID;
		_childSizeLink = _classSizesLinks select _childID;
		if (_childSize == _size && typename _childSizeLink == typename 0) then {
			_classSizesLinks set [_childID,_class];
		};
	} foreach _childrenAll;

	//--- Inherit value from parent if it's same
	_parent = _this select 1;
	_parentID = _classNames find _parent;
	if (_parentID >= 0) then {
		_parentSize = _classSizes select _parentID;
		if (_size == _parentSize) then {
			_sizeLink = _parent;
			_classSizesLinks set [_parentID,_sizeLink];
		};
	};

	//--- Print
	switch (_mode) do {
		case "wiki": {
			_sizeText = if (typename _sizeLink == typename 0) then {
				if (_size > 0) then {
					if (_size < 10) then {"0" + str _size} else {str _size};
				} else {
					"01 ''(Default)''"
				};
				
			} else {
				"''inherited from " + _sizeLink + "''"
			};

			_scope = getnumber (configfile >> "cfgvehicles" >> _class >> "scope");
			_formatText = switch _scope do {
				case 0: {"| style=""background-color:salmon;"" | %1"};
				case 1: {"| style=""background-color:lightsalmon;"" | %1"};
				case 2: {"| %1"};
			};

			_result = _result + [
				"|-" + _br +
				format [_formatText,_class] + _br +
				format [_formatText,_sizeText] + _br +
				format [_formatText,getnumber (configfile >> "cfgvehicles" >> _class >> "mapsize")] + _br +
				format [_formatText,str _scope] + _br
			];
		};
		case "config": {
			if (typename _sizeLink == typename 0) then {
				if (_size <= 0) then {_size = 1};
				_result = _result + ["#define " + _macroName + _class + "	mapSize = " + str _size + ";"];
			};
		};
		case "config_current": {
			_sizeText = if (typename _sizeLink == typename 0) then {
				"	mapSize = " + str getnumber (configfile >> "cfgvehicles" >> _class >> "mapsize") + ";";
			} else {
				""
			};

			_result = _result + ["#define " + _macroName + _class + _sizeText];
		};
	};

	//--- Deeper!
	{
		[_x,_class] call _fnc_mapSize;
	} foreach _children;

	_c = _c + 1;
	progressloadingscreen (0.5 + (_c / (_classCount max 1) / 2));

};

_c = 0;
[_classNames select 0,""] call _fnc_mapSize;

_result = _result call BIS_fnc_sortAlphabetically;
_resultText = "";
{
	_resultText = _resultText + _br + _x;
} foreach _result;

switch (_mode) do {
	case "wiki": {
		_resultText =
		"{| class=""wikitable sortable"" border=""1"" style=""border-collapse:collapse"" cellpadding=""3px""" + _br +
		"! Class" + _br +
		"! Desired mapSize" + _br +
		"! Current mapSize" + _br +
		"! scope" + _br +
		_resultText + _br +
		"|}";
	};
};

copytoclipboard _resultText;
endloadingscreen;
_resultText