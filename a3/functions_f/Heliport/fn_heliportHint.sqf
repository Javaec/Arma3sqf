private ["_logicHeliport","_listHint","_listText","_textHint"];

_logicHeliport = missionnamespace getvariable worldname;
if (isnil "_logicHeliport") exitwith {"Heliport logic not found." call bis_fnc_error};

_listHint = _logicHeliport Getvariable "heliportHint";
if (isnil "_listHint") exitwith {"'heliportHint' variable in heliport logic not found." call bis_fnc_error};

_listText = [];

{
	private ["_item","_category","_displayName","_displayNameCategory","_listTextId"];
	_item = _x select 0;
	_category = _x select 1;
	_displayName = _x call bis_fnc_displayName;
	_displayNameCategory = _category call bis_fnc_displayName;

	_listTextId = _listText find _displayNameCategory;
	if (_listTextId <= 0) then {
		_listTextId = count _listText;
		_listText set [_listTextId,_displayNameCategory];
		_listText set [_listTextId + 1,[]];
	};
	_listText set [
		_listTextId+1,
		(_listText select _listTextId+1) + [_displayName]
	];
} foreach _listHint;
_logicHeliport setvariable ["heliportHint",nil];

_textHint = "";
{
	if (typename _x == typename "") then {
		_textHint = _textHint + format ["<t size='1.5'>%1</t><br />",_x];
	} else {
		{
			_textHint = _textHint + "* " + _x + "<br />";
		} foreach _x;
		_textHint = _textHint + "<br />";
	};
} foreach _listText;
_textHint = format ["<t align='left'><t size='2'>" + localize "STR_HSIM_BIS_fnc_heliportHint_New" + "</t><br /><br />%1</t>",_textHint];
hint parsetext _textHint;