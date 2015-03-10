private ["_listHelislots","_input"];
_listHelislots = (missionnamespace getvariable worldname) getvariable "Helislots";
if (isnil "_listHelislots") exitwith {
	["'Helislots' variable not found in Heliport logic."] call bis_fnc_error;
	if (typename _this == typename []) then {0} else {[]};
};

_input = [_this,0,[],[[],objnull,0]] call bis_fnc_param;

switch (typename _this) do {

	//--- Return number of free slots
	case (typename []): {
		//--- Free heliport array contains logic, position and direction.
		//--- If helicopter is in array, it's no longer free
		{count _x == 3} count _listHelislots
	};

	//--- Return slots attached to given logic
	case (typename objnull): {
		private ["_return"];
		_return = [];
		{
			if (_input in _x) then {_return set [count _return,_x]};
		} foreach _listHelislots;
		_return
	};

	//--- Return slots with given number of items
	case (typename 0): {
		private ["_return"];
		_return = [];
		{
			if (count _x == _input || _input == -1) then {_return set [count _return,_x]};
		} foreach _listHelislots;
		_return
	};
	default {[]}
}