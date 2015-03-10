private ["_curator","_areaID","_editingArea"];

_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_areaID = [_this,1,-1,[0]] call bis_fnc_param;

if (_areaID >= 0) then {
	//_editingArea = _curator call bis_fnc_curatorEditingArea;
	_editingArea = +(_curator getvariable ["bis_fnc_curatorSystem_editingArea",[]]);
	_editingArea set [_areaID,-1];
	//_editingArea = _editingArea - [-1];
	_curator setvariable ["bis_fnc_curatorSystem_editingArea",_editingArea,true];
	true
} else {
	false
};