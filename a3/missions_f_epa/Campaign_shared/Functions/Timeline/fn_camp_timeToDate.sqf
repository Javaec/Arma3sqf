/*
	Author: Jiri Wainar

	Description:
	Converts time to date.

	Parameter(s):
	_this: number	- time; year and fraction of the next year

	Example:
	_date:array 	= _time:number call BIS_fnc_camp_timeToDate;

	Returns:
	_date:array [_year,_month,_day,_hour,_min]
*/

//(numberToDate [floor _this,_this mod 1])

(numberToDate [2035,_this])