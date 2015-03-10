/*
	Author: Joris-Jan van 't Land

	Description:
	Handling EH-based helicopter damage

	Parameter(s):
	_this: EH arguments (Array)

	Returns:
	Bool
*/

//TODO: use new EH which returns actualt hitpoint names?
if ((_this select 1) == "main rotor") then 
{
	private ["_heli"];
	_heli = _this select 0;

	if (((_this select 2) > 0.999) && !(_heli getVariable ["HSim_mainRotorDestroyed", false])) then 
	{	
		private ["_handle"];
		_handle = _heli execVM "hsim\air_h\data\scripts\main_rotor_destruction.sqf";
	};
};

true