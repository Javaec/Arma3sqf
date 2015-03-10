private ["_curator"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
if (isnull _curator) then {
	[]
} else {
	(_curator getvariable ["bis_fnc_curatorSystem_editableUnits",[]]) - [-1];
};