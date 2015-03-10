/*
	Author: Thomas Ryan
	
	Description:
	Add effects to a live feed.
	
	Parameters:
		_this (Optional): NUMBER - Live feed effects (-1: reset, 0: normal (default), 1: night vision, 2: thermal imaging)
	
	Returns:
	True if successful, false if not.
*/

private ["_mode"];
_mode = [_this, 0, 0, [0]] call BIS_fnc_param;
if (_mode > 2) exitWith {"Invalid effects mode defined" call BIS_fnc_error; false};

// Reset effects
"rendertarget0" setPiPEffect [0];

if (_mode >= 0) then {
	private ["_effectParams"];
	_effectParams = switch (_mode) do {
		// Normal
		case 0: {
			[3, 1, 1, 1, 0.1, [0, 0.4, 1, 0.1], [0, 0.2, 1, 1], [0, 0, 0, 0]]
		};
		
		// Night vision
		case 1: {
			[1]
		};
		
		// Thermal imaging
		case 2: {
			[2]
		};
	};
	
	// Set effect
	"rendertarget0" setPiPEffect _effectParams;
};

true