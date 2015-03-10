private ["_logic","_units","_target","_autoTarget","_move","_anim","_FSM"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_target = parseNumber (_logic getvariable ["Target",-1]);
	_autoTarget = parseNumber (_logic getvariable ["AutoTarget",-1]);
	_move = parseNumber (_logic getvariable ["Move",-1]);
	_anim = parseNumber (_logic getvariable ["Anim",-1]);
	_FSM = parseNumber (_logic getvariable ["FSM",-1]);

	{
		switch (_target) do
		{
			case 0: {_x disableAI "TARGET"};
			case 1: {_x enableAI "TARGET"};
		};
		
		switch (_autoTarget) do
		{
			case 0: {_x disableAI "AUTOTARGET"};
			case 1: {_x enableAI "AUTOTARGET"};
		};
		
		switch (_move) do
		{
			case 0: {_x disableAI "MOVE"};
			case 1: {_x enableAI "MOVE"};
		};
		
		switch (_anim) do
		{
			case 0: {_x disableAI "ANIM"};
			case 1: {_x enableAI "ANIM"};
		};
		
		switch (_FSM) do
		{
			case 0: {_x disableAI "FSM"};
			case 1: {_x enableAI "FSM"};
		};
		
	} foreach _units;
};
true

