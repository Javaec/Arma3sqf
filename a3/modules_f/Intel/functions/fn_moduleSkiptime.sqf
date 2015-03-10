disableserialization;

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_isCurator = {_logic == agent _x} count agents > 0;

	if (_isCurator) then {
		_display = uinamespace getvariable "BIS_fnc_curatorInterface_display";
		if (isnil {_display}) then {[] call bis_fnc_displayMission;};
		_display createdisplay "RscDisplayModuleSkiptime";
		deletevehicle _logic;
	} else {
		_time = _logic getvariable ["skiptime",0];
		_time = _time call bis_fnc_parsenumber;
		if (_time != 0) then {
			skiptime _time;
		};
	};
};