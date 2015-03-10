/*
	Author: Karel Moricky

	Description:
	Returns all subclasses within given class
	
	Parameter(s):
		0: CONFIG - class which is searched
		1: NUMBER - depth (e.g., 0  to return only subclasses, 1 to return also subclasses of subclasses and so on)
		3: BOOL - true to return only the last tier, false to return all classes leading to it
	
	Returns:
	ARRAY of CONFIGs
*/

private ["_class","_depth","_lastOnly","_first","_classnames","_subClass","_subClassName"];
_class = [_this,0,configfile >> "",[configfile]] call bis_fnc_param;
_depth = [_this,1,0,[0]] call bis_fnc_param;
_lastOnly = [_this,2,true,[true]] call bis_fnc_param;
_first = [_this,3,true,[true]] call bis_fnc_param;

_private = if (_first) then {["_classes"]} else {[]};
private _private;
if (_first) then {_classes = [];};

if (_depth >= 0) then {
	_classnames = [];
	{
		for "_c" from 0 to (count _x - 1) do {
			_subClass = _x select _c;
			if (isclass _subClass) then {
				_subClassName = tolower configname _subClass;
				if !(_subClassName in _classnames) then {
					if (_depth == 0 || _lastOnly) then {
						_classes set [count _classes,_subClass];
						_classnames set [count _classnames,_subClassName];
					};

					//--- We need to go deeper!
					[_subClass,_depth - 1,_lastOnly,false] call bis_fnc_returnChildren;
				};
			};
		};
	} foreach (_class call bis_fnc_returnparents);
};
_classes