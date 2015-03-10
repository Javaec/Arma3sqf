//wait for the time to get set before the briefing code is executed
waitUntil{!(isNil "BIS_fnc_camp_setTimeWeather__dateWeatherSet") && {BIS_fnc_camp_setTimeWeather__dateWeatherSet}};

// Hide markers
{
	_x setMarkerAlpha 0;
} forEach ["BIS_survivors", "BIS_survivorsArea"];

// Move area markers
{
	private ["_marker", "_area"];
	_marker = _x;
	_area = format ["%1Area", _marker];
	_marker setMarkerPos markerPos _area;
} forEach ["BIS_city", "BIS_survivors"];
