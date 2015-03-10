//--------------------------------------------------------------------------------------------------
//
//	DIARY RECORDS
//
//--------------------------------------------------------------------------------------------------

player createDiaryRecord [
	"Diary",
	[
		localize "STR_A3_Diary_Mission_title",
		localize "STR_A3_A_hub_Briefing_A_skirmish02"
	]
];


1 call BIS_fnc_prepareAO;

//create an optional task "BIS_PatrolToHub"
[player,"BIS_PatrolToHub",
[
	localize "STR_A3_A_hub_Task_BIS_PatrolToHub_Description",
	localize "STR_A3_A_hub_Task_BIS_PatrolToHub_Title",
	localize "STR_A3_A_hub_Task_BIS_PatrolToHub_Marker"
],
objNull,0,nil,false] call BIS_fnc_taskCreate;

//mission run separately
if (isNil "BIS_PER_missionsDone") then {BIS_PER_missionsDone = []};

//mark active minefields
_conds = ["A_m05", "A_m01", "A_m03", "A_m04"];
{
	_cond = _conds select _forEachIndex;
	if (!(_cond in BIS_PER_missionsDone)) then {
		_mrkr1Name = format ["BIS_ZR_mrkr_%1", _forEachIndex];
		_mrk1 = createMarker [_mrkr1Name, position _x];
		_mrkr1Name setMarkerShape "ELLIPSE";
		_mrkr1Name setMarkerBrush "DiagGrid";
		_mrkr1Name setMarkerColor "ColorOPFOR";
		_mrkr1Name setMarkerSize [(triggerArea _x) select 0, (triggerArea _x) select 1];
		_mrkr1Name setMarkerDir ((triggerArea _x) select 2);
	};
} forEach [BIS_ZR_trig1, BIS_ZR_trig2, BIS_ZR_trig3, BIS_ZR_trig4];