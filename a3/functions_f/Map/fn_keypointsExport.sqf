_tabCount = if (count _this > 0) then {_this select 0} else {0};
_tabText = tostring [9];
_brText = tostring [13,10];
_add = {
	call _tab;
	_textExport = _textExport + _this;
	 call _br;
};
_br = {
	_textExport = _textExport + _brText;
};
_tab = {
	private ["_tabAdd"];
	_tabAdd = "";
	for "_i" from 1 to _tabCount do {_tabAdd = _tabAdd + _tabText;};
	_textExport = _textExport + _tabAdd;
};
_tabAdd = {
	_tabCount = _tabCount + _this;
};
_textExport = "";
call _tab;

_exportMode = if (count _this > 1) then {_this select 1} else {0};

_cfgWorld = configfile >> "cfgWorlds" >> worldname;
_parent = configname inheritsfrom _cfgWorld;
_textParent = if (_parent != "") then {": " + _parent} else {""};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_exportMode != 2) then {
	if (_exportMode == 0) then {
		"class CfgWorlds" call _add;
		"{" call _add;
		+1 call _tabAdd;
		if (_textParent != "") then {format ["class %1;",_parent] call _add;};
	};
	format ["class %1%2",worldname,_textParent] call _add;
	"{" call _add;
	+1 call _tabAdd;
	"class Names" call _add;
	"{" call _add;
	+1 call _tabAdd;
};

_logicCounter = 0;
_subLogicCounter = 0;
_listLogics = position bis_functions_mainscope nearentities ["logic",1000000];
_listCategory = [];
{
	_logic = _x;
	_isLeader = leader _logic == _logic;
	_isModule = gettext (configfile >> "cfgvehicles" >> typeof _logic >> "vehicleClass") == "Modules";
	_classCategory = vehiclevarname _logic;
	if (_classCategory == "") then {
		_classCategory = format ["KeypointCategory_%1",_logicCounter];
		_logicCounter = _logicCounter + 1;
	};

	if (_isLeader && !_isModule && count units _logic > 1) then {
		_subLogicCounter = 0;
		_listCategory = _listCategory + [_classCategory];
		{
			_subLogic = _x;
			_class = vehiclevarname _subLogic;
			_name = if (!isnil {_subLogic getvariable "name"}) then {_subLogic getvariable "name"} else {""};
			_position = position _subLogic;
			_direction = (round direction _subLogic) % 360;
			_positionZ = round (_position select 2);
			_position resize 2;
			_textPosition = "{";
			{
				_textPosition = _textPosition + str _x;
				if (_forEachIndex < count _position - 1) then {_textPosition = _textPosition + ","};
			} foreach _position;
			_textPosition = _textPosition + "};";

			if (_class == "") then {
				_class = format ["%1",_subLogicCounter];
				_subLogicCounter = _subLogicCounter + 1;
			};

			if (_exportMode != 2) then {
				format ["class %1_%2",_classCategory,_class] call _add;
				"{" call _add;
				+1 call _tabAdd;
				format ["name = ""%1"";",_name] call _add;
				format ["type = ""%1"";",_classCategory] call _add;
				format ["position[] = %1",_textPosition] call _add;
				format ["angle = %1;",_direction] call _add;
				format ["radiusA = %1;",_positionZ] call _add;
				"radiusB = 0;" call _add;
				-1 call _tabAdd;
				"};" call _add;
			};
		} foreach (units _logic - [_logic]);
	};
} foreach _listLogics;

if (_exportMode != 2) then {
	-1 call _tabAdd;
	"};" call _add;
	-1 call _tabAdd;
	"};" call _add;
	if (_exportMode == 0) then {
		-1 call _tabAdd;
		"};" call _add;
	};
};

if (_exportMode in [0,2]) then {

	"class CfgLocationTypes" call _add;
	"{" call _add;
	+1 call _tabAdd;
	"class Name;" call _add;
	{
		format ["class %1: Name {};",_x] call _add;
	} foreach _listCategory;
	-1 call _tabAdd;
	"};" call _add;
};


copytoclipboard _textExport;
hint parsetext _textExport;