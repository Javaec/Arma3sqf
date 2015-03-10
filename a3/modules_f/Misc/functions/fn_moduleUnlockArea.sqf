_logic = _this select 0;
_units = _this select 1;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	_curator = objnull;
	_areas = [];
	{
		if (triggertype _x != "" && triggertype _x != "NONE") then {
			_areas set [count _areas,_x];
		} else {
			if (_x call bis_fnc_isCurator) then {
				_curator = _x;
			};
		};
	} foreach (synchronizedobjects _logic);

	{
		[_curator,position _x,(triggerarea _x select 0) max (triggerarea _x select 1)] call bis_fnc_curatorAddEditingArea;
	} foreach _areas;
};