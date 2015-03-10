private ["_curator","_areaPos","_areaRadius","_areaID","_editingArea"];

_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_areaPos = [_this,1,[0,0,0],[[]]] call bis_fnc_param;
_areaRadius = [_this,2,0,[0]] call bis_fnc_param;
_areaID = -1;

if (_areaRadius > 0) then {
	//_editingArea = _curator call bis_fnc_curatorEditingArea;
	_editingArea = +(_curator getvariable ["bis_fnc_curatorSystem_editingArea",[]]);
	_areaID = count _editingArea;
	_editingArea set [_areaID,[_areaPos,_areaRadius]];
	_curator setvariable ["bis_fnc_curatorSystem_editingArea",_editingArea,true];
};

_areaID