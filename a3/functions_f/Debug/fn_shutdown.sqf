/*
	Author: Karel Moricky

	Description:
	Shut downs the game.

	Parameter(s):
	NOTHING

	Returns:
	NOTHING
*/

//--- Open options menu (forces to return to main menu)
ctrlactivate ((finddisplay 0) displayctrl 102);

//--- Close options menu
(finddisplay 3) closedisplay 2;

//--- Activate exit button
ctrlactivate ((finddisplay 0) displayctrl 106);