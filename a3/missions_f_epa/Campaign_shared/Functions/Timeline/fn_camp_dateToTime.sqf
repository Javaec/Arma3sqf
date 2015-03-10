/*
	Author: Jiri Wainar

	Description:
	Converts date to time.

	Parameter(s):
	_this: array	- date [_year,_month,_day,_hour,_min]

	Example:
	_time: number 	= _date:array call BIS_fnc_camp_dateToTime;

	Returns:
	_time: number	- year and fraction of the next year
*/

//((_this select 0) + (dateToNumber _this))

(dateToNumber _this)