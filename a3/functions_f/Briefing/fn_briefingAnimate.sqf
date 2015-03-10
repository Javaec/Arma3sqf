/*
	Author: Karel Moricky, modified by Thomas Ryan
	
	Description:
	Animate briefing markers.
	
	Parameters:
		_this select 0: STRING - Marker to animate.
		_this select 1: NUMBER - Marker ID.
		_this select 2: NUMBER - Commit time.
	
	Returns:
	Nothing.
*/

// Determine the marker, its ID & the commit time
_marker = [_this,0,"",[""]] call BIS_fnc_param;
_markerID = [_this,1,0,[0]] call BIS_fnc_param;
_commit = [_this,2,0,[0]] call BIS_fnc_param;

// Define the stage of the marker if it isn't the first marker
_markerTemplate = if (_markerID > 0) then {
	_marker + "_" + str _markerID;
}
// If it is the first marker
else {
	_marker;
};

// If the marker is a camera marker
if (_marker == "camera") then {
	// Determine the camera zoom
	_markerSizeH = markerSize _markerTemplate select 1;
	
	// Make the camera zoom
	mapAnimAdd [_commit, (_markerSizeH * 0.87) / safeZoneH / 10000, markerPos _markerTemplate];
	mapAnimCommit;
}
// If it isn't a camera marker
else {
	// Determine if the marker is hidden
	_markerAlpha = if (_markerId < 0) then {
		0;
	}
	// If it isn't
	else {
		markerAlpha _marker;
		1;
	};
	
	// Determine the commit delay
	_delay = 1/30;
	
	// Determine the number of steps during commit
	_steps = _commit / _delay;

	// Set up the marker
	_marker setMarkerType markerType _markerTemplate;
	_marker setMarkerColor markerColor _markerTemplate;
	_marker setMarkerText markerText _markerTemplate;
	
	// If the commit isn't instant
	if (_commit > 0) then {
		// Save how the marker started and how it will change
		_markerPos = markerPos _marker;
		_markerPosXStart = _markerPos select 0;
		_markerPosYStart = _markerPos select 1;
		_markerPosXStep = ((markerPos _markerTemplate select 0) - _markerPosXStart) / _steps;
		_markerPosYStep = ((markerPos _markerTemplate select 1) - _markerPosYStart) / _steps;

		_markerSize = markerSize _marker;
		_markerSizeAStart = (_markerSize select 0);
		_markerSizeBStart = (_markerSize select 1);
		_markerSizeAStep = ((markerSize _markerTemplate select 0) - _markerSizeAStart) / _steps;
		_markerSizeBStep = ((markerSize _markerTemplate select 1) - _markerSizeBStart) / _steps;

		_markerDirStart = markerDir _marker;
		_markerDirStep = ((markerDir _markerTemplate) - (markerDir _marker)) / _steps;

		_markerAlphaStart = markerAlpha _marker;
		_markerAlphaStep = (_markerAlpha - (markerAlpha _marker)) / _steps;

		// Make a smooth transition
		for "_i" from _delay to _steps do {
			// Change its position
			_marker setMarkerPos [
				_markerPosXStart + (_i * _markerPosXStep),
				_markerPosYStart + (_i * _markerPosYStep)
			];
			
			// Change its size
			_marker setMarkerSize [
				_markerSizeAStart + (_i * _markerSizeAStep),
				_markerSizeBStart + (_i * _markerSizeBStep)
			];
			
			// Change its azimuth
			_marker setMarkerDir (_markerDirStart + (_i * _markerDirStep));
			
			// Change its fade
			_marker setMarkerAlpha (_markerAlphaStart + (_i * _markerAlphaStep));

			_time = time + _delay;
			
			// Wait until committed
			waitUntil {time > _time};
		};
	};

	// Ensure the end state is correct
	_marker setMarkerPos markerPos _markerTemplate;
	_marker setMarkerDir markerDir _markerTemplate;
	_marker setMarkerSize markerSize _markerTemplate;
	_marker setMarkerAlpha _markerAlpha;
};