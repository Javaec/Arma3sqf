/*
	Author: Karel Moricky

	Description:
	Display TitleText with structured text

	Parameter(s):
	_this: STRING - displayed text

	Returns:
	BOOL - true
*/

#define TITLETEXT_DISPLAY	(uinamespace getvariable "RscTitleStructuredText")
#define TITLETEXT_CONTROL	(TITLETEXT_DISPLAY displayctrl 9999)

titlersc ["RscTitleStructuredText","plain"];
waituntil {!isnil {TITLETEXT_DISPLAY}};

private ["_text"];
_text = [_this,0,"",[""]] call bis_fnc_param;
TITLETEXT_CONTROL ctrlsetstructuredtext parsetext _text;

true