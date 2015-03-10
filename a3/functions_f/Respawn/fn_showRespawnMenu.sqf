private ["_title","_code","_parent"];

if (count _this > 0) then {
	_title = [_this,0,"",[""]] call bis_fnc_param;
	_code = [_this,1,{},[{}]] call bis_fnc_param;

	RscDisplayRespawn_section = [_title,_code];

	_parent = uinamespace getvariable ["RscDisplayRespawn_display",displaynull];
	if (isnull _parent) then {_parent = [] call bis_fnc_displayMission;};
	_parent createdisplay "RscDisplayRespawn";
	true
} else {
	(uinamespace getvariable ["RscDisplayRespawn_display",displaynull]) closedisplay -1;
	false
};