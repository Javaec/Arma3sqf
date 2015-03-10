
/*
	File: isPosBlacklisted.sqf
	Author: Joris-Jan van 't Land & Karel Moricky

	Description:
	Function checks a blacklist and sees if the given position is on it or not.
	
	Parameter(s):
	_this select 0: position (Array)
	_this select 1: blacklist (Array or Object/Trigger)
	
	Returns:
	Is the position blacklisted or not (Boolean)
*/

private ["_pos", "_list", "_x", "_y", "_listed"];
_pos = _this select 0;
_list = _this select 1;

_x = _pos select 0;
_y = _pos select 1;
_listed = false;

//Go through all areas in the blacklist.
for "_i" from 0 to ((count _list) - 1) do {
	_current = (_list select _i);
	switch (typename _current) do {
		//--- Definition by top-left and bottom right corner -------------------------------
		case (typeName []): {
			//Check the top-left and bottom-right coordinates.
			private ["_tl", "_br"];
			_tl = _current select 0;
			_br = _current select 1;
	
			private ["_minX", "_maxX", "_minY", "_maxY"];
			_minX = _tl select 0;
			_maxX = _br select 0;
			_minY = _br select 1;
			_maxY = _tl select 1;
	
			if ((_x > _minX) && (_x < _maxX) && (_y > _minY) && (_y < _maxY)) exitWith {
				_listed = true;
			};
		};
		//--- Definition by trigger --------------------------------------------------------
		case (typeName objNull): {
			if ([_current,_pos] call BIS_fnc_inTrigger) exitwith {
				_listed = true;
			};
		};
		default {
			debuglog "Log: Error in isPosBlacklisted.sqf - wrong input data.";
		};
	};
};

_listed