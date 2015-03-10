private ["_curator","_areas"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_areas = +(_curator getvariable ["bis_fnc_curatorSystem_editingArea",[]]);
_areas = _areas - [-1];

//--- Remove position params used by visualization
{
	if (count _x > 2) then {
		_x resize 2
	};
} foreach _areas;
_areas