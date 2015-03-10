#define VAR_TIME	(missionname + "_time_" + str ismultiplayer)

private ["_save","_delete","_time","_timeLoad","_timeAdd"];
_save = [_this,0,true,[true]] call bis_fnc_param;
_delete = [_this,1,false,[false]] call bis_fnc_param;

_time = profilenamespace getvariable [VAR_TIME,0];
_timeLoad = missionnamespace getvariable ["BIS_fnc_missionHandlers_time",time];
_timeAdd = time - _timeLoad;
_time = _time + _timeAdd;

if (_delete) then {
	missionnamespace setvariable ["BIS_fnc_missionHandlers_time",nil];
	profilenamespace setvariable [VAR_TIME,nil];
} else {
	if (_save) then {
		profilenamespace setvariable [VAR_TIME,_time];
	};
};
saveprofilenamespace;

_time