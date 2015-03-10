private ["_curator","_units","_removeCrew","_editableUnits","_selectedArray","_selectedObjects"];
_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_removeCrew = [_this,2,true,[true]] call bis_fnc_param;

_editableUnits = _curator getvariable ["bis_fnc_curatorSystem_editableUnits",[]];
{
	_unitID = _editableUnits find _x;
	if (_unitID >= 0) then {
		_editableUnits set [_unitID,-1];
		[_x,"bis_fnc_curatorSystem_curatorsEditableObject",_curator,true] call bis_fnc_variablespaceremove;
	};

	//--- Remove vehicle crew
	if (_removeCrew) then {
		{
			_unitID = _editableUnits find _x;
			if (_unitID >= 0) then {
				_editableUnits set [_unitID,-1];
				[_x,"bis_fnc_curatorSystem_curatorsEditableObject",_curator,true] call bis_fnc_variablespaceremove;
			}
		} foreach (crew _x);
	};
} foreach _units;
_editableUnits = _editableUnits - [-1];
_curator setvariable ["bis_fnc_curatorSystem_editableUnits",_editableUnits,true];

_editableUnits