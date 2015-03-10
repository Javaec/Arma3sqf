/*
	Author: Jiri Wainar

	Description:
	Changes current time and weather, handles SimulWeather "change-lag".

	Parameter(s):
	_this select 0: array			- date in format [_year,_month,_day,_hour,_min]
	_this select 1: array (optional)	- weather in format [_overcast,_fog] (default: [] = no change)

	Example:
	[_date,_weather] call BIS_fnc_camp_setTimeWeather;

	Returns:
	- nothing -
*/

["BIS_fnc_camp_setTimeWeather",false] call BIS_fnc_blackOut;

if !(isNil "BIS_fnc_camp_setTimeWeather__rainHandle") then
{
	terminate BIS_fnc_camp_setTimeWeather__rainHandle;
	BIS_fnc_camp_setTimeWeather__rainHandle = nil;
};

private["_date","_weather","_year","_month","_day","_hour","_minute","_overcast","_fog","_changeSpeed","_showIntel","_allowCustom","_customPath"];

_date	     = [_this, 0, [2035,6,24,9,0], [[]]] call BIS_fnc_param;
_weather     = [_this, 1, [], [[]]] call BIS_fnc_param;
_showIntel   = [_this, 2, true, [123,true]] call BIS_fnc_param;
_allowCustom = [_this, 3, true, [123,true]] call BIS_fnc_param;
_customPath  = [_this, 4, ["Hubs",missionName], [[]]] call BIS_fnc_param;

//safecheck _date to make sure no values are out of boundries
_date = _date call BIS_fnc_fixDate;

_config = missionConfigFile >> "Hubs" >> missionName;

if (typeName _showIntel == typeName 123) then
{
	_showIntel = _showIntel > 0;
};

if (typeName _allowCustom == typeName 123) then
{
	_allowCustom = _allowCustom > 0;
};

_overcast 	= [_weather, 0, -1, [123]] call BIS_fnc_param;
_fog 		= [_weather, 1, -1, [123,[]]] call BIS_fnc_param;
_changeSpeed	= [_weather, 2, 0, [123]] call BIS_fnc_param;

//check config overrrides (for hubs only)
private ["_missionMeta","_isHub"];

_missionMeta	= [] call BIS_fnc_camp_getMissionMeta;
_isHub		= _missionMeta select 1;

if (_isHub && _allowCustom) then
{
	private["_visited","_d","_o","_f","_lightnings","_rain","_wind"];

	_visited = missionNamespace getVariable [format["BIS_%1",missionName], false];

	if (_visited) exitWith {};

	_d 		= (_customPath + ["date"]) call BIS_fnc_getCfgData;
	_o		= (_customPath + ["overcast"]) call BIS_fnc_getCfgData;
	_f 		= (_customPath + ["fog"]) call BIS_fnc_getCfgData;
	_rain 		= (_customPath + ["rain"]) call BIS_fnc_getCfgData;
	_lightnings 	= (_customPath + ["lightnings"]) call BIS_fnc_getCfgData;
	_wind 		= (_customPath + ["wind"]) call BIS_fnc_getCfgData;

	if (count _d > 0) then
	{
		_date = _d;
	};

	if (_o != -1) then
	{
		_overcast = _o;
	};

	if (typeName _f == typeName 123) then
	{
		if (_f != -1) then
		{
			_fog = _f;
		};
	};
	if (typeName _f == typeName []) then
	{
		if (count _f > 0) then
		{
			_fog = _f;
		};
	};

	if (_rain != -1) then
	{
		BIS_fnc_camp_setTimeWeather__rainHandle = _rain spawn
		{
			while {true} do
			{
				sleep 0.2;
				0 setRain _this;
			};
		};
	};
	if (_lightnings != -1) then
	{
		0 setLightnings _lightnings;
	};

	if (count _wind > 0) then
	{
		setWind (_wind+[true]);
	};
};

_year 		= _date select 0;
_month 		= _date select 1;
_day 		= _date select 2;
_hour 		= _date select 3;
_minute 	= _date select 4;

//set time
setDate [_year,_month,_day,_hour,_minute];

//helper variable set to allow syncing with the mission's initBriefing.hpp
BIS_fnc_camp_setTimeWeather__dateWeatherSet = true;

//set weather
if (_overcast != -1) then
{
	_changeSpeed setOvercast _overcast;
};


//set fog
if (typeName _fog == typeName 123) then
{
	if (_fog != -1) then
	{
		_changeSpeed setFog _fog;
	};
}
else
{
	_changeSpeed setFog _fog;
};

//force weather update
forceWeatherChange;

//set pp effects
[] call BIS_fnc_camp_setPPeffect;

["BIS_fnc_camp_setTimeWeather"] call BIS_fnc_blackIn;

[_showIntel,_date] spawn
{
	private["_showIntel","_date"];

	_showIntel = _this select 0;
	_date = _this select 1;

	waitUntil{BIS_fnc_blackIn_completed};

	["[!] Mission time changed to %1.",_date] call BIS_fnc_logFormat;

	if (_showIntel) then
	{
		sleep 1;

		private["_cfg","_sector","_location"];

		_cfg 		= [missionname] call BIS_fnc_camp_getMissionDesc;
		_sector 	= [_cfg,"osdSector"] call BIS_fnc_getCfgData;
		_location 	= [_cfg,"osdLocation"] call BIS_fnc_getCfgData;

		if (isNil "_sector") then {_sector = "auto"};
		if (isNil "_location") then {_location = "auto"};

		//safecheck _date to make sure no values are out of boundries
		_date = _date call BIS_fnc_fixDate;

		[getPos player,_date,_sector,_location] call BIS_fnc_camp_showOSD;
	};
};