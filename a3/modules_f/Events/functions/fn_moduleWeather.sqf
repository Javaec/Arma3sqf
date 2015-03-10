private ["_logic","_year","_delay","_overcast","_fog","_rain"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_delay = _logic getvariable ["Delay",0];
	_overcast = _logic getvariable ["Overcast",-1];
	_fog = _logic getvariable ["Fog",-1];
	_rain = _logic getvariable ["Rain",-1];

	switch (_overcast) do
	{
		case -1 : {};
		default {
					_delay setOvercast _overcast;
				};
	};

	switch (_rain) do
	{
		case -1 : {};
		default {
					if (_rain > rain) then
					{
						_delay setOvercast (overcast max 0.5); // it cannot rain if overcast smaller than 0.5
						_delay setRain  _rain;
					};	
				};
	};

	switch (_fog) do
	{
		case -1 : {};
		default {
					_delay setFog  _fog;
				};	
	};
};

true
	