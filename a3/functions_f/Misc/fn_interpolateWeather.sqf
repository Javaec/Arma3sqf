/*
	Author: Jiri Wainar

	Description:
	Interpolate weather (overcast and fog) according to 2 boundry dates and their weather conditions.

	Parameter(s):
	_this select 0: array	- _date1 	[_year1,_month1,_day1,_hour1,_min1]
	_this select 1: array	- _weather1	[_overcast1,_fog1]
	_this select 2: array	- _date2 	[_year2,_month2,_day2,_hour2,_min2]
	_this select 3: array	- _weather2	[_overcast2,_fog2]
	_this select 4: array	- _subjectDate 	[_year,_month,_day,_hour,_min] (default: current date)

	Returns:
	[_interpolatedOvercast,_interpolatedFog]

	Example:
	[_overcast,_fog] = [[2035,1,5,24,00],[0.1,0.5],[2035,1,10,24,00],[0.3,0.2],[2035,1,7,24,00]] call BIS_fnc_interpolateWeather;
*/

private["_date1","_weather1","_date2","_weather2","_iDate","_iWeather","_dateS","_weatherS","_dateE","_weatherE","_iOvercast","_iFog","_iMult","_fogS","_fogE"];

_date1 		= [_this,0,[],[[]]] call bis_fnc_param;
_weather1 	= [_this,1,[],[[]]] call bis_fnc_param;
_date2 		= [_this,2,[],[[]]] call bis_fnc_param;
_weather2 	= [_this,3,[],[[]]] call bis_fnc_param;
_iDate 		= [_this,4,date,[[]]] call bis_fnc_param;

//["%1: %2",_date1,_weather1] call BIS_fnc_logFormat;
//["%1: %2",_date2,_weather2] call BIS_fnc_logFormat;

if (count _date1 != 5) exitWith {"Error in param '_date1'!" call BIS_fnc_error; [0,0]};
if (count _date2 != 5) exitWith {"Error in param '_date2'!" call BIS_fnc_error; [0,0]};
if (count _iDate != 5) exitWith {"Error in param '_iDate'!" call BIS_fnc_error; [0,0]};
if (count _weather1 != 2) exitWith {"Error in param '_weather1'!" call BIS_fnc_error; [0,0]};
if (count _weather2 != 2) exitWith {"Error in param '_weather2'!" call BIS_fnc_error; [0,0]};

_date1 = (_date1 select 0) + (dateToNumber _date1);
_date2 = (_date2 select 0) + (dateToNumber _date2);
_iDate = (_iDate select 0) + (dateToNumber _iDate);

//handle possibility of dates being swapped
if (_date1 < _date2) then
{
	_dateS 		= _date1;
	_weatherS 	= _weather1;
	_dateE 		= _date2;
	_weatherE 	= _weather2;
}
else
{
	_dateS 		= _date2;
	_weatherS 	= _weather2;
	_dateE 		= _date1;
	_weatherE 	= _weather1;
};

if (_iDate < _dateS) then
{
	["[!!!] Date %1 is lower then the bottom boundry date %2. Boundry date used instead!",_this select 4,_this select 0] call BIS_fnc_logFormat;

	_iDate = _dateS;
};

if (_iDate > _dateE) then
{
	["[!!!] Date %1 is higher then the upper boundry date %2. Boundry date used instead!",_this select 4,_this select 2] call BIS_fnc_logFormat;

	_iDate = _dateE;
};

_dateE = _dateE - _dateS;
_iDate = _iDate - _dateS;
_dateS = 0;

_iMult = _iDate / _dateE;

_fogS = _weatherS select 1; if (typeName _fogS == typeName []) then {_fogS = _fogS select 0};
_fogE = _weatherE select 1; if (typeName _fogE == typeName []) then {_fogE = _fogE select 0};

_iOvercast 	= (((_weatherE select 0) - (_weatherS select 0)) * _iMult) + (_weatherS select 0);
_iFog 		= ((_fogE - _fogS) * _iMult) + _fogS;

_iWeather = [_iOvercast,_iFog];

//["%1: %2",_this select 4,_iWeather] call BIS_fnc_logFormat;

_iWeather
