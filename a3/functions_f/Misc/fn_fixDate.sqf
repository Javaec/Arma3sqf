/*
	Author: Jiri Wainar

	Description:
	Checks the array with date data and makes sure, the values are within the boundries.

	Parameter(s):
	_this: ARRAY - date array [year, month, day, hour, minute]

	Example:
	_fixedDate = [2033,-2,89,25,75] call BIS_fnc_fixDate;

	Returns:
	ARRAY - fixed date array [year, month, day, hour, minute]
*/

private ["_year","_month","_day","_hour","_minute"];

_year 	= _this select 0;
_month 	= _this select 1;
_day 	= _this select 2;
_hour 	= _this select 3;
_minute = _this select 4;

/*--------------------------------------------------------------------------------------------------

	MINUTES

--------------------------------------------------------------------------------------------------*/
private["_hourFix"];

_hourFix = floor(_minute/60);

_hour 	 = _hour + _hourFix;
_minute  = _minute - (_hourFix * 60);

/*--------------------------------------------------------------------------------------------------

	HOURS

--------------------------------------------------------------------------------------------------*/
private["_dayFix"];

_dayFix = floor(_hour/24);

_day 	= _day + _dayFix;
_hour   = _hour - (_dayFix * 24);

/*--------------------------------------------------------------------------------------------------

	YEARS, MONTHS & DAYS

--------------------------------------------------------------------------------------------------*/
private["_monthFix","_monthDays","_yearFix"];

_yearFix = floor(_month/12);

_year 	 = _year + _yearFix;
_month   = _month - (_yearFix * 12);

waitUntil
{
	_monthDays = [_year,_month] call BIS_fnc_monthDays;
	_monthFix  = floor((_day - 1)/_monthDays);

	if (_monthFix < 0) then
	{
		_monthFix  = -1;					//move to previous month
		_month 	   = _month + _monthFix;

		if (_month == 0) then
		{
			_year = _year - 1;
			_month = 12;
		};

		_monthDays = [_year,_month] call BIS_fnc_monthDays;	//get previous month's days
		_day       = _day + _monthDays;
	};
	if (_monthFix > 0) then
	{
		_monthFix  = 1;						//move to following month
		_month 	   = _month + _monthFix;
		_day       = _day - _monthDays;

		if (_month > 12) then
		{
			_year = _year + 1;
			_month = 1;
		};
	};

	_monthFix == 0
};

//["[!] FIXED DATE: %1",[_year,_month,_day,_hour,_minute]] call BIS_fnc_logFormat;

[_year,_month,_day,_hour,_minute]