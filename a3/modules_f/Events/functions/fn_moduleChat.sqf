private ["_logic","_units","_text","_channel"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_text = _logic getvariable ["Text",""];
	_channel = parseNumber (_logic getvariable ["Channel","0"]);


	[_units,_text,_channel] spawn {

		//--- Wait until loading finished
		waituntil {!isnil "bis_fnc_preload_init"};
		sleep 0.01;

		_units = _this select 0;
		_text = _this select 1;
		_channel = _this select 2;
		{
			switch (_channel) do
			{
				case 0: {_x groupChat _text};
				case 1: {(vehicle _x) vehicleChat _text};
				case 2: {_x sideChat _text};
				case 3: {_x commandChat _text};
				case 4: {_x globalChat _text};
			};
		} foreach _units;
	};
};

true
