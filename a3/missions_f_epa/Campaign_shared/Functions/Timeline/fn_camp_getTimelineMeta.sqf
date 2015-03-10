/*
	Author: Jiri Wainar

	Description:
	Return timeline meta data about the campaign mission.

	Parameter(s):
	_this select 0: string (optional) 	- mission class (default: current mission class)

	or

	_this select 0: number 			- timeline id
	_this select 1: string (optional) 	- mission class (default: current mission class), used only in edgecases for x-campaign/stage reference

	Example:
	_timelineData = [missionName:string] call BIS_fnc_camp_getTimelineMeta;

	or

	_timelineData = [timelineID:number] call BIS_fnc_camp_getTimelineMeta;

	Returns:
	Array in format [[date+time],[travelIn,travelOut],[overcast,fog],[mission0,mission1..missionN]]
*/

private["_mission","_timelineID","_stage","_timelinePool","_timelineData"];
private["_date","_travel","_weather","_missions","_showIntel"];


_mission = [_this,0,missionname,["",123]] call bis_fnc_param;

if (typeName _mission == typeName 123) then
{
	_timelineID = _mission;
	_mission = [_this,1,missionname,[""]] call bis_fnc_param;
}
else
{
	_timelineID = -1;
};

_stage 	 = ["stage"] call BIS_fnc_getCfgData;
_stage	 = format["Stage%1",_stage];

_timelinePool = ["Timeline",_stage] call BIS_fnc_getCfgDataPool;

//defined by timeline id
if (_timelineID != -1) then
{
	if !(_timelineID < count _timelinePool) exitWith
	{
		_timelineID = -1;
	};

	_timelineData = _timelinePool select _timelineID;
}
else
{
	{
		_missions = _x select 3;

		if (_mission in _missions) exitwith
		{
			_timelineID = _forEachIndex;
			_timelineData = _x;
		};
	}
	forEach _timelinePool;
};

if (_timelineID == -1) exitWith
{
	["[!] Timeline data for mission '%1' cannot be retrieved from %2 timeline!",_mission,_stage] call BIS_fnc_logFormat;
	[]
};

//fix missing data / interpolate weather
_date	   = _timelineData select 0;
_travel	   = _timelineData select 1;
_weather   = _timelineData select 2;
_missions  = _timelineData select 3;
_showIntel = [_timelineData,4,1,[123]] call bis_fnc_param;

if (count _travel == 0) then
{
	_travel = [1,1];
};

if (count _weather != 2) then
{
	private["_interpolationData"];

	_interpolationData = [_timelineID,_timelinePool] call BIS_fnc_camp_getWeatherInterpolationData;
	_interpolationData set [count _interpolationData,_date];

	_weather = _interpolationData call BIS_fnc_interpolateWeather;
};

_timelineData = [_date,_travel,_weather,_missions,_showIntel];

//["Timeline phase %1: %2",_timelineID,_timelineData] call BIS_fnc_logFormat;

_timelineData