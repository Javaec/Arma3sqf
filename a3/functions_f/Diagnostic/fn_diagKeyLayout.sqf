/*
	Author: Karel Moricky

	Description:
	Exports default key layout to wiki template.

	Parameter(s):
	_this select 0: STRING - category, can be one of following
		"" - all controls in game
		"All"
		"BasicInfantryControls"
		"Car"
		"Air"
		"Helicopter"
		"Submarine"
		"Buldozer"
		"UserActions"
	_this select 1: STRING - selection method, can be one of following
		"" - single tap
		"double" - double tap
		"LCtrl" - with left control pressed
		"RCtrl" - with right control pressed
		"LShift" - with left shift pressed
		"RShift" - with right shift pressed

	Returns:
	STRING - wiki export text (also copied to clipboard)
*/

#ifndef DIK_ESCAPE

/****************************************************************************
 *
 *      DirectInput keyboard scan codes
 *
 ****************************************************************************/

#define DIK_ESCAPE          0x01
#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B
#define DIK_MINUS           0x0C    /* - on main keyboard */
#define DIK_EQUALS          0x0D
#define DIK_BACK            0x0E    /* backspace */
#define DIK_TAB             0x0F
#define DIK_Q               0x10
#define DIK_W               0x11
#define DIK_E               0x12
#define DIK_R               0x13
#define DIK_T               0x14
#define DIK_Y               0x15
#define DIK_U               0x16
#define DIK_I               0x17
#define DIK_O               0x18
#define DIK_P               0x19
#define DIK_LBRACKET        0x1A
#define DIK_RBRACKET        0x1B
#define DIK_RETURN          0x1C    /* Enter on main keyboard */
#define DIK_LCONTROL        0x1D
#define DIK_A               0x1E
#define DIK_S               0x1F
#define DIK_D               0x20
#define DIK_F               0x21
#define DIK_G               0x22
#define DIK_H               0x23
#define DIK_J               0x24
#define DIK_K               0x25
#define DIK_L               0x26
#define DIK_SEMICOLON       0x27
#define DIK_APOSTROPHE      0x28
#define DIK_GRAVE           0x29    /* accent grave */
#define DIK_LSHIFT          0x2A
#define DIK_BACKSLASH       0x2B
#define DIK_Z               0x2C
#define DIK_X               0x2D
#define DIK_C               0x2E
#define DIK_V               0x2F
#define DIK_B               0x30
#define DIK_N               0x31
#define DIK_M               0x32
#define DIK_COMMA           0x33
#define DIK_PERIOD          0x34    /* . on main keyboard */
#define DIK_SLASH           0x35    /* / on main keyboard */
#define DIK_RSHIFT          0x36
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_LMENU           0x38    /* left Alt */
#define DIK_SPACE           0x39
#define DIK_CAPITAL         0x3A
#define DIK_F1              0x3B
#define DIK_F2              0x3C
#define DIK_F3              0x3D
#define DIK_F4              0x3E
#define DIK_F5              0x3F
#define DIK_F6              0x40
#define DIK_F7              0x41
#define DIK_F8              0x42
#define DIK_F9              0x43
#define DIK_F10             0x44
#define DIK_NUMLOCK         0x45
#define DIK_SCROLL          0x46    /* Scroll Lock */
#define DIK_NUMPAD7         0x47
#define DIK_NUMPAD8         0x48
#define DIK_NUMPAD9         0x49
#define DIK_SUBTRACT        0x4A    /* - on numeric keypad */
#define DIK_NUMPAD4         0x4B
#define DIK_NUMPAD5         0x4C
#define DIK_NUMPAD6         0x4D
#define DIK_ADD             0x4E    /* + on numeric keypad */
#define DIK_NUMPAD1         0x4F
#define DIK_NUMPAD2         0x50
#define DIK_NUMPAD3         0x51
#define DIK_NUMPAD0         0x52
#define DIK_DECIMAL         0x53    /* . on numeric keypad */
#define DIK_OEM_102         0x56    /* < > | on UK/Germany keyboards */
#define DIK_F11             0x57
#define DIK_F12             0x58

#define DIK_F13             0x64    /*                     (NEC PC98) */
#define DIK_F14             0x65    /*                     (NEC PC98) */
#define DIK_F15             0x66    /*                     (NEC PC98) */

#define DIK_KANA            0x70    /* (Japanese keyboard)            */
#define DIK_ABNT_C1         0x73    /* / ? on Portugese (Brazilian) keyboards */
#define DIK_CONVERT         0x79    /* (Japanese keyboard)            */
#define DIK_NOCONVERT       0x7B    /* (Japanese keyboard)            */
#define DIK_YEN             0x7D    /* (Japanese keyboard)            */
#define DIK_ABNT_C2         0x7E    /* Numpad . on Portugese (Brazilian) keyboards */
#define DIK_NUMPADEQUALS    0x8D    /* = on numeric keypad (NEC PC98) */
#define DIK_PREVTRACK       0x90    /* Previous Track (DIK_CIRCUMFLEX on Japanese keyboard) */
#define DIK_AT              0x91    /*                     (NEC PC98) */
#define DIK_COLON           0x92    /*                     (NEC PC98) */
#define DIK_UNDERLINE       0x93    /*                     (NEC PC98) */
#define DIK_KANJI           0x94    /* (Japanese keyboard)            */
#define DIK_STOP            0x95    /*                     (NEC PC98) */
#define DIK_AX              0x96    /*                     (Japan AX) */
#define DIK_UNLABELED       0x97    /*                        (J3100) */
#define DIK_NEXTTRACK       0x99    /* Next Track */
#define DIK_NUMPADENTER     0x9C    /* Enter on numeric keypad */
#define DIK_RCONTROL        0x9D
#define DIK_MUTE            0xA0    /* Mute */
#define DIK_CALCULATOR      0xA1    /* Calculator */
#define DIK_PLAYPAUSE       0xA2    /* Play / Pause */
#define DIK_MEDIASTOP       0xA4    /* Media Stop */
#define DIK_VOLUMEDOWN      0xAE    /* Volume - */
#define DIK_VOLUMEUP        0xB0    /* Volume + */
#define DIK_WEBHOME         0xB2    /* Web home */
#define DIK_NUMPADCOMMA     0xB3    /* , on numeric keypad (NEC PC98) */
#define DIK_DIVIDE          0xB5    /* / on numeric keypad */
#define DIK_SYSRQ           0xB7
#define DIK_RMENU           0xB8    /* right Alt */
#define DIK_PAUSE           0xC5    /* Pause */
#define DIK_HOME            0xC7    /* Home on arrow keypad */
#define DIK_UP              0xC8    /* UpArrow on arrow keypad */
#define DIK_PRIOR           0xC9    /* PgUp on arrow keypad */
#define DIK_LEFT            0xCB    /* LeftArrow on arrow keypad */
#define DIK_RIGHT           0xCD    /* RightArrow on arrow keypad */
#define DIK_END             0xCF    /* End on arrow keypad */
#define DIK_DOWN            0xD0    /* DownArrow on arrow keypad */
#define DIK_NEXT            0xD1    /* PgDn on arrow keypad */
#define DIK_INSERT          0xD2    /* Insert on arrow keypad */
#define DIK_DELETE          0xD3    /* Delete on arrow keypad */
#define DIK_LWIN            0xDB    /* Left Windows key */
#define DIK_RWIN            0xDC    /* Right Windows key */
#define DIK_APPS            0xDD    /* AppMenu key */
#define DIK_POWER           0xDE    /* System Power */
#define DIK_SLEEP           0xDF    /* System Sleep */
#define DIK_WAKE            0xE3    /* System Wake */
#define DIK_WEBSEARCH       0xE5    /* Web Search */
#define DIK_WEBFAVORITES    0xE6    /* Web Favorites */
#define DIK_WEBREFRESH      0xE7    /* Web Refresh */
#define DIK_WEBSTOP         0xE8    /* Web Stop */
#define DIK_WEBFORWARD      0xE9    /* Web Forward */
#define DIK_WEBBACK         0xEA    /* Web Back */
#define DIK_MYCOMPUTER      0xEB    /* My Computer */
#define DIK_MAIL            0xEC    /* Mail */
#define DIK_MEDIASELECT     0xED    /* Media Select */

/*
 *  Alternate names for keys, to facilitate transition from DOS.
 */
#define DIK_BACKSPACE       DIK_BACK            /* backspace */
#define DIK_NUMPADSTAR      DIK_MULTIPLY        /* * on numeric keypad */
#define DIK_LALT            DIK_LMENU           /* left Alt */
#define DIK_CAPSLOCK        DIK_CAPITAL         /* CapsLock */
#define DIK_NUMPADMINUS     DIK_SUBTRACT        /* - on numeric keypad */
#define DIK_NUMPADPLUS      DIK_ADD             /* + on numeric keypad */
#define DIK_NUMPADPERIOD    DIK_DECIMAL         /* . on numeric keypad */
#define DIK_NUMPADSLASH     DIK_DIVIDE          /* / on numeric keypad */
#define DIK_RALT            DIK_RMENU           /* right Alt */
#define DIK_UPARROW         DIK_UP              /* UpArrow on arrow keypad */
#define DIK_PGUP            DIK_PRIOR           /* PgUp on arrow keypad */
#define DIK_LEFTARROW       DIK_LEFT            /* LeftArrow on arrow keypad */
#define DIK_RIGHTARROW      DIK_RIGHT           /* RightArrow on arrow keypad */
#define DIK_DOWNARROW       DIK_DOWN            /* DownArrow on arrow keypad */
#define DIK_PGDN            DIK_NEXT            /* PgDn on arrow keypad */

/*
 *  Alternate names for keys originally not used on US keyboards.
 */
#define DIK_CIRCUMFLEX      DIK_PREVTRACK       /* Japanese keyboard */

#define KEYBOARD_DOUBLE_TAP_OFFSET  256
#define INPUT_CTRL_OFFSET 512

#endif /* DIK_ESCAPE */

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
private ["_mode","_limit","_limitSelector"];
startloadingscreen [""];


//--- Controls options category
//--- All, BasicInfantryControls, Car, Air, Helicopter, Submarine, Buldozer, UserActions
_category = [_this,0,"",[""]] call bis_fnc_param;
_categoryArray = getarray (configfile >> "UserActionGroups" >> _category >> "group");
_categoryAll = count _categoryArray == 0;

//--- Selector mode (double-tap, Ctrl, Shift)
_mode = [_this,1,"",[""]] call bis_fnc_param;
switch _mode do {
	case "double": {
		_limit = 256;
		_limitSelector = 0;

	};
	case "LCtrl": {
		_limit = 0;
		_limitSelector = DIK_LCONTROL;

	};
	case "RCtrl": {
		_limit = 0;
		_limitSelector = DIK_RCONTROL;

	};
	case "LShift": {
		_limit = 0;
		_limitSelector = DIK_LSHIFT;

	};
	case "RShift": {
		_limit = 0;
		_limitSelector = DIK_RSHIFT;

	};
	default {
		_limit = 0;
		_limitSelector = 0;
	};
};

_template = [
	DIK_ESCAPE,"Escape",[],
	DIK_F1,"F1",[],
	DIK_F2,"F2",[],
	DIK_F3,"F3",[],
	DIK_F4,"F4",[],
	DIK_F5,"F5",[],
	DIK_F6,"F6",[],
	DIK_F7,"F7",[],
	DIK_F8,"F8",[],
	DIK_F9,"F9",[],
	DIK_F10,"F10",[],
	DIK_F11,"F11",[],
	DIK_F12,"F12",[],

	DIK_GRAVE,"Tilde",[],
	DIK_1,"Key1",[],
	DIK_2,"Key2",[],
	DIK_3,"Key3",[],
	DIK_4,"Key4",[],
	DIK_5,"Key5",[],
	DIK_6,"Key6",[],
	DIK_7,"Key7",[],
	DIK_8,"Key8",[],
	DIK_9,"Key9",[],
	DIK_0,"Key0",[],
	DIK_MINUS,"Minus",[],
	DIK_EQUALS,"Equals",[],
	DIK_BACK,"Backspace",[],

	DIK_TAB,"Tab",[],
	DIK_Q,"Q",[],
	DIK_W,"W",[],
	DIK_E,"E",[],
	DIK_R,"R",[],
	DIK_Y,"Y",[],
	DIK_T,"T",[],
	DIK_U,"U",[],
	DIK_I,"I",[],
	DIK_O,"O",[],
	DIK_P,"P",[],
	DIK_LBRACKET,"LBracket",[],
	DIK_RBRACKET,"RBracket",[],
	DIK_BACKSLASH,"Backslash",[],

	DIK_CAPITAL,"CapsLock",[],
	DIK_A,"A",[],
	DIK_S,"S",[],
	DIK_D,"D",[],
	DIK_F,"F",[],
	DIK_G,"G",[],
	DIK_H,"H",[],
	DIK_J,"J",[],
	DIK_K,"K",[],
	DIK_L,"L",[],
	DIK_SEMICOLON,"Semicolon",[],
	DIK_APOSTROPHE,"Apostrophe",[],
	DIK_RETURN,"Enter",[],

	DIK_LSHIFT,"LShift",[],
	DIK_Z,"Z",[],
	DIK_X,"X",[],
	DIK_C,"C",[],
	DIK_V,"V",[],
	DIK_B,"B",[],
	DIK_N,"N",[],
	DIK_M,"M",[],
	DIK_COMMA,"Comma",[],
	DIK_PERIOD,"FullStop",[],
	DIK_SLASH,"Slash",[],
	DIK_RSHIFT,"RShift",[],

	DIK_LCONTROL,"LCtrl",[],
	DIK_LWIN,"LWin",[],
	DIK_LMENU,"LAlt",[],
	DIK_SPACE,"Space",[],
	DIK_RMENU,"RAlt",[],
	DIK_RWIN,"RWin",[],
	DIK_APPS,"Menu",[],
	DIK_RCONTROL,"RCtrl",[],

	DIK_SYSRQ,"PrintScreen",[],
	DIK_SCROLL,"ScrollLock",[],
	DIK_PAUSE,"Pause",[],
	DIK_INSERT,"Insert",[],
	DIK_DELETE,"Delete",[],
	DIK_HOME,"Home",[],
	DIK_END,"End",[],
	DIK_PRIOR,"PageUp",[],
	DIK_NEXT,"PageDown",[],

	DIK_UP,"Up",[],
	DIK_LEFT,"Left",[],
	DIK_DOWN,"Down",[],
	DIK_RIGHT,"Right",[],

	DIK_NUMLOCK,"NumLock",[],
	DIK_DIVIDE,"NumSlash",[],
	DIK_MULTIPLY,"NumAsterisk",[],
	DIK_SUBTRACT,"NumMinus",[],
	DIK_ADD,"NumPlus",[],
	DIK_DECIMAL,"NumSeparator",[],
	DIK_NUMPADENTER,"NumEnter",[],
	DIK_NUMPAD1,"Num1",[],
	DIK_NUMPAD2,"Num2",[],
	DIK_NUMPAD3,"Num3",[],
	DIK_NUMPAD4,"Num4",[],
	DIK_NUMPAD5,"Num5",[],
	DIK_NUMPAD6,"Num6",[],
	DIK_NUMPAD7,"Num7",[],
	DIK_NUMPAD8,"Num8",[],
	DIK_NUMPAD9,"Num9",[],
	DIK_NUMPAD0,"Num0",[]
];

_cfg = configfile >> "CfgDefaultKeysMapping";
for "_i" from 0 to (count _cfg - 1) do {
	_action = _cfg select _i;
	_actionName = configname _action;
	if ({_actionName == _x} count _categoryArray > 0 || _categoryAll) then {
		_keys = getarray _action;
		{
			_key = _x;
			if (typename _key == typename "") then {
				_key = call compile _key;
			};
			_selector = 0;
			_selectorName = "";
			if (typename _key == typename []) then {
				_selector = _key select 0;
				_key = _key select 1;		
			};
			if (_key >= _limit && _key < 1000 && _selector == _limitSelector) then {
				if (_limit > 0) then {_key = _key % _limit};
				_id = _template find _key;
				if (_id >= 0) then {
					_templateName = _template select (_id + 1);
					_templateArray = _template select (_id + 2);
					_templateArray set [count _templateArray,_selectorName + _actionName];
				};
			};
		} foreach _keys;
	};
};
_result = "{{Keyboard
";
for "_i" from 0 to (count _template - 3) step 3 do {
	_templateName = _template select (_i + 1);
	_templateArray = _template select (_i + 2);
	_templateText = "";
	{
		_templateText = _templateText + _x + "<br />";
	} foreach _templateArray;
	_result = _result + "|" + _templateName + " = " + _templateText + "
";
};
_result = _result + "}}";
copytoclipboard _result;

endloadingscreen;