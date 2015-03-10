_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_pos = position _logic;
	_dir = direction _logic;

	_texture = _logic getvariable ["Texture","#(argb,8,8,3)color(0,0,0,0)"];
	_color = call compile (_logic getvariable "Color");
	_w = (_logic getvariable ["Width","100"]) call bis_fnc_parsenumber;
	_h = (_logic getvariable ["Height","100"]) call bis_fnc_parsenumber;
	_text = _logic getvariable ["Text",""];
	_shadow = call compile (_logic getvariable "Shadow");

	if (isnil "_color") then {_color = [1,1,1,1];};
	if (isnil "_shadow") then {_shadow = false;};

	_texture = [_texture,0,"#(argb,8,8,3)color(0,0,0,0)",[""]] call bis_fnc_paramIn;
	_color = [[_color],0,[0,0,0,0],[[]]] call bis_fnc_paramIn;
	_w = [_w,0,100,[0]] call bis_fnc_paramIn;
	_h = [_h,0,100,[0]] call bis_fnc_paramIn;
	_text = [_text,0,"",[""]] call bis_fnc_paramIn;
	_shadow = [_shadow,0,false,[false]] call bis_fnc_paramIn;
	_color = _color call bis_fnc_colorConfigToRGBA;

	_logic setvariable ["data",[_texture,_color,_pos,_w,_h,_dir,_text,_shadow]];
};