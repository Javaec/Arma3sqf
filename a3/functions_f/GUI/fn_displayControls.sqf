/*
	Author: Karel Moricky

	Description:
	Return all controls of given display class

	Parameter(s):
	_this select 0: CONFIG - display config
	_this select 1: NUMBER or CONFIG or STRING - type of returned values (control configs, their names or IDCs; default: configfile))
	_this select 2: BOOL - true to search content of controls group (default: true)

	Returns:
	ARRAY
*/

private ["_displayClass","_listIDCs","_returnType","_searchGroups"];
disableserialization;

_displayClass =		[_this,0,configfile,[configfile,[]]] call bis_fnc_param;
_returnType =		[_this,1,configfile,[0,"",configfile]] call bis_fnc_param;
_searchGroups =		[_this,2,true,[true]] call bis_fnc_param;
_listIDCs = [];

//--- Apply colors
{
	private ["_cfg"];
	_cfg = _x;
	for "_i" from 0 to (count _cfg - 1) do {
		private ["_current"];
		_current = _cfg select _i;

		if (isclass _current) then {
			private ["_type"];

			_type = getnumber (_current >> "type");

			private ["_idc","_control","_colorText","_colorBackground"];

			//--- Element
			if (isnumber (_current >> "idc")) then {
				_idc = getnumber (_current >> "idc");
				switch (typename _returnType) do {
					case (typename 0): {
						_listIDCs = _listIDCs + [_idc];
					};
					case (typename ""): {
						_listIDCs = _listIDCs + [configname _current];
					};
					case (typename configfile): {
						_listIDCs = _listIDCs + [_current];
					};
				};
			};
			if (_type == 15 && _searchGroups) then {

				//--- Controls Group - go deeper
				_listIDCs = _listIDCs + ([_current,_returnType] call (uinamespace getvariable _fnc_scriptName));
			};
		};
	};
} foreach [
	_displayClass >> "controlsbackground",
	_displayClass >> "controls",
	_displayClass
];

_listIDCs