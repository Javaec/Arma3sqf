/*
	Author: Karel Moricky

	Description:
	Composes array of classes with unique param (based on returned value of passed code).
	If class inherits the param from parent, it's not listed.
	
	Parameter(s):
		0: CONFIG - class which is searched
		1: CODE - code executed on class, which is passed as _this
	
	Returns:
		ARRAY - classes in format [class,value]
			class: CONFIG - class with unique param
			value: ANY - value returned by the passed code for the given class
*/

private ["_cfg","_code","_allClasses","_allChildren","_allValues","_result"];
_cfg = [_this,0,configfile,[configfile]] call bis_fnc_param;
_code = [_this,1,{},[{}]] call bis_fnc_param;

//--- Create list of all classes
_allClasses = [];
_allChildren = [];
_allValues = [];
{
	_allClasses set [count _allClasses,_x];
	_allChildren set [count _allChildren,[]];
	_allValues set [count _allValues,_x call _code];
} foreach (_cfg call bis_fnc_subClasses);

//--- Add children classes for every class
{
	_class = _x;
	_parents = [_class] call bis_fnc_returnparents;
	_parents = _parents - [_class];
	{
		_parentID = _allClasses find _x;
		_parentChildren = _allChildren select _parentID;
		_parentChildren set [count _parentChildren,_class];
	} foreach _parents;
} foreach _allClasses;

//--- Apply values
_result = [];
{
	_class = _x;
	_classChildren = _allChildren select _foreachindex;
	_classValue = _allValues select _foreachindex;

	if (typename _classValue != typename configfile) then {
		{
			_child = _x;
			_childID = _allClasses find _child;
			_childValue = _allValues select _childID;
			if (typename _childValue != typename configfile) then {
				if (_childValue == _classValue) then {
					_allValues set [_childID,_class];
				};
			};
		} foreach _classChildren;

		_result set [count _result,[_class,_classValue]];
	};
} foreach _allClasses;

//{[0,_x] call bis_fnc_log;} foreach _result;

_result