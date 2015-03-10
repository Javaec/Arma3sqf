private ["_logic","_units","_skill"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_skill = (_logic getvariable ["value",0.5]) min 1 max 0;

	{
		(vehicle _x) setSkill _skill;
	} foreach _units;
};

true