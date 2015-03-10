/*
	Author: Karel Moricky

	Description:
	Return number from expression

	Parameter(s):
	_this: NUMBER or STRING or CODE or CONFIG

	Returns:
	NUMBER
*/
private ["_number"];
_number = [_this,0,-1,[0,"",{},configfile]] call (uinamespace getvariable "bis_fnc_param");
switch (typename _number) do {

	case (typename {}): {
		_number = call _number;
		if (isnil {_number}) then {_number = -1;};
		_number
	};

	case (typename ""): {
		_number = call compile _number;
		if (isnil {_number}) then {_number = -1;};
		_number
	};

	case (typename configfile): {

		if (isnumber _number) then {
			getnumber _number
		} else {
			if (istext _number) then {
				(gettext _number) call bis_fnc_parsenumber
			} else {
				-1
			};
		};
	};

	default {_number};
};