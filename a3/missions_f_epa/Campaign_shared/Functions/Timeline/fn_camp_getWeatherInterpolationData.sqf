/*
	Author: Jiri Wainar

	Description:
	Return weather interpolation data.

	Remarks:
	* Doesn't work x-stage/campaign.

	Parameter(s):
	_this select 0: number 			- timeline id
	_this select 1: array (optional) 	- timeline data pool (default: [] = auto-gather data)

	Example:
	_timelineData = [timelineID:number] call BIS_fnc_camp_getTimelineMeta;
	_timelineData = [timelineID:number,timelineDataPool:array] call BIS_fnc_camp_getTimelineMeta;

	Returns:
	...boundry data for weather interpolation in format:

	[[_year1,_month1,_day1,_hour1,_min1],[_overcast1,_fog1],[_year2,_month2,_day2,_hour2,_min2],[_overcast2,_fog2]]
*/

private["_stage","_timelineID","_timelinePool","_weather1","_weather2","_date1","_date2"];

_stage 	 	= ["stage"] call BIS_fnc_getCfgData;
_stage	 	= format["Stage%1",_stage];

_timelineID 	= [_this,0,-1,[123]] call bis_fnc_param;
_timelinePool 	= [_this,1,[],[[]]] call bis_fnc_param;

if (_timelineID == -1) exitWith
{
	"Mandatory parameter _timelineID not defined!" call BIS_fnc_error;
	[]
};

//timeline pool not supported, need to gather the data
if (count _timelinePool == 0) then
{
	"Timeline pool not supported, need to gather the data..." call BIS_fnc_log;

	_timelinePool = ["Timeline",_stage] call BIS_fnc_getCfgDataPool;
};

if (_timelineID > (count _timelinePool)-1) exitWith
{
	"Parameter _timelineID out of range!" call BIS_fnc_error;
	[]
};

//set defaults for campaing start & end
_weather1 = [1,1];
_weather2 = [1,1];

private["_date","_weather"];

//parse the timeline
{
	_date    = _x select 0;
	_weather = _x select 2;

	//add bottom boundry
	if ((count _weather > 0) && ((_forEachIndex < _timelineID) || (_forEachIndex == 0))) then
	{
		_weather1 = _weather;
		_date1 	  = _date;
	};

	//add upper boundry
	if ((count _weather > 0) && (_forEachIndex >= _timelineID)) exitWith
	{
		_weather2 = _weather;
		_date2 	  = _date;
	};
}
forEach _timelinePool;

//["%1: %2%3 | %4%5",_timelineID,_date1,_weather1,_date2,_weather2] call BIS_fnc_logFormat;

[_date1,_weather1,_date2,_weather2]