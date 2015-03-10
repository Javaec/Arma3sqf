/*
	Author: Karel Moricky

	Description:
	Returns name of currently selected single mission

	Parameter(s):
	NOTHING

	Returns:
	STRING
*/

#define DISPLAY (finddisplay 2)
#define CONTROL (DISPLAY displayctrl 101)

CONTROL lbdata (lbcursel CONTROL);