scriptName "initDiary.sqf";

//--------------------------------------------------------------------------------------------------
//
//	DIARY RECORDS
//
//--------------------------------------------------------------------------------------------------

private["_label","_desc"];

_label = ["Hubs",missionName,"Diary","title"] call BIS_fnc_getCfgData;
_desc  = ["Hubs",missionName,"Diary","desc"] call BIS_fnc_getCfgData;

player createDiaryRecord ["Diary",[_label,_desc]];
