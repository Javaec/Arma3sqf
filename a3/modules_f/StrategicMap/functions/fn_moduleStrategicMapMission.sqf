_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_pos = position _logic;
	_code = _logic getvariable ["Code",""];
	_title = _logic getvariable ["Title",""];
	_description = _logic getvariable ["Description",""];
	_player = _logic getvariable ["Player",""];
	_image = _logic getvariable ["Image",""];
	_size = _logic getvariable ["Size","1"];
	_size = parsenumber _size;

	if (typename _code == typename "") then {_code = compile _code;};

	//--- Check for localization
	_title = _title call bis_fnc_localize;
	_description = _description call bis_fnc_localize;

	_logic setvariable ["data",[_pos,_code,_title,_description,_player,_image,_size]];
};