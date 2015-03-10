/*
	Author: Karel Moricky

	Description:
	Record time spent in mission

	Parameter(s): None

	Returns:
	BOOL
*/

disableserialization;

_display = finddisplay 46;
if (!isnull _display) then {
/*
	_display displayaddeventhandler [
		"unload",
		"
			diag_radioHttpPostLog [
				'http://splendid.bistudio.com/time.php',
				'text/plain',
				str [
					playerName call bis_fnc_filterString,
					missionname call bis_fnc_filterString,
					time
				]
			];
		"
	]
*/
};