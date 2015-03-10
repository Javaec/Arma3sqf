/*
	Author: Jiri Wainar

	Description:
	Types a structured text on the screen, letter by letter, cursor blinking.

	Parameter(s):
	_this: array containing blocks of text with same structured text formatting

	Remarks:
	* Every text block is an array of text and formatting tag.
	* Blocks don't have to span over whole line.

	Example:

	[
		[
			["CAMP ROGAIN,","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
			["RESSUPLY POINT","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"],
			["","<br/>"],
			["10 MINUTES LATER ...","align = 'center' shadow = '1' size = '1.0'"]
		]

	] spawn BIS_fnc_typeText2;

	0=[[["CAMP ROGAIN, ","align = 'center' size = '0.7' font='PuristaBold'"],["RESSUPLY POINT","align = 'center' size = '0.7'","#aaaaaa"],["","<br/>"],["10 MINUTES LATER ...","align = 'center' size = '1.0'"]]] spawn BIS_fnc_typeText2;
*/

disableserialization;

#define DELAY_CHARACTER		0.06;
#define DELAY_CURSOR		0.04;

private["_data","_posX","_posY","_alignBottom","_rootFormat","_abortParams","_abortCond"];

_data 		= [_this, 0, [], [[]]] call BIS_fnc_param;
_posX 		= [_this, 1, 0, [123]] call BIS_fnc_param;
_posY 		= [_this, 2, 0, [123]] call BIS_fnc_param;
_alignBottom	= [_this, 3, true, [false]] call BIS_fnc_param;
_rootFormat 	= [_this, 4, "<t >%1</t>", [""]] call BIS_fnc_param;
_abortParams 	= [_this, 5, [], [[]]] call BIS_fnc_param;
_abortCond 	= [_this, 6, {false}, [{}]] call BIS_fnc_param;

_invisCursor = "<t color ='#00000000' shadow = '0'>_</t>";

//process the input data
private["_block","_format","_color","_blockArray","_blocks","_formats","_colors"];

_blocks  = [];
_formats = [];
_colors	 = [];

{
	_block 	= [_x, 0, "", [""]] call BIS_fnc_param;
	_format = [_x, 1, "align = 'center' size = '0.7'", [""]] call BIS_fnc_param;
	_color	= [_x, 2, "#ffffff", [""]] call BIS_fnc_param;

	//"<t align = 'center' shadow = '1' size = '0.7'>%1</t>"
	if (_format != "<br/>") then
	{
		_format	= format["<t color = '%2' shadow = '%3' %4>%1</t>","%1","%2","%3",_format];
	};

	//convert strings into array of chars
	_blockArray = toArray _block;
	{_blockArray set [_forEachIndex, toString [_x]]} forEach _blockArray;

	_blocks set [count _blocks,_blockArray];
	_formats set [count _formats,_format];
	_colors set [count _colors,_color];
}
forEach _data;

/*
//debug input blocks
{
	["[%1] block: %2",_forEachIndex,_x] call BIS_fnc_logFormat;
}
forEach _blocks;

//debug input formats
{
	["[%1] format: %2",_forEachIndex,_x] call BIS_fnc_logFormat;
}
forEach _formats;
*/

//pre-process the characters
private["_chars","_blockId","_charShown","_charHidden","_charsShown","_charsHidden","_charsPlain"];

_charsShown = [];
_charsHidden = [];
_charsPlain = [];

{
	_chars 	 = _x;
	_blockId = _forEachIndex;
	_format  = _formats select _blockId;
	_color   = _colors select _blockId;

	if (count _chars == 0) then
	{
		_charsShown set [count _charsShown,_format];
		_charsHidden set [count _charsHidden,_format];
		_charsPlain set [count _charsPlain,""];
	}
	else
	{
		{
			_charShown = format[_format,_x,_color,1];
			_charHidden = format[_format,_x,'#00000000',0];

			_charsShown set [count _charsShown,_charShown];
			_charsHidden set [count _charsHidden,_charHidden];
			_charsPlain set [count _charsPlain,_x];
		}
		forEach _chars;
	};
}
forEach _blocks;

/*
//debug _charsShown
{
	["[%1] _charsShown: %2",_forEachIndex,_x] call BIS_fnc_logFormat;
}
forEach _charsShown;

//debug _charsHidden
{
	["[%1] _charsHidden: %2",_forEachIndex,_x] call BIS_fnc_logFormat;
}
forEach _charsHidden;
*/

//pre-process the frames
private["_frame","_frames","_frameId","_charId","_frameMerged"];

_frames = [];

{
	_frame   = [];
	_frameId = _forEachIndex;

	//combine the characters into frames
	{
		_charId = _forEachIndex;

		if (_charId <= _frameId) then
		{
			_frame set [count _frame,_x];
		}
		else
		{
			_frame set [count _frame,_charsHidden select _charId];
		};
	}
	forEach _charsShown;

	//merge frame characters into a string
	_frameMerged = "";

	{
		_frameMerged = _frameMerged + _x;
	}
	forEach _frame;

	_frames set [count _frames, parseText format[_rootFormat,_frameMerged]];
}
forEach _charsShown;

//fadeout: create an index array & shuffle it
private["_indexes"];

_indexes =+ _charsShown;

{
	_indexes set [_forEachIndex,_forEachIndex];
}
forEach _indexes;

_indexes = _indexes call BIS_fnc_arrayShuffle;

//fadeout: pre-select chars for fadeout & pre-process the frames
private["_charCount","_step","_frameOut","_frameOutMerged","_framesOut"];

_charCount = count _indexes;
_framesOut = [];

{
	_step = _x;
	_frameOut =+ _charsShown;

	{
		if (_forEachIndex == round(_charCount/_step)) exitWith {};

		_frameOut set [_x,_charsHidden select _x];
	}
	forEach _indexes;

	_frameOutMerged = "";

	{
		_frameOutMerged = _frameOutMerged + _x;
	}
	forEach _frameOut;

	_framesOut set [count _framesOut, parseText format[_rootFormat,_frameOutMerged]];

}
forEach [10,9,8,7,6,5,4,3,2,1];

//initialize display control
private["_display","_control"];

_display = uinamespace getVariable ["BIS_dynamicText",displayNull];
[_frames select 0, -2, -2, 10e10, 0, 0, 90] spawn BIS_fnc_dynamicText;
waitUntil{(uinamespace getvariable ["BIS_dynamicText",displayNull]) != _display && !isNull(uinamespace getvariable ["BIS_dynamicText",displayNull])};
_display = uinamespace getVariable ["BIS_dynamicText",displayNull];
_control = _display displayctrl 9999;

if (_alignBottom) then
{
	private["_h"];

	_h = ctrlTextHeight _control;
	_control ctrlSetPosition [_posX,_posY - _h - 0.01,safeZoneW,_h];
	_control ctrlCommit 0;
}
else
{
	_control ctrlSetPosition [_posX,_posY,safeZoneW,safeZoneH];
	_control ctrlCommit 0;
};

waitUntil{ctrlCommitted _control};

//print the pre-processed frames
private["_printedChar"];

{
	if (_abortParams call _abortCond) exitWith {};

	_printedChar = _charsPlain select _forEachIndex;

	//["[%1] Printing: %2",_forEachIndex,_printedChar] call BIS_fnc_logFormat;

	_control ctrlSetStructuredText _x;

	switch (_printedChar) do
	{
		case " ":
		{
			sleep 0.08;
		};
		case "":
		{
			sleep 1.4;
		};
		default
		{
			playSound ["ReadoutClick", true];

			sleep 0.08;
		};
	};
}
forEach _frames;

private["_t"];

_t = time + 3;

waitUntil
{
	(time > _t) || (_abortParams call _abortCond)
};

//print the pre-processed fadeout frames
{
	if (_abortParams call _abortCond) exitWith {};

	_control ctrlSetStructuredText _x;
	_control ctrlCommit 0;
	waituntil {ctrlCommitted _control};

	playSound ["ReadoutHideClick1", true];

	sleep 0.035;
}
forEach _framesOut;

//clean the screen
["", _posX, _posY, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;