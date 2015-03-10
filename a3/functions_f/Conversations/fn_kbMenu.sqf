/*
	Author: Karel Moricky

	Description:
	Opens conversation menu. Script terminates itself when menu selection is finished.

	Parameter(s):
	_this select 0: ARRAY or STRING - List of responses (of type ARRAY) or Menu name
		Responses are in format:
		_response select 0: STRING or ANY - Display name when STRING, otherwise used as default option when menu is closed without selecting anything.
		_response select 1:
			STRING - expression
			ARRAY - BIS_fnc_kbTell params

	Returns:
	NUMBER - ID of select option
*/
private ["_listResponses","_menuName","_mission","_section","_forceRadio","_sentenceCode","_listUnits","_sentenceStart","_senteceEnd","_expression","_listMenu","_expressionDefault","_isDefault","_result"];

_listResponses =	[[_this],0,[],[[]]] call bis_fnc_param;
_menuName = "";

_listMenu = [];
_expressionDefault = "";
{
	_response = _x;
	switch (typename _response) do {

		//--- Menu item
		case (typename []): {

			_displayName =		[_response,0,"",["",0]] call bis_fnc_param;
			_expression =		[_response,1,"",["",[]]] call bis_fnc_param;

			//--- Default item (not displayed, caleed when menu is terminated without selecting any item)
			_isDefault = if (typename _displayName == typename 0) then {_displayName = ""; true} else {false};
			_expression = _expression + format [";bis_fnc_kbMenu_menu = %1;",_forEachIndex];

			//--- Ad an item to menu
			if (_isDefault) then {
				_expressionDefault = _expression;
			} else {
				_listMenu = _listMenu + [
					[
						_displayName,
						[_forEachIndex + 2],
						"",
						-5,
						[
							[
								"expression",
								_expression
							]
						],
						"1",
						"1"
					]
				];
			};
		};

		//--- Menu name
		case (typename ""): {
			_menuName = _response;
		};

		//--- Other
		default {};
	};

} foreach _listResponses;

_listMenu = [[_menuName,false]] + _listMenu;

waituntil {isnil "bis_fnc_kbMenu_menu"};
bis_fnc_kbMenu_menu = _listMenu;

showCommandingMenu "#USER:bis_fnc_kbMenu_menu";

waituntil {commandingmenu != "#USER:bis_fnc_kbMenu_menu" || isnil "bis_fnc_kbMenu_menu"};

//--- Default response
_result = -1;
if !(isnil "bis_fnc_kbMenu_menu") then {
	if (typename bis_fnc_kbMenu_menu == typename []) then {
		call compile _expressionDefault;
	} else {
		_kbArray = +(_listResponses select bis_fnc_kbMenu_menu);
		_kbArray set [0,objnull];
		_kbArray = _kbArray - [objnull];
		_kbArray call bis_fnc_kbTell;
		_result = bis_fnc_kbMenu_menu;
	};
	bis_fnc_kbMenu_menu = nil;
};

_result