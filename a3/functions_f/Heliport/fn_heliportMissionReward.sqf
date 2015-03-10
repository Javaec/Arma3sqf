/*
	Author: Karel Moricky

	Description:
	Modify mission reward or apply it

	Parameter(s):
	_this select 0:	NUMBER - modify mission reward coeficient
	_this select 1 (Optional): BOOL - true to replace coeficient, false to multiply it (default: false)

	Returns:
	NUMBER - mission reward coeficient
*/

private ["_coef","_replace","_coefCurrent"];

_coef = [_this,0,1,[0,false]] call bis_fnc_param;
_replace = [_this,1,false,[false]] call bis_fnc_param;

//--- Find current mission
_missionName = [] call bis_fnc_heliportMission;
_config = [hsim_heliportDB,[worldname,"MissionsPending",_missionName,"config"]] call bis_fnc_dbValueReturn;
if (!isnil "_config")  then {

	//--- Modify coeficient
	_coefCurrent = [hsim_heliportDB,[worldname,"MissionsPending",_missionName,"rewardCoef"],1] call bis_fnc_dbValueReturn;
	if (_replace) then {
		_coefCurrent = _coef;
	} else {
		_coefCurrent = _coefCurrent * _coef;
	};
	[hsim_heliportDB,[worldname,"MissionsPending",_missionName,"rewardCoef"],_coefCurrent] call bis_fnc_dbValueSet;
	_coefCurrent
} else {
	//--- Modify coeficient
	_coefCurrent = missionnamespace getvariable ["BIS_fnc_heliportMissionReward_rewardCoef",1];
	if (_replace) then {
		_coefCurrent = _coef;
	} else {
		_coefCurrent = _coefCurrent * _coef;
	};
	missionnamespace setvariable ["BIS_fnc_heliportMissionReward_rewardCoef",_coefCurrent];
	_coefCurrent
};