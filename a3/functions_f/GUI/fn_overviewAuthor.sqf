private ["_config","_control","_author","_entry"];

_config = [_this,0,configfile,[configfile]] call bis_fnc_param;
_control = [_this,1,controlnull,[controlnull]] call bis_fnc_param;

if !(isclass _config) exitwith {""};

_author = "";
for "_i" from 0 to (count _config - 1) do {
	_entry = _config select _i;
	if (istext _entry) then {
		if (configname _entry == "dev" && cheatsenabled) exitwith {_author = gettext _entry;};
		if (configname _entry == "author") exitwith {_author = gettext _entry;};
	};
};

if (_author == "") then {_author = localize "STR_AUTHOR_UNKNOWN"};
_author = if (_author == "") then {""} else {format [localize "STR_FORMAT_AUTHOR_SCRIPTED",_author]};
_control ctrlsettext _author;
_author