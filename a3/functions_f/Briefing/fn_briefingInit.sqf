/*
	Author: Karel Moricky, modified by Thomas Ryan
	
	Description:
	Initialize animated briefing markers.
	
	Parameters:
		_this: STRING - Marker to initialize.
	
	Returns:
	Nothing.
*/

// Determine the marker
_marker = [_this,0,"",[""]] call BIS_fnc_param;

// If the marker is a regular icon
if (markerShape _marker == "ICON") then {
	// Set its size depending on UI size & aspect ratio
	_marker setMarkerSize [
		(markerSize _marker select 0) * safeZoneH,
		(markerSize _marker select 1) * safeZoneH
	];
};

for "_i" from 0 to 100 do {
	// Find the marker's following stages
	_markerTemplate = (_marker + "_" + str _i);
	
	// Hide them for later
	_markerTemplate setMarkerAlpha 0;
	
	// If the marker is a regular icon
	if (markerShape _markerTemplate == "ICON") then {
		// Set their size depending on UI size & aspect ratio
		_markerTemplate setMarkerSize [
			(markerSize _markerTemplate select 0) * safeZoneH,
			(markerSize _markerTemplate select 1) * safeZoneH
		];
	};
};

// If the marker is for the camera
if (_marker == "camera") then {
	// Hide the marker
	_marker setMarkerAlpha 0;
};