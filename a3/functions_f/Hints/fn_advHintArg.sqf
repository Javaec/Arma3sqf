/*
	File: advHintArg.sqf
	Author: Borivoj Hlava

	Description:
	Advanced hint arguments preprocess.

	Parameter(s):
	_this select 0: Array - arguments
	_this select 1: String - HTML color code (for highlighted text)
	_this select 2; String (optional) - Class of hint (in case of warning or error is used in logged info)
	
	Returned value:
	Array with arguments
*/
private ["_arg","_keyColor","_class","_argArray","_arrArg","_res","_code","_actKey","_actKeyForm","_elementForm","_invChar02","_invChar05","_dot","_smallSpace","_HLStart","_HLEnd","_warningColor","_friendC","_enemyC","_unknownC","_friendColor","_enemyColor","_unknownColor"];

_arg = _this select 0;
_keyColor = _this select 1;
_class = [_this,2,"undefined",[""]] call BIS_fnc_param;
_undefinedColor = (["IGUI", "WARNING_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;

_argArray = [];
_j = 0;
{
	_j = _j + 1;
	if (typeName _x == typeName "") then {
		_arrArg = toArray (toUpper _x);
		if ((count _arrArg) > 3) then {
			if ((_arrArg select 0 == 83) && (_arrArg select 1 == 84) && (_arrArg select 2 == 82) && (_arrArg select 3 == 95)) then {
				_res = localize _x;
				_argArray = _argArray + [_res]
			} else {
				_code = compile _x;
				_res = call _code;
				_argArray = _argArray + [_res]
			}
		} else {
			_code = compile _x;
			_res = call _code;
			_argArray = _argArray + [_res]
		}
	} else {
		if (typeName _x == typeName []) then {
			if ((count _x) == 1) then {
				_x = _x select 0;
				if (typeName _x == typeName []) then {
					if (count _x == 1) then {
						_x = _x select 0;

						switch (typename _x) do {
							case (typename ""): {
								_actKey = actionKeysNamesArray _x;
								if (count _actKey != 0) then {
									_actKeyForm = format ["<t color = '%2'>[%1]</t>",_actKey select 0,_keyColor];
									_argArray = _argArray + [_actKeyForm];
								} else {
									//error - wrong name of action or undefined key, actionKeysNamesArray return empty array
									_argArray = _argArray + [format ["<t color = '%2'>%1</t>",(localize "STR_A3_Hints_undefined"),_undefinedColor]];
									["For %1. argument (action) in class %2 isn't defined key!",_j,_class] call bis_fnc_log;
								};
							};
							case (typename 00): {
								_actKey = call compile keyname _x;
								_actKeyForm = format ["<t color = '%2'>[%1]</t>",_actKey,_keyColor];
								_argArray = _argArray + [_actKeyForm];
							};
							default {
								//error - action name isn't string
								_argArray = _argArray + ["<t color = '#FF0000'>!MISSING ACTION KEY!</t>"];
								["%1. argument in class %2 has wrong format of array!",_j,_class] call bis_fnc_error;
							};
						};
					} else {
						//error - wrong number of elements in array (action key)
						_argArray = _argArray + ["<t color = '#FF0000'>!MISSING ACTION KEY!</t>"];
						["%1. argument in class %2 has wrong format of array!",_j,_class] call bis_fnc_error;
					}
				} else {
					if (typeName _x == typeName "") then {
						_arrArg = toArray (toUpper _x);
						if ((count _arrArg) > 3) then {
							if ((_arrArg select 0 == 83) && (_arrArg select 1 == 84) && (_arrArg select 2 == 82) && (_arrArg select 3 == 95)) then {
								_res = localize _x;
								_elementForm = _res;
								_argArray = _argArray + [_elementForm]
							} else {
								_elementForm = format ["<t color = '%2'>%1</t>", _x, _keyColor];
								_argArray = _argArray + [_elementForm]
							}
						} else {
							_elementForm = format ["<t color = '%2'>%1</t>", _x, _keyColor];
							_argArray = _argArray + [_elementForm]
						};
					} else {
						// error - element isn't string
						_argArray = _argArray + ["<t color = '#FF0000'>!MISSING ELEMENT!</t>"];
						["%1. argument in class %2 has unknown format!",_j,_class] call bis_fnc_error;
					}
				}
			} else {
				//error - wrong number of elements in array (action key or element)
				_argArray = _argArray + ["<t color = '#FF0000'>!MISSING ACTION KEY OR ELEMENT!</t>"];
				["%1. argument in class %2 has wrong format of array!",_j,_class] call bis_fnc_error;
			}
		} else {
			// error - unknown format of argument
			_argArray = _argArray + ["<t color = '#FF0000'>!UNKNOWN FORMAT OF ARGUMENT!</t>"];
			["%1. argument in class %2 has unknown format!",_j,_class] call bis_fnc_error;
		}
	};
} forEach _arg;

if ((isNil {BIS_advHintArg_argArrayCheck}) || {BIS_advHintArg_argArrayCheck != _keyColor}) then {		//performance optimization - should be processed only once, it is stored in global variable
	_invChar05 = "<img image='#(argb,8,8,3)color(0,0,0,0)' size='0.5' />";		//invisible object for small spaces
	_invChar02 = "<img image='#(argb,8,8,3)color(0,0,0,0)' size='0.2' />";		//invisible object for small spaces
	_friendC = ((configfile >> 'CfgInGameUI' >> 'IslandMap' >> 'colorCivilian') call bis_fnc_colorConfigToRGBA) call bis_fnc_colorRGBAtoHTML;
	_enemyC = ((configfile >> 'CfgInGameUI' >> 'IslandMap' >> 'colorEnemy') call bis_fnc_colorConfigToRGBA) call bis_fnc_colorRGBAtoHTML;
	_unknownC = ((configfile >> 'CfgInGameUI' >> 'IslandMap' >> 'colorFriendly') call bis_fnc_colorConfigToRGBA) call bis_fnc_colorRGBAtoHTML;
	_blueC = ((configfile >> 'CfgInGameUI' >> 'IslandMap' >> 'colorNeutral') call bis_fnc_colorConfigToRGBA) call bis_fnc_colorRGBAtoHTML;
	_greenC = ((configfile >> 'CfgInGameUI' >> 'IslandMap' >> 'colorUnknown') call bis_fnc_colorConfigToRGBA) call bis_fnc_colorRGBAtoHTML;

	_dot = "<img image='\A3\ui_f\data\igui\rscingameui\Rschint\indent_square.paa' size = '0.25' shadow = '0'/> ";
	_smallSpace = format ["<br/>%1<br/>", _invChar02];
	_HLstart = format ["<t color = '%1'>", _keyColor];
	_HLend = "</t>";
	_warningColor = format ["color = '%1'",_keyColor];
	_friendColor = format ["color = '%1'",_friendC];
	_enemyColor = format ["color = '%1'",_enemyC];
	_unknownColor = format ["color = '%1'",_unknownC];
	_blueColor = format ["color = '%1'",_blueC];
	_greenColor = format ["color = '%1'",_greenC];
	
	BIS_advHintArg_argArrayPart1 = [_smallSpace,_dot,_HLstart,_HLend,_warningColor,_friendColor,_enemyColor,_unknownColor,_blueColor,_greenColor];
	BIS_advHintArg_argArrayCheck = _keyColor;
};


_argArray = BIS_advHintArg_argArrayPart1 + _argArray;

_argArray