private ["_parentLocal","_modeLocal"];
_parentLocal = if (!isnil "_fnc_scriptNameParent") then {_fnc_scriptNameParent} else {""};
_modeLocal = if (!isnil "_mode") then {_mode} else {""};

private ["_parent","_mode"];
_parent =	[_this,0,_parentLocal,[""]] call bis_fnc_param;
_mode =		[_this,1,_modeLocal,[""]] call bis_fnc_param;

_parent = tolower _parent;
_mode = tolower _mode;

switch _parent do {

	//--- Upgrade menu
	case "bis_fnc_heliportmenuupgrade": {

		switch _mode do {

			case "init": {

			};
		};
	};
};