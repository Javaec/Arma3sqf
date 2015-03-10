/*
	Author: Thomas Ryan
	
	Description:
	Set the source of a live feed.
	
	Parameters:
		_this: OBJECT or ARRAY - Live feed source. Can be an array in the format [object, [x, y, z]]
	
	Returns:
	True if successful, false if not.
*/

// Dedicated servers need not apply
if (isDedicated) exitWith {"Not dedicated server compatible" call BIS_fnc_error; false};

// Cannot be run until the feed exists
if (isNil "BIS_liveFeed") exitWith {"No live feed exists" call BIS_fnc_error; false};

private ["_source"];
_source = [_this, 0, objNull, [objNull, []]] call BIS_fnc_param;

// Ensure a valid source is defined
if (typeName _source == typeName objNull) then {
	_source = [_source];
	{if (isNull _x) then {_source = _source - [_x]}} forEach _source;
};

if (count _source == 0 || count _source > 3) exitWith {"Invalid source defined" call BIS_fnc_error; false};

// Set the live feed's source
switch (count _source) do {
	// Object
	case 1: {
		_source = _source select 0;
		BIS_liveFeed attachTo [_source, [0, 0, -2]];
	};
	
	// Object with array
	case 2: {
		BIS_liveFeed attachTo _source;
	};
	
	// Position
	case 3: {
		BIS_liveFeed camPreparePos _source;
		BIS_liveFeed camCommitPrepared 0;
	};
};

true