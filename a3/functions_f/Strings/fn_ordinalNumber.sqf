/*
	Author: Karel Moricky

	Description:
	Return number as ordinal number (e.g. 1 become "1st")

	Parameter(s):
		0: NUMBER
		1 (Optional): STRING - language (default: current game language)
		2 (Optional): BOOL - true for feminine gender, false for masculine (default: false)

	Returns:
	STRING
*/
private ["_number","_language","_feminine"];

_number = [_this,0,0] call bis_fnc_param;
_number = _number call bis_fnc_parsenumber;
_language = [_this,1,language,[""]] call bis_fnc_param;
_feminine = [_this,2,false,[false]] call bis_fnc_param;

_suffix = switch (tolower _language) do {
	/////////////////////////////////////////////////////////////////////////////////////
	case "original";
	case "english": {
		switch (_number % 100) do {
			case 11;
			case 12;
			case 13: {"th"};	
			default {
				switch (_number % 10) do {
					case 1: {"st"};
					case 2: {"nd"};
					case 3: {"rd"};
					default {"th"};
				};
			};
		};
	};

	/////////////////////////////////////////////////////////////////////////////////////
	case "french": {
		switch (_number % 10) do {
			case 1: {
				if (_feminine) then {"re"} else {"er"}; //--- ToDo: Localize
			};
			default {"e"};
		};

	};

	/////////////////////////////////////////////////////////////////////////////////////
	case "portuguese";
	case "italian";
	case "spanish": {
		if (_feminine) then {"ª"} else {"º"};
	};

	/////////////////////////////////////////////////////////////////////////////////////
	case "russian": {
		"." //--- ToDo: Russian ordinal numbers
	};

	/////////////////////////////////////////////////////////////////////////////////////
	default {"."};
};
str _number + _suffix