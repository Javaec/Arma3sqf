/*
	Author: Joris-Jan van 't Land

	Description:
	Returns the dynamically composed overview text for Time Trial scenarios

	Parameter(s):
	_this: scenario class name

	Returns:
	Overview: StructuredText
*/

private ["_cfgMission"];
_cfgMission = configFile >> "CfgMissions" >> "TimeTrials" >> _this;

//Fetch player times
private ["_varName1", "_varName2", "_best", "_last"];
_varName1 = _this + "_Best";
_varName2 = _this + "_Last";
_best = profileNameSpace getVariable [_varName1, -1];
_last = profileNameSpace getVariable [_varName2, -1];

//Fetch trial times
private ["_times", "_gold", "_silver", "_bronze"];
_times = getArray (_cfgMission >> "times");
_gold = _times select 0;
if ((profileNamespace getVariable ["BIS_IShouldSupportTheDeveloper", 0]) > 4) then {_gold = 5};
_silver = _times select 1;
_bronze = _times select 2;

private ["_colorBest", "_colorLast"];
_colorBest = "FFFFFF";
if (_best != -1) then 
{
	if (_best <= _gold) then 
	{
		_colorBest = "FFD700";
	} 
	else 
	{
		if (_best <= _silver) then 
		{
			_colorBest = "C0C0C0";
		} 
		else 
		{
			if (_best <= _bronze) then 
			{
				_colorBest = "A0522D";
			};
		};
	};
};

_colorLast = "FFFFFF";
if (_last != -1) then 
{
	if (_last <= _gold) then 
	{
		_colorLast = "FFD700";
	} 
	else 
	{
		if (_last <= _silver) then 
		{
			_colorLast = "C0C0C0";
		} 
		else 
		{
			if (_last <= _bronze) then 
			{
				_colorLast = "A0522D";
			};
		};
	};
};

private ["_overview"];
_overview = "";

_overview = _overview + "<t align='center'><t color='#A0522D'>Bronze: " + ([_bronze / 60, "HH:MM"] call (uiNamespace getVariable "BIS_fnc_timeToString")) + "</t> <t color='#C0C0C0'>Silver: " + ([_silver / 60, "HH:MM"] call (uiNamespace getVariable "BIS_fnc_timeToString")) + "</t> <t color='#FFD700'>Gold: " + ([_gold / 60, "HH:MM"] call (uiNamespace getVariable "BIS_fnc_timeToString")) + "</t>";
if (_best != -1) then {_overview = _overview + "<br />Personal best: <t color='#" + _colorBest + "'>" + ([_best / 60, "HH:MM"] call (uiNamespace getVariable "BIS_fnc_timeToString")) + "</t>"};
if (_last != -1) then {_overview = _overview + "<br />Previous attempt: <t color='#" + _colorLast + "'>" + ([_last / 60, "HH:MM"] call (uiNamespace getVariable "BIS_fnc_timeToString")) + "</t>"};
_overview = _overview + "</t>";

(parseText _overview)