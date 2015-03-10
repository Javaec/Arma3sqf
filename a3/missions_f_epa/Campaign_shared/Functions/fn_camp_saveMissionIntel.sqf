/*
	Author: Jiøí Wainar (Warka)

	Description:
	Function stores intel data, so they can be retrieved in next mission.

	Stored data are:
		0: date: [year,month,day,hour,minute]
		1: weather [overcast: number,fog: number]

	Parameter(s):
	- none -

	Returns (optional):
	Intel data of current mission settings.

	Example:
	_intel = [] call BIS_fnc_camp_saveMissionIntel;
*/

private["_intel"];

//add "travel-from-mission" time if leaving campaign mission
if !(_isHub || _isSkirmish) then
{
	private["_date","_weather","_year","_month","_day","_hour","_minute","_overcast","_fog","_travelTime","_travelH","_travelM"];

	_date 	  = date;
	_weather  = [overcast,fog];

	_year 	  = _date select 0;
	_month 	  = _date select 1;
	_day 	  = _date select 2;
	_hour 	  = _date select 3;
	_minute   = _date select 4;

	if !(["bis_per_phase"] call BIS_fnc_camp_hasImplicitValue) then
	{
		_travelTime = [BIS_PER_phase] call bis_fnc_camp_getTimelinePhaseTravelTimes;
		_travelTime = _travelTime select 1;
	}
	else
	{
		["[!] Travel time MISSION -> HUB cannot be retrieved!"] call BIS_fnc_logFormat;

		_travelTime = 1;
	};

	_travelH = floor _travelTime;
	_travelM = round((_travelTime mod 1) * 60);

	["[!] Persistent time adjusted by the MISSION -> HUB travel time: %1hr %2min",_travelH,_travelM] call BIS_fnc_logFormat;

	_hour 	= _hour + _travelH;
	_minute = _minute + _travelM;

	_date 	= [_year,_month,_day,_hour,_minute];
	_intel 	= [_date,_weather];
}
else
{
	_intel = [date,[overcast,fog]];
};


//store intel data into BIS_PER_intel and save it into campaign save
BIS_PER_intel = _intel;

["[!] Mission intel saved: %1!",_intel] call BIS_fnc_logFormat;

_intel